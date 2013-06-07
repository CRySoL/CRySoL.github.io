---
layout: post
title: "Testing deterministic behavior with doublex"
category: receta
tags: Python doublex
author: david.villa
---

Sometimes you need to test that some procedure is deterministic, that
is, it is done exactly the same way again and again (builder or
factory method patterns) exactly the same behavior for the same
arguments. In these situations there is not a "right" invocation
sequence but the sequence must no change.

You may use a doublex Mock to test that. The first time configure the
Mock, the second time verify the same behaviour.

<!--more-->

An example:

{% gist 5728565 %}
