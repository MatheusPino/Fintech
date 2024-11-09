<%@ page import="java.sql.Connection, java.sql.Statement, java.sql.ResultSet" %>
<%@ page import="factory.ConnectionFactory" %>
<html>
<head>
    <title>Teste de Conexão Oracle</title>
</head>
<body>
    <h2>Teste de Conexão com o Oracle Database</h2>
    <%
        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;
        try {
            connection = ConnectionFactory.getOracleConnection();
            if (connection != null) {
                out.println("<p>Conexão estabelecida com sucesso!</p>");

                statement = connection.createStatement();
                resultSet = statement.executeQuery("SELECT * FROM DUAL");

                while (resultSet.next()) {
                    out.println("<p>Resultado da Consulta: " + resultSet.getString(1) + "</p>");
                }
            } else {
                out.println("<p>Falha na conexão!</p>");
            }
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<p>Erro: " + e.getMessage() + "</p>");
        } finally {
            if (resultSet != null) resultSet.close();
            if (statement != null) statement.close();
            if (connection != null) connection.close();
        }
    %>
</body>
</html>