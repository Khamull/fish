<%@ page import="java.sql.*" %>
<%@ include file="../inc/conexao.jsp" %>

<jsp:useBean id="empresa" class="cadastro.Empresa" scope="page"></jsp:useBean>

<jsp:useBean id="usuario" class="cadastro.Usuario" scope="page"></jsp:useBean>

<jsp:useBean id="datas" class="formatar.Datas" scope="page"></jsp:useBean>

<jsp:useBean id="produto" class="cadastro.Produto" scope="page"></jsp:useBean>

<jsp:useBean id="produtoEstoque" class="cadastro.ProdutoEstoque" scope="page"></jsp:useBean>

<jsp:useBean id="transf" class="financeiro.TransferenciaEstoque" scope="page"></jsp:useBean>

<jsp:useBean id="caixa" class="caixaloja.Caixa" scope="page"></jsp:useBean>

<%
//Variavel que recebe o nivel do Usuário
String nivelUsuario = String.valueOf(session.getAttribute("nivel"));
String transfID = request.getParameter("transfID");
//Se o nivel for restrito enviar para a página de erro
//if(nivelUsuario.equals("3") || nivelUsuario.equals("4") || nivelUsuario.equals("5") || nivelUsuario.equals("6")){
//	response.sendRedirect("forbiden.jsp");
//}
%>

<%
//Instancia um Objeto do tipo Statement para ajudar na Query
Statement st01 = con.createStatement();
Statement st02 = con.createStatement();
Statement st03 = con.createStatement();
%>

<%
//Instancia um Objeto do tipo ResultSet para receber o resultado de uma consulta
ResultSet rs01 = null;
ResultSet rs02 = null;
ResultSet rs03 = null;
%>

<%
//Pesquisa informações relacionadas à Empresa
empresa.empresaID = Integer.parseInt((String)session.getAttribute("empresaID"));
rs01 = st01.executeQuery(empresa.dadosGerais());
%>


<%
//Verifica se a consulta retornou algum valor e atribui às Variaveis
String nomeFantasia = "";
String endereco = "";
String bairro = "";
String cidade = "";
String telefone = "";

	if(rs01.next()){
		nomeFantasia = rs01.getString("nomeFantasia");
		endereco = rs01.getString("rua")+", "+rs01.getString("numero");
		bairro = rs01.getString("bairro");
		cidade = rs01.getString("cidade");
		telefone = rs01.getString("telefone");
	}
%>

<%
//Pesquisa todos os Usuários
rs02 = st02.executeQuery(transf.pesquisaTransferenciasRel(transfID));
rs03 = st03.executeQuery(transf.pesquisaTransferenciasRel(transfID));
%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title> RELATÓRIO - VENDA </title>

<style type="text/css">
 body, html{
	 margin:0px;
	 border:0px;
	 font-family:Arial, Helvetica, sans-serif;
	 font-size:12px;
 }
 
 .borda{
	border:1px dashed #666; 
	text-align:left;
	height:18px;
	padding:2px;
 }
</style>

</head>
<body bgcolor="#CCCCCC">

<!-- PRIMEIRA PÁGINA -->
<table align="center" cellpadding="0" cellspacing="0" width="630" height="980" style="1px solid border:#000000; background-color:#FFFFFF">
 <tr>
  <td align="center" valign="middle">
  
  <!-- Borda 1 -->
   <table width="590" height="950" cellpadding="0" cellspacing="0" style="border:1px solid none" align="center">
    <tr>
     <td align="center" valign="top" height="120">
      <!-- Esse é o espaço para que apareça o cabeçalho -->
      <table width="585" height="120" border="0" align="center" cellpadding="0" cellspacing="0">
       <tr>
        <td width="140" rowspan="5" align="left" valign="top"><a href="javascript: window.print() "><img src="images/logo_relatorio.png" border="0" title="Iprimir Relatorio"></a></td>
        <td width="300" height="15" align="center"><font size="4"><strong><%=nomeFantasia %></strong></font></td>
        <td width="140" rowspan="5" align="center">&nbsp;</td>
       </tr>
       <tr>
        <td height="15" align="center"><strong><%=endereco %></strong></td>
        </tr>
       <tr>
        <td height="15" align="center"><strong><%=bairro %></strong></td>
        </tr>
       <tr>
        <td height="15" align="center"><strong><%=cidade %></strong></td>
        </tr>
       <tr>
        <td height="15" align="center"><strong><%=telefone %></strong></td>
        </tr>
       <tr>
        <td align="center" colspan="3"><hr></td>
       </tr>
       <tr>
        <td height="15" colspan="3" align="center"><strong>RELATORIO - TRANSFERENCIAS FEIRANTE</strong></td>
       </tr>
       <tr>
        <td align="center" colspan="3"><hr></td>
       </tr>
       <tr>
    <%if(rs03.next()){ %>
    	<td align="left">Feirante :<strong><%=rs03.getString("NomeDestino") %></strong></td>
    	<td align="left">Data :<strong><%=datas.dataAtual() %></strong></td>
    <%} %>	
    </tr>
      </table>
     </td>
    </tr>
    <tr>
     <td align="center" valign="top">
     
     <!-- ##########################   INICIO DO RELATORIO ######################## -->
      <table border="1" cellpadding="0" cellspacing="0" width="585" align="center">
      <tr>
      	<td align="center"><strong>Produto</strong></td>
      	<td align="center"><strong>Ida - Kg</strong></td>
      	<td align="center"><strong>Volta - Kg</strong></td>
      	<td align="center"><strong>Kg Tot Venda</strong></td>
      	<td align="center"><strong>R$ Venda</strong></td>
      	<td align="center"><strong>R$ Ida</strong></td>
      	<td align="center"><strong>Tot Venda</strong></td>
      </tr>
      <%
      int ln = 1;
      float tot=0;
      float perdaTot=0;
      while(rs02.next()){
    	  tot = tot + rs02.getFloat("totalVenda");
    	  perdaTot = perdaTot + rs02.getFloat("totalPerda");
    	  
      %>
      	<tr>
	      	<td align="center"><%=rs02.getString("nome") %></td>
	      	<td align="center"><%=rs02.getString("quantidade") %></td>
	      	<td align="center"><%=rs02.getString("voltaKG") %></td>
	      	<td align="center"><%=rs02.getString("vendaKG") %></td>
	      	<td align="center">R$  <%=rs02.getString("preco") %></td>
	      	<td align="center">R$ <%=rs02.getString("totalSaida") %></td>
	      	<td align="center">R$ <%=rs02.getString("totalVenda") %></td>
      	</tr>
    <%} %>
	   <tr><td colspan="6"></td><td align="center">Total Venda R$ <%=tot %></td></tr>    
	   <tr><td colspan="6"></td><td align="center">Total Perda R$ <%=perdaTot %></td></tr>
       </table>
     <!-- ##########################     FIM DO RELATORIO ######################### -->
     
     </td>
    </tr>
    <tr>
 	<td>
 		<a href="../sis_retorno_feira.jsp">[Voltar]</a>
 	</td>
 </tr>
   </table>
  <!-- Fim da Borda -->
  
  </td>
 </tr>
 
</table>
<!-- Fim da Primeira Página -->


</body>
</html>