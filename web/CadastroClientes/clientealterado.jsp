<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.cliente.Cliente"%>
<%@page import="controler.ControladorBanco"%>
<%@page import="repository.cliente.ClienteNaoCadastradoException"%>

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Sucesso</title>
  </head>
  <body>
    <%
      ControladorBanco controlador = ControladorBanco.getInstance();
      Cliente cliente = controlador.buscarCliente(request.getParameter("cpf"));
      String nome = request.getParameter("nome");
      String sexo = request.getParameter("sexo");
      String fone = request.getParameter("fone");

      cliente.setNome(nome);
      cliente.setSexo(sexo.charAt(0));
      cliente.setTelefone(fone);

      try {
        controlador.alterarCliente(cliente);

    %>

    <div>
      <h2>Cliente alterado!</h2>
    </div>

    <%          } catch (ClienteNaoCadastradoException ex) {
        out.println(ex.getMessage());
      }
    %>

    <form class="voltar" action="cadastrocliente.html">
      <button type="submit">VOLTAR</button>
    </form>
  </body>
</html>
