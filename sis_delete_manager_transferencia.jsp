<%@ page import="java.sql.*" %>

<%@ include file="inc/conexao.jsp" %>


<jsp:useBean id="trasnf" class="financeiro.TransferenciaEstoque" scope="page"></jsp:useBean>

<%
//Recupera o ID da Conta à Receber que irá ser excluido e adiciona ao Objeto
trasnf.transferenciaID = Integer.parseInt(request.getParameter("transID"));

//chama o Metodo que irá excluir essa conta
st.execute(trasnf.excluiTransferencia());

//direciona para a página que lista as Contas à Receber
response.sendRedirect("sis_retorno_feira.jsp?msg=3");
%>

<%
 //fecha a consulta
 st.close();
%>