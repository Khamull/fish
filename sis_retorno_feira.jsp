<%@ page errorPage="index.jsp?erro=3" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.*" %>
<%@ page import = "java.util.Date,java.text.SimpleDateFormat,java.text.ParseException"%>
<%@ include file="inc/seguranca.jsp" %>

<%@ include file="inc/conexao.jsp" %>

<jsp:useBean id="produto" class="cadastro.Produto" scope="page"></jsp:useBean>

<jsp:useBean id="produtoEstoque" class="cadastro.ProdutoEstoque" scope="page"></jsp:useBean>

<jsp:useBean id="empresa" class="cadastro.Empresa" scope="page"></jsp:useBean>

<jsp:useBean id="transf" class="financeiro.TransferenciaEstoque" scope="page"></jsp:useBean>

<jsp:useBean id="caixa" class="caixaloja.Caixa" scope="page"></jsp:useBean>

<%
//Instancia um objeto do tipo Statement para ajudar na query
Statement st01 = con.createStatement();
Statement st02 = con.createStatement();
Statement st03 = con.createStatement();
%>

<%
//Instancia um objeto do tipo ResultSet para receber resultado de uma Consulta
ResultSet rs = null;
ResultSet rs01 = null;
ResultSet rs02 = null;
ResultSet rs03 = null;
%>

<%
//Recupera o Nivel do Usuário
String nivel = String.valueOf(session.getAttribute("nivel"));
%>

<%
//ANTES DE CRIAR UMA NOVA VENDA OU ABRIR UMA JÁ EXISTENTE
//VERIFICA SE FOI FEITA A ABERTURA DO CAIXA COM O LOGIN DO
//USUARIO QUE ESTÁ LOGADO NO MOMENTO

//Atribui o nome do usuario ao objeto caixa para realizar
//a consulta posteriormente
caixa.usuario.login = (String)session.getAttribute("usuario");

//Faz a consulta na Base de Dados
rs03 = st03.executeQuery(caixa.verificaCaixaRetornoFeira());
if(!rs03.next())
{
	response.sendRedirect("sis_menu.jsp?msg=1");
}








//Trata Ações
//variaveis que serão utilizadas para verificação
String acao = "";
int numeroAcao;
//verifica se passado alguma acao via URL
if(request.getParameter("acao") != null){
	produto.produtoID = Integer.parseInt(request.getParameter("produtoID"));
	numeroAcao = Integer.parseInt(request.getParameter("acao"));
	st.execute(produto.statusProduto(numeroAcao));
	response.sendRedirect("sis_view_produtos.jsp");
}
%>

<%
//Pesquisa Todos os Fornecedores ou busca por nome
if(request.getParameter("nome") != null){//alterar para pesquisar da mesma forma em transferencias
	rs = st.executeQuery(transf.pesquisaTransferenciasNome(request.getParameter("nome")));
}else if(request.getParameter("data") != null){
	rs = st.executeQuery(transf.pesquisaTransferenciasData(request.getParameter("data")));
}else{
	rs = st.executeQuery(transf.pesquisaTransferencias());
}

%>

<%
//Atribui o objeto salvo na sessao ao objeto empresa
empresa.empresaID = Integer.parseInt((String)session.getAttribute("empresaID"));
//Pesquisa a Unidade que está logada de acordo com a variavel que foi salva na sessao
rs02 = st02.executeQuery(empresa.dadosGerais());
%>

<%
//Trata mensagens
//variaveis que serão utilizadas para verificação
String msg = "";
int numeroMsg;
//verifica se foi passado alguma mensagem via URL
if(request.getParameter("msg") != null){
	numeroMsg = Integer.parseInt(request.getParameter("msg"));
	msg = transf.mensagem(numeroMsg);
}

int count = 0;
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Currency"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>FORTE SYSTEM</title>

