INSERT INTO TipoConta (nomeTipoConta) VALUES 
('Conta Corrente'),
('Conta Poupança'),
('Conta Salário'),
('Conta Conjunta'),
('Conta Universitária');

INSERT INTO Conta (limite, nomeConta, saldo, tipoContaIdTipoConta) VALUES 
(1000.00, 'João Silva', 500.00, 1),
(2000.00, 'Maria Souza', 1500.00, 2),
(500.00, 'Carlos Oliveira', 300.00, 3),
(10000.00, 'Empresa ABC', 7500.00, 4),
(1500.00, 'Ana Costa', 1200.00, 5);

INSERT INTO TipoLancamento (nomeTipo) VALUES 
('Depósito'),
('Saque'),
('Pagamento'),
('Transferência'),
('Investimento');

INSERT INTO Transferencia (dataTransferencia, contaIdContaDestino, contaIdContaOrigem, valor) VALUES 
('2024-12-01', 2, 1, 100.00),
('2024-12-02', 3, 2, 50.00),
('2024-12-03', 1, 4, 200.00),
('2024-12-04', 5, 3, 75.00),
('2024-12-05', 4, 5, 150.00);


INSERT INTO Lancamento (dataLancamento, descricao, status, valor, contaIdConta, tipoLancamentoIdTipo) VALUES 
('2024-12-01', 'Depósito inicial', 'Concluído', 1000.00, 1, 1),
('2024-12-01', 'Saque no caixa eletrônico', 'Concluído', 100.00, 1, 2),
('2024-12-02', 'Pagamento de fatura', 'Pendente', 200.00, 2, 3),
('2024-12-03', 'Transferência para conta conjunta', 'Concluído', 300.00, 3, 4),
('2024-12-03', 'Aplicação em CDB', 'Concluído', 500.00, 4, 5);
