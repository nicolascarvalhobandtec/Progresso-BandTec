
drop database BandTec_Digital_School;

create database BandTec_Digital_School;
use BandTec_Digital_School;

-- Criação da tabela Curso e será referenciada pela fkCurso da tabela Aluno
-- Por isso, a tabela Curso deve ser criada primeiro
create table Curso (
idCurso int primary key auto_increment,
nomeCurso char (5),
coordenador varchar (15)
) auto_increment = 100;

select * from Curso;
desc Curso;
-- ----------------------------------------------------------------------------------------------------------------------

-- Criação da tabela Aluno já configurando uma coluna como fkCurso
create table Aluno (
ra int primary key auto_increment,
nomeAluno varchar (40),
bairro varchar (30),
fkCurso int,
foreign key (fkCurso) references Curso (idCurso)
) auto_increment = 50000;

select * from Aluno;
desc Aluno;

-- Inserção de dados da tabela Curso
insert into Curso (NomeCurso, coordenador) values 
('ADS', 'Gerson'),
('CCO', 'Marise'),
('Redes', 'Alex');
select * from Curso;

-- Inserção de dados da tabela Aluno 
insert into Aluno (nomeAluno, bairro, fkCurso) values
('Maria', 'Jd. Varginha', 100),
('Pedro', 'Consolação', 101),
('Arthur', 'Liberdade', 100),
('Marcelo', 'Uberlândia', 102);
select * from Aluno;

-- Como a tabela Curso está sendo referenciada pela tabela Aluno, 
-- não é possível "dropar" (excluir) a tabela Curso, 
-- a não ser que a tabela Aluno seja "dropada" (excluída) antes
drop table Curso;

-- Exibir os dados dos alunos e dos cursos correspondentes
-- JEITO ERRADO DE FAZER:
select * from Aluno, Curso;

-- JEITO CORRETO DE FAZER:
select * from Aluno, Curso where fkCurso = idCurso;
-- Mostrar tudo nas tabelas Aluno e Curso onde o fkCurso é igual ao idCurso

-- Exibir os dados dos Alunos e do Curso correspondente.
-- Mas somente do Curso 'ADS'
 select * from Aluno, Curso where fkCurso = idCurso and nomeCurso = 'ADS';
 
 -- Exibir os dados dos Alunos e do Curso correspondentes.
 -- Mas sem repetir a informação do idCurso
 
 select Aluno.*, nomeCurso, coordenador from Aluno, Curso where fkCurso = idCurso;
 
 
 
-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- AULA DO DIA 23/11/2020 - JOIN

-- Exibir os dados dos alunos e dos cursos de forma correspondente
select * from Aluno, Curso where fkCurso = idCurso;

-- Idem, mas usando JOIN
select * from Aluno join Curso on fkCurso = idCurso;
select * from Aluno join Curso on Aluno.fkCurso = Curso.idCurso;

-- Exibir os dados dos alunos e dos cursos de forma correspondente,
-- mas somente do curso 'ADS'
select * from aluno join Curso on fkCurso = idCurso and nomeCurso = 'ADS';

select * from Aluno;
insert into Aluno values
(1202998, 'Sieghart', 'Canaban', null),
(1202997, 'Jin', 'Terra de Prata', null);

select * from Curso;
insert into Curso values
(106, 'SI', 'Big Brand');

-- LEFT JOIN
-- Exibir todos os alunos e cursos correspondentes 
-- e também os alunos que não estão associdados a nenhum curso
select * from Aluno left join Curso on fkCurso = idCurso;

-- O que acontece se INVERTEMOS a ordem das tabelas?
select * from Curso left join Aluno on fkCurso = idCurso;



-- RIGHT JOIN
-- Exibir todos os alunos e cursos correspondentes 
-- e também os alunos que não estão associdados a nenhum aluno
select * from Aluno right join Curso on fkCurso = idCurso;

-- E se quiser trazer tudo?
-- Então usamos a cláusula UNION
select * from Aluno left join Curso on fkCurso = idCurso
union
select * from Aluno right join Curso on fkCurso = idCurso;


select * from Aluno;
select * from Curso;
select * from AlunoCurso;

-- Exibir os dados dos alunos e dos cursos de forma correspondentes usando JOIN 
-- mas somente do curso de Espanhol
select * from Aluno join AlunoCurso on fkRa = ra
				    join Curso on fkCurso - idCurso
					where nomeCurso = 'Espanhol';
                    
                    