<script type="text/javascript">
 function excluir(produtoID){
	if(confirm("Tem certeza que deseja Excluir esse produto?")){
		window.location.href="sis_delete_manager_produto.jsp?produtoID="+produtoID;
	}
 }
 var selecionados = false;
 function SelecionarTodos()
 {
	 if(selecionados == false)
	 {
		 for (i=0;i<document.form1.elements.length;i++) 
		      if(document.form1.elements[i].type == "checkbox")	
		         document.form1.elements[i].checked=1
		 selecionados = true;
	 }
	 else
	{
		 for (i=0;i<document.form1.elements.length;i++) 
		      if(document.form1.elements[i].type == "checkbox")	
		         document.form1.elements[i].checked=0
		selecionados=false;        
	}
 }
 
 function diferenca(contador, qtd, obj)
 {
	  var vendaKG = qtd - obj.value;
	  document.getElementById("totalVendido"+contador).value = vendaKG; 
 }
 
 function volta(count, qtd, valor)
 {
	 var tot = document.getElementById("totalVendido"+count).value * valor;
	 document.getElementById("totalVenda"+count).value ="R$ "+(tot).toFixed(2);
	 
	 //document.getElementById("diferenca"+count).value ="R$ "+ ((valor*qtd) - tot).toFixed(2);
 }
 
 function excluir(trasnID){
		if(confirm("Tem certeza que deseja excluir essa trasnferência?")){
			
			 $.post('sis_delete_manager_trasnferencia.jsp', {transID: transID});
			 return false;
		}
		return false;
	 }
 function recalcula(valor, count, obj)
 {
	 var totSaida = document.getElementById("totalSaida"+count).value;
	 totSaida = totSaida.substring(3, totSaida.lenght).replace(",", ".");//Valor Total esperado da venda
	 
	 //var diferenca = document.getElementById("diferenca"+count).value;
	 //diferenca = diferenca.substring(3, diferenca.lenght).replace(",", ".");//Total Perda da Venda
	 
	 var totVend = document.getElementById("totalVenda"+count).value
	 totVend = totVend.substring(3, totVend.lenght).replace(",", "."); 
	 
	 var perda = obj.value;
	 var valorPerda = perda * valor;
	 
	 var totPerda = obj.value * valor;
	 
	if(totVend > totPerda){
		 totVend = totVend - totPerda;
	 }
	 else
	 {
		 totVend = totPerda - totVend;
	 }
	 
	 
	 
	 document.getElementById("diferenca"+count).value = "R$ " + valorPerda.toFixed(2);
	 document.getElementById("totalVenda"+count).value = "R$ " + totVend.toFixed(2);
	 //document.getElementById("diferenca"+count).value = 
 }
 function checado(count, obj)
 {
	 if(obj.checked == true)
		 {
		 	document.getElementById("volta"+count).required = true;
		 }
	 else
		 {
		 document.getElementById("volta"+count).required = false;
		 }
 }
 
 function valida() {
	 var checkedAtLeastOne = false;
	 $('input[type="checkbox"]').each(function() {
	     if ($(this).is(":checked")) {
	         checkedAtLeastOne = true;
	     }
	 });
	 if(checkedAtLeastOne)
		 {
		 	return true;
		 }
	 else
		 {
		 	alert("Selecione pele menos uma trasnferencia!");
		 	return false;
		 }
}

 
</script>

<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/interface.js"></script>
 <script type="text/javascript" src="js/jquery-1.4.3.min.js"></script>

<!--[if lt IE 7]>
 <style type="text/css">
 .dock img { behavior: url(iepngfix.htc) }
 </style>
<![endif]-->

<link type="text/css" href="css/paging.css" rel="stylesheet" />	
<script type="text/javascript" src="js/paging.js"></script>

<link href="css/menu.css" rel="stylesheet" type="text/css" />
<link href="css/geral.css" rel="stylesheet" type="text/css" />
</head>
<body>

<div id="container">

<div id="topo">
 <jsp:include page="inc/menu_superior.jsp"/>
</div>
<div id="corpo">

<table width="985" align="center" height="440">
<tr>
 <td height="25" bgcolor="#EEEEEE">
 <input type="button" class="botao" onclick="javascript: window.location.href='sis_transferencia_feira.jsp'" value="+ Nova Transferencia" />&nbsp;
 </td>
