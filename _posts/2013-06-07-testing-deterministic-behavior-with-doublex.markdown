---
layout: post
title: "Testing deterministic behavior with doublex"
category: receta
tags: Python doublex
author: david_villa
---

Sometimes you need to test that some procedure is deterministic, that
is, it is done exactly the same way again and again (builder or
factory method patterns). The production code does exactly the same invocations for the same
arguments. In these situations there is not a "right" behavior but the invocation sequence must no change.

You may use a doublex Mock to test that. The first execution "trains" the
Mock, the second time verify the same behaviour.

<!--more-->

An example:

{% gist 5728565 %}
