---
layout: post
title: "How to annotate/tag stdout and stderr outputs with bash"
author: david_villa
category: recipe
tags: bash shell
lang: en
comments: true
---

Lets create a test script `test-std.sh`:

<pre class="bash">
#!/bin/bash --

echo info
echo error >&2
</pre>

We will use `sed` to prepend some text to each output line. To perform redirection we use a less known feature called [process substitution](https://www.gnu.org/software/bash/manual/html_node/Process-Substitution.html).

<pre class="console">
$ ./test-std.sh 2> >(sed 's/^/err: /g') > >(sed 's/^/out: /g')
out: info
err: error
</pre>

And... it's possible to use a different color to each of them too
