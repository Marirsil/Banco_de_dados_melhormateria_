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
