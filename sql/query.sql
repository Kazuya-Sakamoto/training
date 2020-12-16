CREATE DATABASE shop;

use shop;
-- * TABLE COLUMN 操作
create table if not exists 顧客情報 
	(顧客名 text, 家族の情報 int, 入会日 date);

alter table 顧客情報 add column 郵便番号 text;

alter table 顧客情報 add カラム1 text first;

alter table 顧客情報 add カラム2 text after 顧客名;

alter table 顧客情報 rename column 郵便番号 to 郵便;

alter table 顧客情報 modify column 郵便 int;

alter table 顧客情報 drop column カラム2;
alter table 顧客情報 drop column カラム1;

alter table 顧客情報 modify 郵便番号 text after 顧客名;

-- * データの挿入
alter table 顧客情報 modify 郵便番号 text after 顧客名;

insert into 顧客情報 values(
	'山田太郎',
    '123-4567',
    2,
    '2020-01-24 01:11:11'
);

select 顧客名, 郵便番号, 家族の情報, 入会日 from 顧客情報;
select * from 顧客情報;

insert into 顧客情報 (顧客名) values ('斎藤一');

truncate 顧客情報;

alter table 顧客情報 modify 顧客名 text not null;

alter table 顧客情報 rename column 家族の情報 to 家族の人数;

-- * unique key 
select * from 顧客情報;

delete from 顧客情報 where 顧客名='山田太郎';

alter table 顧客情報 add 顧客番号 int unique key;

truncate 顧客情報;

insert into 顧客情報 (顧客名, 顧客番号)
	values('山田太郎', 1);
insert into 顧客情報 (顧客名, 顧客番号)
	values('佐藤太郎', 4);
insert into 顧客情報 (顧客名, 顧客番号)
	values('加藤太郎', 5);

alter table 顧客情報 modify 顧客番号 int primary key;
alter table 顧客情報 modify 顧客番号 int auto_increment;


create table 商品 (
	商品ID int primary key auto_increment,
    商品名 text,
    価格 int
);

-- * delete update
select * from 顧客情報;

delete from 顧客情報 where 顧客番号=1;

update 顧客情報 set 郵便番号='123-4567' where 顧客番号=5;

--* 条件 select
select * from 顧客 where 姓='上野';
select * from 顧客 where 生年月日>="1963-12-06";
select * from 顧客 where 生年月日<="1963-12-06";
select * from 顧客 where 生年月日<>"1963-12-06";


