---
layout: page
title: 币安说
comments: no
permalink: /binance/
---

***

币安是全球领先的数字货币交易平台，提供比特币、以太坊、BNB 以及 USDT 交易。

邀请注册: [https://www.binance.net/cn/markets?ref=11190872](https://www.binance.net/cn/markets?ref=11190872)
邀请码: **11190872**

#### Archive
***

<ul class="tags-box">
{% if site.posts != empty %}
    {% for tag in site.tags %}
        {% if tag[1].size > 1%}
            {% if tag[0] == 'Binance' %}
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

