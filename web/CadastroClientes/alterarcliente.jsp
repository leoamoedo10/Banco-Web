<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="controler.ControladorBanco"%>
<%@page import="model.cliente.Cliente"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../css/style.css">
        <title>ALterar Cliente</title>
    </head>
    <body>
        
        <% 
            ControladorBanco controlador = ControladorBanco.getInstance();
            Cliente cliente = controlador.buscarCliente(request.getParameter("cpf"));
        %>
        
        <h1>ALTERAR CLIENTE</h1>
        <form action="clientealterado.jsp" method="post">
            <div>
                <label> CPF: </label>
                <%= cliente.getCpf()%>
                <input value="<%= cliente.getCpf()%>" type="hidden" name="cpf"/>
            </div>
            <div>
                <label for="nome"> Nome: </label>
                <input value="<%= cliente.getNome()%>" type="text" name="nome"/>
            </div>
            <div>
                <label for="sexo"> Sexo: </label>
                <select name="sexo">
                    <option value="F" <%= (cliente.getSexo() == 'F')?"selected":"" %>>Feminino</option>
                    <option value="M" <%= (cliente.getSexo() == 'M')?"selected":"" %>>Masculino</option>
                </select>
            </div>
            <div>
                <label for="fone"> Telefone: </label>
                <input value="<%= cliente.getTelefone()%>" type="tel" name="fone"/>
            </div>
            <div class="salvar">
                <button type="submit"> SALVAR </button>
            </div>
        </form>
        <form class="voltar" action="listarcliente.jsp">
            <button type="submit">VOLTAR</button>
        </form>
        
    </body>
</html>
