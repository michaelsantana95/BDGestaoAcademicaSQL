-- CRIAÇÃO DO BANCO DE DADOS

--Querie para criar um banco de dados novo:
CREATE DATABASE BDGestaoAcademica

--CRIAÇÃO DE TABELAS

--Querie para criar tabela aluno
CREATE TABLE BDGestaoAcademica.public.aluno (
    alunoID VARCHAR(7) PRIMARY KEY
    ,nome_completo VARCHAR(100)
    ,data_nascimento DATE
    ,sexo VARCHAR(9)
    ,nome_mae VARCHAR(100)
    ,nome_pai VARCHAR(100)
    ,rg VARCHAR(9)
    ,cpf VARCHAR(11)
    ,telefone_responsavel VARCHAR(11)
    ,email_responsavel VARCHAR(256)
)
;

--Querie para criar tabela professor
CREATE TABLE BDGestaoAcademica.public.professor (
    professorID VARCHAR(7) PRIMARY KEY      
    ,nome_completo VARCHAR(100)
    ,telefone VARCHAR(11)
    ,email VARCHAR(256)
)
;

--Querie para criar tabela turma
CREATE TABLE BDGestaoAcademica.public.turma (
    turmaID VARCHAR(9) PRIMARY KEY
    ,serie VARCHAR(6)
    ,turno VARCHAR(5)
    ,ano_letivo SMALLINT
)
;

--Querie para criar tabela disciplina
CREATE TABLE BDGestaoAcademica.public.disciplina (
    disciplinaID VARCHAR(2) PRIMARY KEY
    ,disciplina VARCHAR(18)
    ,carga_horaria SMALLINT
)
;

--Querie para criar tabela matricula
CREATE TABLE BDGestaoAcademica.public.matricula (
    alunoID VARCHAR(7)
    ,turmaID VARCHAR(9)
    ,gera_quantidade SMALLINT DEFAULT 1
    ,FOREIGN KEY (alunoID) REFERENCES aluno(alunoID)
    ,FOREIGN KEY (turmaID) REFERENCES turma(turmaID)
)
;

--Querie para criar tabela diario
CREATE TABLE BDGestaoAcademica.public.diario (
    diarioID VARCHAR(8) PRIMARY KEY
    ,turmaID VARCHAR(9)
    ,professorID VARCHAR(7)
    ,disciplinaID VARCHAR(2)
    ,FOREIGN KEY (turmaID) REFERENCES turma(turmaID)
    ,FOREIGN KEY (professorID) REFERENCES professor(professorID)
    ,FOREIGN KEY (disciplinaID) REFERENCES disciplina(disciplinaID)
)
;

--Querie para criar tabela conteudo
CREATE TABLE BDGestaoAcademica.public.conteudo (
    conteudoID VARCHAR(8) PRIMARY KEY
    ,data DATE
    ,diarioID VARCHAR(8)
    ,conteudo_ministrado VARCHAR(100)
    ,FOREIGN KEY (diarioID) REFERENCES diario(diarioID)
)
;

--Querie para criar tabela presenca_aluno
CREATE TABLE BDGestaoAcademica.public.presenca_aluno (
    presencaID VARCHAR(8) PRIMARY KEY
    ,data DATE
    ,diarioID VARCHAR(8)
    ,alunoID VARCHAR(7)
    ,falta VARCHAR(1)
    ,FOREIGN KEY (diarioID) REFERENCES diario(diarioID)
    ,FOREIGN KEY (alunoID) REFERENCES aluno(alunoID)
)
;

--Querie para criar tabela notas_alunos
CREATE TABLE BDGestaoAcademica.public.notas_alunos (
    notaID VARCHAR(8) PRIMARY KEY
    ,alunoID VARCHAR(7)
    ,diarioID VARCHAR(8)
    ,mediab1 NUMERIC(4, 2)
    ,mediab2 NUMERIC(4, 2)
    ,mediab3 NUMERIC(4, 2)
    ,mediab4 NUMERIC(4, 2)
    ,media_anual NUMERIC(4, 2)
    ,recuperacao NUMERIC(4, 2)
    ,media_recuperacao NUMERIC(4, 2)
    ,situacao VARCHAR(9)
    ,FOREIGN KEY (alunoID) REFERENCES aluno(alunoID)
    ,FOREIGN KEY (diarioID) REFERENCES diario(diarioID)
)
;

--INSERÇÃO DE DADOS NAS TABELAS

--Querie para inserir os dados na tabela aluno
COPY BDGestaoAcademica.public.aluno (alunoID, nome_completo, data_nascimento, sexo, nome_mae, nome_pai, rg, cpf, telefone_responsavel, email_responsavel)
FROM 'D:\Desktop\alunos.csv' DELIMITER ';' CSV HEADER
;

--Querie para inserir os dados na tabela professor
INSERT INTO BDGestaoAcademica.public.professor (professorID, nome_completo, telefone, email)
VALUES ('p000001', 'Patrícia Pereira', '11987654320', 'patricia.pereira@gmail.com')
,('p000002', 'Carlos Santos', '11976543210', 'carlos.santos@gmail.com')
,('p000003', 'Fábio Oliveira', '11965432109', 'fabio.oliveira@gmail.com')
,('p000004', 'Sheila Carvalho', '11954321098', 'sheila.carvalho@gmail.com')
,('p000005', 'Vanessa Silva', '11943210987', 'vanessa.silva@gmail.com')
,('p000006', 'Felipe Souza', '11932109876', 'felipe.souza@gmail.com')
,('p000007', 'André Lima', '11921098765', 'andre.lima@gmail.com')
,('p000008', 'Márcia Rocha', '11910987654', 'marcia.rocha@gmail.com')
,('p000009', 'Tereza Martins', '11998765432', 'tereza.martins@gmail.com')
,('p000010', 'Cintia Costa', '11987654321', 'cintia.costa@gmail.com')
,('p000011', 'Marcos Fernandes', '11976543210', 'marcos.fernandes@gmail.com')
,('p000012', 'Gabriel Almeida', '11965432109', 'gabriel.almeida@gmail.com')
,('p000013', 'Paulo Cardoso', '11954321098', 'paulo.cardoso@gmail.com')
,('p000014', 'Luiza Gomes', '11943210987', 'luiza.gomes@gmail.com')
;

