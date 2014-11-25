<%
Connection con = null;
Statement st = null;

//CONEXAO PARA HOSPEDAGEM
//Class.forName("org.gjt.mm.mysql.Driver");
//con = DriverManager.getConnection("jdbc:mysql://mysql.fortesystem.net.br/fortesystem04", "fortesystem04", "varzeainfo123");
//st=con.createStatement();


//CONEXAO PARA PC-ALMIR
Class.forName("org.gjt.mm.mysql.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost/peixaria","root","");
st=con.createStatement();

%>