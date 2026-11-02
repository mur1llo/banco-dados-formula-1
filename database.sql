CREATE DATABASE IF NOT EXISTS db_formula1; 
 
USE db_formula1; 
 
CREATE TABLE paises ( 
    codigo INT NOT NULL, 
    nome VARCHAR(50) NOT NULL, 
    PRIMARY KEY (codigo) 
); 
 
CREATE TABLE equipes ( 
    sigla VARCHAR(10) NOT NULL, 
    nome VARCHAR(60) NOT NULL, 
    cod_pais INT NOT NULL, 
    PRIMARY KEY (sigla), 
    FOREIGN KEY (cod_pais) REFERENCES paises(codigo) 
); 
 
CREATE TABLE pilotos ( 
    numero INT NOT NULL, 
    nome VARCHAR(80) NOT NULL, 
    cod_pais INT NOT NULL, 
    sigla_equipe VARCHAR(10) NOT NULL, 
    PRIMARY KEY (numero), 
    FOREIGN KEY (cod_pais) REFERENCES paises(codigo), 
    FOREIGN KEY (sigla_equipe) REFERENCES equipes(sigla) 
); 
 
CREATE TABLE corridas ( 
    sigla_gp VARCHAR(10) NOT NULL, 
    nome_gp VARCHAR(80) NOT NULL, 
    cod_pais INT NOT NULL, 
    qtd_voltas INT NOT NULL, 
    PRIMARY KEY (sigla_gp), 
    FOREIGN KEY (cod_pais) REFERENCES paises(codigo) 
); 
 
CREATE TABLE participantes ( 
    sigla_gp VARCHAR(10) NOT NULL, 
    num_piloto INT NOT NULL, 
    posicao_largada INT NOT NULL, 
    PRIMARY KEY (sigla_gp, num_piloto), 
    FOREIGN KEY (sigla_gp) REFERENCES corridas(sigla_gp), 
    FOREIGN KEY (num_piloto) REFERENCES pilotos(numero) 
); 
 
INSERT INTO paises (codigo, nome) VALUES 

(1, 'BRASIL'), 
(2, 'ITALIA'), 
(3, 'FRANCA'), 
(4, 'REINO UNIDO'), 
(5, 'ALEMANHA'), 
(6, 'ESPANHA'), 
(7, 'JAPAO'), 
(8, 'ESTADOS UNIDOS'), 
(9, 'AUSTRALIA'), 
(10, 'CANADA'); 
 
INSERT INTO equipes (sigla, nome, cod_pais) VALUES 

('FER', 'Scuderia Ferrari', 2), 
('MCL', 'McLaren', 4), 
('MER', 'Mercedes', 4), 
('RBR', 'Red Bull Racing', 4), 
('ALP', 'Alpine', 3), 
('WIL', 'Williams', 4), 
('AST', 'Aston Martin', 4), 
('HAA', 'Haas', 8), 
('SAU', 'Sauber', 5), 
('LOT', 'Lotus', 4); 

INSERT INTO pilotos (numero, nome, cod_pais, sigla_equipe) VALUES 

(1, 'Ayrton Senna', 1, 'MCL'), 
(2, 'Nelson Piquet', 1, 'RBR'), 
(3, 'Emerson Fittipaldi', 1, 'MCL'), 
(4, 'Rubens Barrichello', 1, 'FER'), 
(5, 'Felipe Massa', 1, 'FER'), 
(6, 'Alberto Ascari', 2, 'FER'), 
(7, 'Giuseppe Farina', 2, 'FER'), 
(8, 'Riccardo Patrese', 2, 'ALP'), 
(9, 'Alain Prost', 3, 'MCL'), 
(10, 'Pierre Gasly', 3, 'ALP'); 

INSERT INTO corridas (sigla_gp, nome_gp, cod_pais, qtd_voltas) VALUES 

('BRA', 'Grande Premio do Brasil', 1, 71), 
('ITA', 'Grande Premio da Italia', 2, 53), 
('FRA', 'Grande Premio da Franca', 3, 53), 
('GBR', 'Grande Premio da Gra-Bretanha', 4, 52), 
('ALE', 'Grande Premio da Alemanha', 5, 67), 
('ESP', 'Grande Premio da Espanha', 6, 66), 
('JAP', 'Grande Premio do Japao', 7, 53), 
('USA', 'Grande Premio dos Estados Unidos', 8, 56), 
('AUS', 'Grande Premio da Australia', 9, 58), 
('CAN', 'Grande Premio do Canada', 10, 70); 

INSERT INTO participantes (sigla_gp, num_piloto, posicao_largada) VALUES 

('BRA', 1, 1), 
('BRA', 2, 2), 
('BRA', 3, 3), 
('BRA', 4, 4), 
('ITA', 6, 1), 
('ITA', 7, 2), 
('ITA', 8, 3), 
('FRA', 9, 1), 
('FRA', 10, 2), 
('GBR', 1, 2), 
('GBR', 5, 3), 
('ALE', 2, 1), 
('ALE', 6, 4), 
('ESP', 4, 2), 
('ESP', 9, 3), 
('JAP', 3, 1), 
('USA', 5, 2), 
('USA', 10, 4), 
('AUS', 7, 1), 
('CAN', 8, 3); 

ALTER TABLE pilotos 

ADD salario DECIMAL(10,2); 

UPDATE pilotos SET salario = 95000 WHERE numero = 1; 
UPDATE pilotos SET salario = 90000 WHERE numero = 2; 
UPDATE pilotos SET salario = 85000 WHERE numero = 3; 
UPDATE pilotos SET salario = 80000 WHERE numero = 4; 
UPDATE pilotos SET salario = 75000 WHERE numero = 5; 
UPDATE pilotos SET salario = 70000 WHERE numero = 6; 
UPDATE pilotos SET salario = 65000 WHERE numero = 7; 
UPDATE pilotos SET salario = 60000 WHERE numero = 8; 
UPDATE pilotos SET salario = 100000 WHERE numero = 9; 
UPDATE pilotos SET salario = 72000 WHERE numero = 10; 

SELECT nome 
FROM paises 
WHERE nome LIKE 'B%L'; 

SELECT pilotos.nome 
FROM pilotos 
INNER JOIN paises 
ON pilotos.cod_pais = paises.codigo 
WHERE paises.nome IN ('BRASIL', 'ITALIA', 'FRANCA'); 

SELECT nome 
FROM pilotos; 

SELECT nome_gp AS Grande_Premio, 
qtd_voltas AS Quantidade_de_Voltas 
FROM corridas; 

SELECT pilotos.nome AS Piloto, 
paises.nome AS Pais 
FROM pilotos 
INNER JOIN paises 
ON pilotos.cod_pais = paises.codigo; 

SELECT nome, salario 
FROM pilotos 
WHERE salario BETWEEN 70000 AND 100000; 
 
SELECT cod_pais,
ROUND(AVG(salario), 2) AS media_salarial
FROM pilotos
GROUP BY cod_pais;

SELECT DISTINCT salario 

FROM pilotos 

ORDER BY salario ASC;
