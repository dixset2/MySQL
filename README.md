# MySQL
````
create database example
````
````
create table users (
    id int not null,
    name varchar(255) not null,
    constraint users2_pk
    primary key (id)
);
````
Сделал дамп
````
mysqldump -u root --databases sakila > sakiladump.sql|
````
"кавычки для пробелов"

Так как таблица address содержит бинарные данные, я добавил опцию экспорта --hex-blob. Опцию --skip-extended-insert добавил потому что думал, что проблема в слишком длинных строках. 
````
mysqldump --skip-extended-insert --hex-blob -u root --databases sakila > sakiladump3.sql
````
При импорте дампа, я использовал опцию --binary-mode=1, которая позволила мне вставить бинарные данные и убрать ошибку.
````
mysql -u root --binary-mode=1 -e "source D:\Geekbrains\Git\sakiladump3.sql"
````
Текущая ошибка: ERROR at line 1: Unknown command '\G'.

Экспорт 100 строк из одной таблицы
````
mysqldump --skip-extended-insert -u root --where="1 limit 100" sakila actor > sakila_actor_100_dump.sql
````
Вопросы:
- С какой БД надо было делать дамп? (Sakila?)
- Откуда help_keyword?