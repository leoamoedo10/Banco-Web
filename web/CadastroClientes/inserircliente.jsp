<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.cliente.Cliente"%>
<%@page import="controler.ControladorBanco"%>
<%@page import="repository.cliente.CPFJaCadastradoException"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>INCLUIR CLIENTES</title>
    </head>
    <body>
        
        <%           
            ControladorBanco controlador = ControladorBanco.getInstance();

            String cpf = request.getParameter("cpf");
            String nome = request.getParameter("nome");
            String sexo = request.getParameter("sexo");
            String fone = request.getParameter("fone");

            Cliente cliente = new Cliente(cpf, nome, sexo.charAt(0), fone);

            try {
                controlador.inserirCliente(cliente);
        %>
            
            <div>
                <h2>Usuário cadastrado!</h2>
            </div>
                
        <%
            } catch (CPFJaCadastradoException ex) {
                out.println(ex.getMessage());
            }
        %>
        
        <form class="voltar" action="cadastrocliente.html">
            <button type="submit">VOLTAR</button>
        </form>
    </body>
</html>
