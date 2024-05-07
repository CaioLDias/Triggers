-- Criação da tabela "Pedidos"
CREATE TABLE Pedidos (
IDPedido INT AUTO_INCREMENT PRIMARY KEY,
DataPedido DATETIME,
NomeCliente VARCHAR(100)
);

-- Inserção de dados de exemplo
INSERT INTO Pedidos(DataPedido, NomeCliente) VALUES
(NOW(), 'Caio'),
(NOW(), 'Rafael'),
(NOW(), 'Monyque');

-- Criação da Trigger
DELIMITER $
CREATE TRIGGER RegistroDataCriacaoPedido
BEFORE INSERT ON Pedidos
FOR EACH ROW
BEGIN
	SET New.DataPedido = NOW();
END;
$
DELIMITER ;

-- Inserção de um novo registro na tabela "Pedidos" sem fornecer a data
INSERT INTO Pedidos (NomeCliente) VALUES ('Murilo');

-- Consulta para verificar os resultados
SELECT * FROM Pedidos;