---
layout: page
---
{% include JB/setup %}

<ul class="posts">
  {% for post in site.posts %}
	<div class="node">
	  <h2><a href="{{ BASE_PATH }}{{ post.url }}">{{ post.title }}</a></h2>
	  <div class="meta">tags</div>
	  <span class="submitted">
		  {{ post.date | date_to_string }} —  {{ post.author }}
	  </span>

	  <div class="content">
	  {% if post.content contains '<!--more-->' %}
		  {{ post.content | split:'<!--more-->' | first }}
	  {% else %}
          No teaser
	  {% endif %}
	  </div>
	</div>
  {% endfor %}
</ul>

<!--
-->
