create database restaurant_db
default character set utf8
default collate utf8_bin;

use restaurant_db;

create table roles(
id int unsigned auto_increment primary key,
role varchar(15) not null 
) ENGINE = INNODB;

create table users(
id int unsigned auto_increment primary key,
f_name varchar(30) not null,
l_name varchar(30) not null,
login varchar(20) not null,
password varchar(30) not null,
email varchar(20) not null,
status tinyint(1) not null,
id_role int unsigned not null,
foreign key (id_role) references roles(id) on delete cascade 
) ENGINE = INNODB;

create table categories(
id int unsigned auto_increment primary key,
category varchar(20) not null 
) ENGINE = INNODB;

create table dishes(
id int unsigned auto_increment primary key,
name varchar(50) not null,
description text not null,
price int not null,
image varchar(70) not null,
status tinyint(1) not null,
count tinyint(2) not null,
id_category int unsigned not null,
foreign key (id_category) references categories(id) on delete cascade 
) ENGINE = INNODB;

create table orders(
id int unsigned auto_increment primary key,
date datetime not null,
status tinyint(1) not null,
id_user int unsigned not null,
foreign key (id_user) references users(id) on delete cascade 
) ENGINE = INNODB;

create table tickets(
id int unsigned auto_increment primary key,
count tinyint(2) not null,
id_order int unsigned not null,
id_dish int unsigned not null,
foreign key (id_order) references orders(id) on delete cascade, 
foreign key (id_dish) references dishes(id) on delete cascade
) ENGINE = INNODB;