<%@ include file="/WEB-INF/jsp/include/include.jsp"%>

<tiles:insertDefinition name="defaultTemplate">
	<tiles:putAttribute name="body">

		<div class="container theme-showcase" role="main">

			<div class="page-header">

				<div class="bs-example">
					<nav class="navbar navbar-default" role="navigation">
						<div class="container-fluid">
							<div class="navbar-header">
								<button type="button" class="navbar-toggle"
									data-toggle="collapse"
									data-target="#bs-example-navbar-collapse-2">
									<span class="sr-only">Toggle navigation</span> <span
										class="icon-bar"></span> <span class="icon-bar"></span> <span
										class="icon-bar"></span>
								</button>
							</div>
						</div>
					</nav>
				</div>

			</div>

			<div class="container-fluid">
				<div class="row">
					<div class="col-md-12">

						<div class="panel panel-primary">
							<div class="panel-heading">
								<h3 class="panel-title">Paciente - ${paciente.id}</h3>
							</div>
							<div class="panel-body">
								<!-- Table -->
								<table class="table">
									<thead>
										<tr>
											<th>Nome</th>
											<th>Idade</th>
											<th>Quarto</th>
											<th>Data de Iternação</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>${paciente.name}</td>
											<td>${paciente.age}</td>
											<td>${paciente.room}</td>
  											<td><joda:format value="${lastEnteredDate}" pattern="dd/MM/yyyy"/></td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>

					</div>
				</div>
				<div class="row">
					<div class="col-md-6">

						<div class="panel panel-info">
							<div class="panel-heading">
								<h3 class="panel-title">Diagnóstico</h3>
							</div>
							<div class="panel-body">
								<c:forEach items="${paciente.diseases}" var="diagnostico">
									${diagnostico.name}
								</c:forEach>
							</div>
						</div>

					</div>
					<div class="col-md-6">

						<div class="panel panel-info">
							<div class="panel-heading">
								<h3 class="panel-title">Exames</h3>
							</div>
							<div class="panel-body">
								<c:forEach items="${paciente.treatment}" var="tratamento">
									<c:forEach items="${tratamento.exam}" var="exame">
								 		${exame.name} - 
								 		${exame.results} - 
								 		${exame.date} </br>
									</c:forEach>
									<div class="panel-heading">
										<h3 class="panel-title">Observações</h3>
									</div>
									<div class="panel-body">${tratamento.observations}</div>
								</c:forEach>
							</div>
						</div>

					</div>
				</div>

				<div class="row">
					<div class="col-md-12">
						<h3>Detalhes</h3>

						<div class="panel-group" id="accordion">
							<%@ include file="/WEB-INF/jsp/pacientes/medicationRecommended.jsp"%>
							</br>
							<%@ include file="/WEB-INF/jsp/pacientes/medicationAdministered.jsp"%>
							</br>
							<%@ include file="/WEB-INF/jsp/pacientes/bloodPressureChart.jsp"%>
							</br>
							<%@ include file="/WEB-INF/jsp/pacientes/vitalSignsChart.jsp"%>
							</br>
							<%@ include file="/WEB-INF/jsp/pacientes/patientsWithSameDiseaseChart.jsp"%>
						</div>
					</div>
				</div>
			</div>
		</div>
	</tiles:putAttribute>
</tiles:insertDefinition>
<%@ include file="/WEB-INF/jsp/footer.jsp" %>