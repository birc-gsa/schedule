# Week 4 — Aho-Corasick

## Lecture

- Topics: The Aho-Corasick algorithm
- Slides: [GSA Week 04 — Aho-Corasick](../slides/GSA%20Week%2004%20--%20Aho-Corasick.pdf)
- Reading material: SAC chapter 3, the section on Aho-Corasick

## Projects

- Hand in project 1

## Exercises

### Border arrays

#### Strict border arrays

The algorithm for constructing border arrays is relatively straightforward, as long as you are careful with the indexing. Implement it in your preferred programming language—if that is C, there is already an implementation in the book, so don’t look there before you are done.

If your preferred language is one of the following three, you can use the templates at GitHub as a starting point: [ [C][border.c] ][ [Go][border.go] ][ [Python][border.python] ]

We define the border array `ba` such that `ba[i]` is the longest border of `x[1:i+1]`. Now, define `bax` such that `bax[i]` is the longest border of `x[1:i+1]` where `x[bax[i]]` differs from `x[i+1]`, that is, the next character after the border and the position in `x` must be different.

Can you derive an algorithm for computing `bax`?

A hint here is that either `bax[i]=ba[i]`, when the additional condition is satisfied, or else it must be the longest border of `x[1:ba[i]]` where the condition is satisfied (can you show why?). This is a value that can be found in `bax`.

#### Improper borders

A border must be a proper prefix matching a proper suffix. We could change the definition so they are allowed to be improper as well, i.e., the prefix/suffix is allowed to be the entire string. Describe what the border array would look like if that were the case.

#### Reverse border arrays

Come up with an algorithm for computing what we can call “the reverse border array”, an array `r`, where `r[i]` is the length of the longest border of the *suffix* starting at index `i`, `x[i:]` (in contrast, the border array is the length of the longest border of the *prefix* that *ends* at i, `x[:i+1]`. The running time should be $O(n)$.

What is the relationship between the reverse border array and the border array of the reversed string?

### Exact pattern matching

The following exercises ask you to prepare a presentation of the algorithms at the blackboard. You should prepare this the way you would prepare for the exam—the point of exercises is amongst other things to prepare your or the exam—but a good rule of thumb is that if you cannot explain an algorithm to others, you do not understand it. These exercises are here to make sure that you understand the algorithms.

#### Presentations

Present how the KMP algorithm works.

Present how the BMH algorithm works.

#### KMP and BMH performance

Explain the running time of KMP.

Explain the running time of BMH.

Explain what the best- and worst-case running time is for both KMP and BMH. Give examples.

If we used the strict border array in KMP, how would that affect the running time?
