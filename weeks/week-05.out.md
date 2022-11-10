# Week 5 — Applications of Suffix Trees

## Lecture

- Topics: Suffix tree, definition and applications, Representation of suffix trees
- Slides: [GSA Week 05 — Suffix trees (applications)](../slides/GSA%20Week%2005%20--%20Suffix%20trees%20applications.pdf)
- Reading material: SAC chapter 3

## Projects

- [Start project 2](../projects/project-02.out.md)

## Exercises

*I don't expect you to get through all the exercises this week. There are a lot of implementation tasks and not all of them will be used in the projects. The essential exercises are the tree traversal and the theoretical considerations for Aho-Corasick. You don’t want to skip those. The exercises marked with a \*  you can drop if they get too tricky, but give them a good try before you give up.*

### Tree traversal

For Aho-Corasick we need a breadth-first traversal of a trie. In general in this class we will often have need of traversing some tree structures, either depth-first or breadth-first (and sometimes it doesn’t matter as long as we traverse the entire tree).

Here is a small exercise to test that you are familiar with tree travesals: [ [C][tree.traversal.c] ][ [Go][tree.traversal.go] ][ [Python][tree.traversal.python] ]

You will need to traverse suffix trees in projects two and tree, but it is easier to do in binary trees in a simplified setting, so I strongly encourage you to do this exercise if it is the only thing you do.

### Threaded trees\*

Whenever we are talking really big trees, the space we use to traverse them can become an issue. The call stack very quickly becomes an issue in most languages. With Python you will get an exception thrown in your face very quickly. You can change how much stack space you have in the VM, but it is going to be of constant time, so there is no way around that. Go will grown its stack to adapt to how much space you need, but there is an upper limit (that depends on the architecture), and eventually you will get a panic here as well. C, being C, will also run out of stack space, but what happens is the usual C thing: it’s undefined. From experience, though, I can tell you that it isn’t pleasant.

Even if you don’t have a problem with the call stack—because you use a language that can grow the call stack, or because you use an explicit stack on the heap instead—you are still using memory when you traverse a tree, and that memory is proportional to either the depth or the width of the tree, depending on which traversal you are doing. That could very well be the difference between fitting your program in memory or not, when you work with strings that are hundreds of millions characters long.

Ideally, we would love to be able to traverse a tree with constant memory usage (in addition to the tree itself). Is that possible? Yes, or I wouldn’t be asking you to do it in this exercise. I’m not that cruel.

The trick is to use a so-called [*threaded tree*](https://en.wikipedia.org/wiki/Threaded_binary_tree). You either add a pointer per node, that points to where a traversal should go next, or you reuse memory that is already there but not used, like the child pointers of leaves.

Try to adapt the code you wrote in the previous exercise so you can do an in-order traversal in a threaded way. You might have to set up the pointers in some preprocessing—it depends on how you do it—but you are not allowed to do a “normal” traversal to do it; remember, we don’t have the memory to do that.

Does your solution also work for multi-furcating trees? Remember that if the alphabet of our strings isn’t binary, then a node can have more than two children.

A hint: the suffix tree in the book is implemented in a way that you can traverse without a stack.

### Aho-Corasick — Running time

Show that the running time of Aho-Corasick is O(n+m+z) where n is the input string, m is the sum of pattern lengths, and z is the number of reported occurrences.

### Aho-Corasick — Output sets

As mention in the lecture, we need to annotate the Trie with output sets in order to report the proper matches. Annotate the example Trie from the lecture with output sets.

### Representing a trie

In the programming language of your choice, how would you represent a trie? Work out how you will insert strings into it. Work out on a piece of paper how you would do it.

### Building a trie\*

Try to implement a trie and insert strings into it. If you get stuck, then don't worry about it, but trying to implement it is a good exercise that will give you a better understanding of the data structure. When you have to implement a suffix tree later, having a feeling for tries will be helpful.

There is no template code for this exercise, since that would defeat the point of the previous one where you have to come up with a representation for tries yourself. This also gives you a chance to set up an environment for your code yourself, which is an additional good exercise in its own rights.

### Implement Aho-Corasick\*

This is certainly not an easy exercise, so don't worry if you do not get through it, but trying to will give you a feeling for the algorithm.

### An Aho-Corasick read-mapper\*

If you build an edit cloud—which you have already written code for—and insert all the edit strings into a trie, you should be able to use Aho-Corasick to search for all occurrences of patterns. Try to write a read-mapper using this idea. You want to keep track of the CIGARS separately from the strings since there are more CIGARS per string. Don't worry if you do not manage to implement this either. It is not something you will need for the final project, but if you have implemented the Aho-Corasick algorithm it shouldn't be hard to implement this read-mapper either.

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


