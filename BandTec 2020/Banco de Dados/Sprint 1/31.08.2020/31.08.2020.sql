-- Criação do banco de dados (schema) aluno
create database Sala_Aula;
use Sala_Aula;  -- seleciona o banco de dados aluno
-- isso é um comentário
-- criação da tabela aluno
create table Aluno (
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
