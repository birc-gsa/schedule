# Project 1: Basic exact pattern matching

This project is about exact pattern matching. You should implement the naive quadratic time algorithm and a linear time algorithm of your choice, e.g. the border-array or the KMP-algorithm. The naive algorithm has the worst-case running time O(nm) and the other algorithms we have seen have worst-case running time O(n+m).

The algorithms should be implemented in two programs, `naive` and `lin`. Both programs should take two arguments (no more and no less): the first should be a Simple-FASTA file and the second a Simple-FASTQ file. The programs should output all matches in the Simple-SAM format to stdout (i.e., they should write to the terminal). Since we are only doing exact matching, the CIGAR strings in the output should consist of M’s only, since all the characters in the read will match the reference at the reported position.

For example, with this Simple-FASTA file

 > chr1
 mississippi
 > chr2
 mississippimississippi

and this Simple-FASTQ file

 @read1
 iss
 @read2
 mis
 @read3
 ssi
 @read4
 ssippi

your output should be

 read1 chr1 2 3M iss
 read1 chr1 5 3M iss
 read1 chr2 2 3M iss
 read1 chr2 5 3M iss
 read1 chr2 13 3M iss
 read1 chr2 16 3M iss
 read2 chr1 1 3M mis
 read2 chr2 1 3M mis
 read2 chr2 12 3M mis
 read3 chr1 3 3M ssi
 read3 chr1 6 3M ssi
 read3 chr2 3 3M ssi
 read3 chr2 6 3M ssi
 read3 chr2 14 3M ssi
 read3 chr2 17 3M ssi
 read4 chr1 6 6M ssippi
 read4 chr2 6 6M ssippi
 read4 chr2 17 6M ssippi

assuming you iterate over reads in an outer loop and FASTA records in an inner loop. If you order your loops differently, of course, the output will be different.

The project should be in groups of 2–3 students. It will not be graded.

## Evaluation

Once you have implemented the `naive` and `lin` programs (and tested them to the best of your abilities) fill out the report in the README file on GitHub, and notify me that your pull request is ready for review.

Further information is available on GitHub where you can choose between implementing the project in :

* [C using CMake][proj1.c]
* [Go][proj1.go]
* [Python][proj1.python]
