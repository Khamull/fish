<%@ page import="java.sql.*" %>
<%@ include file="../inc/conexao.jsp" %>

<jsp:useBean id="mensagens" class="acesso.Mensagens" scope="page"></jsp:useBean>

<jsp:useBean id="empresa" class="cadastro.Empresa" scope="page"></jsp:useBean>

<%
//Instancia um objeto do tipo Statement para ajudar na query
Statement st01 = con.createStatement();
%>

<%
//Instancia um objeto do tipo ResultSet para receber o resultado de uma consulta
ResultSet rs01 = null;
%>

<%
//Atribui o objeto salvo na sessao ao objeto empresa
empresa.empresaID = Integer.parseInt((String)session.getAttribute("empresaID"));
//Pesquisa a Unidade que está logada de acordo com a variavel que foi salva na sessao
rs01 = st01.executeQuery(empresa.dadosGerais());
%>


<%
//Trata mensagens
//variaveis que serão utilizadas para verificação
String msg = "";
int numeroMsg;
//verifica se foi passado alguma mensagem via URL
if(request.getParameter("msg") != null){
	numeroMsg = Integer.parseInt(request.getParameter("msg"));
	msg = mensagens.mensagem(numeroMsg);
}
%>

<table width="985" align="center" height="440">
<%if(rs01.next()){%>
<tr>
 <td height="15" align="center" bgcolor="#CCCCCC">MENU FEIRA - <strong><%=rs01.getString("unidade")%></strong></td>
<tr>
<%}%>
  <td align="center">
  
  <!--Menu Principal -->
  <table width="460" align="center">
   
   <tr>
    <td height="15"></td>
   </tr>
   <tr>
    
    <td width="160" align="center"><a href="sis_transferencia_feira.jsp"><img src="ico/transferencia.png" alt="" width="60" height="60" border="0" title="Contas a Pagar" /></a></td>
    <td width="160" align="center"></td>
    <td width="160" align="center"><a href="sis_retorno_feira.jsp"><img src="ico/return.png" alt="" width="60" height="60" border="0" title="Livro Caixa" /></a></td>
	</tr>
   <tr>
   	
    <td align="center">Transferir Feirante</td>
    <td align="center"></td>
    <td align="center">Retorno Feira</td>
    </tr>
   
    <tr>
    <td width="160" align="center">&nbsp;</td>
    <td width="160" align="center">&nbsp;</td>
    <td width="160" align="center">&nbsp;</td>
    </tr>
   <tr>
    <td align="center">&nbsp;</td>
    <td align="center">&nbsp;</td>
    <td align="center">&nbsp;</td>
    </tr>
   
   <tr>
    <td align="center"></td>
    <td align="center"></td>
    <td align="center">&nbsp;</td>
    </tr>
   <tr>
     <td align="center">&nbsp;</td>
     <td align="center">&nbsp;</td>
     <td align="center">&nbsp;</td>
     </tr>
   
   
   <%if(request.getParameter("msg") != null){%>
   <tr bgcolor="#FFFFCC">
    <td height="25" colspan="3" align="center" valign="middle"><strong><font color="#FF0000"><%=msg %></font></strong></td>
   </tr>
   <%} %>
  </table>
  <!--Fim Menu Principal-->
    
  </td>
</tr>
</table>