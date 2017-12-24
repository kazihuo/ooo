---
layout: page
title: Blockchain
permalink: /blockchain/
---

***

#### Archive
***

<ul class="tags-box">
{% if site.posts != empty %}
    {% for tag in site.tags %}
        {% if tag[1].size > 1%}
            {% if tag[0] == 'Blockchain' %}
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

#### GitHub
***

* [mycrypto](https://github.com/dbarobin/mycrypto)

#### Media
***

「区块链技术指北」同名 Telegram Channel：[https://t.me/BlockchainAge](https://t.me/BlockchainAge)，欢迎订阅。

同时，本系列文章会在以下渠道同步更新，欢迎关注：

* 「区块链技术指北」同名微信公众号（微信号：BlockchainAge）
* 「区块链技术指北」同名知识星球，[https://t.xiaomiquan.com/ZRbmaU3](https://t.xiaomiquan.com/ZRbmaU3)
* 个人博客，[https://dbarobin.com](https://dbarobin.com)
* 知乎，[https://zhuanlan.zhihu.com/robinwen](https://zhuanlan.zhihu.com/robinwen)
* Steemit，[https://steemit.com/@robinwen](https://steemit.com/@robinwen)
* Medium，[https://medium.com/@robinwan](https://medium.com/@robinwan)

原创不易，读者可以通过如下途径打赏，虚拟货币、美元、法币均支持。

* BTC: 3QboL2k5HfKjKDrEYtQAKubWCjx9CX7i8f
* ERC20 Token: 0x8907B2ed72A1E2D283c04613536Fac4270C9F0b3
* PayPal: [https://www.paypal.me/robinwen](https://www.paypal.me/robinwen)

© Robin Wen