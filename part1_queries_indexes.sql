USE company;


-- PARTE 1: Queries e Criação de Índices


-- 1. Qual o departamento com maior número de pessoas?

SELECT 
    Dno, 
    COUNT(*) AS Qtd_Funcionarios
FROM employee
GROUP BY Dno
ORDER BY Qtd_Funcionarios DESC
LIMIT 1;

-- 2. Quais são os departamentos por cidade?

SELECT 
    d.Dname AS Departamento, 
    l.Dlocation AS Cidade
FROM departament AS d
JOIN dept_locations AS l ON d.Dnumber = l.Dnumber
ORDER BY l.Dlocation, d.Dname;

-- 3. Relação de empregados por departamento

SELECT 
    d.Dname AS Departamento, 
    CONCAT(e.Fname, ' ', e.Lname) AS Funcionario
FROM departament AS d
JOIN employee AS e ON d.Dnumber = e.Dno
ORDER BY d.Dname, e.Fname;



-- CRIAÇÃO DOS ÍNDICES
-- Motivo: Otimizar as buscas e agrupamentos feitos acima.


-- Índice 1: Para a tabela employee na coluna Dno.

CREATE INDEX idx_employee_dno ON employee(Dno);

-- Índice 2: Para a tabela dept_locations na coluna Dlocation.

CREATE INDEX idx_dept_locations_loc ON dept_locations(Dlocation);

