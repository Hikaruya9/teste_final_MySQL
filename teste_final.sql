CREATE DATABASE empresa
DEFAULT CHARACTER SET utf8mb4
DEFAULT COLLATE utf8mb4_general_ci;

USE empresa;

CREATE TABLE departamentos(
id int NOT NULL AUTO_INCREMENT,
nome varchar(50),
PRIMARY KEY(id)
)DEFAULT CHARSET = utf8mb4;

INSERT INTO departamentos(nome) VALUES
('Marketing'),
('Adm'),
('Managers'),
('TI'),
('Security'),
('Director');

CREATE TABLE funcionarios(
id int NOT NULL AUTO_INCREMENT,
nome varchar(30),
cargo varchar(50),
salario decimal(7,2),
departamento_id int,
PRIMARY KEY(id),
FOREIGN KEY (departamento_id) REFERENCES departamentos(id)
)DEFAULT CHARSET = utf8mb4;

ALTER TABLE funcionarios
ADD COLUMN data_admissao date AFTER salario;

INSERT INTO funcionarios(nome, cargo, salario, data_admissao, departamento_id) VALUES
('Jorge', 'Segurança', '9570.00', '2024-01-20', 5),
('Jane', 'Vendedora', '16200.00', '2018-06-03', 1),
('Benjamin', 'Suporte técnico', '10380.00', '2019-12-01', 4),
('John', 'Auxiliar administrativo', '12850.00', '2020-07-10', 2),
('Leonard', 'Suporte técnico', '7940.00', '2023-05-06', 4),
('Alan', 'Vendedor', '12540.00', '2021-10-15', 1),
('Mary', 'Gerente', '22520.00', '2021-04-01', 3),
('Pedro', 'CEO', null, '2018-08-30', 6),
('Thales', 'Auxiliar administrativo', '13920.00', '2024-03-12', 2),
('Thiago', 'Segurança', '15520.00', '2022-08-24', 5);

UPDATE funcionarios
SET departamento_id = 5
WHERE nome = 'thiago';

UPDATE funcionarios
SET cargo = 'Vendedor'
WHERE nome = 'Jane';

UPDATE funcionarios
SET salario = '42050.00'
WHERE cargo = 'CEO';

SELECT nome FROM funcionarios;

SELECT f.nome, f.cargo FROM funcionarios AS f
LEFT JOIN departamentos AS d ON d.id = f.departamento_id
WHERE d.nome = 'marketing';

SELECT d.nome, COUNT(f.departamento_id) AS 'Quantidade de funcionarios' FROM funcionarios AS f
JOIN departamentos AS d ON d.id = f.departamento_id
GROUP BY d.nome;

SELECT f.nome, d.nome FROM funcionarios AS f
JOIN departamentos AS d ON d.id = f.departamento_id;

SELECT nome FROM funcionarios
WHERE salario > 10000;

SELECT f.nome FROM funcionarios AS f
JOIN departamentos AS d ON d.id = f.departamento_id
WHERE d.nome = 'TI' OR d.nome = 'Marketing';

SELECT nome FROM funcionarios AS f
WHERE data_admissao > '2020-01-01' AND data_admissao < '2022-12-31';

SELECT f.nome FROM funcionarios AS f
WHERE f.nome LIKE 'M%';

SELECT DISTINCT cargo FROM funcionarios;

SELECT ROUND(AVG(salario)) FROM funcionarios;

SELECT MAX(salario) FROM funcionarios;

SELECT d.nome FROM funcionarios AS f
JOIN departamentos AS d ON d.id = f.departamento_id
GROUP BY d.nome HAVING COUNT(f.departamento_id) > 1;

UPDATE funcionarios
SET cargo = 'Analista de Sistemas'
WHERE id = 5;

DELETE FROM funcionarios
WHERE id = 10;









CREATE DATABASE carro
DEFAULT CHARACTER SET utf8mb4
DEFAULT COLLATE utf8mb4_general_ci;

USE carro;

CREATE TABLE carros(
id int NOT NULL AUTO_INCREMENT,
marca varchar(30),
modelo varchar(20),
ano year,
proprietario_id int,
PRIMARY KEY(id),
FOREIGN KEY (proprietario_id) REFERENCES proprietarios(id)
)DEFAULT CHARSET = utf8mb4;

