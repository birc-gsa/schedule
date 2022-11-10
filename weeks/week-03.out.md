# Week 3 — Exact pattern matching, continued

## Lecture

- Topics: BMH and KMP
- Slides: [GSA Week 03 — BMH and KMP](../slides/GSA%20Week%2003%20--%20BMH%20and%20KMP.pdf)
- Reading material: SAC Chapter 2, sections on KMP and BMH

## Exercises

### Exact pattern matching

Your first project will involve implementing exact pattern matching algorithms. When you do so, you will, of course, also need to test them. This means both testing that they have the correct behaviour and that they have the correct running time.

As a warm-up exercise for the project, we can do this for the naïve algorithm. First, you should consider the following questions:

1. How would you test the correctness of the algorithm? Which cases do you think that you should test to have a reasonable confidence in your implementation?
2. If you convince yourself that you have a working implementation, how would you use that to test the correctness of more sophisticated algorithms?
3. How do you test the running time of an algorithm? Does it complicate matters if the complexity depends on more than one parameter?

Once you have come to solutions to these questions, implement the naïve algorithm and code to test correctness and test that the algorithm works as intended.

Give this some thought. You will need to convince me that you have tested your algorithms in the projects, and I am not convinced if you have just run them on two or three cases and eyeballed the result. I want proper testing, and it is your job to convince me that you have done a good job at it.

If you want, you can get started on [Project 1: Basic exact pattern matching](../projects/project-01.out.md). At least you can use the template code there as a starting point for implementing the naïve algorithm.

### Generating strings

An easy way to do inexact pattern matching, if we have an implementation of exact pattern matching, is to reduce the first problem to the second. If, given a pattern string, we can generate all strings at a certain edit distance from the pattern, then we can simply search for all the strings.

This might even be a good solution—who knows? It is worth giving this some thought. We don’t want to implement complicated algorithms and data structures if something simple will be good enough. In this exercise, you need to figure this out. Guestimates are fine, if they are reasonably accurate, but we want some quantifiable measure of how well we can expect this approach to work.

Consider this:

1. How many strings are at a given edit distance from a given string?
2. Can you derive a recursion for answering this question? The answers in such questions are not always closed formed—that depends on whether we can solve a recursion equation, but a place to start is to get the recursion. If you can write a recursive formula, then you also have a solution; not everything has to be neat. (And if it takes too long to compute a recursive formula, then you know that dynamic programming can save the day).
3. It is hard to calculate exactly how many strings are at a given distance because many different sequences of edits can lead to the same string. The sequences of edits are unique, however, so instead of counting strings you can count the edit strings (or CIGARs) you can generate.
4. From the recursion, can you derive an asymptotic complexity? Either lower bound or upper bound, if not exact.
5. If the lower and upper bound, which is more important for this particular problem?

Now try and implement the recursion you come up with and plot the number of strings/edits at various edit distance to strings of various lengths. Does the result look promising?

As a bonus challenge, derive an algorithm for actually generating the strings and implement that. Since, in the SAM format, matches contain CIGAR strings together with positions of matches, can you extend the algorithm so it generates both approximate strings and the CIGAR string corresponding to the edits?

### Edits and CIGAR strings

In the first many weeks of this class, we will only focus on “exact pattern matching”, which means, given a long string `x` and a shorter one `p`, find out at which positions `p` occur in `x`. With this problem, you have the full answer if you know at which indices occurrences of `p` start (or end) in `x`, so one way to report an answer is as a list of indices. However, for read mapping, this does not suffice. There, we want “approximative pattern matching”; we want to know where we “almost” find occurrences of `p` in `x`.

The details of what we mean by “almost occurrences” is something we will return to. For now it suffices to see that knowing at which indices we almost have an occurrence of `p` won’t necessarily be enough to know what that “almost” occurrence is. If I have an occurrence of the string `p'` at index `i` in `x`, and `p'` almost is the same as `p`, then I want to know both what `i` and `p'` is, not just that there is some, otherwise undefined, occurrence there, that somewhat relates to `p`.

One way to look at “almost `p`” is to say that I can transform `p` into `p'` in some way. Then, if I report where there are occurrences, indices such as `i`, *and* I report which operations I should do to translate `p` into `p'`, *then* I have the full information about what the “almost occurrence is”.

Consider, as an example:

```</>
x = aaba
p = aa
```

We obviously have an occurrence of `p` at index 0: `x[0:2] = aa = p`, but we also have an “almost” occurrence a `x[1:3] = ab ~= aa = p`, we just have to change the second `a` in `p` into a `b`. At index 2 we have `x[2:4] = ba ~= aa = p` where we can get an “almost match” if we change the first letter in `p` from an `a` to a `b`.

