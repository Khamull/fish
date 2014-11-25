<%@ page errorPage="index.jsp?erro=3" %>
<%@ page import="java.sql.*" %>
<%@ include file="inc/conexao.jsp" %>

<jsp:useBean id="retiradaEstoque" class="cadastro.RetiradasEstoque" scope="page"></jsp:useBean>

<jsp:useBean id="produto" class="cadastro.Produto" scope="page"></jsp:useBean>

<jsp:useBean id="produtoDestino" class="cadastro.Produto" scope="page"></jsp:useBean>

<jsp:useBean id="produtoEstoque" class="cadastro.ProdutoEstoque" scope="page"></jsp:useBean>

<%
//Instancia um objeto do tipo Statment para realizar uma query
Statement st01 = con.createStatement();
Statement st02 = con.createStatement();
Statement st03 = con.createStatement();
%>

<%
//Instancia um objeto do tipo ResultSet para receber o resultado de uma consulta
ResultSet rs01 = null;
ResultSet rs02 = null;
ResultSet rs03 = null;

%>

<%
//Recupera os valores trazidos do formulári e os atribui ao objeto retiradaEstoque

retiradaEstoque.produto.produtoID = Integer.parseInt(request.getParameter("produtoID"));
retiradaEstoque.destino = Integer.parseInt(request.getParameter("destino"));

	//Trata a quantidade
	String quantidade = request.getParameter("quantidade");
	String qtdFinal = request.getParameter("qtdFinal");
	String perda = request.getParameter("perda");
	retiradaEstoque.quantidade = Float.parseFloat(quantidade.replace(",","."));
	retiradaEstoque.qtdFim = Float.parseFloat(qtdFinal.replace(",","."));
	retiradaEstoque.perda = Float.parseFloat(perda.replace(",","."));
	

//retiradaEstoque.motivo = request.getParameter("motivo");
//retiradaEstoque.usuario.login = (String)session.getAttribute("usuario");
retiradaEstoque.responsavel = request.getParameter("responsavel");
retiradaEstoque.usuario.login = (String)session.getAttribute("usuarioID");
retiradaEstoque.empresa.empresaID = Integer.parseInt((String)session.getAttribute("empresaID"));

%>


<%
//Atribui os valores ao objeto produto
produto.produtoID = retiradaEstoque.produto.produtoID;

//Pesquisa o Estoque desse produto
rs01 = st01.executeQuery(produto.listaProdutosPorID());
if(rs01.next()){
	produto.estoque = rs01.getFloat("estoque");
}


//Subtrai do estoque atual a quantidade retirada
produto.estoque -= retiradaEstoque.quantidade;

//Atualiza estoque do Produto
st.execute(produto.alteraEstoqueProduto());
%>

<%
//Atribui os valores ao objeto produtoEstoque
produtoEstoque.produto.produtoID = produto.produtoID;
produtoEstoque.empresa.empresaID = retiradaEstoque.empresa.empresaID;

//Pesquisa o Estoque desse produto
rs02 = st02.executeQuery(produtoEstoque.pesquisaEstoque());
if(rs02.next()){
	produtoEstoque.quantidade = rs02.getFloat("quantidade");
}

//Subtrai do estoque atual a quantidade retirada
produtoEstoque.quantidade -= retiradaEstoque.quantidade;

//Atualiza estoque do Produto
st.execute(produtoEstoque.alteraEstoque());




%>


<%
//Atribui os valores ao objeto produto
produtoDestino.produtoID = retiradaEstoque.produto.produtoID;

//Pesquisa o Estoque desse produto
rs03 = st03.executeQuery(produto.listaProdutosPorID());
if(rs03.next()){
	produto.estoque = rs01.getFloat("estoque");
}


//Soma do estoque atual a quantidade retirada
produto.estoque += retiradaEstoque.qtdFim;

//Atualiza estoque do Produto
st.execute(produto.alteraEstoqueProduto());
%>

<%
//Atribui os valores ao objeto produtoEstoque
produtoEstoque.produto.produtoID = produtoDestino.produtoID;
produtoEstoque.empresa.empresaID = retiradaEstoque.empresa.empresaID;

//Pesquisa o Estoque desse produto
rs02 = st02.executeQuery(produtoEstoque.pesquisaEstoque());
if(rs02.next()){
	produtoEstoque.quantidade = rs02.getFloat("quantidade");
}

//Soma do estoque atual a quantidade retirada
produtoEstoque.quantidade += retiradaEstoque.quantidade;

//Atualiza estoque do Produto
st.execute(produtoEstoque.alteraEstoque());

%>





<%
//Cadastra a Retirada na tabela de Retiradas do Estoque (retiradasestoque)
st.execute(retiradaEstoque.cadastraRetiradaNova());
%>


<%
//Redireciona para a página onde lista os Produtos
response.sendRedirect("sis_view_produtos_separados.jsp?msg=6");
%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

</body>
</html>