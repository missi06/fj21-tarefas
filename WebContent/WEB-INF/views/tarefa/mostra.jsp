<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="caelum" %>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Alterar Tarefa...</title>
<link type="text/css" href="resources/css/altTarefa.css" rel="stylesheet" />
<link href="css/jquery-ui.css" rel="stylesheet">
<link href="/resources/demos/style.css">
<script src="js/jquery.js"></script>
<script src="js/jquery-ui.js"></script>
<script>
  $(function(){
    $("#datepicker").datepicker({
      changeMonth: true,
      changeYear: true
    });
  });
</script>
</head>
<body>
<div id="inner">
	<div id="box">
	<h3>Alterar tarefa - ${tarefa.id}</h3>
	
	<form action="alteraTarefa" method="post">
		<input type="hidden" name="id" value="${tarefa.id}"/>
		
		Descrição:<br/>
		<textarea name="descricao" cols="100" rows="5">
		${tarefa.descricao}
		</textarea>
		
		<br/>
		Finalizado? <input type="checkbox" name="finalizado" value="true" ${tarefa.finalizado? 'checked' : '' }/> <br/>
		
		Data de finalização: <br/>
		<fmt:formatDate value="${tarefa.dataFinalizacao.time}" pattern="dd/MM/yyyy" var="dataFormatada"/>
		<caelum:campoData id="dataFinalizacao" val="${dataFormatada}"/>
		
		<br/>
		<input type="submit" value="Alterar"/>
	</form>
	</div>
</div>
</body>
</html>