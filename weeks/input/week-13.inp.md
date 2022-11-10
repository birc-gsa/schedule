# Week 13 — Saving space & Project Q&A

## Lecture

- Topics: Approaches to saving space and Q&A about project 5
- Slides: [GSA Week 13 — Saving space](../slides/GSA%20Week%2013%20--%20Saving%20space.pdf)

## Projects

Hand in project 5

## Exercises

### Clearing a bit-vector

Explain how you could set all bits in a bit-vector of length $n$ to 0 in time $O(n / \log n)$.

### Bit-vector NEG, AND and OR

The bit-wise logical operators like NEG, (`~x`), AND (`x&y`) and OR (`x|y`) are implemented in hardware if we use them on single computer words, and we can consider those constant time operations.

How would you implement the same operators on full bit-vectors in $O(n / \log n)$?

### Shifting

Shift on single computer words is implemented in hardware and we can consider such operations as running in constant time. How would you implement a shift operator on an entire bit-vector,  `bv >> k` or `bv << k`?

If `k` is smaller or equal to the wordsize `w` you only need to move data between neighbouring words. If `k > w`, the hardware (usually) won’t let you shift that far, and in any case, you need to move between non-adjacent words. If `k > w` it has the form `k = aw + b` where `a = k//w` and `b = k%w`. When shifting right, to get the values you need to put in `words[i]` you can consider shifting `b` for `words[i+a]` and `words[i+a+1]` and put it in `words[i]`. For shifting left, the situation is symmetric.

## Bring questions you might have about the last project

If you have any trouble getting things to work, or if you have ideas you want to discuss for improving the performance of your readmapper, bring them, and we can discuss them.
