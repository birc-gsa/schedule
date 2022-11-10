# Week 12 — Bit-vectors and Q&A

## Lecture

- Topics: Implementing bit-vectors
- Slides: [GSA Week 12 — Bitvectors](../slides/GSA%20Week%2012%20--%20Bitvectors.pdf)

## Exercises

### Leading and trailing deletions

Will straightforward recursive approximative matching down a suffix tree include deletions operations at the beginning and end of the matches? Does it only report deletions at the beginning or the end of a match? Do you consider it meaningful to include flanking deletions? Can you prevent them if they are included?

### Best matches

If, instead of reporting all matches, we want to report the best matches, what should we do? By best matches I mean that if there are matches with zero edits, I do not want to see any match that does require edits. If I can find a match with one edit, I do not want to see any matches with two edits. And so on. How would you implement that?

### Approximative matching in a suffix array

Derive an approximative pattern matching algorithm based on the binary search approach to searching in suffix arrays. You want to write down a recursion; a depth first traversal of the recursion will get the job done.