The standard format that read mappers use to describe how you have to modify `p` to get `p'` is called [CIGAR strings](https://jef.works/blog/2017/03/28/CIGAR-strings-for-dummies/).[^1] These are run-length encoded sequences of edit operations. We’ll get to the run-length encoded part shortly, but first we’ll consider the operations.

The basic edit operations to go from one string to another are these three:

1. Match/mismatch (either keep a letter as it is, or substitute it with another)
2. Insert (insert a new letter)
3. Delete (delete a letter)

Strictly speaking, you don’t need the mismatch operation, since you can always substitute one letter for another by first deleting the existing one and then inserting the other, and some approaches do that, but these three operations are the typical ones.

As operations, we can encode the three as `M`, `I`, or `D`. The `M` doesn’t distinguish between matches or mismatches, but there are modified versions of CIGAR strings that do, where `=` means a match and `X` a mismatch. This isn’t necessary, though; if you have both `x`, `p` and the index where you have a match, `i`, then you can determine whether you have a match or a mismatch without further information.

The three “almost matches” described above, at index 0, 1, and 2, could be described as two `M` operations. To match `p = aa` and index 0, we say that we first match:

```</>
x[0:] = a...
p     = a
        M
```

and then match again

```</>
x[0:] = aa...
p     = aa
        MM
```

and that would be the perfect match. At index 1 we would have

```</>
x[1:] = a...
p     = a
        M
```

and then match again

```</>
x[1:] = ab...
p     = aa
        MM
```

and this time the second “match” happens to be a “mismatch”.  We still know what the `p'` in the “almost match” was: it has to be `ab` because that is the part of `x` we have matched.

We could also match `p` at index 0 in a different way: match the first character, then skip the `b` at `x[1]`, and then match `a` against `a` at `x[2]`

```</>
x[0:] = aba...
p     = a-a
        MIM
```

Here, we need to insert a character into `p` to get `p'` to match the second character in `x`, so we match the first, `M`, insert a character `I` (and from `x` we can immediately see which character we need to insert), and then we match once more, `M` to finish the transformation from `p` to `p'`.

Or, we could match `p` at index 0 if we deleted the second character in `p` to transform `p = aa` into `p' = a`:

```</>
x[0:] = a-ba...
p     = aa
        MD
```

Notice that we use dashes, `-`, when we align the two strings, one above the other, to display these transformations. When we insert something, we need a letter from `x` to go in between two letters in `p`, and we make room for it by putting a `-` in `x` so we can still align characters on top of each other. When we delete something from `p` with a `D` operation we likewise need to have a letter from `p` appear between two letters in `x`, and we put a dash, also called a “gap”, at the position where this letter goes.

When we write strings on top of each other that way, showing how the tranformations are done, we call it an *alignment*. Here, there are only two strings, `x` and `p`, and we call that a *pairwise alignment*. And since we don’t align all of `x` but only a local substring, it is a *local pairwise alignment*. I know it is a complicated nomenclature, but you get the hang of it with time.

If you have `x`, `p`, `i` and a sequence of edits that describes how to transform `p` into `p'`, then the letters in `x` gives you the information about what `p'` is, so we don’t need to know that. Just the two strings, the position, and the operations. So, to report an approximative alignment, we only need to report `i` and the edit operations; everything else is given by context.

Now, since we usually have relatively long strings for `p`, at least one or two hundred characters, and since we don’t allow that many edit operations before we declare that we do not have a match, we expect that a match will have an edit sequence with mostly `M` operations. An edit string such as `MMMMMMMMIMMMMMDMMMMMMM` is wasteful in memory—and we will have tons and tons of these in a real application, so we compress these strings. A simple compression is [run-length encoding](https://en.wikipedia.org/wiki/Run-length_encoding). Replace each run of the same character `MMMMMMMM` `I`, `MMMMM`, `D` and `MMMMMMM` with how many times a letter is repeated, followed by the letter `MMMMMMMMIMMMMMDMMMMMMM` = `8M1I5M1D7M`. This doesn’t necessarily shorten a string, if you have no repeated letter in the string it grows to twice its length instead, but for the typical use in approximative matching, it will. These run-length encoded lists of edit operations is what we call CIGAR strings.

While you won’t need to deal with edits right now, you will eventually have to at the end of the class. At that point, we will be busy with implementing complicated algorithms, so now, where we have more time on our hands, seems like a good time to work a little with the CIGARs. Then you will have tools for dealing with them later, when you need them.

This exercise continues on GitHub, and you can choose which programming language you will do the exercises in: [ [Python][cigar.python] ][ [Go][cigar.go] ][ [C][cigar.c] ]

[^1]: CIGAR stands for “Concise Idiosyncratic Gapped Alignment Report”, and I will bet good money that the acronym was chosen before the text it supposedly abbreviates.

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

