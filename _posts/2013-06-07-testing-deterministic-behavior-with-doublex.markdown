---
layout: post
title: "Testing deterministic behavior with doublex"
category: recipe
tags: Python doublex TDD
author: david_villa
lang: en
---

Sometimes you need to test that some procedure is deterministic, that
is, it is done exactly the same way again and again (builder or
factory method patterns are examples of that). The production code does exactly the same invocations for the same
arguments. In these situations were are not checking the "right" behavior but just the invocation sequence does not change.

You may use a doublex Mock to test that. The first execution "trains" the
Mock, the second time verify the same behaviour.

<!--break-->

An example:

{% gist 5728565 %}


## References

* "python-doublex":https://bitbucket.org/DavidVilla/python-doublex
