# Week 13 — Saving space & Project Q&A

## Lecture

- Topics: Approaches to saving space and Q&A about project 5
- Slides: [GSA Week 13 — Saving space](../slides/GSA%20Week%2013%20--%20Saving%20space.pdf)

## Projects

Hand in project 5

## Exercises

### Clearing a bit-vector

Explain how you could set all bits in a bit-vector of length $n$ to 0 in time $O(n / \log n)$.

### Bit-vector NEG, AND and OR

The bit-wise logical operators like NEG, (`~x`), AND (`x&y`) and OR (`x|y`) are implemented in hardware if we use them on single computer words, and we can consider those constant time operations.

How would you implement the same operators on full bit-vectors in $O(n / \log n)$?

### Shifting

Shift on single computer words is implemented in hardware and we can consider such operations as running in constant time. How would you implement a shift operator on an entire bit-vector,  `bv >> k` or `bv << k`?

If `k` is smaller or equal to the wordsize `w` you only need to move data between neighbouring words. If `k > w`, the hardware (usually) won’t let you shift that far, and in any case, you need to move between non-adjacent words. If `k > w` it has the form `k = aw + b` where `a = k//w` and `b = k%w`. When shifting right, to get the values you need to put in `words[i]` you can consider shifting `b` for `words[i+a]` and `words[i+a+1]` and put it in `words[i]`. For shifting left, the situation is symmetric.

## Bring questions you might have about the last project

If you have any trouble getting things to work, or if you have ideas you want to discuss for improving the performance of your readmapper, bring them, and we can discuss them.

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


