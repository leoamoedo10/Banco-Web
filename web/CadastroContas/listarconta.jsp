<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="controler.ControladorBanco"%>
<%@page import="java.util.List"%>
<%@page import="model.conta.Conta"%>

<% 
    ControladorBanco controlador = ControladorBanco.getInstance();
    List<Conta> contas = controlador.getAllContas();
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de Contas</title>
    </head>
    <body>
        <table border="1">
            <tr>
                <th>CONTA</th>
                <th>TIPO</th>
                <th>TUTULAR</th>
                <th>SALDO</th>
            </tr>

            <%
                for (Conta conta : contas) {
            %>

                <tr class="list">
                    <td class="count">
                        <%=conta.getNumero()%>
                        <%=conta.getTitular().getNome()%>
                        <%=conta.getSaldo()%>
                        <form>
                            <input type="button" onclick="location.href='excluircliente.jsp?cpf='" value="Excluir">
                        </form>
                    </td>
                </tr>
            
            <%
                }
            %>
            
        </table>
        <form class="voltar" action="cadastroconta.html">
            <button type="submit">VOLTAR</button>
        </form>
    </body>
</html>
