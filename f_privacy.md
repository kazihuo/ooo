---
layout: page
title: 隐私极客
permalink: /privacy/
---

***

**隐私极客，Privacy Geek。**

关于隐私，「[黑客伦理与信息时代精神](https://book.douban.com/subject/1071093)」写到：「言论自由和隐私权一直是很重要的黑客理想，网络的发展也一直与此一致。隐私不只是一个伦理问题，它还是一个技术问题」。

希望从今以后，隐私不会再只是茶余饭后一笑而过的谈资。

#### Archive
***

<ul class="tags-box">
{% if site.posts != empty %}
    {% for tag in site.tags %}
        {% if tag[1].size > 1%}
            {% if tag[0] == 'Privacy' %}
                {% for post in tag[1] %}
                    <time datetime="{{ post.date | date:"%Y-%m-%d" }}">{{ post.date | date:"%Y-%m-%d" }}</time> &raquo;
                    <a href="{{ site.baseurl }}{{ post.url }}" title="{{ post.title }}">{{ post.title }}</a><br />
                {% endfor %}
            {% endif %}
        {% endif %}
    {% endfor %}
{% else %}
    <span>No posts</span>
{% endif %}
</ul>
