
drop database Aluno_Atributo;

create database Aluno_Atributo;
use Aluno_Atributo;

create table Aluno (
ra int primary key auto_increment,
primeiro_nome varchar (40),
sobrenome varchar (50),
telefone1 char (13),
telefone2 char (13),
nota decimal (4,2) check (nota >= 0 and nota <= 10)
);

insert into Aluno values
(null, 'Maria', 'Sousa', '(11)1234-1234', null, 7),  
(null, 'José', 'Silva', '(11)9934-1234', null, 10),
(null, 'Ronan', 'Erudon', '(11)9876-5432', null, 5),    
(null, 'Claudio', 'Lorenzo', '(11)4114-4114', null, 6); 

select * from Aluno;

select sum(nota) from Aluno;
select sum(nota) as Soma_Notas from Aluno;
select min(nota) as NotaMinima from Aluno;
select min(nota) as 'Nota Mínima', max(nota) as 'Nota Máxima' from Aluno;
select avg(nota) as 'Média das Notas' from Aluno; 
