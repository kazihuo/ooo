---
layout: page
title: 币安说
comments: no
permalink: /binance/
---

***

**币安说，说币安。**

这里是「币安说」专栏相关信息页面，我是主理人 Robin。笔者是币安老用户，一路见证了币安的崛起。一个因缘巧合的机会，笔者有幸能和币安合作，推出「币安说」专栏。个人资产神圣不可侵犯，让价值自由流通，Cryptocurrency 做到了。币安的目标是 Exchange the World，然而 Blockchain vs Cryptocurrency 普及远未达成。这就是「币安说」创立的初衷，一个致力于普及区块链和加密货币的专栏。

币安是全球领先的数字货币交易平台，提供比特币、以太坊、BNB 以及 USDT 交易。

币安注册: [https://www.binance.net/cn/markets?ref=11190872](https://www.binance.net/cn/markets?ref=11190872)
邀请码: **11190872**

有任何问题，欢迎与我 [联系](https://dbarobin.com/about)。

「币安说」相关资讯渠道：

* [微博](https://weibo.com/rwio)
* [Twitter](https://twitter.com/vrwio)
* [Telegram Channel](https://t.me/BinanceTalking)

同时，「币安说」系列文章会在以下渠道同步更新，欢迎关注：

* [个人博客](https://dbarobin.com)
* [金色财经](https://www.jinse.com/member/29374)
* [巴比特](https://www.8btc.com/user/199009)
* [币乎](https://bihu.com/people/22207)
* [知乎](https://www.zhihu.com/people/wentasy)
* [简书](https://www.jianshu.com/c/65dfa1ee8b6a)
* [今日头条](https://www.toutiao.com/c/user/101084147997)
* [掘金](https://juejin.im/user/5673ccae60b2260ee435f89a/posts)
* [开发者头条](https://toutiao.io/subjects/15354)
* [Steemit](https://steemit.com/@robinwen)
* [Medium](https://medium.com/@robinwan)

原创不易，读者可以通过如下途径打赏，虚拟货币、美元、法币均支持。

* BTC: 3QboL2k5HfKjKDrEYtQAKubWCjx9CX7i8f
* ERC20 Token: 0x8907B2ed72A1E2D283c04613536Fac4270C9F0b3
* PayPal: [https://www.paypal.me/robinwen](https://www.paypal.me/robinwen)
* 微信打赏二维码

![Wechat](https://i.imgur.com/SzoNl5b.jpg)

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