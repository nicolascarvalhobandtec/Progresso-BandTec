create database Televisao;
use Televisao;

create table Programa (
idPrograma int primary key,
nome varchar (40),
genero varchar (30),
emissora varchar (20)
);
select * from Programa;

insert into Programa values
(01, 'TV Kids','Infantil','Rede TV'),
(02, 'Bom Dia & Compania','Infatil','SBT'),
(03, 'TV Globinho','Infantil','TV Globo'),
(04, 'Apenas Um Show','Juvenil','Cartoon Network'),
(05, 'Super Choque','Juvenil','SBT'),
(06, 'Os Simpsons','Seriado','Fox'),
(07, 'The Flash','Seriado','Warner Bros');
select * from Programa;

select nome,emissora from Programa;

select nome from Programa where emissora = 'SBT';

select nome from Programa where genero='Infantil';

select * from Programa order by genero;

select * from Programa order by nome desc;

select * from Programa where nome like '%a';

select * from Programa where genero like 'j%';

select * from Programa where emissora like '_a%';

select * from Programa where nome like '%o_';

update Programa set emissora = 'SBT' where idPrograma ='04';
select * from Programa;

delete from Programa where idPrograma='07';
select * from Programa;

drop table Programa;

drop database Televisao;