INSERT INTO carros (marca, modelo, ano, proprietario_id) VALUES
('Toyota', 'HB20', 2001, 9),
('Wolksvagen', 'A40', 2020, 4),
('Fiat', 'Uno', 2012, 3),
('Fusca', 'Rebaixado', 1999, 1),
('Kwid', 'W60', 2005, 5),
('Fiat', 'Dos', 2013, 6),
('Fiat', 'Tres', 2015, 10),
('Fiat', 'Cuatro', 2018, 2),
('Fiat', 'Cinco', 2020, 7);

CREATE TABLE proprietarios(
id int NOT NULL AUTO_INCREMENT,
nome varchar(30),
idade int,
PRIMARY KEY(id)
)DEFAULT CHARSET = utf8mb4;

INSERT INTO proprietarios (nome, idade) VALUES
('Jorge', 54),
('Gerson', 45),
('Sergio', 50),
('Gustavo', 30),
('Igor', 42),
('Cleiton', 22),
('Maria', 62),
('Luis', 34),
('Waldemiro', 72),
('Joao', 20);

ALTER TABLE proprietarios
MODIFY COLUMN idade int;

SELECT c.marca, c.modelo FROM carros AS c;

SELECT p.nome, c.marca FROM carros AS c
JOIN proprietarios AS p ON p.id = c.proprietario_id;

SELECT c.marca FROM carros AS c
WHERE ano < 2010;

SELECT p.nome FROM proprietarios AS p
JOIN carros AS c ON p.id = c.proprietario_id
WHERE c.marca = 'toyota';

SELECT c.marca, COUNT(c.marca) FROM carros AS c
JOIN proprietarios AS p ON p.id = c.proprietario_id
GROUP BY c.marca;

SELECT c.marca FROM carros AS c
GROUP BY c.marca HAVING COUNT(c.marca) > 2;

UPDATE carros
SET ano = '2015'
WHERE id = 3;

DELETE FROM carros
WHERE id = 7;








CREATE DATABASE computador
DEFAULT CHARACTER SET utf8mb4
DEFAULT COLLATE utf8mb4_general_ci;

USE computador;

CREATE TABLE computadores(
id int NOT NULL AUTO_INCREMENT,
marca varchar(30),
modelo varchar(20),
processador varchar(50),
memoria_ram int,
usuario_id int,
PRIMARY KEY(id),
FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
)DEFAULT CHARSET = utf8mb4;

ALTER TABLE computadores
MODIFY COLUMN memoria_ram int;

INSERT INTO computadores (marca, modelo, processador, memoria_ram, usuario_id) VALUES
('Dell', 'H230', 'Intel Core I5-9200', 12, 2),
('Positivo', 'L20', 'Intel Core I3-2400', 4, 5),
('Dell', 'H170', 'Intel Core I7-7900K', 8, 4),
('Alienware', 'A238', 'Intel Core I9-12800KF', 32, 3),
('Positivo', 'L55', 'Intel Core Celeron 520', 4, 1),
('Dell', 'H210', 'Intel Core I3-8700K', 8, 6);

CREATE TABLE usuarios(
id int NOT NULL AUTO_INCREMENT,
nome varchar(50),
email varchar(100),
PRIMARY KEY(id)
)DEFAULT CHARSET = utf8mb4;

INSERT INTO usuarios (nome, email) VALUES
('Gerson', 45),
('Sergio', 50),
('Gustavo', 30),
('Igor', 42),
('Maria', 62),
('Joao', 20);

SELECT c.modelo, c.processador FROM computadores AS c;

SELECT u.nome, c.marca FROM computadores AS c
JOIN usuarios AS u ON u.id = c.usuario_id;

SELECT c.marca FROM computadores AS c
WHERE memoria_ram > 8;

SELECT u.nome FROM usuarios AS u
JOIN computadores AS c ON u.id = c.usuario_id
WHERE c.marca = 'Dell';

SELECT c.marca, COUNT(c.marca) FROM computadores AS c
JOIN usuarios AS u ON u.id = c.usuario_id
GROUP BY c.marca;

SELECT c.marca FROM computadores AS c
GROUP BY c.marca HAVING COUNT(c.marca) < 3;

