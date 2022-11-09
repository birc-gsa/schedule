# Week 9 --- suffix arrays and SAIS

## Lecture

-   Topics: Linear time suffix array construction with the SAIS
    algorithm
-   Slides: [GSA Week 09 --- Suffix arrays and the SAIS
    algorithm](../slides/GSA%20Week%2009%20--%20SA-IS%20algorithm.pdf)
-   Reading material: SAC Chapter 4

## Projects

**FIXME**

-   Hand in project 3
-   [Start project
    4](https://www.dropbox.com/s/k6skgrwlhs8mrz4/Project%204-%20BWT-based%20matching%20%28FM-index%29.pdf?dl=0)

## Exercises

### Building a suffix array from a suffix tree

If we have a suffix tree --- which we should by now --- then it is
simple to build a suffix array in linear time. You just need to traverse
the tree in lexicographical order. So this week, we will implement that.

To traverse in lexicographical order in linear time, we must be able to
traverse the children of any given node in lexicographical order. Well,
technically we could search for each character in order, since we assume
that the alphabet size is constant in most of what we do, but we know it
isn't real.

*Problem 1:* If you don't already have your children in order---no pun
intended---then what strategy would you use to traverse the tree in
lexicographical order?

*Problem 2:* As a group exercise, discuss various strategies and we will
discuss them. You won't have to implement them, so you can get as
creative as you want.

A strategy that you should be able to implement is this: make a list
with the length of the alphabet size and simply bucket the children into
it each time you recurse to a new node. You cannot reuse the say array
here if you traverse the tree recursively since that would break the
bucketing of parental nodes, but you don't need to modify the tree in
any way to implement an algorithm like this:

1.  At the given node, bucket all the children.
2.  In the correct order, traverse the bucket list.
3.  If there is a child in a bucket, recurse.

*Problem 3:* What would the complexity of this approach be?

*Problem 4:* Try to implement this strategy to build a suffix array from
a suffix tree.

### Building a suffix array using `sort` and `strcmp`

Most programming languages have a builtin function for comparison of
strings, e.g. `strcmp` in C. Most programming languages also have a
builtin sorting function that can efficient sort a sequence of objects
given a function to compare to objects, e.g. `qsort` in C.

Use the functions for sorting and comparing strings in your favourite
programming language to make a simple program for constructing the
suffix array of a string.

How fast is this program compared to other ways of constructing suffix
arrays that you have implemented?

### Building a suffix array in linear time using the Skew-algorithm

In the lecture we presented the Skew-algorithm that can build a suffix
array in linear time.

We claimed that we can construct `sa0` in time $O(n)$ using radix-sort,
where the ordering of the suffixes `s[1..], s[4..]` etc. are determined
in constant time using `sa12`. Explain how we did this. What do we
require from the data and the algorithm for this to work?

Explain why the Skew-algorithm divides the suffixes into the two groups
"i mod 3 != 0" and "i mod 3 = 0" instead of just dividing into the two
groups "i mod 2 != 0" and "i mod 2 = 0" of equal size, i.e. the odd and
even suffixes.