</tr>
<tr>
 <td valign="top">
 <br />
 
  <table width="940" align="center" cellpadding="0" cellspacing="0">
  <%if(rs02.next()){ %>
   <tr>
    <td colspan="11" align="center"><strong>LISTA DE TRANFERENCIAS: ( <%=rs02.getString("unidade") %> )</strong></td>
   </tr>
  <%} %>
   <tr>
     <td colspan="11" height="15" align="center"></font></td>
   </tr>
   <%if(request.getParameter("msg")!=null && request.getParameter("msg")!=""){%>
   <tr>
     <td colspan="11" height="15" align="center"><font color="#ff0000"><%=msg %></font></td>
   </tr>
   <%}%>
   <tr>
    <td colspan="11" height="40" align="left" valign="middle">
    
    <table width="730" align="left">
    <tr>
    <td width="356">
    
    <!-- Busca por Código -->
    <!-- form name="formBuscaCodigo" method="post">
     <table width="335" style="border:1px solid #333; height:30px" align="left" cellpadding="0" cellspacing="0">
      <tr>
       <td width="259" align="right">
       <input type="text" name="codigo" maxlength="100" size="50" style="background-image:url(images/buscacodigo.png); height:18px; border:none"  onclick="this.style.backgroundImage = 'none'" onblur="if(this.value == '')this.style.backgroundImage = 'url(images/buscacodigo.png)'"/>
       </td>
       <td width="74" align="left"><input type="submit" class="botao" style="height:22px" name="BUSCARCODIGO" value="Buscar" /></td>
      </tr>
     </table>
    </form>
    Fim da Busca por Código
    </td-->
    
    <!-- Busca por Marca -->  
    <form name="formBusca" method="post">
     <table width="335" style="border:1px solid #333; height:30px" align="left" cellpadding="0" cellspacing="0">
      <tr>
       <td width="259" align="right">
       <input type="text" name="nome" maxlength="100" size="50" placeholder="Pesquisa Por Feirante" style="height:18px; border:none"  onclick=""/>
       </td>
       <td width="74" align="left"><input type="submit" class="botao" style="height:22px" name="BUSCAR" value="Buscar" /></td>
      </tr>
     </table>
    </form>
    <!-- Fim da Busca por Marca-->
    </td>
    <td width="382">
    <form name="formBuscaData" method="post">
     <table width="335" style="border:1px solid #333; height:30px" align="left" cellpadding="0" cellspacing="0">
      <tr>
       <td width="259" align="right">
       <input type="date" name="data" maxlength="" size="" placeholder="Pesquisa Por Data" style="height:18px; border:none"  onclick=""/>
       </td>
       <td width="74" align="right"><input type="submit" class="botao" style="height:22px" name="BUSCAR" value="Buscar" /></td>
      </tr>
     </table>
    </form>
    </td>
    </tr>
    </table>
    
    </td>
   </tr>
   <tr>
   	<td>
   	<form name="form1" action="sis_manager_retorno_estoque.jsp" method="post" onsubmit="return valida(this);" id="form1">
   	<table width="940" align="center" cellpadding="0" cellspacing="0" border="0">
    <tr bgcolor="#EEEEEE">
    	<td><input type="checkbox" title="Selecionar Todos" onclick="SelecionarTodos()"/></td>
    	<td  align="left"><strong>Feirante</strong></td>
		<td  align="left"><strong>Produto</strong></td>
		<td  align="left"><strong>Saida (KG)</strong></td>
		<td  align="left"><strong>Volta (KG)</strong></td>
		<td  align="left"><strong>Venda (KG)</strong></td>
		<td  align="center"><strong>Perda(KG)</strong></td>
		<td  align="center"><strong>Preço(p/KG)</strong></td>
		<td  align="center"><strong>Total Saida</strong></td>
		<td  align="center"><strong>Total Venda</strong></td>
		<td  align="center"><strong>Total Perda</strong></td>

		<%if(nivel.equals("1") || nivel.equals("2") || nivel.equals("6")){ %>
		<td  align="center"><strong>Ex</strong></td>
		<%} %>
   </tr>
<%
//Enquanto a Consulta retonar um resultada, Liste os Usuários do Sistema

