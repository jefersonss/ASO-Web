<%@ include file="/WEB-INF/jsp/include/include.jsp" %>

<tiles:insertDefinition name="defaultTemplate">
    <tiles:putAttribute name="body">
 
    <div class="container theme-showcase" role="main">
		
	<div class="page-header">
		<div class="bs-example">
			<nav class="navbar navbar-default" role="navigation">
			  <div class="container-fluid">
				<div class="navbar-header">
				  <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-2">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				  </button>
				</div>
			  </div>
			</nav>
		  </div>
  		</div>

     	<div class="panel-group" id="accordion">
     	
     		<c:forEach items="${patientsByRoom}" var="entry" varStatus="count">
     		
		  	  <div class="panel panel-default">
				<div class="panel-heading">
				  <h4 class="panel-title">
					<a data-toggle="collapse" data-parent="#accordion" href="#collapse${count.index}">
					  ${entry.key}<span class="badge pull-right"> ${fn:length(entry.value)}</span>
					</a>
				  </h4>
				</div>
				<div id="collapse${count.index}" class="panel-collapse collapse">
				  <div class="panel-body">
					<div class="bs-example">
						<table class="table table-hover">
						  <thead>
							<tr>
							  <th>Nome</th>
							  <th>Idade</th>
							</tr>
						  </thead>
						  <tbody>
						  
						  <c:forEach items="${entry.value}" var="paciente">
						  	<tr>
							  <td><a href='<c:url value="/pacientes/${paciente.id}"/>'>${paciente.name}</a></td>
							  <td>${paciente.age}</td>
							</tr>
						  </c:forEach>

						  </tbody>
						</table>
					  </div><!-- /example -->
				  </div>
				</div>
			  </div>
			  
			</c:forEach>
     		</br>
			<%@ include file="/WEB-INF/jsp/pacientes/patientsByDiseaseChart.jsp"%>
     		
     	</div>

    </div> <!-- /container -->
    </tiles:putAttribute>
</tiles:insertDefinition>

<script>
	$(document).ready(function(){$("#collapseGraph").click();});
</script>

<%@ include file="/WEB-INF/jsp/footer.jsp" %>