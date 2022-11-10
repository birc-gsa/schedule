# Week 11 — Approximative matching

## Lecture

- Topics: Approximative matching — suffix tree & BWT
- Slides: [GSA Week 11 — Approximative matching](../slides/GSA%20Week%2011%20--%20Approximative%20matching.pdf)
- Reading material: SA Chapter 5

## Projects

- Hand in project 4
- [Start project 5](../projects/project-05.out.md)

## Exercises

### BWT based pattern matching

Recall the algorithm for exact pattern matching using BWT as presented in the lecture. In this algorithm we use two tables, $O$ and $C$, Show how to compute the $C$ table in time $O(n)$ and the $O$ table in time $O(\sigma n)$, where $n$ is the length of the text and $\sigma$ is the size of the alphabet.

### BWT and reversal

Implement a function that can take a string as input and output the BWT. Then implement a function that reverses this, i.e., given the Burrows-Wheeler transform of a string returns the original string.

Choose: [ [Python][bwt.python] ][ [Go][bwt.go] ][ [C][bwt.c] ]

[fasta.python]: https://classroom.github.com/a/3p-4YDEy
[fasta.go]:     https://classroom.github.com/a/w34JR9FD
[fasta.c]:      https://classroom.github.com/a/ljTlT5NO

[fastq.python]: https://classroom.github.com/a/SNorpTI9
[fastq.go]:     https://classroom.github.com/a/6jiC7ED4
[fastq.c]:      https://classroom.github.com/a/F2ywXphR

[sam.python]: https://classroom.github.com/a/bfS1ecIR
[sam.go]:     https://classroom.github.com/a/C9D3A55s
[sam.c]:      https://classroom.github.com/a/a8lzL6Nz

[cigar.python]: https://classroom.github.com/a/8IzKU7c4
[cigar.go]:     https://classroom.github.com/a/E7lgdZbX
[cigar.c]:      https://classroom.github.com/a/QZniBOMN

[border.c]:      https://classroom.github.com/a/t1bzUNuD
[border.go]:     https://classroom.github.com/a/LsL_tdES
[border.python]: https://classroom.github.com/a/a8Igh8ws

[tree.traversal.c]:      https://classroom.github.com/a/sYzQx5sn
[tree.traversal.go]:     https://classroom.github.com/a/xyKOTvu2
[tree.traversal.python]: https://classroom.github.com/a/VKJGqpFE

[radix.sort.python]: https://classroom.github.com/a/1ja1pcoM
[radix.sort.go]:     https://classroom.github.com/a/SaHPc4w7
[radix.sort.c]:      https://classroom.github.com/a/ohYQlbYy

[bwt.python]: https://classroom.github.com/a/2QD5TvYV
[bwt.go]:     https://classroom.github.com/a/vbUZjfns
[bwt.c]:      https://classroom.github.com/a/hBxQ1k2k


