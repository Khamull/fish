<%@page import="java.sql.*" %>
<%@include file="inc/conexao.jsp" %>

<jsp:useBean id="empresa" class="cadastro.Empresa" scope="page"></jsp:useBean>

<jsp:useBean id="produtoEstoque" class="cadastro.ProdutoEstoque" scope="page"></jsp:useBean>

<jsp:useBean id="produto" class="cadastro.Produto" scope="page"></jsp:useBean>

<jsp:useBean id="transferencia" class="financeiro.TransferenciaEstoque" scope="page"></jsp:useBean>

<jsp:useBean id="venda" class="pdv.Venda" scope="page"></jsp:useBean>

<jsp:useBean id="vendaItem" class="pdv.VendaItem" scope="page"></jsp:useBean>


<%
String ok = "";
String transfID = "";
Statement st01 = con.createStatement();
Statement st02 = con.createStatement();
Statement st03 = con.createStatement();
Statement st04 = con.createStatement();
Statement st05 = con.createStatement();
Statement st06 = con.createStatement();

ResultSet rs02 = null;
ResultSet rs03 = null;
ResultSet rs04 = null;


venda.usuario.login = (String)session.getAttribute("usuario");//Prepara ambiente para nova venda passando usuário atual
venda.empresa.empresaID = Integer.parseInt((String)session.getAttribute("empresaID"));//Prepara ambiente para nova venda passando a Empresa atual
produtoEstoque.empresa.empresaID = Integer.parseInt((String)session.getAttribute("empresaID"));//Prepara Ambiente para alteração do estoque da empresa em questão
 


String produtoID[]		= request.getParameterValues("produtoID[]");
String preco[]		= request.getParameterValues("preco[]");
String chk[] 			= request.getParameterValues("chk[]");//Retorna os selecionados
String select[] 		= request.getParameterValues("transferenciaID[]");//retorna todos os ID's, sem distinção
String volta[] 			= request.getParameterValues("volta[]");//retorna todos os ID's, sem distinção
String totalVendido[] 	= request.getParameterValues("totalVendido[]");
String perda[] 			= request.getParameterValues("perda[]");
String totalSaida[] 	= request.getParameterValues("totalSaida[]");
String totalVenda[] 	= request.getParameterValues("totalVenda[]");
String totPerda[]		= request.getParameterValues("totPerda[]");
String feirante[]		= request.getParameterValues("clienteID[]");

venda.feiranteID = Integer.parseInt(feirante[0]);
st03.execute(venda.cadastraVendaRetorno());//Cadastra nova venda no PDV
rs03 = st.executeQuery(venda.vendaAberta());//retorna o novo ID
int vendaID = 0;
if(rs03.next())
{
	vendaID = Integer.parseInt(rs03.getString("vendaID"));
}

for(int j = 0; j< select.length; j++)
{
	for(int i = 0; i < chk.length; i++)
	{
		if(select[j].equals(chk[i]))
		{
			//out.print("<br> "+select[j]+" / "+volta[j]+" / "+totalVendido[j]+" / "+perda[j]+" / "+totalSaida[j]+" / "+totalVenda[j]+" / "+totPerda[j] );
			transfID += select[j]+",";
			transferencia.transferenciaID = Integer.parseInt(select[j]);
			transferencia.voltaKG = volta[j];
			transferencia.vendaKG = totalVendido[j];
			transferencia.perdaKG = perda[j];
			transferencia.totalSaida = totalSaida[j].substring(3, totalSaida[j].length()).replace(",", ".");
			transferencia.totalVenda = totalVenda[j].substring(3, totalVenda[j].length()).replace(",", ".");
			transferencia.totalPerda = totPerda[j].substring(3, totPerda[j].length()).replace(",", ".");
			
			st01.executeUpdate(transferencia.AtualizaRetornoFeira());//insere e altera o status da transferencia
			//produto.produtoID = Integer.parseInt(produtoID[j]);
			produtoEstoque.produto.produtoID = Integer.parseInt(produtoID[j]); 				
			
			rs02 = st02.executeQuery(produtoEstoque.pesquisaEstoque());
			//rs02 = st02.executeQuery(produto.produtoPorID());
			float estoque;
			if(rs02.next())//Retorna Volta para o Estoque
			{
				
				//produto.produtoID = rs02.getInt("produtoID");
				produtoEstoque.quantidade = rs02.getFloat("quantidade");
				produtoEstoque.quantidade = Float.parseFloat(volta[j]) + produtoEstoque.quantidade;
				st05.executeUpdate(produtoEstoque.alteraEstoque());//executar
				
			}
	
			//Cadastra prodotudos da venda
			if(vendaID != 0){
				if(!totalVendido[j].equals("0")){
					ok="1";
					vendaItem.venda.vendaID = vendaID;
					vendaItem.produto.produtoID = rs02.getInt("produtoID");
					
					if(Float.parseFloat(totalVendido[j]) > Float.parseFloat(perda[j]))//Verifica total real vendido
					{
						 estoque = Float.parseFloat(totalVendido[j]) - Float.parseFloat(perda[j]);
					}
					else
					{
						 estoque =  Float.parseFloat(perda[j]) -Float.parseFloat(totalVendido[j]);
					}
					vendaItem.quantidade = estoque;
					vendaItem.produto.preco = Double.parseDouble(preco[j]);
					vendaItem.total = Float.parseFloat(totalVenda[j].substring(3, totalVenda[j].length()).replace(",", "."));
					st04.execute(vendaItem.salvaItem());
				}
			}
		}
	}
}

if(ok.equals("1")){
	response.sendRedirect("sis_pdv_feira.jsp?vendaID="+vendaID+"&transfID="+transfID.substring(0, transfID.length() - 1));
}
else
{
	st06.execute("delete from venda where vendaID='"+vendaID+"'");
	response.sendRedirect("sis_retorno_feira.jsp?msg=6");
}


%>