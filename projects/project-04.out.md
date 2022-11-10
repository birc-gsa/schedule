# Project 4: BWT-based matching (FM-index)

Now that you have a functioning suffix array, you should implement the BWT-based search, also known as FM-index. This algorithm improves the search in the suffix array from $O(m \log n + z)$ to $O(m + z)$ after $O(n)$ preprocessing (plus whatever time it takes you to build your suffix array).

You should implement a suffix array construction algorithm. You can choose to implement the naive algorithm where you explicitly sort strings, or the $O(n)$ skew or SAIS algorithms, or any other algorithm. After constructing the suffix array, you should implement the binary search based and the Burrows-Wheeler based search algorithm.

The algorithms should be implemented in a program named `fm`. Since we are building data structures in a preprocessing step, and since a common usage of read mappers is to map multiple files of reads against the same genome, we should build the tool such that we can preprocess a genome once, and then reuse the preprocessed data on subsequent searches.

Therefore, your tool should have options for either preprocessing or read-mapping. If you run it as `fm -p genome.fa` it should preprocess the sequences in `genome.fa`, and if you run the tool as  `fm genome.fa reads.fq` it should search the genome and produce output in the same format as the previous projects.

When you preprocess `genome.fa` you should write the result to file. You are free to choose what you write to file, how many files you use, or how you represent the output. Use the input file name, here `genome.fa` but it can be any file name, to select the file names for your preprocessed data. That way, when you run a search with `fm genome.fa reads.fq`, your tool can determine which preprocessed files to read from the second first argument.

## Evaluation

Once you have implemented the `fm` program (and tested it to the best of your abilities) fill out the report in the README file on GitHub, and notify me that your pull request is ready for review.

Further information is available on GitHub where you can choose between implementing the project in :

* [C using CMake][proj4.c]
* [Go][proj4.go]
* [Python][proj4.python]

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

