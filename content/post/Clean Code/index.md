---
title: 'Clean Code'
tags: ['clean code']
date: 2024-05-04T10:00:00+00:00
draft: false
---

![Clean Code](./image.webp)

## Readable Code: Practical Tips for Senior Software Engineers

Senior software engineers are expected to write clean, readable code — but what does that mean, and how do we do it? In this post, I'll explore the concept of readability and share some practical tips to help you write code that's easy to understand and maintain.

## Defining Readability

For me, readable code allows a developer to quickly grasp the main purpose and logic flow without straining their mental capacity. Since our working memory is limited, we need to break down complex code into smaller, easily digestible chunks.

Let's dive into some simple but powerful principles that I apply daily to write cleaner code. These practices are mostly broadly applicable, while some are more specific to JavaScript/TypeScript.

## Prevent Side Effects

Methods should perform a single, well-defined task. Side effects make code unpredictable by changing things outside the method's intended scope. This creates a mismatch between your mental model of the code and its actual behavior, leading to bugs.

## Descriptive Names

Descriptive names serves same purpose: enabling code abstraction. You can quickly grasp the purpose of a method by its name, allowing you to treat it as a self-contained unit.

## Define And Follow Conventions

In large, collaborative projects, consistent conventions make code feel like it was written by a single person. This homogeneity dramatically improves readability. Use a linter to enforce your chosen conventions. (What is the difference between prettify and eslint)

## Minimal Branching

Strive to merge code paths as quickly as possible. When the same task can be done in multiple ways, inconsistencies are likely to creep in when eventually only one branch will be modified upon subsequent features implementation.

## Strict Types Usage

Defining interfaces instead of using 'any' adds valuable guardrails to your code. It restricts how a function can be used, provides helpful IDE support, and clearly documents your intended use for future developers (including yourself!).

## Promote Compile-Time Error Checking

Analyze your code to see if you can refactor it for compile-time error catching. Errors found during compilation are far easier to identify and resolve, often with direct IDE assistance. To promote errors to compile-time you can configure your linter with rigorous rules and elevate warnings to error status.

## Embrace Named Constants

Use descriptive named constants instead of raw numbers or strings. Constants improve consistency, make changes easier, and provide valuable context right where they're used.

## Avoid Flag Arguments

Flag arguments that change a method's behavior are a serious anti-pattern. Consider the Strategy pattern or break the logic into smaller, more focused units. Never resort to flag arguments!

## Eliminate Code Duplication

It might seem obvious, but code duplication is surprisingly common. With duplicate code you have more code to maintain, more tests to cover the code and as a result you need more resource to properly maintaining the code base. Duplicate code often signals deeper design issues. If you see a similar case that needs only minor changes, maybe it can be solved with parameter. Maybe the methods need to be shorter and more focused. And maybe even the business logic can be questioned and reviewed to simplify both user experience and the code base.

## Write clean code - reap big benefits

Following these simple practices will dramatically improve the clarity and maintainability of your code and make your future self (and colleagues) happy.
