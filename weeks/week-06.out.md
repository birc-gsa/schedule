# Week 6 — Suffix tree construction

## Lecture

* Topics: Suffix tree construction algorithms
* Slides: [GSA Week 06 — Suffix tree construction](../slides/GSA%20Week%2006%20--%20Suffix%20trees%20construction.pdf)
* Reading material:
  * Focus on the slides, since they give a presentation of the algorithm with the same notation as the previous slides. Otherwise, the original algorithm is in this paper: E. M. McCreight (1976). [A Space-Economical Suffix Tree Construction Algorithm](https://dl.acm.org/doi/10.1145/321941.321946). Journal of the ACM. 23 (2): 262–272. doi:10.1145/321941.321946
  * SAC Chapter 3

## Exercises

### Representing suffix trees

Discuss how you would represent suffix trees in the programming language you use for the projects. In project 2 you need to implement a suffix tree, and the choice of representation could be important there.

### Searching in a suffix tree

#### Searching

Describe how you would search for a string `y` in a suffix tree `S(x)`.

How do you return the result, if you have to handle both complete matches and partial matches (where only a prefix of y, possibly empty, is in the suffix tree)?

How do you handle that a search can finish both on an edge and on an inner node? (And why can’t it finish on a leaf?)

Bonus points if you have implemented this search.

#### Reporting occurrences

Say that the string you search for is in the suffix tree, `S(x)`.

* How do you report at which positions in x where the string occurs?
* How long does it take to report them, with your implementation?
* Can you say anything about the order of the reported occurrences, compared to e.g. KMP or the naïve algorithm?

### Inserting a new string

If you have a compacted trie, and the search method from above, how would you insert a new string in the trie?

(In the next project, that is what you have to do: you will construct a suffix tree by iteratively inserting shorter and shorter suffixes, `x[0:n]$`, `x[1:n]$`, `x[2:n]$`, …)

You must handle both when the search ends on an inner node and on an edge.

* What do you do in the two cases?
* If you have to split an edge, how do you do this efficiently, so the existing structure doesn’t break?

You want to flesh this out in sufficient detail that you can implement it, because you have to in the next project.

### Suffix tree construction from a suffix trie\*

Assume you have a trie of all suffixes of a string. Describe how you would create a suffix tree from it (i.e. how you would compress it).

How you do this depends on the specific way you have represented both trie and tree in an implementation, so explain what the representation is, e.g. which fields are necessary to store in nodes for your algorithm to work.

For an extra bonus, implement a trie and an algorithm for creating a suffix tree.

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


