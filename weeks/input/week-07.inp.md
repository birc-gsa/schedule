# Week 7 — Suffix arrays

## Lecture

- Topics: Suffix arrays, lcp arrays, enhanced suffix arrays and interval trees, and how to construct suffix trees from suffix and lcp arrays
- Slides: [GSA Week 07 — Suffix trees, LCP and SA construction](../slides/GSA%20Week%2007%20--%20Suffix%20trees%20and%20LCP%20and%20SA%20arrays.pdf)
- Reading material: SAC Chapter 3
- Additional material: M.I. Abouelhoda, S. Kurtz, and E. Ohlebusch. [Replacing suffix trees with enhanced suffix arrays.](https://www.sciencedirect.com/science/article/pii/S1570866703000650) Journal of Discrete Algorithms, vol. 2, pages 53-86, 2004. This paper is nice to know, since it describes how to replace suffix trees with suffix arrays in practice in order to avoid the space consumption of suffix trees. It is not the only way to simulate a suffix tree with a suffix array, but it is where most of the tricks are introduced.

## Projects

- Hand in project 2
- [Start project 3](../projects/project-03.out.md)

## Exercises

### Border

Given a suffix tree, can you find the longest border of your string?

### Palindromes

How would you use a suffix tree to compute all palindromic repeats?

### Linear time suffix tree construction algorithms

Linear time suffix tree construction algorithms, building a tree directly from a string, are usually one of the exam questions, and since we do not implement any of them this year, you should be extra careful that you understand how one works. That will, naturally, be the McCreight algorithm. Discuss what the key tricks are in the algorithm and how these tricks give you linear time algorithms.

- Given a node, $v$, what is $s(v)$?
- What is the head of suffix $i$, $h(i)$?
- What are the relationships between leaf $i$ and its parent, $p(i)$, and the corresponding strings?
  - Between $p(i)$ and $s(p(i))$?
  - Between $p(i)$ and its parent $p^2(i)$
  - Between $s(p(i))$ and $s(p^2(i))$?
- How do we get from leaf $i-1$, that we just inserted, to $h(i)$?
  - Which steps are involved?
  - Which properties do we exploit?
  - What is the total time of each of the steps?
- Could you fast scan all the way to $h(i)$? If not, why not?

### Suffix links

1. Show that if u is a node in the suffix tree, then so is $s(u)$.
2. Show that if you have just inserted suffix $i$, then for all prefixes $y$ of $h(i)$, $s(y)$ is in the trie.
3. Show that if you have just inserted suffix $i$, then for inner nodes *v* in the trie, *except* possibly for $h(i)$, $s(v)$ is also a node. ($s(h(i))$ might also be, but can you give an example where it isn't?)
4. Give an example of a string, where you have $s(h(i))$ on an edge, right after you insert suffix `x[i:]`, and show that you will turn it into a node when you insert suffix `x[i+1:]`.
5. Show that the depth of node $v$, is no more than one larger than its suffix, $s(v)$, i.e. show that $d(v) \geq s(v) + 1$.
