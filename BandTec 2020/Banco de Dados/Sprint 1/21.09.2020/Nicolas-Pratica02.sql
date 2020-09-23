create database Livraria;
use Livraria;

create table Livro (
idLivro int primary key,
titulo varchar (40),
autor varchar (35),
genero varchar (30)
);


insert into Livro values
(01, 'Todos Contra Dante', 'Luis Dill', 'Narrativa Juvenil'),
(02, 'A Arte da Guerra', 'Sun Tzu', 'Arte Militar'),
(03, 'Crepúsculo', 'Stephanie Meyer', 'Sobrenatural'),
(04, 'Ben 10', 'On Line Editora', 'Ação'),
(05, 'Pica-Pau e Seus Amigos', 'Walter Lantz', 'Infantil'),
(06, 'Batman Arkham Knight', 'Marv Wolfman', 'Drama'),
(07, 'Código da Vinci', 'Dan Brown', 'Romance');

select * from Livro;

select titulo, genero from Livro;

select titulo from Livro where genero = 'Sobrenatural';

select titulo from Livro where autor = 'Walter Lantz';

select * from Livro order by titulo;

select * from Livro order by autor desc;

select * from Livro where autor like 'm%';

select * from Livro where genero like '_a%';

select * from Livro where autor like '%s';

select * from Livro where titulo like '_i_%';

update Livro set genero = 'Romance' where idLivro ='03';
select * from Livro;

delete from Livro where idLivro='07';
select * from Livro;

drop table Livro;

drop database Livraria;