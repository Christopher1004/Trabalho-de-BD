Create Database BibliotecaEtec;

Create table Autores (
Autores_id INT PRIMARY KEY,
Nome VARCHAR(250));

Create table Livros (
Livros_id INT PRIMARY KEY,
titulo VARCHAR(250),
Autores_id INT,
FOREIGN KEY (Autores_id) references Autores(Autores_id));

Create table Leitor (
Leitor_id INT PRIMARY KEY,
nome VARCHAR(250),
email VARCHAR(250));

Create table Emprestimos (
Emprestimos_id INT PRIMARY KEY,
data_emprestimo DATE,
data_devolucao DATE,
Leitor_id INT,
Livros_id INT,
FOREIGN KEY (Leitor_id) references Leitor(Leitor_id),
FOREIGN KEY (Livros_id) references Livros(Livros_id));

create table Exemplar(
id_exemplar int primary key,
edicao_livros int,
Livros_id int,
foreign key (Livros_id) references Livros(Livros_id));

insert into Autores (Autores_id, Nome) Values
	(123, "Willian Shakespeare"),
	(234, "Machado de Assis"),
	(345, "Clarice Lispecto"),
	(456, "Monteiro Lobato"),
	(567, "Luís de Camões");

insert into Livros (Livros_id, titulo, Autores_id) values 
	(098, "Romeu e Julieta" , 123),
	(087, "Dom Casmurro", 234),
	(076, "A hora da estrela", 345),
	(065, "O pica pau amarelo", 456),
	(054, "Anfitriões" , 567);

insert into Leitor (leitor_id, nome, email) values 
	(298, "Natã", "nata@gmail.com"),
	(287, "Lorena", "lorena@gmail.com"),
	(276, "Lavinia", "lavinia@gmail.com"),
	(265, "Lyncon", "lyncon@gmail.com"),
	(254, "Christopher", "Christopher@gmail.com");

insert into Emprestimos (Emprestimos_id, data_emprestimo, data_devolucao, Leitor_id, Livros_id) values
	(012, "2024/06/12", "2024/06/20", 254, 065),
	(034, "2024/06/11", "2024/06/21", 276, 087),
	(045, "2024/06/10", "2024/06/22", 265, 054),
	(056, "2024/06/13", "2024/06/24", 287, 098),
	(067, "2024/06/14", "2024/06/25", 298, 076);

insert into Exemplar (id_exemplar, edicao_livros, livros_id) values 
	(543, 1, 098),
	(765, 3, 087),
	(987, 2, 076),
	(354, 1, 065),
	(687, 3, 054);

update Emprestimos set data_emprestimo = "2024/06/13" where Emprestimos_id = 012;
update Leitor set nome = "Yago" where leitor_id = 254;
update Leitor set email = "Yago@gmail" where leitor_id = 254;

select * from Livros;
select Nome from Autores where Nome = "Willian Shakespeare";
select * from Autores;

ALTER TABLE Autores
ADD nacionalidade VARCHAR(255);

ALTER TABLE Autores
ADD data_nascimento DATE;

ALTER TABLE Autores
ADD gênero VARCHAR(255);


DELETE FROM Livros 
WHERE Autores_id IS NULL

DELETE FROM Livros
WHERE Autores_id NOT IN (SELECT Autores_id FROM Autores);

SELECT Livros.titulo, Autores.Nome, Autores.nacionalidade
FROM Livros
JOIN Autores ON Autores.Autores_id = Livros.Autores_id;

SELECT Leitor.nome, Emprestimos.data_emprestimo, Emprestimos.data_devolucao, Livros.titulo, Autores.Nome
FROM Leitor
JOIN Emprestimos ON Leitor.Leitor_id = Emprestimos.Leitor_id
JOIN Livros ON Livros.Livros_id = Emprestimos.Livros_id
JOIN Autores ON Autores.Autores_id = Livros.Autores_id;

SELECT Exemplar.id_exemplar, Livros.titulo, Autores.Nome, Exemplar.edicao_livros
FROM Exemplar
JOIN Livros ON Livros.Livros_id = Exemplar.Livros_id
JOIN Autores ON Autores.Autores_id = Livros.Autores_id;
