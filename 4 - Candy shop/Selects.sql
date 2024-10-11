SELECT sum(php.quantidade*php.precoUnitario) 
FROM Pedido p , PedidoHasProduto php 
WHERE p.idPedido =php.PedidoIdPedido AND php.PedidoIdPedido =5 

SELECT p.idPedido, f.PessoaCpfPessoa, pess.nomePessoa ,prod.nomeProduto, php.quantidade , php.precoUnitario , (php.quantidade *php.precoUnitario ) as subtotal
FROM Pedido p , PedidoHasProduto php , Funcionario f , Pessoa pess , Produto prod
WHERE p.idPedido =php.PedidoIdPedido AND p.FuncionarioPessoaCpfPessoa = f.PessoaCpfPessoa and f.PessoaCpfPessoa = pess.cpfPessoa and prod.idProduto = php.ProdutoIdProduto 
