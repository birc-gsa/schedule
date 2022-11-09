# Week 1 --- Read-mapping and file formats

## Lecture

-   Topics: Introduction to class, The read-mapping problem,
    Introduction to exercise formats, Data formats
-   Slides: [GSA Week 01 ---
    Introduction](../slides/GSA%20Week%2001%20--%20Introduction.pdf)
-   Reading material: None for this week

## Exercises

### General Q&A about the class

### Read-mapping

Download the read-mapping tool [bwa](https://github.com/lh3/bwa). You
can do this either by downloading a
[zip-file](https://github.com/lh3/bwa/archive/master.zip) or by cloning
the git repository

``` bash
git clone https://github.com/lh3/bwa.git
```

After downloading (and unzipping if you downloaded the zip-file), go to
the directory and compile the tool.

``` bash
cd bwa
make
```

Download this [zip file](data/week-01.zip). It contains an example
[FASTA file](https://en.wikipedia.org/wiki/FASTA_format), `ref.fa`, a
script for simulating FASTA files, `simulate-fasta.py`, a script for
simulating [FASTQ files](https://en.wikipedia.org/wiki/FASTQ_format),
`simulate-fastq.py`, a FASTQ file, `exact-samples.fq` and a text file
`exact-samples.txt`.

The `ref.fa` file contains a reference genome I have simulated using the
script `simulate-fasta.py`. I ran the command

``` bash
python simulate-fasta.py -n 20 -m 10000 > ref.fa
```

to create 20 chromosomes of length 10,000 each. You can use the script
to simulate your own data for more testing.

The two simulation scripts use the full FASTA and FASTQ file format. In
this class, we will use simpler formats (since the class is about the
underlying algorithms and not about parsing file formats), but since
`bwa` is a real read-mapper, it uses the full format. For the simpler
file formats, see later exercises. Still, you can adapt the scripts for
later usage, if you so wish.

The `exact-samples.fq` and `exact-samples.txt` files contain strings
that match exactly in the reference genome. I have sampled
`exact-samples.fq` from the reference using the `simulate-fastq.py`
script using this command:

``` bash
python simulate-fastq.py -n 10 -m 100 -l exact-samples.txt ref.fa > exact-samples.fq
```

The `exact-samples.txt` file contains four columns, the first is the
chromosome I have sampled from, the second the index into the chromosome
where I sampled, the third is the sub-sequence of the chromosome, and
the fourth column contains a mutated version of the sampled sequence.
For the exact matches, the third and the fourth columns are the same,
but you can simulate inexact subsequences if you use the option `-d`
with `simulate-fastq.py`.

Before you can use `bwa` for read-mapping you must index the reference
genome. You do this with the command

``` bash
bwa index ref.fa
```

This creates a number of files that `bwa` will use when mapping reads
against the reference.

``` bash
$ ls ref.*
ref.fa     ref.fa.amb ref.fa.ann ref.fa.bwt ref.fa.pac ref.fa.sa
$ bwa mem ref.fa exact-samples.fq
```

You can now compare the positions where we got the reads from with the
matches that `bwa` finds:

``` bash
less -S exact-samples.txt
bwa mem ref.fa exact-samples.fq | less -S
```

Check that these matches.

Now, try simulating inexact matches and run `bwa` again with these.
Inspect the hits and the CIGAR strings.

Notice how `bwa` uses two steps for an analysis: a *preprocessing* step
where it builds data structures it needs to scan a genome and then a
*read mapping* step, where it does the actual searching. In our final
project, we will do the same. The benefit of this approach is that we
can process a genome once, or at least each time we get a new genome
assembly---and genome assemblies do not change that often---and then
reuse this preprocessing every time we need to map new reads against it.
This can greatly speed up an analysis.
