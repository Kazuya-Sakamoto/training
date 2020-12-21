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

-- * and / or / and not 
select * from 顧客 where 姓="上野";
select * from 顧客 where 姓="上野" and 名="孝";
select * from 顧客 where 姓="上野" or 名="孝";
select * from 顧客 where 姓="上野" and not(名="孝");
select * from 顧客
	where (姓="上野" or 名="孝") 
    and 生年月日="1961-02-13";

-- * 並び替え 
select * from 顧客 order by id desc;
select * from 顧客 order by id asc;

select * from 顧客 order by 生年月日 desc;
select * from 顧客 order by せい, めい;

-- * 表示数制限 
select * from 顧客 limit 10;
select * from 顧客 limit 20, 10;

select * from 顧客 
	where 姓 like "上%" order by id desc limit 3;


-- * リレーション
create table 商品 (
	id int primary key auto_increment,
    カテゴリー varchar(45),
    商品名 varchar(1000),
    価格 smallint
)

create table カテゴリー (
	id int primary key auto_increment,
    カテゴリー名 varchar(45)
);

update 商品 set カテゴリー=1 where カテゴリー="洋服";
update 商品 set カテゴリー=2 where カテゴリー="バッグ";
update 商品 set カテゴリー=3 where カテゴリー="グッズ";

describe 商品;

-- * リレーションからの中執
select * from 商品 
	inner join カテゴリー 
    on 商品.カテゴリー = カテゴリー.id
    where カテゴリー.id = 1;

select * from 商品, カテゴリー where 
	商品.カテゴリー = カテゴリー.id
    and カテゴリー.id = 1;


select * from 顧客 left join 購入履歴 
	on 顧客.id = 購入履歴.顧客
    inner join 商品 on 商品.id = 商品
    order by 顧客.id;
