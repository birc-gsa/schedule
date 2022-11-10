# Week 10 — BWT

## Lecture

- Topics: BW-transform based pattern matching
- Slides: [GSA Week 10 — BWT search](../slides/GSA%20Week%2010%20--%20BWT%20search.pdf)
- Reading material: SAC chapter 4
- Extra material: H. Li and R. Durbin. [Fast and accurate short read alignment with Burrows-Wheeler transform](https://academic.oup.com/bioinformatics/article/25/14/1754/225615). Bioinformatics, vol. 25, pages 1754-1760, 2009. Focus on section 2.2-2.4 that outlines a method for exact pattern matching using the suffix array and the Burrows-Wheeler transform.

## Exercises

### Building a suffix array without using a suffix tree but using radix-sort

In the lecture, we said that we could build the suffix array for a string of length $n$ in time $O(n^2)$ using radix-sort. In this exercise, you get to explore that in a little more detail.

Choose: [ [Python][radix.sort.python] ][ [Go][radix.sort.go] ][ [C][radix.sort.c] ]

If we do a radix sort from most-significant letter to least-significant, we split the data into separate blocks and sort them independently. At each level, we can have up to $O(n)$ blocks (or up to $n/2$ if we are sensible not to sort singletons). Depending on how we represent the bucket-counts, this can affect the running time.

If we have $O(n)$ elements in an array and $O(k)$ different buckets represented as an integer array, we need to scan the array two times, to count and to place values, each in time $O(n)$, and we need to initialise the buckets array in time $O(k)$. That gives us the $O(n+k)$ time for a bucket sort.

However, if you split the $O(n)$ elements into smaller chunks and handle them independently, the analysis changes. We can have up to $n/2$ blocks (if we are sensible not to sort singletons) and for *each* of these blocks we use time $O(m+k)$ where $m$ is the size of the block. If all the blocks have size 2, this is $O(2+k)=O(k)$ per block, or $n/2 \times O(k) = O(nk)$ to sort all the blocks. The overhead in initialising the bucket count table to zero is paid for in *each block* instead of once and for all.

Is this a problem for the asymptotic running time?

If we are in a situation where we build our alphabet dynamically, like we do with skew or SAIS, then $k$ can be of order $O(n)$. In that case, what would the running time be for the least-significant digit first radix sort, and what would it be for the most-significant digit first radix sort?

What happens is that the number of keys can grow larger than the number of elements in a chunk. We never construct alphabets where $k > n$, so we never have a larger alphabet than the number of keys we have in total. But this is not the same as saying that we never have a larger alphabet than a *block size*.

If, for each block, you can reduce the alphabet size to no more than the block size, then the $O(m+k)$ becomes $O(m)$, and handling all blocks will take $O(n)$ since the block sizes adds up to the total number of elements.

What do you need to do to reduce the bucket initialisation time to no more than the number of elements?

Of course, if your chunk has m elements, there can’t be more than m unique keys. And you only need a buckets table for the observed keys. So in theory at least, it seems possible that we can reduce the existing alphabet of size $k$ to a smaller one $k'$ in $O(m)$ by only considering those keys we actually have. But how would you do that?

If you are now thinking hash tables, or something along those lines, remember that you need to compute the cumulative sum of the counts. That means that you must be able to run through the observed keys in sorted order—which means that you have to sort them.

If you have $k'$ ($k' \in O(m)$) unique keys, numbers between 0 and $k-1$, can you then sort them in $O(m)$? If you don’t have a constant bound on $k$, you cannot use bucket/radix sort, and if you use comparison sort you need at least $O(k' \log k')$ which might not be in $O(m)$.

In the full general case, this is an issue. There might be something to gain from the most-significant digit first approach when you can terminate the sort early, but there is a larger overhead in having to deal with recursion and the book-keeping there, and there is a potential issue in the asymptotic running time increasing as well, even to super-linear. This doesn’t mean that MSD is a bad approach, it can easily outcompete LSD in some situations, but it means that it is an engineering question that depends on the specific problem and the specific data you are working with.

In practise, there are also ways around the last problem. If your keys are bounded by n (i.e. the size of the alphabet k is less than n) and n fits in a bounded word size (as often assumed), say n is known to fit into a 32-bit integer, then you can radix sort the keys by breaking them into smaller keys, here 4 bytes. There are only 256 different bytes (a constant) and you have to radix sort four times (a constant), so that way you can sort m keys of maximum size $n$ in $O(4(m + 256)) = O(m)$. If we can sort one block in $O(m)$, then we can sort all of them in $O(n)$. Assuming that $n$ fits in 32 bits (or 64 bits or 128 bits or anything that is just constant we know ahead of time) is not a strong assumption. It isn’t t theoretically valid in complexity theory, but in practise it works most of the time.

### Sorting LMS strings

Show that the LMS strings are sorted with the procedure in the algorithm. This is not trivial, but it is *the* key trick in the algorithm, so it is essential that you understand it. It is well worth your time to spend some time on this exercise and come up with a proof of correctness!

### Sorted LMS suffixes

Show that if we have the suffix array from the reduced string then we also have the order of the LMS suffixes.

### Building the alphabet

Why can’t you just put all the LMS strings into a table, the way you can for the triplets in the skew algorithm? What could possibly go wrong?

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


