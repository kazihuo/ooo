---
layout: post
title: "MySQL检查重复索引工具-pt-duplicate-key-checker"
category: mysql
tags: [MySQL, pt-duplicate-key-checker, Percona Toolkit, 索引, 工具]
comments: true
share: true

---

目录

* Table of Contents
{:toc}

## 文档摘要 ##

`文/温国兵`

在MySQL中是允许在同一个列上创建多个索引的，示例如下：

{% highlight bash %}
mysql --socket=/tmp/mysql5173.sock -uroot -p
{% endhighlight %}

{% highlight sql %}
mysql> SELECT VERSION();
+-----------+
| VERSION() |
+-----------+
| 5.1.73    |
+-----------+
1 row in set (0.00 sec)

# 创建测试表
mysql> DROP TABLE temp;
ERROR 1051 (42S02): Unknown table 'temp'
mysql> CREATE TABLE temp
    -> (id int auto_increment primary key,
    -> name varchar(20),
    -> password varchar(20),
    -> age int)
	-> ENGINE=INNODB DEFAULT CHARSET=utf8;                                                                                         
Query OK, 0 rows affected (0.12 sec)

# 插入测试数据
mysql> INSERT INTO temp(name, password, age) \
VALUES('robin', '123456', '18');
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO temp(name, password, age) \
VALUES('jack', '123456', '19');
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO temp(name, password, age) \
VALUES('rose', '123456', '20');
Query OK, 1 row affected (0.00 sec)

mysql> SELECT * FROM temp;
+----+-------+----------+------+
| id | name  | password | age  |
+----+-------+----------+------+
|  1 | robin | 123456   |   18 |
|  2 | jack  | 123456   |   19 |
|  3 | rose  | 123456   |   20 |
+----+-------+----------+------+
3 rows in set (0.00 sec)
{% endhighlight %}

接着在name列上创建两个相同的索引。

{% highlight sql %}
mysql> CREATE INDEX idx_test_temp_name ON test.temp(name);
Query OK, 3 rows affected (0.07 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> CREATE INDEX idx_test_temp_name_new ON test.temp(name);
Query OK, 3 rows affected (0.11 sec)
Records: 3  Duplicates: 0  Warnings: 0
{% endhighlight %}

我们使用`pt-duplicate-key-checker`工具检查是否有重复的索引。根据结果，我们可以看出重复的索引信息，包括索引定义，列的数据类型，以及修复建议。

{% highlight bash %}
pt-duplicate-key-checker --user=root \
--password=xxxx \
--host=localhost \
--socket=/tmp/mysql5173.sock 
{% endhighlight %}

输出结果。

{% highlight sql %}
# ########################################################################
# test.temp                                                               
# ########################################################################

# idx_test_temp_name is a duplicate of idx_test_temp_name_new
# Key definitions:
#   KEY `idx_test_temp_name` (`name`),
#   KEY `idx_test_temp_name_new` (`name`)
# Column types:
#     `name` varchar(20) default null
# To remove this duplicate index, execute:
ALTER TABLE `test`.`temp` DROP INDEX `idx_test_temp_name`;

# ########################################################################
# Summary of indexes                                                      
# ########################################################################

# Size Duplicate Indexes   189
# Total Duplicate Indexes  1
# Total Indexes            32
{% endhighlight %}

我们根据修复建议，删除重复的索引。

{% highlight sql %}
mysql> ALTER TABLE `test`.`temp` DROP INDEX `idx_test_temp_name`;
Query OK, 3 rows affected (0.13 sec)
Records: 3  Duplicates: 0  Warnings: 0
{% endhighlight %}

再次使用`pt-duplicate-key-checker`工具检查是否有重复的索引。根据输出结果，可以看出已经没有重复的索引了。

{% highlight bash %}
pt-duplicate-key-checker --user=root \
--password=xxxx \
--host=localhost \
--socket=/tmp/mysql5173.sock 
{% endhighlight %}

{% highlight sql %}
# ########################################################################
# Summary of indexes                                                      
# ########################################################################

# Total Indexes  31
{% endhighlight %}

**总结**

重复的索引必定会浪费系统资源，势必找出重复索引，然后干掉它。`pt-duplicate-key-checker`工具是Percona Toolkit中的一员，是DBA进行维护的好帮手。顺便说下，`Percona Toolkit`是一组相当赞的MySQL维护管理工具，相当赞，强烈推荐使用。

工具传送门：<a href="http://www.percona.com/software/percona-toolkit" target="_blank"><img src="http://i.imgur.com/18VTVkQ.jpg" title="Percona Toolkit" height="16px" width="16px" border="0" alt="Percona Toolkit" /></a> 

–EOF–

版权声明：自由转载-非商用-非衍生-保持署名<a href="http://creativecommons.org/licenses/by-nc-nd/3.0/deed.zh" target="_blank">（创意共享3.0许可证）</a>

## 作者信息 ##

温国兵

* Robin Wen
* <a href="mailto:dbarobinwen@gmail.com"><img src="http://i.imgur.com/7yOaC7C.png" title="Robin's Gmail" border="0" height="16px" width="16px" alt="Robin's Gmail" /></a>
* <a href="https://github.com/dbarobin" target="_blank"><i class="fa fa-github"></i></a>
* <a href="https://dbarobin.github.io/" target="_blank"><img src="http://i.imgur.com/dEfMkyt.jpg" title="Robin's Blog" border="0" alt="Robin's Blog" height="16px" width="16px" /></a>
* <a href="http://blog.csdn.net/justdb" target="_blank"><img src="http://i.imgur.com/BROigUO.jpg" title="DBA@Robin's CSDN" height="16px" width="16px" border="0" alt="DBA@Robin's CSDN" /></a>
