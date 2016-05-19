<div class="panel panel-primary">
	<div class="panel-heading">
		<h4 class="panel-title">
			<a data-toggle="collapse" data-parent="#accordion" href="#collapse0">Medicação Recomendada</a>
		</h4>
	</div>
	<div id="collapse0" class="panel-collapse collapse">
		<div class="panel-body">
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-12">
						<div class="panel panel-info" style="margin-bottom: 20px;">
							<div class="panel-heading">
								<h3 class="panel-title">Medicação</h3>
							</div>
							<div class="panel-body">
								<!-- Table -->
								<table class="table">
									<thead>
										<tr>
											<th>Nome</th>
											<th>Tipo</th>
											<th>Data</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<c:forEach items="${paciente.recommendedMedication}" var="medication">
												<td>${medication.name}</td>
												<td>${medication.type}</td>
												<td><span id="medicationDate"></span></td>
												<script>
													var medicationDate = new Date('${medication.dateAdministered}');
													medicationDate = dateToString(medicationDate);
													$('#medicationDate').html(medicationDate);
												</script>
											</c:forEach>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>