# Week 2 — Exact pattern matching

## Lecture

- Topics: Simple solutions to read mapping, Exact pattern matching,  Border arrays and a linear time algorithm
- Slides: [GSA Week 02 — Exact pattern matching](../slides/GSA%20Week%2002%20--%20Exact%20pattern%20matching.pdf)
- Reading material: String algorithms in C (SAC) Chapter 2, sections on naïve and border array algorithms

## Projects

- [Start project 1](../projects/project-01.out.md)

## Exercises

### FASTA files

At some point you will have to write a read mapper that can read in (Simple-)FASTA files, so you might as well write a parser for it now…

The exercise continues on GitHub, and you can choose which programming language you wish to implement it in: [ [Python][fasta.python] ][ [Go][fasta.go] ][ [C][fasta.c] ]

### FASTQ files

You will also have to read (Simple-)FASTQ files at some point, so write a parser for it now. Write a parser that lets you iterate through all the reads in the FASTQ file.

The exercise continues on GitHub, and you can choose which programming language you wish to implement it in: [ [Python][fastq.python] ][ [Go][fastq.go] ][ [C][fastq.c] ]

### SAM files

This year, let’s try to get the output of the programs right as well…

This is not a difficult exercise, but most errors I’ve seen in this class are trivial and idiotic misunderstanding what the output file format for the projects should look like. This exercise should alleviate it. Pick your language and solve it: [ [Python][sam.python] ] [ [Go][sam.go] ] [ [C][sam.c] ]
