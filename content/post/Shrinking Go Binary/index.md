---
title: 'Shrinking Go Binary'
tags: ['go']
date: 2024-05-11T10:00:00+00:00
draft: false
---

## Battling Bloated Binaries: My Journey to Shrink a Go CLI Tool

Modern software often comes with a large footprint, partly due to the convenience of abstraction layers and the practice of static linking in Go, which bundles all dependencies into a single executable. This became apparent when I built a simple Go-based CLI tool for managing calendar events - [figoro](https://github.com/EugeneShtoka/figoro), resulting in a surprisingly large 24MB file. To address this, I embarked on a journey to slim down the binary, uncovering various techniques and their associated tradeoffs along the way.

## Step One: Stripping for a Leaner Build

Go's -s -w build flags remove debugging information, immediately cutting my binary's size by 33% from 24MB to 16MB.

The tradeoff here is straightforward: it makes debugging harder if you need it later.

```
go build -ldflags "-s -w"
```

## Step Two: Compressing with UPX

Leveraging an executable packer opened up another avenue for optimization. UPX, a common choice for Go projects, further compressed the binary, achieving a remarkable 41% reduction (74% overall). In pursuit of maximum efficiency, I experimented with UPX's compression flags, including --brute, --force-brute, and --lzma. LZMA emerged as the superior option, striking the best balance between speed and compression, and reducing the binary size by an additional 6% (80% in total).

This time a tradeoff was significant: a notably longer startup delay, with execution time jumping from 24ms to 300ms (a 1150% increase). While this impact is less pronounced for longer operations, a 0.3-second delay is still perceptible.

```
go build -ldflags "-s -w" . && upx -9 --lzma figoro
```

## Step three: Using alternative compiler

Alternative gccgo compiler offers potential benefits in reduced binary size and improved performance, albeit at the cost of increased compilation time and debugging complexity. However, as of version 15, gccgo supports Go 1.18 but lacks support for generics. Since generics are an integral part of of the tool, building the project with the current version of gccgo is not feasible.

## Summary

While UPX compression yielded impressive results, the tradeoff of increased execution time ultimately made it unsuitable for my use case of a command-line utility. The size reduction didn't justify the noticeable 0.3-second delay in startup.

However, for a daemon service where startup time is less critical, the compression benefits would outweigh the increased execution time.

And third option is no go for me in this case as well, as I prefer the self-contained nature of a statically linked binary, ensuring my utility's functionality regardless of system changes. So, stripping debug info it is! A 33% size reduction is a win, and I can deal with the debugging hurdles if they come up.
