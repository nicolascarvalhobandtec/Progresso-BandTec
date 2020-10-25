create database aluno_atributo;
use aluno_atributo;

create table Aluno (
  ra int primary key auto_increment,
  primeiroNome varchar(45), -- nome foi modelado como atributo composto
  sobreNome varchar(45),    -- 2 colunas: primeiroNome e sobrenome
  telefone1 char(13),       -- telefone foi modelado como atributo multivalorado
  telefone2 char(13),       -- 2 colunas: telefone1 e telefone2
  nota decimal (4,2) check (nota >= 0 and nota <=10) -- esse check só funciona em versões                                                           -- posteriores ao MySQL 8.0.16
 );
 insert into Aluno values (null, 'Maria', 'Sousa','(11)1234-1234','(11)9934-5678',7),
                          (null, 'José', 'Silva', '(11)9934-1234','(11)5436-0089',10),
                          (null, 'Claudio', 'Teixeira', '(11)9894-1234','(11)3567-9876',5),
                          (null, 'Ana', 'Oliveira', '(11)4564-1234','(11)6756-0011',6);
select * from Aluno;

-- Exibição da soma das notas dos alunos
select sum(nota) from Aluno;

-- Exibição da soma da notas, mas nomeando a coluna do resultado
select sum(nota) as Soma_Notas from Aluno;

-- Exibição da nota mínima e da nota máxima dos alunos
select min(nota) as 'Nota Minima', max(nota) as 'Nota Maxima' from Aluno;

-- Exibição da média das notas
select avg(nota) as 'Média das notas' from Aluno;

