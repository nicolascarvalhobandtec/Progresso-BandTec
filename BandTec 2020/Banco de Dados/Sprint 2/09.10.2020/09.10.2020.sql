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

 