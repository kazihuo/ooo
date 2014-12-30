---
layout: post
title: "MySQL Handler_delete and Com_delete"
category: mysql
tags: [MySQL, 状态变量]
comments: true
share: true

---

目录

* Table of Contents
{:toc}

## 文档摘要 ##

`文/温国兵`

首先看一个示例。

{% highlight bash %}
mysql --socket=/tmp/mysql5173.sock -uroot -p
{% endhighlight %}

{% highlight bash %}
mysql> SELECT VERSION();
+-----------+
| VERSION() |
+-----------+
| 5.1.73    |
+-----------+
1 row in set (0.00 sec)

mysql> DROP TABLE t2;
ERROR 1051 (42S02): Unknown table 't2'
mysql> CREATE TABLE t2
    -> (id int auto_increment primary key,
    -> name varchar(20),
    -> password varchar(20),
    -> age int) ENGINE=INNODB DEFAULT CHARSET=utf8;                                                                                    
Query OK, 0 rows affected (0.07 sec)

mysql> INSERT INTO t2(name, password, age) VALUES('robin', '123456', '18');
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO t2(name, password, age) VALUES('jack', '123456', '18');
Query OK, 1 row affected (0.05 sec)

mysql> INSERT INTO t2(name, password, age) VALUES('keven', '123456', '18');
Query OK, 1 row affected (0.00 sec)

mysql> SELECT * FROM t2;
+----+-------+----------+------+
| id | name  | password | age  |
+----+-------+----------+------+
|  1 | robin | 123456   |   18 |
|  2 | jack  | 123456   |   18 |
|  3 | keven | 123456   |   18 |
+----+-------+----------+------+
3 rows in set (0.01 sec)

mysql> SHOW GLOBAL STATUS LIKE '%delete%';
+---------------------+-------+
| Variable_name       | Value |
+---------------------+-------+
| Com_delete          | 0     |
| Com_delete_multi    | 0     |
| Handler_delete      | 0     |
| Innodb_rows_deleted | 0     |
+---------------------+-------+
4 rows in set (0.00 sec)

mysql> DELETE FROM t2;
Query OK, 3 rows affected (0.07 sec)

mysql> SHOW GLOBAL STATUS LIKE '%delete%';
+---------------------+-------+
| Variable_name       | Value |
+---------------------+-------+
| Com_delete          | 1     |
| Com_delete_multi    | 0     |
| Handler_delete      | 3     |
| Innodb_rows_deleted | 3     |
+---------------------+-------+
4 rows in set (0.00 sec)
{% endhighlight %}

翻了下官方文档，原来这两个变量有不同之处。

**Handler_delete**

> The number of times that rows have been deleted from tables.

**Com_xxx**

> The Com_xxx statement counter variables indicate the number of times each xxx statement has been executed. There is one status variable for each type of statement. For example, Com_delete and Com_update count DELETE and UPDATE statements, respectively. Com_delete_multi and Com_update_multi are similar but apply to DELETE and UPDATE statements that use multiple-table syntax.

也就是说Handler_delete是**删除的记录数**，Com_delete是**执行Delete命令的次数**。

## 参考资料 ##

* <a href="http://dev.mysql.com/doc/refman/5.1/en/server-status-variables.html#statvar_Handler_delete" target="_blank">Handler_delete</a>
* <a href="http://dev.mysql.com/doc/refman/5.1/en/server-status-variables.html#statvar_Com_xxx" target="_blank">Com_xxx</a>

–EOF–

版权声明：自由转载-非商用-非衍生-保持署名<a href="http://creativecommons.org/licenses/by-nc-nd/3.0/deed.zh" target="_blank">（创意共享3.0许可证）</a>

## 作者信息 ##

温国兵

* Robin Wen
* <a href="mailto:dbarobinwen@gmail.com"><img src="http://i.imgur.com/7yOaC7C.png" title="Robin's Gmail" border="0" height="16px" width="16px" alt="Robin's Gmail" /></a>
* <a href="https://github.com/dbarobin" target="_blank"><i class="fa fa-github"></i></a>
* <a href="https://dbarobin.github.io/" target="_blank"><img src="http://i.imgur.com/dEfMkyt.jpg" title="Robin's Blog" border="0" alt="Robin's Blog" height="16px" width="16px" /></a>
* <a href="http://blog.csdn.net/justdb" target="_blank"><img src="http://i.imgur.com/BROigUO.jpg" title="DBA@Robin's CSDN" height="16px" width="16px" border="0" alt="DBA@Robin's CSDN" /></a>