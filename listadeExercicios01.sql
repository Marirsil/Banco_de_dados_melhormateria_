SELECT titulo FROM livros;

SELECT nome FROM autores WHERE YEAR(nascimento) < 1900;

SELECT livros.titulo
FROM livros
INNER JOIN autores ON livros.autor_id = autores.id
WHERE autores.nome = 'J.K. Rowling';

SELECT alunos.nome
FROM alunos
INNER JOIN matriculas ON alunos.id = matriculas.aluno_id
WHERE matriculas.curso = 'Engenharia de Software';

SELECT produto, COUNT(*) AS quantidade_vendida
FROM vendas
GROUP BY produto;

SELECT autores.nome, COUNT(livros.id) AS total_de_livros
FROM autores
LEFT JOIN livros ON autores.id = livros.autor_id
GROUP BY autores.nome;

SELECT matriculas.curso, COUNT(alunos.id) AS total_de_alunos
FROM matriculas
LEFT JOIN alunos ON matriculas.aluno_id = alunos.id
GROUP BY matriculas.curso;

SELECT produto, COUNT(*) AS quantidade_vendida
FROM vendas
GROUP BY produto;

SELECT produto
FROM (
    SELECT produto, COUNT(*) AS quantidade_vendida
    FROM vendas
    GROUP BY produto
) AS produtos_vendidos
HAVING SUM(quantidade_vendida) > 10000;

SELECT autores.nome
FROM autores
LEFT JOIN livros ON autores.id = livros.autor_id
GROUP BY autores.nome
HAVING COUNT(livros.id) > 2;

CREATE VIEW livros_autores AS
SELECT livros.titulo, autores.nome AS autor
FROM livros
INNER JOIN autores ON livros.autor_id = autores.id;
SELECT * FROM livros_autores;

SELECT alunos.nome, matriculas.curso
FROM alunos
LEFT JOIN matriculas ON alunos.id = matriculas.aluno_id;

CREATE VIEW autores_livros AS
SELECT autores.nome, livros.titulo AS livro
FROM autores
LEFT JOIN livros ON autores.id = livros.autor_id;
SELECT * FROM autores_livros;

CREATE VIEW cursos_alunos AS
SELECT alunos.nome, matriculas.curso
FROM matriculas
RIGHT JOIN alunos ON matriculas.aluno_id = alunos.id;
SELECT * FROM cursos_alunos;

CREATE VIEW alunos_cursos AS
SELECT alunos.nome, matriculas.curso
FROM alunos
INNER JOIN matriculas ON alunos.id = matriculas.aluno_id;
SELECT * FROM alunos_cursos;

SELECT autores.nome, COUNT(livros.id) AS total_de_livros
FROM autores
LEFT JOIN livros ON autores.id = livros.autor_id
GROUP BY autores.nome
ORDER BY total_de_livros DESC
LIMIT 1;

SELECT produto
FROM (
    SELECT produto, COUNT(*) AS quantidade_vendida
    FROM vendas
    GROUP BY produto
) AS produtos_vendidos
ORDER BY quantidade_vendida
LIMIT 1;

CREATE VIEW autores_receita AS
SELECT autores.nome, COUNT(livros.id) * 20 AS receita_total
FROM autores
LEFT JOIN livros ON autores.id = livros.autor_id
GROUP BY autores.nome;
SELECT * FROM autores_receita;