while (rs.next()){

String valor = null;

Currency currency = Currency.getInstance("BRL");

DecimalFormat formato = new DecimalFormat("R$ ###0.00");

valor = formato.format(rs.getDouble("preco"));
%>


<%
//Pesquisa o Estoque relacionado ao produto de acordo com a unidade em que o usuário
//está logado no Sistema
produtoEstoque.produto.produtoID = rs.getInt("produtoID");
produtoEstoque.empresa.empresaID = Integer.parseInt((String)session.getAttribute("empresaID"));

//rs01 = st01.executeQuery(produtoEstoque.pesquisaEstoque());
count++;
%>
   
   <tr>
   		<td><input type="checkbox" name="chk[]" value="<%=rs.getString("transferenciaID")%>" onchange="checado(<%=count %>, this)" /><input type="hidden" name="transferenciaID[]" value="<%=rs.getString("transferenciaID")%>"/><input type="hidden" name="produtoID[]" value="<%=rs.getString("produtoID")%>"/><input type="hidden" name="clienteID[]" value="<%=rs.getString("clienteID")%>"/></td>
   		<td align="center"><%=rs.getString("NomeDestino")%></td>
    	<td align="left"><%=rs.getString("nome")%></td>
		<td align="left"><%=rs.getString("quantidade")%></td>
		<td  align="left"><input type="number" step="0.01" min="0" value="" style="width:75px; text-align: right" name="volta[]" id="volta<%=count %>" onchange="diferenca(<%=count%>, <%=rs.getString("quantidade")%>, this); volta(<%=count%>, <%=rs.getString("quantidade")%>, <%=rs.getDouble("preco")%>)"/></td>
		<td  align="left"><input type="number" step="0.01" min="0" value="0" style="width:75px; text-align: right" name="totalVendido[]" id="totalVendido<%=count%>" readonly="readonly"/></td>
		<td  align="center"><input type="number" step="0.01" min="0" name="perda[]" value="0" id="perda<%=count %>" style="width:75px; text-align: right"  onchange="recalcula(<%=rs.getDouble("preco")%>, <%=count%>, this)"></input></td>
		<td  align="center"><%=formato.format(rs.getDouble("preco"))%><input type="hidden" value="<%=rs.getString("preco")%>" name="preco[]"/></td>
		<td  align="center"><input type="text" name="totalSaida[]" id="totalSaida<%=count %>" value="<%=formato.format(rs.getDouble("preco")*rs.getDouble("quantidade"))%>" style="width:75px; text-align: right" readonly="readonly"></input></td>
		<td  align="center"><input type="text" name="totalVenda[]" id="totalVenda<%=count %>" value="R$ 0.00" style="width:75px; text-align: right" readonly="readonly"></input></td>
		<td  align="center"><input type="text" name="totPerda[]"  id="diferenca<%=count %>" value="R$ 0.00" style="width:75px; text-align: right" readonly="readonly"></input></td>
		<%if(nivel.equals("1") || nivel.equals("2") || nivel.equals("6")){ %>
		<td><a href="sis_delete_manager_transferencia.jsp?transID=<%=rs.getString("transferenciaID") %>"><img src="ico/ico_cancelar.png" width="20" height="20" border="0" title="Excluir Transferência"/></a></td>
		<%} %>
   </tr>
	 
   <tr>
    <td colspan="11" align="center" style="height:1px"><hr style="border:1px solid #333333" /></td>
   </tr>
<%
}
%>
	<tr>
		<td colspan="11" align="center"><input type="submit" class="botao" style="height:22px" name="pagar" value="Efetuar Venda" /></td>
	</tr>
   </table>
   </form>
   </td>
   </tr>
	
	<tr>
	 <td colspan="11" align="center"></td>
	</tr>
    <tr>
     <td colspan="11" align="center">
      <!-- div onde será criados os links da paginaçao -->
	  <!-- div id="pageNav"></div-->
     </td>
    </tr>

  </table>
 
 </td>
</tr>
</table>

</div>


<div id="rodape"><jsp:include page="inc/rodape.jsp" /></div>

</div>


<script type="text/javascript">
	
	$(document).ready(
		function()
		{
			$('#dock').Fisheye(
				{
					maxWidth: 50,
					items: 'a',
					itemsText: 'span',
					container: '.dock-container',
					itemWidth: 40,
					proximity: 50,
					halign : 'center'
				}
			)
		}
	);

</script>

	<script>
        var pager = new Pager('tb1', 24); 
        pager.init(); 
        pager.showPageNav('pager', 'pageNav'); 
        pager.showPage(1);
    </script>

</body>
</html>

<%
 //fecha a consulta
 st.close();
 rs.close();
%>