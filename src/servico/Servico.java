package servico;

import pdv.FormaPagamento;
import cadastro.Cliente;
import cadastro.Empresa;
import cadastro.Usuario;

public class Servico {
	
	public int servicoID;
	public Cliente cliente = new Cliente();
	public Empresa empresa = new Empresa();
	public String descricao;
	public FormaPagamento formaPagamento = new FormaPagamento();
	public float entrada;
	public float troco;
	public int vezes;
	public float desconto;
	public String dataInicio;
	public String dataFim;
	public float valor;
	public Usuario usuario = new Usuario();
	
	
	//Pesquisa informa��es sobre um determinado Servi�o por ID
	public String pesquisaServico() {
		String pesquisaEmp = "SELECT cliente.*, servico.* ";
		pesquisaEmp += "FROM servico INNER JOIN cliente ON cliente.clienteID = servico.clienteID ";
		pesquisaEmp += "WHERE servico.servicoID = '"+servicoID+"'";
		
		return pesquisaEmp;
	}
	
	//Pesquisa informa��es sobre um determinado Servi�o por ID e por Empresa
	public String pesquisaServicoEmpresa() {
		String pesquisaEmp = "SELECT cliente.clienteID, cliente.clienteNomeFantasia, servico.* ";
		pesquisaEmp += "FROM servico INNER JOIN cliente ON cliente.clienteID = servico.clienteID ";
		pesquisaEmp += "WHERE servico.servicoID = '"+servicoID+"' AND servico.empresaID = '"+empresa.empresaID+"'";
		
		return pesquisaEmp;
	}
	
	//Pesquisa todos os Servi�os
	public String listaServicos() {
		return "SELECT * FROM servico ORDER BY servicoID DESC";
	}
	
	//Pesquisa todos os Servi�os N�o-Finalizados Por Empresa
	public String listaServicosPendentes() {
		String listaServ = "SELECT cliente.clienteID, cliente.clienteNomeFantasia, servico.* ";
		listaServ += "FROM servico INNER JOIN cliente ON cliente.clienteID = servico.clienteID ";
		listaServ += "WHERE servico.status = 'M' AND servico.empresaID = '"+empresa.empresaID+"' ORDER BY servico.servicoID DESC";
		
		return listaServ;
	}
	
	
	//Pesquisa Servi�os por cliente
	public String pesquisaPorCliente(String keyword) {
		String listaServ = "SELECT cliente.clienteID, cliente.clienteNomeFantasia, servico.* ";
		listaServ += "FROM servico INNER JOIN cliente ON cliente.clienteID = servico.clienteID ";
		listaServ += "WHERE servico.status = 'M' AND servico.empresaID = '"+empresa.empresaID+"' ";
		listaServ += "AND cliente.clienteNomeFantasia LIKE '%"+keyword+"%' ORDER BY servico.servicoID DESC";
		
		return listaServ;
	}
	
	//Pesuisa todos os Servi�os Finalizados
	public String servicosFechados(String dataInicial, String dataFinal) {
			String busca = "SELECT formapagamento.formID, formapagamento.descricao, ";
			busca += "cliente.clienteID, cliente.clienteNomeFantasia, ";
			busca += "servico.* FROM servico ";
			busca += "INNER JOIN formapagamento ON formapagamento.formID = servico.formPagID ";
			busca += "LEFT JOIN cliente ON cliente.clienteID = servico.clienteID ";
			busca += "WHERE servico.dataFim BETWEEN '"+dataInicial+"' AND '"+dataFinal+" 23:59:59"+"' ";
			busca += "AND servico.status = 'F' AND servico.empresaID = '"+empresa.empresaID+"' ";
			busca += "ORDER BY dataFim DESC";
			
			return busca;
	}
	
	
	//Pesquisa a soma dos Servi�os finalizados em um determinado periodo com um determinado usu�rio
	public String somaServicos(int servicoInicio, int servicoFim) {
		String servicos = "SELECT SUM(valor) as totalServicos ";
		servicos += "FROM servico ";
		servicos += "WHERE servicoID BETWEEN '"+servicoInicio+"' AND '"+servicoFim+"' ";
		servicos += "AND usuario = '"+usuario.usuarioID+"' AND status = 'F'";
		
		return servicos;
	}
	
	//Pesquisa a soma dos Servi�os finalizados em um determinado periodo com um determinado usu�rio
	public String somaServicosPorData(String dataFinal) {
		String servicos = "SELECT SUM(valor) as totalServicos ";
		servicos += "FROM servico ";
		servicos += "WHERE dataFim LIKE '%"+dataFinal+"%' ";
		servicos += "AND usuario = '"+usuario.usuarioID+"' AND status = 'F'";
		
		return servicos;
	}
	
