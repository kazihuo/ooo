---
layout: post
title: "搭建LAMP环境(源码方式)"
category: linux
tags: [MySQL, Linux, Apache, PHP, 源码, 环境搭建]
comments: true
share: true

---


目录

* Table of Contents
{:toc}

## Build lamp env via source code ##

`文/温国兵`

## 一 关于LAMP ##

> LAMP：Linux、Apache、MySQL、PHP的组合。目前企业使用较多。
> WAMP：Windows、 Apache、MySQL、PHP的组合。

安装顺序：首先MySQL，然后Apache，最后PHP。**注意：本文所有操作以root用户运行。**

版本说明：

> RHEL: 6.1 x86_64
> MySQL: 5.1.58
> PHP: 5.3.6
> Apache: 2.2.21

## 二 搭建LAMP ##

第一步，安装MySQL。

1.安装Development tools和ncurses-devel。

{% highlight bash %}
yum grouplist | grep Devel
yum groupinstall "Development tools" -y
yum install ncurses-devel -y
{% endhighlight %}

2.解压。

{% highlight bash %}
tar -xf mysql-5.1.58.tar.gz -C /usr/src/
cd /usr/src/mysql-5.1.58/
{% endhighlight %}

3.配置。

{% highlight bash %}
./configure --prefix=/usr/local/mysql \
--with-extra-charsets=gbk,gb2312 \
—with-plugins=partition,innobase,innodb_plugin,myisam
{% endhighlight %}

4.编译。

{% highlight bash %}
make
{% endhighlight %}

5.安装。
{% highlight bash %}
make install
{% endhighlight %}

6.拷贝配置文件和执行脚本。

{% highlight bash %}
cp support-files/my-medium.cnf /etc/my.cnf
cp support-files/mysql.server /etc/init.d/mysqld
chmod a+x/etc/init.d/mysqld
{% endhighlight %}

7.创建数据文件的存放路径，并修改my.cnf和mysqld文件。

{% highlight bash %}
mkdir /usr/local/mysql/data
vim /etc/my.cnf
grep "^datadir" /etc/my.cnf -n
27:datadir           =/usr/local/mysql/data
vim /etc/init.d/mysqld
sed "46,47p" /etc/init.d/mysqld -n
basedir=/usr/local/mysql
datadir=/usr/local/mysql/data
{% endhighlight %}

8.新增用户，并加入MySQL的用户组。然后执行mysql_install_db脚本。

{% highlight bash %}
groupadd mysql
useradd -g mysql mysql
./scripts/mysql_install_db --user=mysql
{% endhighlight %}

9.启动MySQL，进入/usr/local/mysql/bin/，执行mysql，查询MySQL版本。

{% highlight bash %}
/etc/init.d/mysqld start
cd /usr/local/mysql/bin/
./mysql
{% endhighlight %}

{% highlight sql %}
mysql> select version();
+------------+
| version() |
+------------+
| 5.1.58-log |
+------------+
1 row in set (0.00 sec)

mysql> create database larry defaultcharset utf8;
Query OK, 1 row affected (0.00 sec)

mysql> use larry;
Database changed

mysql> show tables;
Empty set (0.00 sec)

mysql> create table t_user(id int(11) \
primary key auto_increment, name varchar(20));
Query OK, 0 rows affected (0.01 sec)

mysql> insert into t_user(name)values('larrywen');
Query OK, 1 row affected (0.00 sec)

mysql> insert into t_user(name)values('justdb');
Query OK, 1 row affected (0.00 sec)

mysql> insert into t_user(name)values('wgb');
Query OK, 1 row affected (0.00 sec)

mysql> select * from t_user;
+----+----------+
| id | name     |
+----+----------+
|  1 |larrywen |
|  2 |justdb   |
|  3 |wgb      |
+----+----------+
3 rows in set (0.00 sec)

mysql> create table t_log(id int(11)primary key auto_increment,\
content varchar(20), t_user_id int(11), \
constraintfk_larry_t_log_usr_id foreign key(t_user_id) references t_user(id));
Query OK, 0 rows affected (0.01 sec)

mysql> insert into t_log(content,t_user_id) values('Logining System', 1);
Query OK, 1 row affected (0.01 sec)

mysql> select * from t_log;
+----+-----------------+-----------+
| id | content         | t_user_id |
+----+-----------------+-----------+
|  1 |Logining System |         1 |
+----+-----------------+-----------+
1 row in set (0.00 sec)
mysql> exit
Bye
{% endhighlight %}

10.修改mysql目录的所有者和组拥有者。

{% highlight bash %}
cd /usr/local/mysql
chown -R mysql .
chgrp -R mysql .
{% endhighlight %}

第二步，安装Apache。

1.解压。

{% highlight bash %}
tar -xf httpd-2.2.21.tar.gz -C /usr/src
{% endhighlight %}

2.进入安装目录，检查配置。

{% highlight bash %}
cd /usr/src/httpd-2.2.21/
./configure--help
./configure--prefix=/usr/local/apache \
--enable-modules=all \
--enable-mods-shared=all--enable-so \
--with-mpm=worker
{% endhighlight %}

如果出现zlib not found，安装zlib-devel。

{% highlight bash %}
yum install zlib-devel -y
{% endhighlight %}

3.编译。

{% highlight bash %}
make
{% endhighlight %}

4.安装。

{% highlight bash %}
make install
{% endhighlight %}

5.进入/usr/local/apache/bin/目录，启动。

{% highlight bash %}
cd /usr/local/apache/bin/
./apachectl -k start
{% endhighlight %}

如果出现如下问题：

