# Week 6 — Suffix tree construction

## Lecture

* Topics: Suffix tree construction algorithms
* Slides: [GSA Week 06 — Suffix tree construction](../slides/GSA%20Week%2006%20--%20Suffix%20trees%20construction.pdf)
* Reading material:
  * Focus on the slides, since they give a presentation of the algorithm with the same notation as the previous slides. Otherwise, the original algorithm is in this paper: E. M. McCreight (1976). [A Space-Economical Suffix Tree Construction Algorithm](https://dl.acm.org/doi/10.1145/321941.321946). Journal of the ACM. 23 (2): 262–272. doi:10.1145/321941.321946
  * SAC Chapter 3

## Exercises

### Representing suffix trees

Discuss how you would represent suffix trees in the programming language you use for the projects. In project 2 you need to implement a suffix tree, and the choice of representation could be important there.

### Searching in a suffix tree

#### Searching

Describe how you would search for a string `y` in a suffix tree `S(x)`.

How do you return the result, if you have to handle both complete matches and partial matches (where only a prefix of y, possibly empty, is in the suffix tree)?

How do you handle that a search can finish both on an edge and on an inner node? (And why can’t it finish on a leaf?)

Bonus points if you have implemented this search.

#### Reporting occurrences

Say that the string you search for is in the suffix tree, `S(x)`.

* How do you report at which positions in x where the string occurs?
* How long does it take to report them, with your implementation?
* Can you say anything about the order of the reported occurrences, compared to e.g. KMP or the naïve algorithm?

### Inserting a new string

If you have a compacted trie, and the search method from above, how would you insert a new string in the trie?

(In the next project, that is what you have to do: you will construct a suffix tree by iteratively inserting shorter and shorter suffixes, `x[0:n]$`, `x[1:n]$`, `x[2:n]$`, …)

You must handle both when the search ends on an inner node and on an edge.

* What do you do in the two cases?
* If you have to split an edge, how do you do this efficiently, so the existing structure doesn’t break?

You want to flesh this out in sufficient detail that you can implement it, because you have to in the next project.

### Suffix tree construction from a suffix trie\*

Assume you have a trie of all suffixes of a string. Describe how you would create a suffix tree from it (i.e. how you would compress it).

How you do this depends on the specific way you have represented both trie and tree in an implementation, so explain what the representation is, e.g. which fields are necessary to store in nodes for your algorithm to work.

For an extra bonus, implement a trie and an algorithm for creating a suffix tree.
