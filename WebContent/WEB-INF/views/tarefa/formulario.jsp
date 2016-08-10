<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Adicionar tarefas</title>

<link type="text/css" href="resources/css/adcTarefa.css" rel="stylesheet" />
</head>
<body>
<div id="inner">
	<div id="box">
		<h3>Adicionar tarefas</h3>
		
		<form:errors path="tarefa.descricao" cssStyle="color:red"/>
		<form action="adicionaTarefa" method="post">
			Descrição: <br/>
			<textarea name="descricao" rows="5" cols="100"></textarea><br />
			<input type="submit" value="Adicionar">
		</form>
	</div>
</div>
</body>
</html>