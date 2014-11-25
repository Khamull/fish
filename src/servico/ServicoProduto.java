package servico;

import cadastro.Produto;

public class ServicoProduto {
	
	public int servicoProdutoID;
	public Servico servico = new Servico();
	public Produto produto = new Produto();
	public float valor;
	
	
		
	//Seleciona o produto que foi adicionado ao Servico
	public String listaProdutos() {
		String pesquisaProd = "SELECT produto.produtoID, produto.nome, servicoproduto.* ";
		pesquisaProd += "FROM servicoproduto INNER JOIN produto ON produto.produtoID = servicoproduto.produtoID ";
		pesquisaProd += "WHERE servicoproduto.servicoID = '"+servico.servicoID+"'";
		
		return pesquisaProd;
	}
	
	//Seleciona o produto que foi adicionado ao Servico
	public String listaProdutosCupom() {
		String pesquisaProd = "SELECT produto.produtoID, produto.nome, produto.codigo, produto.tipoprodutoID, produto.unidade, ";
		pesquisaProd += "tipoproduto.tipoprodutoID, tipoproduto.tipo, ";
		pesquisaProd += "servicoproduto.* ";
		pesquisaProd += "FROM servicoproduto INNER JOIN produto ON produto.produtoID = servicoproduto.produtoID ";
		pesquisaProd += "INNER JOIN tipoproduto ON tipoproduto.tipoprodutoID = produto.tipoprodutoID ";
		pesquisaProd += "WHERE servicoproduto.servicoID = '"+servico.servicoID+"'";
		
		return pesquisaProd;
	}
	
	//Pesquisa produto por ID
	public String pequisaProduto() {
		return "SELECT * FROM servicoproduto WHERE servicoprodutoID = '"+servicoProdutoID+"'";
	}
	
	//Cadastra Produto no Servico
	public String salvaProduto() {
		String salvaProd = "INSERT INTO servicoproduto (servicoID, produtoID, valor) VALUES ";
		salvaProd += "('"+servico.servicoID+"', '"+produto.produtoID+"', '"+valor+"')";
		
		return salvaProd;
	}
	
	//Exclui Produto do Serviço
	public String excluiProduto() {
		return "DELETE FROM servicoproduto WHERE servicoprodutoID = '"+servicoProdutoID+"'";
	}

}
