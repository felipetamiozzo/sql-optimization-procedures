# Projeto de Otimização de Banco de Dados e Stored Procedures

Este repositório contém a solução para o desafio de banco de dados, dividido em otimização com índices e automação com procedures.

## Parte 1: Índices (Database Company)
Foi utilizado o schema do banco de dados `company`. O objetivo foi otimizar consultas frequentes relacionadas a departamentos e funcionários.

### Índices Criados
1. **`idx_employee_dno` na tabela `employee`**:
   - **Motivo:** A coluna `Dno` é uma chave estrangeira fundamental. Ela é utilizada em praticamente todas as junções (`JOIN`) com a tabela de departamentos e nas agregações (`GROUP BY`) para contar funcionários. O índice elimina a necessidade de varredura completa da tabela (Full Table Scan).

2. **`idx_dept_locations_loc` na tabela `dept_locations`**:
   - **Motivo:** Consultas gerenciais frequentemente filtram ou ordenam departamentos por localização geográfica. Indexar a coluna `Dlocation` acelera a resposta para perguntas como "Quais departamentos estão em Houston?".

## Parte 2: Stored Procedures
Foram criadas procedures para automatizar o CRUD (Create, Read, Update, Delete) em dois contextos distintos, utilizando variáveis de controle.

1. **`sp_manage_ecommerce`**:
   - Gerencia tabela de produtos.
   - Utiliza estrutura `CASE` para selecionar a operação (1=Insert, 2=Update, 3=Delete).

2. **`sp_manage_university`**:
   - Gerencia tabela de alunos.
   - Utiliza estrutura `IF/ELSEIF` para demonstrar outra forma de controle de fluxo condicional.

## Como Executar
1. Execute o script `part1_queries_indexes.sql` no banco de dados `company`.
2. Execute o script `part2_procedures.sql` para criar as tabelas de exemplo e as procedures.
