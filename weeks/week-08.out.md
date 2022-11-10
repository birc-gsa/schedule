# Week 8 — suffix arrays and skew

## Lecture

- Topics: Suffix arrays and a linear time construction algorithm called skew
- Slides: [GSA Week 08 -- Suffix arrays and the skew algorithm](../slides/GSA%20Week%2008%20--%20Suffix%20arrays%20skew.pdf)
- Reading material: SAC Chapter 4
- Extra material: J. Karkkainen and P. Sanders. [Simple Linear Work Suffix Array Construction](http://citeseerx.ist.psu.edu/viewdoc/summary?doi=10.1.1.125.1794). In Proceedings of the 30th International Colloquium on Automata, Languages and Programming (ICALP), LNCS vol. 2719, pages 943-955, 2003. If you read this one, then focus on sections 1 and 2, ignore the stuff about “other models of computation”.

## Exercises

### Constructing suffix trees from LCP and suffix arrays

We have seen that you can construct a suffix tree from the LCP and suffix arrays. Argue why this can be done in time $O(n)$, where n is the length of the text.

As we have talked about in the lectures, the LCP/SA suffix tree construction algorithm is building the suffix tree by inserting the suffixes of the text in lexicographical order, i.e. in the order given by the suffix array. In the first round, we insert suffix `sa[0]`, in the second round, we insert suffix `x[1:]`, and in the i’th round, we insert suffix`x[i-1:]`.

We can define `head(i)` similar to McCreight, as the the longest prefix that suffix `x[i:]` shares with the previously inserted strings. It isn’t exactly the same, because in McCreight the order of “previously inserted” is different, it is suffixes `j < i` while for this algorithm it is the lexicographically smaller, `j: sa[j] < sa[i]`, but it serves the same purpose.

When inserting suffix `i`, we start the from the leaf representing suffix `i-1`, and efficiently search for `head(i)` using `lcp[i]` in a ‘fastscan’-like manner.

- Why is it essential to start from the leaf? We know that a prefix of length `lcp[i]` of suffix `i` is in the suffix tree, i.e. we could also fastscan for `head(i)` from the root. What is the worst case running time of this approach?
- Can you give an example of worst case input?

### Exact search in suffix arrays

You know that you can use a binary search in a suffix array for exact pattern matching if you can test which, of two strings, is the lexicographically smaller. You can also do a binary search one character at a time. If you use an interval `[L,R]` where a prefix of the pattern match you can find a smaller interval where the prefix and the next character match.

1. Show that these intervals are nested.
2. Show that you can go from one interval to the next in O(log n)
3. Describe the exact pattern matching algorithm and show that it runs in time O(m log n)

### Suffix links in suffix arrays

In McCreight’s algorithm we used a suffix link function, `s(aw) -> w`, that also functioned as a pointer from inner node `aw` to inner node `w`. Imagine instead that we have a suffix array `sa` and an index into it `i` with `x[sa[i]:] = aw`, i.e., the suffix at position `sa[i]` is the string `aw`. How would you find index `j` such that `x[sa[j]:] = w`?

### Finding maximal repeats using an extended suffix array\*

On [the slides from Week 05](../slides/GSA%20Week%2005%20--%20Suffix%20trees%20applications.pdf) there is an algorithm that finds maximal repeats, that is strings `x[i:i+k] == x[j:j+k]` where `x[i-1] != x[j-1]` and `x[i+k+1] != x[j+k+1]` (strings that match, but do not match if you include the character before or after them). The algorithm works by traversing a suffix tree, collecting leaf-lists in the inner nodes. Can you derive an algorithm that does the same, but using the suffix and lcp arrays instead?

If you feel brave, you can implement it. It is not as hard as it appears at first glance.

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


