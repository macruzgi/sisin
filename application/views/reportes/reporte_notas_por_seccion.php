<?php 

//print_r($TraerPermisosUsuario);
?>
<script>
window.print();
</script>
<style type="text/css">
table.gridtable {
	font-family: courier;
	font-size:12px;
	color:#333333;
	border-width: 1px;
	border-color: #666666;
	border-collapse: collapse;
}

-->
</style>

							<div class="alert alert-info">
							<?php if(count($GenerarReporteNotasPorSeccion) == 0)
							{
								exit;
							}
							?>
							<table class="gridtable" border="0" width ="100%">
								<tr>
									<td><strong><?php echo $Titulo;?></strong></td>
								</tr>
								<tr>
									<td>Docente: <b><?php echo $this->session->userdata("docente_apellido").", ".$this->session->userdata("docente_nombre");?></b></td>
								</tr>
								<tr>
									<td>Secci&oacute;n/Curso: <b><?php echo $GenerarReporteNotasPorSeccion[0]->SECCION." (".$GenerarReporteNotasPorSeccion[0]->curso_turno.")";?></b></td>
								</tr>
								<tr>
									<td>A&ntilde;o: <b><?php echo $this->input->post("annio");?></b></td>
								</tr>
									
										
							</table> 
									</div>

                          
                               
                                <div class="block-content collapse in">
										  <div class="span12">
										  <table class="gridtable" border="1" width ="100%">
										  <thead>
										  <tr>
										   <th>C&oacute;digo</th>
										   <th>Nombre</th>
											<?php 
											/*
												NOTA:
												siguiente es para armar los encabezados de las materias de la tabla
												dinamicamete, dependiendo de las materias  encontrados asi se generara
												las columnas dimamicamente.
												Meto el resultado ($GenerarReporteNotasPorSeccion->id_materia) traido de controlador en un array solo el nombre de la materia
												para luego quitar los valores repetidos y solo tome los indeces unicos y quite los repetidos con la funcion
												array_unique, luego itero ese arrary para amar las columnas de las notas
												esto se hace porque la liberia de PDF dara error si las celdas de las tablas no estan completas
											*/
											$arrayMaterias = array();
											foreach($GenerarReporteNotasPorSeccion as $materiasEncontradas):
													//$arrayMaterias[] = $materiasEncontradas->id_materia;
													$arrayMaterias[] = $materiasEncontradas->materia_nombre;
											endforeach;
											$sultadoArrayMaterias = array_unique($arrayMaterias);
											//print_r($sultadoArrayMaterias);
											
										
												foreach($sultadoArrayMaterias as $materiasEncontradas):
													
												?>
													<th><?php echo $materiasEncontradas;?></th>
													
												<?php
													
												endforeach;
											
											?>
											 
											</tr>
											
											
										  </thead>
										  <tbody>
											<?php 
												/*
													NOTA:
													El 1° FOREACH es para amar el array de los alumnos y quitar las calves duplicadas
													para iterar los alumnos una sola vez y no hacer bandera y con la funcion unique_multidim_array encontarada en inter se eliminan las claves duplicadas ya que 
													array_unique no funciona para arrars bidimencionales este foreacha se hace del resultado que de la consulta que se trae del controlador.
													El 2° FOREACH es para recorrer los alumnos encontrados del primer array arrayAlumnos.
													El 3° FOREACH es para recorrer las notas ya promediadas por el PA
													*/
											
											/*NO PUEDO RECORRER ESTE ARRAY
											 este seria el idonea para no utilizar la funcion unique_multidim_array
											 y este se convertira en el foreach 1°
											$alumnosEnarray = array();
											foreach($GenerarReporteNotasPorSeccion as $alumnosEncontradas)
											{
												$alumnosEnarray["alumnos"][$alumnosEncontradas->id_alumno]=array(
													"id_alumno"=>$alumnosEncontradas->id_alumno,
													"alumno_codigo"=>$alumnosEncontradas->alumno_codigo,
													"NOMBRE"=>$alumnosEncontradas->NOMBRE
													);
												
											}
											*/
												//1° FOREACH
												foreach($GenerarReporteNotasPorSeccion as $alumnosEncontrados):
														$arrayAlumnos[] = array(
																"id_alumno"=>$alumnosEncontrados->id_alumno,
																"alumno_codigo"=>$alumnosEncontrados->alumno_codigo,
																"NOMBRE"=>$alumnosEncontrados->NOMBRE
																);
													endforeach;
													
													function unique_multidim_array($array, $key) { 
														$temp_array = array(); 
														$i = 0; 
														$key_array = array(); 
														
														foreach($array as $val) { 
															if (!in_array($val[$key], $key_array)) { 
																$key_array[$i] = $val[$key]; 
																$temp_array[$i] = $val; 
															} 
															$i++; 
														} 
														return $temp_array; 
													} 
											$alumnos = unique_multidim_array($arrayAlumnos,'id_alumno'); 
											//print_r($details);
											//2° FOREACH
											foreach($alumnos as $alumnosEncontrados):
											
											
											?>
											<tr>
												
												 <td><?php echo $alumnosEncontrados["alumno_codigo"];?> </td>
												 <td><?php echo $alumnosEncontrados["NOMBRE"];?> </td>
												 <?php 
												//3° FOREACH 
												foreach($GenerarReporteNotasPorSeccion as $promediosEncontrados):
													if($promediosEncontrados->id_alumno == $alumnosEncontrados["id_alumno"])
													{
												?>
												<!-- SE IMPRIME EL PROMEDIO POR MATERIA CONGLOMERADO--->
												<td style="text-align:right;"><?php echo number_format($promediosEncontrados->N_1, 2);?></td>
												<?php 
													}
												endforeach;
												
												?>
												
												
												<?php
												//} 
												?>
												
											</tr>
											
											<?php endforeach;?>
										  </tbody>
										</table>
										
                                </div>
                            
                                </div>
                            
							



 