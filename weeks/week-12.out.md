# Week 12 — Bit-vectors and Q&A

## Lecture

- Topics: Implementing bit-vectors
- Slides: [GSA Week 12 — Bitvectors](../slides/GSA%20Week%2012%20--%20Bitvectors.pdf)

## Exercises

### Leading and trailing deletions

Will straightforward recursive approximative matching down a suffix tree include deletions operations at the beginning and end of the matches? Does it only report deletions at the beginning or the end of a match? Do you consider it meaningful to include flanking deletions? Can you prevent them if they are included?

### Best matches

If, instead of reporting all matches, we want to report the best matches, what should we do? By best matches I mean that if there are matches with zero edits, I do not want to see any match that does require edits. If I can find a match with one edit, I do not want to see any matches with two edits. And so on. How would you implement that?

### Approximative matching in a suffix array

Derive an approximative pattern matching algorithm based on the binary search approach to searching in suffix arrays. You want to write down a recursion; a depth first traversal of the recursion will get the job done.

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


