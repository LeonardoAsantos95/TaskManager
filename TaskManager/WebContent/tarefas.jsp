<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.Tarefa" %>
<%@ page import="service.TarefaService" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Tasks Manager</title>
		
	</head>
	<body>
		<% 
			String nome = "";
			HttpSession sessao = request.getSession();
			if(session.getAttribute("nome") == null) {
				session.setAttribute("mensagem", "Usuário e/ou senha inválidos!");
				response.sendRedirect("index.jsp");
			}
			else {
				nome = (String) session.getAttribute("nome");
				
			}
		%>
		
		<div align="right">
			<p >
				Bem vindo, <%= nome %> 
			</p>
		
		
			<a href="Logoff.do">Sair</a>
		</div>
		
		<h1 >Tasks Manager</h1> 
		
		>
		<a href="cadastrar_tarefa.jsp">Adicionar nova tarefa</a>
		<br><br>
		
		<%
			String email = (String) session.getAttribute("email");
			TarefaService ts = new TarefaService();
			Tarefa t = new Tarefa();
			ArrayList<Tarefa> lista = new ArrayList<>();
			lista = ts.listar(email);
			if(lista.size() >= 1) {
				for(int i = 0; i < lista.size(); i++) {
					t = lista.get(i);
		%>
			
					<table border='3'>
					
						<tr>							
							<th>Titulo</th>
							<th>Descrição</th>
							<th>Alterar</th>
							<th>Excluir</th>														
						</tr>
					
						
					<tr>
						<td><%= t.getTitulo() %></td> 
						<td><%= t.getDescricao() %></td>
						<td><a href="alterar_tarefa.jsp?id=<%= t.getId() %>"> Alterar </a></td>
						<td><a href="DeletarTarefa.do?id=<%= t.getId() %>"> Excluir</a></td>
					</tr>	
					</table>					
			
		<%			
				}
			}
		%>
	</body>
</html>