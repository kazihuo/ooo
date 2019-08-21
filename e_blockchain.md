---
layout: page
title: 区块链
permalink: /blockchain/
---

***

**「区块链技术指北」**，常见价值数字货币的相关教程、区块链技术前沿信息、区块链技术好文品鉴和分享、区块链技术相关工具、区块链技术分析、区块链项目跟踪、区块链资源共享、开源翻译计划、开源创作计划等。

社区初衷：**构建优质社区，传播和分享区块链技术，探讨潜在价值，连接技术和商业。**

区块链技术指北社区（ChainONE Community）的 共识原则：

* **自由，开放，平等，协作，分享**。我们希望聚合众人的力量构建一个区块链技术社区。
* 在有限的生命里 **持续做有价值** 的事情。
* **优质产出**，我们对社区的产出有严格苛刻的高标准要求。
* **多中心化**。去中心化永远只是个相对理论概念，究竟什么样的程度才算是去中心呢？我们希望社区每一位成员，每一位读者都是一个平等的节点，都可以为社区贡献自己的力量。

* 如果对我感兴趣，想和我交流，我的微信号：**Wentasy**，加我时简单介绍下自己，并注明来自「区块链技术指北」。同时我会把你拉入微信群「区块链技术指北」。

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

#### Community
***

* [区块链技术指北 \| ChainONE 官网](https://chainon.io)
* [区块链技术指北 \| ChainONE 官方博客](https://blog.chainon.io)
* [区块链技术指北 \| ChainONE 官方社区](https://bbs.chainon.io)

#### GitHub
***

* [ChainONE Community](https://github.com/BlockchainOne)
* [Open-Translating](https://github.com/BlockchainOne/Open-Translating)
* [WeChat](https://github.com/BlockchainOne/WeChat)
* [awesome-blockchain](https://github.com/BlockchainOne/awesome-blockchain)
* [crack-mining](https://github.com/BlockchainOne/crack-mining)
* [mycrypto](https://github.com/dbarobin/mycrypto)

#### Media
***

「区块链技术指北」相关资讯渠道：

* 「区块链技术指北」同名 [知识星球](https://t.xiaomiquan.com/ZRbmaU3)
* [官网](https://chainon.io)
* [官方博客](https://blog.chainon.io)
* [官方社区](https://bbs.chainon.io)
* [Telegram Channel](https://t.me/chainone)
* [Twitter](https://twitter.com/bcageone)
* [Facebook](https://www.facebook.com/chainone.org)
* [新浪微博](https://weibo.com/BlockchainAge)

同时，本系列文章会在以下渠道同步更新，欢迎关注：

* 「区块链技术指北」同名微信公众号（微信号：BlockchainAge）
* [官方博客](https://blog.chainon.io)
* [知乎专栏](https://zhuanlan.zhihu.com/robinwen)
* [简书](https://www.jianshu.com/c/a37698a12ba9)
* [Steemit](https://steemit.com/@chainone)
* [Medium](https://medium.com/@chainone.org)
* [币乎](https://bihu.com/people/345886)
* [掘金](https://juejin.im/user/5673ccae60b2260ee435f89a/posts)

#### Referrals
***

> **币安**，[https://www.binance.net/cn/register/?ref=11190872](https://www.binance.net/cn/register/?ref=11190872)
> **币乎**，[https://zt.bihu.com/?id=22207](https://zt.bihu.com/?id=22207)

#### Donate
***

原创不易，读者可以通过如下途径打赏，支持 BTC 和 ERC20 Token。

> *BTC**: 1HRZ7og2KjqpP3v3jskgueNu64kJrFU8GD
> **ERC20 Token**: 0x5c8DEB48dC08b5dC60A0290B718690a801509Dd1

© ChainONE

<p class="post-meta">
   <span id="busuanzi_container_page_pv">
      By Robin Wen, Viewd <span id="busuanzi_value_page_pv"></span* times.
   </span>
</p>
