package cadastro;

public class ProdutoEntradaEstoque {
	
	public int produtoEstoqueID;
	public Produto produto = new Produto();
	public Empresa empresa = new Empresa();
	public float quantidade;
	
	
	//Pesquisa se já tem estoque cadastrado para esse produto
	public String pesquisaEstoque() {
		return "SELECT * FROM produtoestoque WHERE produtoID = '"+produto.produtoID+"' AND empresaID = '"+empresa.empresaID+"'";
	}
	
	
	//Pesquisa entrada de estoque recente.
	public String pesquisaEntrada() {
		String pesquisa = "Select f.*, e.*, p.* FROM estoque e ";
		pesquisa += "INNER JOIN produto p ON e.produtoID = p.produtoID INNER JOIN fornecedor f";
		pesquisa += " ON f.fornecedorID = e.fornecedorID";
		pesquisa += " WHERE e.statusEstoque = 0;";
		
		return pesquisa;
	}
	public String salvaQuantidade() {
		String salvaQtdd = "INSERT INTO produtoestoque ";
		salvaQtdd += "(produtoID, empresaID, quantidade) ";
		salvaQtdd += "VALUES ";
		salvaQtdd += "('"+produto.produtoID+"', '"+empresa.empresaID+"', '"+quantidade+"')";
		
		return salvaQtdd;
	}
	
	
	//Altera quantidade no Estoque
	public String alteraEstoque() {
		String alteraQtdd = "UPDATE produtoestoque SET ";
		alteraQtdd += "quantidade = '"+quantidade+"' ";
		alteraQtdd += "WHERE produtoID = '"+produto.produtoID+"' AND empresaID = '"+empresa.empresaID+"'";
		
		return alteraQtdd;
	}

}