> httpd: apr_sockaddr_info_get() failed forserv02.host.com
> httpd: Could not reliably determine theserver's fully qualified domain name, using 127.0.0.1 for ServerName

编辑httpd.conf文件，加上ServerName serv02.host.com。编辑hosts文件，加上192.168.1.12 serv02.host.com。

如下：

{% highlight bash %}
vim ../conf/httpd.conf
grep "ServerName" /usr/local/apache/conf/httpd.conf
ServerName serv02.host.com
echo "192.168.1.12 serv02.host.com" >> /etc/hosts
tail -n1 /etc/hosts
192.168.1.12 serv02.host.com
{% endhighlight %}

再次启动，查看端口。

{% highlight bash %}
./apachectl -k start
netstat -langput | grep httpd
{% endhighlight %}

6.测试。

浏览器输入http://192.168.1.12/ 如果出现“It works”则成功。

第三步，安装PHP。

1.解压。

{% highlight bash %}
tar -xf php-5.3.6.tar.bz2 -C /usr/src/
{% endhighlight %}

2.进入/usr/src/php-5.3.6/目录，配置。

{% highlight bash %}
cd /usr/src/php-5.3.6/
./configure —help
./configure--prefix=/usr/local/php5 \
--with-apxs2=/usr/local/apache/bin/apxs \
--with-mysql-sock=/tmp/mysql.sock \
--with-mysql=/usr/local/mysql/
{% endhighlight %}

如果出现如下错误，安装libxml2。

> checking libxml2 install dir... no
> checking for xml2-config path...
> configure: error: xml2-config not found.Please check your libxml2 installation.

{% highlight bash %}
yum install libxml2*-y
{% endhighlight %}

如果出现如下文本，则证明配置成功。

> +\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-+
> | License:
> | 省略若干内容。
> +\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-+
>
> Thank you for using PHP.

3.编译。

{% highlight bash %}
make
{% endhighlight %}

4.安装。

{% highlight bash %}
make install
{% endhighlight %}

5.拷贝php.ini文件，修改httpd.conf文件。

{% highlight bash %}
cp php.ini-development /usr/local/php5/lib/php.ini
grep -e "AddHandler" -e "AddType" /usr/local/apache/conf/httpd.conf
  AddHandler php5-script .php
  AddType text/html .php
{% endhighlight %}

## 三 测试 ##

1.修改root用户密码，创建测试数据库和表。

{% highlight sql %}
./mysql
mysql> set password=password("helloworld");
Query OK, 0 rows affected (0.00 sec)

mysql> exit
Bye
{% endhighlight %}

修改密码成功后，重新登录。
{% highlight bash %}
./mysql -uroot -phelloworld
{% endhighlight %}

{% highlight sql %}
mysql> use larry
Database changed
mysql> show tables;
+-----------------+
| Tables_in_larry |
+-----------------+
| t_log           |
| t_user          |
+-----------------+
2 rows in set (0.00 sec)

mysql> select * from t_user;
+----+----------+
| id | name     |
+----+----------+
|  1 |larrywen |
|  2 |justdb   |
|  3 |wgb      |
+----+----------+
3 rows in set (0.00 sec)
{% endhighlight %}

2.新建测试php文件。

{% highlight bash %}
cd /usr/local/apache/htdocs/
vim index.php
cat index.php
{% endhighlight %}

脚本内容如下：

{% highlight php %}
<?php
       phpinfo();
?>
{% endhighlight %}

新建测试LAMP整合脚本。

{% highlight bash %}
vim user_list.php
pwd
/usr/local/apache/htdocs
vim user_list.php
cat user_list.php
{% endhighlight %}

脚本内容如下：

{% highlight php %}
<?php
       $conn=mysql_connect("localhost","root", "helloworld");
       mysql_select_db("larry",$conn);
       $users=mysql_query("select* from t_user");

       while(!!$user=mysql_fetch_array($users)){
              echo$user["id"]."------->".$user["name"]."<br>";
       }
       mysql_close();
?>
{% endhighlight %}

3.浏览器输入http://192.168.1.12/index.php，如果出现php相关的配置信息，则证明LAMP环境配置成功。输入http://192.168.1.12/user_list.php，如果能出现以下的信息，则证明PHP、MySQL、Apache整合成功。

> 1------->larrywen
> 2------->justdb
> 3------->wgb

Enjoy!

–EOF–

原文地址：<a href="http://blog.csdn.net/justdb/article/details/12232889" target="_blank"><img src="http://i.imgur.com/BROigUO.jpg" title="搭建LAMP环境(源码方式)" height="16px" width="16px" border="0" alt="搭建LAMP环境(源码方式)" /></a>

版权声明：自由转载-非商用-非衍生-保持署名<a href="http://creativecommons.org/licenses/by-nc-nd/3.0/deed.zh" target="_blank">（创意共享3.0许可证）</a>

## 作者信息 ##

温国兵

* Robin Wen
* <a href="mailto:dbarobinwen@gmail.com"><img src="http://i.imgur.com/7yOaC7C.png" title="Robin's Gmail" border="0" height="16px" width="16px" alt="Robin's Gmail" /></a>
* <a href="https://github.com/dbarobin" target="_blank"><i class="fa fa-github"></i></a>
* <a href="https://dbarobin.github.io/" target="_blank"><img src="http://i.imgur.com/dEfMkyt.jpg" title="Robin's Blog" border="0" alt="Robin's Blog" height="16px" width="16px" /></a>
* <a href="http://blog.csdn.net/justdb" target="_blank"><img src="http://i.imgur.com/BROigUO.jpg" title="DBA@Robin's CSDN" height="16px" width="16px" border="0" alt="DBA@Robin's CSDN" /></a>