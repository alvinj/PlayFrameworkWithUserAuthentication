
#------
# users
#------
create table users (
  id          bigint auto_increment not null primary key,
  email       varchar(255) not null,
  name        varchar(255) not null,
  password    varchar(255) not null
);

insert into users (email, name, password) values ('al@foo.com', 'Alvin Alexander', 'foo');

#-----
# urls
#-----
create table urls (
  id          bigint auto_increment not null primary key,
  user_id     bigint not null,
  url         varchar(255) not null,
  short_url   varchar(255) not null,
  created     timestamp not null default now(),
  foreign key (user_id) references users(id) on delete set null,
  clicks      int unsigned not null
);

#-----------------------------------------------------------------------
# last_url - the last url that was used; used as a seed for the next one
#-----------------------------------------------------------------------
create table last_url (
  url         varchar(255) not null
);

insert into last_url (url) values ('0001');

#------
# drops
#------

SET FOREIGN_KEY_CHECKS = 0;
drop table if exists users;
drop table if exists urls;
drop table if exists last_url;
SET FOREIGN_KEY_CHECKS = 1;
