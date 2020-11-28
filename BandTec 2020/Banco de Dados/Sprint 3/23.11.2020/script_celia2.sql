create database EscolaIdioma;
use EscolaIdioma;

-- Criação da tabela Aluno
create table Aluno (
  ra int primary key auto_increment,
  nomeAluno varchar(45),
  bairro varchar(45)
) auto_increment = 1000;

-- Criação da tabela Curso
create table Curso (
  idCurso int primary key auto_increment,
  nomeCurso varchar(45),
  coordenador varchar(45)
);

-- Criação da tabela associativa AlunoCurso
-- Resultante do relacionamento muitos para muitos entre Aluno e Curso
create table AlunoCurso (
   fkRa int,
   foreign key(fkRa) references Aluno(ra),
   fkCurso int,
   foreign key(fkCurso) references Curso(idCurso),
   dataInicio date,
   nivel char(2),
   media decimal(4,2) check (media >= 0 and media <= 10),
   primary key(fkRa, fkCurso, dataInicio)  -- chave primária composta
); 

-- Inserção de valores da tabela Aluno
insert into Aluno values (null, 'Maria', 'Saúde'),
                         (null, 'João', 'Consolação'); 

-- Exibir a tabela Aluno
select * from Aluno;

-- Inserção de valores da tabela Curso
insert into Curso values (null, 'Espanhol', 'Juan'),
						 (null, 'Inglês', 'Beth');

-- Exibir a tabela Curso
select * from Curso;

-- Inserção de valores da tabela associativa AlunoCurso
insert into AlunoCurso values (1000, 1, '2015-02-01', 'A1', 9),
                              (1000, 2, '2017-02-01', 'I3', 7),
                              (1001, 1, '2020-02-01', 'B1', 8),
                              (1001, 2, '2019-02-01', 'I2', 9);

-- Exibir a tabela AlunoCurso
select * from AlunoCurso;

-- Exibir os dados dos alunos e dos cursos correspondentes
select * from Aluno, Curso, AlunoCurso where fkRa = ra and fkCurso = idCurso;

-- Exibir os dados dos alunos e dos cursos correspondentes, mas somente de um curso
select * from Aluno, Curso, AlunoCurso where fkRa = ra and fkCurso = idCurso
                                             and nomeCurso = 'Inglês';

-- Exibir os dados dos alunos e dos cursos correspondentes, mas somente de um aluno
select * from Aluno, Curso, AlunoCurso where fkRa = ra and fkCurso = idCurso
                                             and nomeAluno = 'Maria';

-- Exibir a soma e a média das médias dos alunos
select sum(media) as 'Soma das médias', 
       round(avg(media),2) as 'Média das médias' from AlunoCurso; 

-- Exibir a menor e a maior média dos alunos
select min(media) as 'Menor média', max(media) as 'Maior média' from AlunoCurso;       

-- Exibir a menor e a maior média dos alunos agrupado por curso
select fkCurso, min(media) as 'Menor média', 
       max(media) as 'Maior média' from AlunoCurso group by fkCurso;       

-- Exibir a menor e a maior média dos alunos agrupado por curso, exibindo o nome do curso
select idCurso, nomeCurso, min(media) as 'Menor média', 
       max(media) as 'Maior média' from AlunoCurso, Curso 
									where fkCurso = idCurso group by fkCurso;

-- Exibir a menor e a maior média dos alunos agrupado por aluno
select fkRa, min(media) as 'Menor média', 
       max(media) as 'Maior média' from AlunoCurso group by fkRa;

-- Exibir apenas as médias da tabela AlunoCurso
select media from AlunoCurso;

-- Exibir as médias distintas (sem repetição de valores) da tabela AlunoCurso
select distinct media as 'Médias distintas' from AlunoCurso;

-- Exibir a quantidade de médias da tabela AlunoCurso
select count(media) as 'Quantidade de médias' from AlunoCurso;

-- Exibir a quantidade de médias distintas da tabela AlunoCurso
select count(distinct media) as 'Quantidade de médias distintas' from AlunoCurso;       

-- Exibir a menor média de todas e o aluno correspondente à menor média
-- Exemplo de uso de subconsulta ou subquery
select min(media) as 'Menor média', nomeAluno from AlunoCurso, Aluno 
      where media = (select min(media) from AlunoCurso);                                    

-- Atualizar a média da Maria no curso de espanhol para 9.5
update AlunoCurso set media = 9.5 where fkRa = 1000 and fkCurso= 1;

-- Exibir os dados da tabela AlunoCurso
select * from AlunoCurso;

-- Inserindo mais um registro em que fkRa = 1000 e fkCurso = 1 com outra data de início
insert into AlunoCurso values (1000, 1, '2020-11-01', 'A1', 8.5); 

-- Atualizar a média da Maria no curso de espanhol para 9.0
update AlunoCurso set media = 9.0 where fkRa = 1000 and fkCurso= 1;
-- este último comando, o correto seria colocarmos a data de inicio também, para que
-- ele não altere a média da matrícula antiga da Maria no curso de Espanhol

-- ------------------------------------------------------
-- 23/11/20 - Refazendo os selects usando JOIN

select * from Aluno;
select * from Curso;
select * from AlunoCurso;

-- Exibir os dados dos alunos e dos cursos correspondentes usando JOIN
select * from Aluno join AlunoCurso on fkRa = ra
                    join Curso on fkCurso = idCurso;
                    
-- Exibir os dados dos alunos e dos cursos correspondentes usando JOIN
-- mas somente do curso de Espanhol
select * from Aluno join AlunoCurso on fkRa = ra
                    join Curso on fkCurso = idCurso
                    where nomeCurso = 'Espanhol';
-- Também funciona com and no lugar do where
select * from Aluno join AlunoCurso on fkRa = ra
                    join Curso on fkCurso = idCurso
                    and nomeCurso = 'Espanhol';