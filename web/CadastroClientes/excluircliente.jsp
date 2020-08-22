<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="controler.ControladorBanco"%>
<%@page import="model.cliente.Cliente"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Excluir Cliente</title>
    </head>
    <body>
        <% 
            ControladorBanco controlador = ControladorBanco.getInstance();
            Cliente cliente = controlador.buscarCliente(request.getParameter("cpf"));
            controlador.excluirCliente(cliente);
        %>
        
        <div class="sucesso">
            <h2>Usuário excluído!</h2>
        </div>
        <form class="voltar" action="listarcliente.jsp">
            <button type="submit">VOLTAR</button>
        </form>
    </body>
</html>
