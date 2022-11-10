# Project 5: building your very own readmapper

In this final project, you will write a complete read mapper.

The read mapper should be able to preprocess a reference genome. To avoid preprocessing each time you need to map reads, you should store the preprocessed data structures on disk. Reference genomes come in Simple-FASTA format, as usual, and reads in Simple-FASTQ format, and your tool must write matches to standard out in Simple-SAM.

Your program, which should be named `readmap`, and should take the following options:

* `readmap -p genome.fa` should preprocess the genome
* `readmap -d k genome.fa reads.fq` should do read-mapping for matches within an edit distance .

## Evaluation

Once you have implemented the `readmap` program (and tested it to the best of your abilities) fill out the report in the README file on GitHub, and notify me that your pull request is ready for review.

Further information is available on GitHub where you can choose between implementing the project in :

* [C using CMake][proj5.c]
* [Go][proj5.go]
* [Python][proj5.python]

[proj1.c]:      https://classroom.github.com/a/he9xv9uf
[proj1.go]:     https://classroom.github.com/a/hIRqbX7M
[proj1.python]: https://classroom.github.com/a/bq7xX7mv

[proj2.c]:      https://classroom.github.com/a/4ndR3xZS
[proj2.go]:     https://classroom.github.com/a/MwQhgiLU
[proj2.python]: https://classroom.github.com/a/VLsSqtEJ

[proj3.c]:      https://classroom.github.com/a/lJuQfu71
[proj3.go]:     https://classroom.github.com/a/-Y9qtwJi
[proj3.python]: https://classroom.github.com/a/PQOTuoXI

[proj4.c]:      https://classroom.github.com/a/PJcW0pbi
[proj4.go]:     https://classroom.github.com/a/cqnXFaoA
[proj4.python]: https://classroom.github.com/a/B6L8EnO1

[proj5.c]:      https://classroom.github.com/a/WZK52vWy
[proj5.go]:     https://classroom.github.com/a/95N2-iEX
[proj5.python]: https://classroom.github.com/a/iPfMJiia

