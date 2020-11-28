-- Criação do banco de dados (schema) aluno
create database aluno;
use aluno;  -- seleciona o banco de dados aluno
-- isso é um comentário
-- criação da tabela aluno
create table aluno (
  ra int primary key,    -- ra é a chave primária da tabela aluno 
  nome varchar(50),
  bairro varchar(40)
);

-- se criou a tabela com o nome aluco, como renomear?
alter table aluco rename to aluno;
-- ou também é possível excluir a tabela aluco, e refazer o comando com o nome certo
drop table aluco; 

-- exibir os dados da tabela aluno (todas as colunas)
select * from aluno;
-- exibir apenas a coluna ra da tabela aluno
select ra from aluno;
-- exibir apenas a coluna nome da tabela aluno
select nome from aluno; 
-- exibir apenas as colunas ra e nome
select ra, nome from aluno;
-- exibir as colunas nome e ra
select nome, ra from aluno;

-- inserir dados de um aluno no banco
insert into aluno values (01202023, 'Lais', 'Umuarama');

-- exibir os dados da tabela aluno (todas as colunas)
select * from aluno;
-- exibir apenas a coluna ra da tabela aluno
select ra from aluno;
-- exibir apenas a coluna nome da tabela aluno
select nome from aluno; 
-- exibir apenas as colunas ra e nome
select ra, nome from aluno;
-- exibir as colunas nome e ra
select nome, ra from aluno;

-- inserir dados de mais alunos
insert into aluno values (01202086, 'Luiz Gustavo', 'Jardim Primavera'),
                         (01202093, 'Luis Fernando Rocha', 'Jd.iracema'),
                         (01202003, 'Caio', 'Taboão'),
                         (01202099, 'Vinícius', 'Pirituba'),
                         (01202079, 'Jorge ULIAM', 'Parque casa de pedra'),
                         (01202027, 'Lucas', 'Pirituba');

-- exibir os dados da tabela aluno (todas as colunas)
select * from aluno;
-- exibir apenas a coluna ra da tabela aluno
select ra from aluno;
-- exibir apenas a coluna nome da tabela aluno
select nome from aluno; 
-- exibir apenas as colunas ra e nome
select ra, nome from aluno;
-- exibir as colunas nome e ra
select nome, ra from aluno;

-- exibir os dados dos alunos do bairro Pirituba
select * from aluno where bairro = 'Pirituba';

-- exibir apenas o ra dos alunos do bairro Pirituba
select ra from aluno where bairro = 'Pirituba';

-- exibir os dados dos alunos de RA > 01202030
select * from aluno where ra > 01202030;
-- o mesmo vale para >=, <, <=

-- Exibir a tabela aluno ordenado pelo nome
select * from aluno order by nome;
-- Exibir a tabela aluno ordenado pelo bairro
select * from aluno order by bairro;
-- Exibir a tabela aluno ordenado pelo nome, em ordem decrescente
select * from aluno order by nome desc;

-- Exibir os dados dos alunos cujo nome comece com a letra L
select * from aluno where nome like 'L%';

-- Exibir os dados dos alunos cujo nome termine com a letr o 
select * from aluno where nome like '%o';

-- Exibir os dados dos alunos cujo nome termine com a letr o 
select * from aluno where bairro like '%o';

-- Exibir os dados dos alunos cujo nome tenha a letra u como segunda letra
select * from aluno where nome like '_u%';

-- idem para 3a letra do nome = i 
select * from aluno where nome like '__i%';

-- idem para bairro com penultima letra = m
select * from aluno where bairro like '%m_';

-- Alterar o bairro do Caio para 'Campanario'
update aluno set bairro = 'Campanario' where ra = 1202003;

-- Excluir um aluno
delete from aluno where ra = 1202079;

-- Excluir a tabela aluno
drop table aluno;

-- Excluir o banco de dados aluno
drop database aluno;

-- -----------------------------------------------------------------------
-- ESSA PARTE É NOVA (09/10/20)
select * from Aluno;