UPDATE computadores
SET processador = 'Intel Core i7'
WHERE id = 6;

DELETE FROM computadores
WHERE id = 6;









CREATE DATABASE celular
DEFAULT CHARACTER SET utf8mb4
DEFAULT COLLATE utf8mb4_general_ci;

USE celular;

CREATE TABLE celular(
id int NOT NULL AUTO_INCREMENT,
marca varchar(30),
modelo varchar(20),
sistema_operacional varchar(30),
proprietario_id int,
PRIMARY KEY(id),
FOREIGN KEY (proprietario_id) REFERENCES proprietarios(id)
)DEFAULT CHARSET = utf8mb4;

INSERT INTO celular (marca, modelo, sistema_operacional, proprietario_id) VALUES
('Samsung', 'Galaxy S5 Pro', 'Android 10', 10),
('Xiaomi', 'A24', 'Android 14', 5),
('iPhone', 'Pro Max 12', 'Apple 12', 4),
('Motorola', 'G5 Play', 'Android 13', 2),
('Motorola', 'G6 Plus', 'Android 14', 8),
('Motorola', 'G5 Play', 'Android 11', 3),
('iPhone', 'Pro 9 Plus', 'Apple 20', 7),
('Motorola', 'G6', 'Android 12', 1),
('Motorola', 'G5', 'Android 10', 9),
('Samsung', 'Galaxy S6', 'Android 14', 6);

UPDATE celular
SET sistema_operacional = 'iOS 20'
WHERE id = 7;

CREATE TABLE proprietarios(
id int NOT NULL AUTO_INCREMENT,
nome varchar(50),
email varchar(100),
PRIMARY KEY(id)
)DEFAULT CHARSET = utf8mb4;

INSERT INTO proprietarios (nome, email) VALUES
('Jorge', 'jorge@gmail.com'),
('Gerson', 'gerson@yahoo.com'),
('Sergio', 'sergio@terra.com'),
('Gustavo', 'gustavo@gmail.com'),
('Igor', 'igor@gov.com'),
('Cleiton', 'cleiton@empresa.com'),
('Maria', 'maria@producoes.com'),
('Luis', 'luis@terraria.com'),
('Waldemiro', 'waldemiro@tibia.com'),
('Joao', 'joao@uol.com');

SELECT c.marca, c.modelo FROM celular AS c;

SELECT p.nome, c.marca FROM celular AS c
JOIN proprietarios AS p ON p.id = c.proprietario_id;

SELECT c.sistema_operacional FROM celular AS c
WHERE c.sistema_operacional LIKE '%Android%';

SELECT p.nome FROM proprietarios AS p
JOIN celular AS c ON p.id = c.proprietario_id
WHERE c.marca = 'Samsung';

SELECT c.sistema_operacional, COUNT(c.marca) FROM celular AS c
GROUP BY c.sistema_operacional;

SELECT c.sistema_operacional FROM celular AS c
GROUP BY c.sistema_operacional HAVING COUNT(c.sistema_operacional) > 2;

UPDATE celular
SET sistema_operacional = 'iOS'
WHERE id = 4;

DELETE FROM celular
WHERE id = 9;









CREATE DATABASE redes_sociais
DEFAULT CHARACTER SET utf8mb4
DEFAULT COLLATE utf8mb4_general_ci;

USE redes_sociais;

CREATE TABLE usuarios(
id int NOT NULL AUTO_INCREMENT,
nome varchar(50),
email varchar(100),
PRIMARY KEY(id)
)DEFAULT CHARSET = utf8mb4;

INSERT INTO usuarios(nome, email) VALUES
('Gerson', 'gerson@yahoo.com'),
('Gustavo', 'gustavo@gmail.com'),
('Igor', 'igor@gov.com'),
('Cleiton', 'cleiton@empresa.com'),
('Luis', 'luis@terraria.com'),
('Joao', 'joao@uol.com');


CREATE TABLE posts(
id int NOT NULL AUTO_INCREMENT,
conteudo text,
data_publicacao date,
usuario_id int,
PRIMARY KEY(id),
FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
)DEFAULT CHARSET = utf8mb4;

