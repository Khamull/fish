package financeiro;

import cadastro.Empresa;
import cadastro.Usuario;
import cadastro.Produto;

public class TransferenciaEstoque {
	
	public int transferenciaID;
	public Usuario usuario = new Usuario();
	public Empresa empresa = new Empresa();
	public Produto produto = new Produto();
	public int origemID; //Empresa origem, de onde sairá a quantidade do estoque
	public int destinoID; //Empresa destino, para onde irá o estoque que foi retirado da origem
	public float quantidade;
	public String voltaKG;
	public String vendaKG; 
	public String perdaKG; 
	public String totalSaida;
	public String totalVenda;
	public String totalPerda;
	
	//Salva Transferencia
	public String salvaTransferencia() {
		String salvar = "INSERT INTO transferenciaestoque ";
		salvar += "(usuarioID, empresaID, produtoID, origemID, destinoID, quantidade) ";
		salvar += "VALUES ";
		salvar += "('"+usuario.usuarioID+"','"+produto.produtoID +"','"+empresa.empresaID+"','"+origemID+"','"+destinoID+"','"+quantidade+"')";
		
		return salvar;
	}
	
	public String salvaTransferenciaFeira() {
		String salvar = "INSERT INTO transferenciaestoque ";
		salvar += "(usuarioID, empresaID, produtoID, origemID, destinoID, quantidade, tipo) ";
		salvar += "VALUES ";
		salvar += "('"+usuario.usuarioID+"','"+empresa.empresaID+"','"+produto.produtoID +"','"+origemID+"','"+destinoID+"','"+quantidade+"', 1)";
		
		return salvar;
	}
	
	public String AtualizaRetornoFeira() {
		String salvar =  "UPDATE transferenciaestoque"; 
			   salvar += " SET tipo   ='2',";
			   salvar += " voltaKG    ='"+voltaKG+"',";
		       salvar += " vendaKG    ='"+vendaKG+"',"; 
		       salvar += " perdaKG    ='"+perdaKG+"',"; 
		       salvar += " totalSaida ='"+totalSaida+"',";
		       salvar += " totalVenda ='"+totalVenda+"',";
		       salvar += " totalPerda ='"+totalPerda+"'";
		       salvar += " WHERE transferenciaID = '"+transferenciaID+"'";
		
		return salvar;
	}
	
	/*SELECT T.*, P.*, E.* FROM transferenciaestoque T
	INNER JOIN produto P on P.produtoID = T.produtoID
	INNER JOIN empresa E on E.empresaID = T.destinoID
	WHERE T.tipo = '1'
	AND T.origemID = '1'
	ORDER BY E.nomeFantasia desc, T.data asc*/

	public String pesquisaTransferencias()//verifica todas as trasnferencias pendentrtes no sistema, ou seja, com tipo 1
	{//tipo 0 é trasnferencia normal, original do sistema e tipo 2 é trasnferencia ja retornada e recebida
		String pesquisa = "SELECT T.*, P.*, E.*, E.unidade as NomeDestino, E.empresaID as clienteID FROM transferenciaestoque T ";
		pesquisa += " LEFT JOIN produto P on P.produtoID = T.produtoID ";
		pesquisa += " LEFT JOIN empresa E on E.empresaID = T.destinoID ";
		pesquisa += " LEFT JOIN empresa E_ on E_.empresaID = T.empresaID ";			
		pesquisa += " WHERE T.tipo = '1' ";
		pesquisa += " ORDER BY E.nomeFantasia asc, T.data asc";
		
		return pesquisa;
	}
	
	public String pesquisaTransferenciasRel(String transfID)//verifica todas as trasnferencias pendentrtes no sistema, ou seja, com tipo 1
	{//tipo 0 é trasnferencia normal, original do sistema e tipo 2 é trasnferencia ja retornada e recebida
		String pesquisa = "SELECT T.*, P.*, E.*, E.unidade as NomeDestino, E.empresaID as clienteID FROM transferenciaestoque T ";
		pesquisa += " LEFT JOIN produto P on P.produtoID = T.produtoID ";
		pesquisa += " LEFT JOIN empresa E on E.empresaID = T.destinoID ";
		pesquisa += " LEFT JOIN empresa E_ on E_.empresaID = T.empresaID ";			
		pesquisa += " WHERE T.transferenciaID in ("+transfID+")";
		pesquisa += " ORDER BY E.nomeFantasia asc, T.data asc";
		
		return pesquisa;
	}
	
	public String pesquisaTransferenciasNome(String keyword)//verifica todas as trasnferencias pendentrtes no sistema, ou seja, com tipo 1
	{//tipo 0 é trasnferencia normal, original do sistema e tipo 2 é trasnferencia ja retornada e recebida
		String pesquisa = "SELECT T.*, P.*, E.* FROM transferenciaestoque T ";
		pesquisa += " INNER JOIN produto P on P.produtoID = T.produtoID ";
		pesquisa += " INNER JOIN empresa E on E.empresaID = T.destinoID ";
		pesquisa += " WHERE T.tipo = '1' ";
		pesquisa += " AND E.nomeFantasia LIKE '%"+keyword+"%'";
		pesquisa += " ORDER BY E.nomeFantasia asc, T.data asc";
		
		
		return pesquisa;
	}
	
	public String pesquisaTransferenciasData(String keyword)//verifica todas as trasnferencias pendentrtes no sistema, ou seja, com tipo 1
	{//tipo 0 é trasnferencia normal, original do sistema e tipo 2 é trasnferencia ja retornada e recebida
		

		String pesquisa = "SELECT T.*, P.*, E.* FROM transferenciaestoque T ";
		pesquisa += " INNER JOIN produto P on P.produtoID = T.produtoID ";
		pesquisa += " INNER JOIN empresa E on E.empresaID = T.destinoID ";
		pesquisa += " WHERE T.tipo = '1' ";
		pesquisa += " AND DATE_FORMAT(T.data, '%Y-%m-%d') = "+"\""+keyword+"\"";
		pesquisa += " ORDER BY E.nomeFantasia asc, T.data asc";
		return pesquisa;
	}
	
	public String excluiTransferencia() {
		String delete = "DELETE FROM transferenciaestoque WHERE  transferenciaID = '"+transferenciaID+"'";
		return delete;
	}
public String mensagem(int numeroMsg){
		
		switch (numeroMsg) {
		case 1:
			return "Transferência Cadastrado com Sucesso!";
			
		case 2:
			return "Transferência Alterado com Sucesso!";
			
		case 3:
			return "Transferência Excluido com Sucesso!";
			
		case 4:
			return "Impossível Cadastrar! Já existe um produto cadastrado com esse Nome.";
		
		case 5:
			return "Impossível Alterar! Já existe um produto cadastrado com esse Nome.";

		case 6:
			return "Estoque Alterado com Sucesso!";
			
		case 7:
			return "Impossível Cadastrar! Já existe um produto cadastrado com esse Código.";
			
		case 8:
			return "Impossível Alterar! Já existe um produto cadastrado com esse Código.";
			
		default:
			return "";
		}
	}
	

}