-- Como exibir dados de um intervalo de RA
select * from Aluno where ra between 1202027 and 1202093;
select * from Aluno where ra between 1202020 and 1202095;

-- Criação da tabela Curso
create table Curso (
  idCurso int primary key auto_increment,
  nomeCurso char(5),
  coordenador varchar(15)
) auto_increment=100;

-- Inserção dos dados da tabela Curso
insert into Curso (nomeCurso, coordenador) values ('ADS', 'Gerson'),
                                                  ('CCO', 'Marise'),
                                                  ('Redes', 'Alex');
-- Exibir os dados da tabela Curso
select * from Curso;

-- Exibir a descrição da tabela Aluno
desc Aluno;

-- Acrescentar a coluna fkCurso na tabela Aluno
alter table Aluno add fkCurso int;
                         
-- Exibir os dados da tabela Aluno
select * from Aluno;

-- Acrescentar a restrição de chave estrangeira na coluna fkCurso da tab Aluno
alter table Aluno add foreign key(fkCurso) references Curso(idCurso);

-- É possível acrescentar a coluna fkCurso na tabela Aluno e já
-- configurar essa coluna como foreign key num único comando alter table:
alter table Aluno add fkCurso int,
                  add foreign key(fkCurso) references Curso(idCurso);

-- Exibir a descrição da tabela Aluno
desc Aluno;

-- Atribuindo valores para a coluna fkCurso
update Aluno set fkCurso = 100 where ra <= 1202027 or ra = 1202099; 
update Aluno set fkCurso = 101 where ra in (1202079, 1202093);
update Aluno set fkCurso = 102 where ra = 1202086;

-- Exibir os dados dos alunos e dos cursos correspondentes
select * from Aluno, Curso where fkCurso = idCurso;

-- Exibir os dados dos alunos e dos cursos correspondentes sem repetir a informação do idCurso
select Aluno.*, nomeCurso, coordenador from Aluno, Curso where fkCurso = idCurso;

-- Inserção de um novo aluno, agora com a fkCurso
insert into Aluno values (1202999, 'Mickey', 'Disney', 102); 

-- -------------------------------------------------------------
-- AULA DO DIA 23/11/20 - EXPLICAÇÃO DO JOIN

-- Exibir os dados dos alunos e dos cursos de forma correspondente
select * from Aluno, Curso where fkCurso = idCurso;

-- Idem, mas usando JOIN
select * from Aluno join Curso on fkCurso = idCurso;
select * from Aluno as a join Curso as c on a.fkCurso = c.idCurso;

-- Exibir os dados dos alunos e dos cursos de forma correspondente,
-- mas somente do curso 'ADS'
select * from Aluno join Curso on fkCurso = idCurso and nomeCurso = 'ADS';
select * from Aluno inner join Curso on fkCurso = idCurso where nomeCurso = 'ADS';

select * from Aluno;
select * from Curso;
insert into Aluno values (1202998, 'Pateta','Florida',null),
                         (1202997, 'Pluto', 'Miami', null);
insert into Curso values (103, 'SI','Brandão');                         

-- LEFT JOIN
-- Exibir todos os alunos e cursos correspondentes 
-- e também os alunos que não estão associados a nenhum curso
select * from Aluno left join Curso on fkCurso = idCurso; 

-- RIGHT JOIN
-- Exibir todos os alunos e cursos correspondentes 
-- e também os cursos que não estão associados a nenhum aluno
select * from Aluno right join Curso on fkCurso = idCurso;

-- E se quiser trazer tudo?
-- Então usamos a cláusula UNION
select * from Aluno left join Curso on fkCurso = idCurso
             union 
select * from Aluno right join Curso on fkCurso = idCurso;

-- se invertermos no comando e colocarmos Curso antes do join e Aluno depois,
-- então o que ele considera LEFT é o Curso
-- o que ele considera RIGHT é o Aluno, como nos exemplos a seguir:
select * from Curso left join Aluno on fkCurso = idCurso;
select * from Curso right join Aluno on fkCurso = idCurso;
                         