drop database Funcionario_Dependente;

create database Funcionario_Dependente;
use Funcionario_Dependente;

-- Craçãoda tabela Funcionario
create table Funcionario (
idFunc int primary key auto_increment,
nomeFunc varchar (40),
salario decimal (7,2) check (salario > 0),
sexo char (1),
check (sexo = 'm' or sexo = 'f' or sexo = 'n'),
fkSupervisor int,
foreign key (fkSupervisor) references Funcionario (idFunc) -- Relacionamento recursivo
) auto_increment = 1000;

select * from Funcionario;
desc Funcionario;

-- Criação da tabela Dependente
create table Dependente (
fkFunc int,
foreign key (fkFunc) references Funcionario (idFunc),
idDepen int,
primary key (fkFunc, idDepen), -- Configuração da chave primária composta
nomeDepen varchar (40),
tipoRelacao varchar (40),
dataNasc date
);

select * from Dependente;
desc Dependente;

-- Testando inserção de valores na tabela Funcionario
-- Testando o check do salário 
insert into Funcionario (nomeFunc, salario) values 
('Maria Eduarda', 0);

-- Testando o check do sexo
insert into Funcionario (nomeFunc, sexo) values
('Maria Eduarda', 'x');

-- Inserindo valores na tabela Funcionario
insert into Funcionario values
(null, 'Maria Eduarda', 25000, 'f', null);

insert into Funcionario values
(null, 'Oliver Gabriel', 15000, 'm', 1000),
(null, 'Paula Avelino', 13000, 'f', 1000),
(null, 'Arthur Wayne', 13500, 'm', 1001),
(null, 'Diana Cristina', 9000,'n', 1002);

select * from Funcionario;

-- Inserindo de valores na tabela Dependente
insert into Dependente values
(1000, 1, 'Anna Tavares', 'filha', '2041-04-12'),
(1000, 2, 'Pedro Henrique', 'marido', '2001-12-30'),
(1001, 1, 'Sarah Connor', 'esposa', '1999-04-12'),
(1001, 2, 'Ronan Lima', 'filho', '2032-05-18'),
(1001, 3, 'Elesis Lima', 'filha', '2032-05-18');
select * from Dependente;

-- Exibir os dados dos Funcionarios e dos Dependentes correspondentes
select * from Funcionario, Dependente where fkFunc = idFunc;

-- Exibir os dados dos Funcionarios e dos seus Dependentes, mas somente de UM Funcionario
select * from Funcionario, Dependente where fkFunc = idFunc and nomeFunc = 'Oliver Gabriel';

-- Exibir os dados dos Funcionarios e dos seus Supervisores
-- Após o where, o fksupervisor do Funcionario deve ser igual ao idFunc do Supervisor
select * from Funcionario as F, Funcionario as S where F.fkSupervisor = S.idFunc;
-- select * from Funcionario as func, Funcionario as superv where func.fkSupervisor = superv.idFunc;

-- Exibir a media dos salarios
select avg(salario) as 'Média dos Salários' from Funcionario;
--  15100.000000

select round(avg(salario),2) as 'Média dos Salários Arredondada' from Funcionario;
--  15100.000000 - round -> 15100.00
-- round arredonda o numero para um dos lados extremos (1 ou 9) mais próximos

select truncate(avg(salario),2) as 'Média dos Salários Arredondada' from Funcionario;
-- 15100.000000 - truncate -> 15100.00

-- Exibir os dados dos Funcionarios e dos Supervisores,
-- porém somento de UM Supervisor
select * from Funcionario as F, Funcionario as S where F.fkSupervisor = S.idFunc and f.nomeFunc = 'Oliver Gabriel';

-- Exibir os dados dos Funcionarios, dos seus Supervisores e dos seus Dependentes
select * from Funcionario as f, Funcionario as s, Dependente where f.fkSupervisor = s.idFunc and fkFunc = f.idFunc;

-- Exibir a quantidade de salários da tabela Funcionario
select count(salario) as 'Quantidade de Salários' from Funcionario;

-- Exibir a quantidade de salários abaixo de 10k (10 mil) da tabela Funcionario
select count(salario) as 'Quantidade de Salários' from Funcionario where salario <= 10000;

-- Exibir a media e a soma dos salarios abaixo de 10k (10 mil)
select avg(salario) as 'Media de Salários <= 14k', 
       sum(salario) as 'Soma dos Salários <= 14k' from Funcionario where salario <= 14000;

-- Arredondando com o round
select round(avg(salario),2) as 'Media de Salários <= 14k', 
       sum(salario) as 'Soma dos Salários <= 14k' from Funcionario where salario <= 14000;
       
