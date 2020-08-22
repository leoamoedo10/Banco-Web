<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.cliente.Cliente"%>
<%@page import="model.conta.Conta"%>
<%@page import="controler.ControladorBanco"%>
<%@page import="repository.conta.ContaJaCadastradaException"%>
<%@page import="repository.cliente.ClienteNaoCadastradoException"%>
<%@page import="model.conta.ContaCorrente"%>
<%@page import="model.conta.ContaPoupanca"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inserir Conta</title>
    </head>
    <body>
        
        <% 
            ControladorBanco controlador = ControladorBanco.getInstance();
            
            String tipConta = request.getParameter("tipConta");

            try{
                Cliente titular = controlador.buscarCliente(request.getParameter("cpf"));
                if (tipConta == "CC"){
                    Conta cc = new ContaCorrente(titular);
                    cc = controlador.inserirConta(cc);
                    out.println("Conta Corrente #" + cc.getNumero() + " criada!");

                } else if (tipConta == "POUP"){
                    Conta cp = new ContaPoupanca(titular);
                    cp = controlador.inserirConta(cp);
                    out.println("Conta Poupança #" + cp.getNumero() + " criada!");
 
                }
                else{
                    out.println(tipConta);

                }
                    
            } catch ( ContaJaCadastradaException ex) {
                out.println(ex.getMessage());
            }
        %>
        
        <form class="voltar" action="cadastroconta.html">
            <button type="submit">VOLTAR</button>
        </form>

    </body>
</html>

