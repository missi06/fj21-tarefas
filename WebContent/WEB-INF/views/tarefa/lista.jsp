<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Listando tarefas</title>
	<script type="text/javascript" src="resources/js/jquery.js"></script>
	<link type="text/css" href="resources/css/tarefa.css" rel="stylesheet" />
	
	<script type="text/javascript">
		function finalizaAgora(id){
			$.post("finalizaTarefa", {'id' : id}, function() {
				// selecionando o elemento html através da
				// ID e alterando o HTML dele
				$("#tarefa_"+id).html("Finalizado");
			});
		}
	</script>
		
	<script type="text/javascript">
		function finalizaAgora(id) {
			$.post("finalizaTarefa", {'id' : id}, function(resposta) {
				$("#tarefa_"+id).html(resposta);
			});
		}
	</script>
</head>
<body>
	<div id="box">
		<a href="novaTarefa">Criar nova tarefa</a>
	</div>
	
	<div id="sair">
		<p><a href="logout">Sair do sistema</a></p>
	</div>
	
	<br/><br/>
	<table>
	
		<tr>
		<th>Id</th>
		<th>Descrição</th>
		<th>Finalizado?</th>
		<th>Data de finalização</th>
		<!-- <th>Alterar</th>
		<th>Remover</th>-->
		</tr>
		
		<c:forEach items="${tarefas}" var="tarefa">
			<tr id="tarefa_${tarefa.id}">
				<td>${tarefa.id}</td>
				<td>${tarefa.descricao}</td>
				
				<c:if test="${tarefa.finalizado eq false}">
				<td id="tarefa_${tarefa.id}">
					<a href="#" onClick="finalizaAgora(${tarefa.id})">
						Finalizar
					</a>
				</td>
				</c:if>
				
				<c:if test="${tarefa.finalizado eq true}">
					<td>Finalizado</td>
				</c:if>
				
				<td>
					<fmt:formatDate value="${tarefa.dataFinalizacao.time}" pattern="dd/MM/yyyy"/>
				</td>
				
				<td>
					<a href="mostraTarefa?id=${tarefa.id}">Alterar</a>
				</td>
				
				<td>
					<a href="removeTarefa?id=${tarefa.id}" >Remover</a>
				</td>

			</tr>
		</c:forEach>
	</table>
	
</body>
</html>