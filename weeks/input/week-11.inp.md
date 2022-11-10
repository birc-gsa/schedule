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
