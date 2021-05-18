create table group_authorities 
(id bigint generated by default as identity (start with 1), 
 authority nvarchar(50),
 group_id bigint, 
 primary key (id))
 
create table group_members 
(id bigint generated by default as identity (start with 1),
 username nvarchar(50) not null, 
 group_id bigint, 
 primary key (id))
 
create table groups
(id bigint generated by default as identity (start with 1),
 group_name nvarchar(50) not null, 
 primary key (id))
 
create table users 
(username nvarchar(50) not null, 
 enabled boolean not null, 
 password nvarchar(50),
 primary key (username))

create table "Order" 
(id integer generated by default as identity (start with 1), 
 address varchar(255), 
 zip_code integer, 
 date_and_time timestamp, 
 status varchar(255), 
 city_id integer, 
 client_id integer, 
 primary key (id));
 
create table Author 
(id integer generated by default as identity (start with 1), 
 first_name varchar(255), 
 last_name varchar(255), 
 primary key (id));
 
create table AuthorBook 
(author_id integer not null, 
 book_id integer not null, 
 primary key (author_id, book_id));
 
create table Book 
(id integer generated by default as identity (start with 1),
 genre varchar(255), 
 num_of_pages integer, 
 num_of_selected integer, 
 paper_type varchar(255), 
 price integer not null, 
 quantity integer not null, 
 selected boolean not null, 
 title varchar(255), 
 year integer, 
 publishing_house_id integer, 
 primary key (id));
 
create table BookOrder 
(id integer generated by default as identity (start with 1), 
 number integer not null, 
 book_id integer, 
 order_id integer, 
 primary key (id));
 
create table City 
(id integer generated by default as identity (start with 1), 
 name varchar(255), 
 country_id integer, 
 primary key (id));
 
create table Client 
(id integer generated by default as identity (start with 1), 
 first_name varchar(255), 
 last_name varchar(255), 
 address varchar(255), 
 zip_code integer, 
 email varchar(255), 
 mobile_telephone varchar(255), 
 city_id integer, 
 primary key (id));
 
create table Country 
(id integer generated by default as identity (start with 1),
 name varchar(255), 
 primary key (id));
 
create table PublishingHouse 
(id integer generated by default as identity (start with 1), 
 name varchar(255), 
 primary key (id));
 
alter table "Order" 
add constraint FK_CITY_ORDER foreign key (city_id) references City;

alter table "Order" 
add constraint FK_CLIENT_ORDER foreign key (client_id) references Client;

alter table AuthorBook 
add constraint FK_BOOK_AUTHORBOOK foreign key (book_id) references Book;

alter table AuthorBook 
add constraint FK_AUTHOR_AUTHORBOOK foreign key (author_id) references Author;

alter table Book 
add constraint FK_PUBLISHINGHOUSE_BOOK foreign key (publishing_house_id) references PublishingHouse;

alter table BookOrder 
add constraint FK_BOOK_BOOKORDER foreign key (book_id) references Book;

alter table BookOrder 
add constraint FK_ORDER_BOOKORDER foreign key (order_id) references "Order";

alter table City 
add constraint FK_COUNTRY_CITY foreign key (country_id) references Country;

alter table Client 
add constraint FK_CITY_CLIENT foreign key (city_id) references City;

alter table group_authorities 
add constraint GROUP_GROUP_AUTHORITIES foreign key (group_id) references groups

alter table group_members 
add constraint GROUP_GROUP_MEMBERS foreign key (group_id) references groups