INSERT INTO posts(conteudo, data_publicacao, usuario_id) VALUES
('All those moments will be lost in time, like tears in rain', '2022-07-24', 3),
('Impossivel tankar o bostil', '2024-01-30', 6),
('O tempo sempre será o mesmo para todos, não existe essa de não ter tempo.', '2020-04-03', 5),
('O bostil não é um lugar para amadores', '2024-03-05', 6),
('Sempre que você se encontrar perdido, lembre-se que Deus estará com você', '2023-07-03', 1),
('Não podemos nem mais dormir em paz sem ter um bostileiro estourando um som no talo em pleno MEIO DE SEMANA', '2024-04-20', 6);

CREATE TABLE comentarios(
id int NOT NULL AUTO_INCREMENT,
conteudo text,
data_publicacao date,
post_id int,
usuario_id int,
PRIMARY KEY(id),
FOREIGN KEY (post_id) REFERENCES posts(id),
FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
)DEFAULT CHARSET = utf8mb4;

INSERT INTO comentarios(conteudo, data_publicacao, post_id, usuario_id) VALUES
('Vai dormir ao invés de ficar reclamando rapaz! Ficar reclamando em rede social não vai mudar nada!!', '2024-06-20', 6, 1),
('Realmente, esses bostileiro estao cada dia piores', '2024-05-01', 6, 4),
('Você está precisando é de Deus na sua vida, vá à igreja ao invés de perder seu tempo sendo vira-lata de gringo.', '2024-04-24', 4, 1),
('Muito bom isso aí amigo, quando que vai lançar o curso de coach?', '2021-02-16', 3, 1),
('Muito triste ver que tem gente tão cega pros problemas do país', '2024-02-26', 2, 3),
('É uma infeliz realidade essa que nós temos que suportar, mesmo assim continuo tendo esperança na melhora do Brasil', '2024-04-30', 4, 3),
('Fala isso pros milhões de brasileiros amaldiçoados por uma escala 6x1', '2022-09-22',3, 6),
('Amém!', '2023-09-10', 5, 4),
('Larga mão dessa síndrome de vira-lata e vai empreender, já que odeia tanto a CLT', '2024-03-01',2, 2),
('Esse filme é excelente, possivelmente um dos melhores que já vi na vida', '2022-07-26', 1, 6),
('Bom ver que existem pessoas que enxergam a verdade no nosso país', '2024-05-03', 4, 5),
('Graças a Deus eu vivo em um lugar pacífico hoje, não aguentava viver perto desse pessoal', '2024-05-10',6, 2),
('Ainda bem que já tenho minhas passagens compradas pra poder fugir do Bostil, não aguento mais lidar com o bostileiro', '2024-05-15',6, 5),
('Não importa o momento da vida, nós nunca estaremos sozinhos, Deus lhes abençoem!', '2023-11-20', 5, 3),
('Posso dizer com tranquilidade que essa é uma das melhores cenas que já vi na vida', '2022-07-27', 1, 1);

SELECT u.nome, u.email FROM usuarios AS u;

SELECT p.conteudo, p.data_publicacao FROM posts AS p;

SELECT u.nome, p.conteudo FROM posts AS p
LEFT JOIN usuarios AS u ON u.id = p.usuario_id;

SELECT p.conteudo, c.conteudo FROM posts AS p
JOIN comentarios AS c ON p.id = c.post_id;

SELECT p.conteudo FROM posts AS p
WHERE data_publicacao > '2023-01-01';

SELECT c.conteudo FROM comentarios AS c
JOIN usuarios AS u ON u.id = c.usuario_id
WHERE u.id = 3;

SELECT u.nome AS 'Nome', COUNT(p.usuario_id) AS 'Posts' FROM posts AS p
JOIN usuarios AS u ON u.id = p.usuario_id
GROUP BY p.usuario_id;

SELECT u.nome, COUNT(c.usuario_id) AS 'Comentarios' FROM comentarios AS c
JOIN usuarios AS u ON u.id = c.usuario_id
GROUP BY c.usuario_id HAVING COUNT(c.usuario_id) > 2;

UPDATE posts
SET conteudo = 'Parece que a cada dia que passa o bostileiro está pior'
WHERE usuario_id = 6
LIMIT 1;

DELETE FROM comentarios
WHERE post_id = 3;

DELETE FROM comentarios
WHERE usuario_id = 5;

DELETE FROM posts
WHERE usuario_id = 5;