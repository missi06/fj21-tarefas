<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<td>${tarefa.id}</td>
<td>${tarefa.descricao}</td>
<td>Finalizada</td>
<td><fmt:formatDate value="${tarefa.dataFinalizacao.time}"
pattern="dd/MM/yyyy" /></td>
<td><a href="mostraTarefa?id=${tarefa.id}">Alterar</a></td>
<td><a href="removeTarefa?id=${tarefa.id}">Remover</a></td>


</body>
</html>