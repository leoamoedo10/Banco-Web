<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="controler.ControladorBanco"%>
<%@page import="java.util.List"%>
<%@page import="model.cliente.Cliente"%>

<link rel="stylesheet" href="styles.css">

<%
  ControladorBanco controlador = ControladorBanco.getInstance();
  List<Cliente> clientes = controlador.getAllClientes();
%>

<html>
  <head>
    <title>Lista de Clientes</title>
  </head>
  <body>
    <table border="1">
      <tr>
        <th>CLIENTE</th>
      </tr>

      <%
        for (Cliente cliente : clientes) {
      %>

      <tr class="list">
        <td class="user">
          <%= cliente.getNome()%>
          <form>
            <input type="button" onclick="location.href = 'alterarcliente.jsp?cpf=<%= cliente.getCpf()%>'" value="Editar">
            <input type="button" onclick="location.href = 'excluircliente.jsp?cpf=<%= cliente.getCpf()%>'" value="Excluir">
          </form>
        </td>
      </tr>

      <%
        }
      %>

    </table>
    <form class="voltar" action="cadastrocliente.html">
      <button type="submit">VOLTAR</button>
    </form>
  </body>
</html>