--Querie para inserir os dados na tabela turma
INSERT INTO BDGestaoAcademica.public.turma (turmaID, serie, turno, ano_letivo)
VALUES ('t01012022', '1º ano', 'manhã', 2022)
,('t01022022', '1º ano', 'tarde', 2022)
,('t02012022', '2º ano', 'manhã', 2022)
,('t02022022', '2º ano', 'tarde', 2022)
,('t03012022', '3º ano', 'manhã', 2022)
,('t03022022', '3º ano', 'tarde', 2022)
,('t04012022', '4º ano', 'manhã', 2022)
,('t04022022', '4º ano', 'tarde', 2022)
,('t05012022', '5º ano', 'manhã', 2022)
,('t05022022', '5º ano', 'tarde', 2022)
;

--Querie para inserir os dados na tabela disciplina
INSERT INTO BDGestaoAcademica.public.disciplina (disciplinaID, disciplina, carga_horaria)
VALUES ('01', 'Artes', 1)
,('02', 'Ciências', 3)
,('03', 'Educação Física', 1)
,('04', 'Ensino Religioso', 1)
,('05', 'Geografia', 3)
,('06', 'História', 3)
,('07', 'Língua Estrangeira', 1)
,('08', 'Língua Portuguesa', 4)
,('09', 'Matemática', 3)
;

--Querie para inserir os dados na tabela matricula
COPY matricula (alunoID, turmaID)
FROM 'D:\Desktop\matricula.csv' DELIMITER ';' CSV HEADER
;

--Querie para inserir os dados na tabela diario
COPY diario (diarioID, turmaID, professorID, disciplinaID)
FROM 'D:\Desktop\diarios.csv' DELIMITER ';' CSV HEADER
;

--Querie para inserir os dados na tabela conteudo
COPY conteudo (conteudoID, data, diarioID, conteudo_ministrado)
FROM 'D:\Desktop\conteudo.csv' DELIMITER ';' CSV HEADER
;

--Querie para inserir os dados na tabela presenca_aluno
COPY presenca_aluno (presencaID, data, diarioID, alunoID, falta)
FROM 'D:\Desktop\presenca.csv' DELIMITER ';' CSV HEADER
;

--Querie para inserir os dados na tabela notas_alunos
COPY notas_alunos (notaID, alunoID, diarioID, mediab1, mediab2, mediab3, mediab4, media_anual, recuperacao, media_recuperacao, situacao)
FROM 'D:\Desktop\notas_alunos.csv' DELIMITER ';' CSV HEADER
;


--CRIAÇÃO DE VIEWS

-- Alunos por turma
CREATE VIEW lista_alunos_por_turma AS
SELECT
    t.turmaID,
    t.serie,
    t.turno,
    a.nome_completo
FROM
    BDGestaoAcademica.public.turma t
LEFT JOIN
    BDGestaoAcademica.public.matricula m ON t.turmaID = m.turmaID
LEFT JOIN
    BDGestaoAcademica.public.aluno a ON m.alunoID = a.alunoID
ORDER BY
    t.turmaID,
    a.nome_completo
;

-- Notas por aluno
CREATE VIEW notas_por_aluno AS
SELECT
    n.notaID,
    a.alunoID,
    a.nome_completo,
    d.disciplinaID,
    n.mediab1,
    n.mediab2,
    n.mediab3,
    n.mediab4,
    n.media_anual,
    n.recuperacao,
    n.media_recuperacao,
    n.situacao
FROM
    BDGestaoAcademica.public.notas_alunos n
JOIN
    BDGestaoAcademica.public.aluno a ON n.alunoID = a.alunoID
JOIN
    BDGestaoAcademica.public.diario d ON n.diarioID = d.diarioID
;


-- Todos professores da escola
CREATE VIEW lista_professores_escola AS
SELECT
    professorID,
    nome_completo,
    telefone,
    email
FROM
    BDGestaoAcademica.public.professor
;

-- Situação de final de ano (aprovado ou reprovado)
CREATE VIEW situacao_final_ano AS
SELECT
    na.alunoID,
    a.nome_completo,
    t.serie,
    na.situacao AS situacao_final
FROM
    BDGestaoAcademica.public.notas_alunos na
JOIN
    BDGestaoAcademica.public.aluno a ON na.alunoID = a.alunoID
JOIN
    BDGestaoAcademica.public.diario di ON na.diarioID = di.diarioID
JOIN
    BDGestaoAcademica.public.turma t ON di.turmaID = t.turmaID
;

-- Desempenho médio por disciplina em cada série
CREATE VIEW boletim_escolar_geral AS
SELECT
	t.turmaID,
    t.serie,
    d.disciplina,
    ROUND(AVG(n.media_anual), 2) AS media_disciplina
FROM
    BDGestaoAcademica.public.notas_alunos n
JOIN
    BDGestaoAcademica.public.diario di ON n.diarioID = di.diarioID
JOIN
    BDGestaoAcademica.public.turma t ON di.turmaID = t.turmaID
JOIN
    BDGestaoAcademica.public.disciplina d ON di.disciplinaID = d.disciplinaID
GROUP BY
    t.serie, d.disciplina, t.turmaID
ORDER BY 
	t.turmaID
;