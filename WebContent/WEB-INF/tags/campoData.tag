<%@ attribute name="id" required="true" %>
<%@ attribute name="val" required="false" %>

<input type="text" id="${id}" name="${id}" value="${val}"/>

<script>
$("#${id}").datepicker({ changeYear: true , monthRange: "julho:setembro", yearRange: "2010:2016", dateFormat:'dd/mm/yy'});
</script>