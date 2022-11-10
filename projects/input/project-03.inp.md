# Project 3: Suffix array construction

You should implement a suffix array construction algorithm. You can choose to implement the naive $O(n^2 log n)$-time construction algorithm based on just sorting all the suffixes using a comparison based algorithm, the $O(n^2)$ algorithm you get if you radix sort the suffixes, or you can use the suffix tree from project 2: If you run through the suffix tree, and traverse children in lexicographical order, you will see each leaf in lexicographical order as well, and if you collect all the leaf-labels you have your suffix array.

If you feel adventurous, you are also welcome to implement one of the linear time algorithms *skew* or *SAIS* that we will see the next two weeks, but then you will have to read a bit ahead.

Once you have constructed a suffix array you should use it to implement a binary-search based exact pattern matching. Since I haven’t taught you have to do it faster, it should run in $O(m \log n + z)$ where $m$ is the length of the pattern, $n$ is the length of the genome string, and $z$ is the number of matches you report.

Implement the suffix array construction and the exact pattern matching in a single program called `sa`.  The program should take the same options as in [project 1](./project-01.out.md), so `sa genome.fa reads.fq` and produce output in the same format. The program should output (almost) the same Simple-SAM file. Because a search in a suffix array is not done from the start to the end of the string the output might be in a different order, but if you sort the output from the previous project and for this program, they should be identical.

## Evaluation

Once you have implemented the `sa` program (and tested it to the best of your abilities) fill out the report in the README file on GitHub, and notify me that your pull request is ready for review. Further information is available on GitHub where you can choose between implementing the project in :

* [C using CMake][proj3.c]
* [Go][proj3.go]
* [Python][proj3.python]