	//Pesquisa a soma dos Servi�os de acrdo com a forma de pagamento tamb�m
	public String somaServicoFormaPgto(int servicoInicio, int servicoFim) {
		String vendas = "SELECT formapagamento.formID, formapagamento.descricao, ";
		vendas += "SUM(servico.valor) as totalServicos, servico.formPagID ";
		vendas += "FROM servico ";
		vendas += "INNER JOIN formapagamento ON formapagamento.formID = servico.formPagID ";
		vendas += "WHERE servico.servicoID BETWEEN '"+servicoInicio+"' AND '"+servicoFim+"' ";
		vendas += "AND servico.usuario = '"+usuario.usuarioID+"' AND servico.status = 'F' ";
		vendas += "GROUP BY servico.formPagID";
		
		return vendas;
	}
	
	//Pesquisa a soma dos Servi�os de acrdo com a forma de pagamento tamb�m
	public String somaServicoFormaPgtoPorData(String dataFinal) {
		String vendas = "SELECT formapagamento.formID, formapagamento.descricao, ";
		vendas += "SUM(servico.valor) as totalServicos, servico.formPagID ";
		vendas += "FROM servico ";
		vendas += "INNER JOIN formapagamento ON formapagamento.formID = servico.formPagID ";
		vendas += "WHERE servico.dataFim LIKE '%"+dataFinal+"%' ";
		vendas += "AND servico.usuario = '"+usuario.usuarioID+"' AND servico.status = 'F' ";
		vendas += "GROUP BY servico.formPagID";
		
		return vendas;
	}
	
	
	//Pesquisa qual foi o Ultimo Servi�o Realizado
	public String ultimaServicoPorUsuario(){
		return "SELECT * FROM servico WHERE usuario = '"+usuario.usuarioID+"' AND status = 'F' ORDER BY servicoID DESC LIMIT 1";
	}
	
	//Pesquisa dados do ultimo Servico Cadastrado no Sistema
	public String ultimoServico() {
		return "SELECT * FROM servico ORDER BY servicoID DESC LIMIT 1";
	}
	
	
	//Cadastra um novo Servi�o
	public String cadastraServico() {
		String salvaServ = "INSERT INTO servico ";
		salvaServ += "(clienteID, empresaID, descricao, dataInicio, valor, usuario) ";
		salvaServ += "VALUES ";
		salvaServ += "('"+cliente.clienteID+"', '"+empresa.empresaID+"', '"+descricao+"', '"+dataInicio+"', '"+valor+"', '"+usuario.usuarioID+"')";
		
		return salvaServ;
	}
	
	
	//Completa as informa��es do Servi�o
	public String completaServico() {
		String completa = "UPDATE servico ";
		completa += "SET formPagID = '"+formaPagamento.formPagID+"', vezes = '"+vezes+"', ";
		completa += "valor = '"+valor+"', entrada = '"+entrada+"', troco = '"+troco+"', desconto = '"+desconto+"', status = 'F' ";
		completa += "WHERE servicoID = '"+servicoID+"'";
		
		return completa;
	}
	
	//Atualiza Servi�o
	public String atualizaServico() {
		String alterServ = "UPDATE servico ";
		alterServ += "SET descricao = '"+descricao+"' ";
		alterServ += "WHERE servicoID = '"+servicoID+"'";
		
		return alterServ;
	}
	
	
	//Atualiza o valor do Servico
	public String atualizaValorServico() {
		String alterServ = "UPDATE servico ";
		alterServ += "SET valor = '"+valor+"' ";
		alterServ += "WHERE servicoID = '"+servicoID+"'";
		
		return alterServ;
	}
	
	//======== SUBSTITUIDO PELO M�TODO >> completaServico() << =========
	//Finaliza Servi�o
	//public String finalizaServico() {
	//	String fimServ = "UPDATE servico ";
	//	fimServ += "SET status = 'F' WHERE servicoID = '"+servicoID+"'";
	//	
	//	return fimServ;
	//}
	
	
	//Muda o status (Visualizado) para S(SIM)
	public String visualizado() {
		return "UPDATE servico SET visualizacao = 'S' WHERE servicoID = '"+servicoID+"'";
	}
	
	
	//Muda o status (Visualizado) para N(N�O)
	public String naoVisualizado() {
		return "UPDATE servico SET visualizacao = 'N' WHERE servicoID = '"+servicoID+"'";
	}
	
	
	//Exclui Servi�o
	public String excluiServico() {
		return "DELETE FROM servico WHERE servicoID = '"+servicoID+"'";
	}
	
	
	
	
	//Metodo de tratamento de Mensagens
	public String mensagem(int numeroMsg){
		
		switch (numeroMsg) {
		case 1:
			return "Servi�o Cadastrado com Sucesso!";
			
		case 2:
			return "Servi�o Atualizado com Sucesso!";
			
		case 3:
			return "Servi�o Excluido com Sucesso!";
			
		case 4:
			return "Confirmado a Visualiza��o";
		
		case 5:
			return "";

		default:
			return "";
		}
	}

}
