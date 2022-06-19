<?php 

//print_r($TraerPermisosUsuario);
if(count($TraerNotasPorDocenteMateriaCursoYannio) == 0)
{
	exit;
}
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
										
									
							<table class="gridtable" border="0" width ="100%">
								<tr>
									<td><strong><?php echo $Titulo;?></strong></td>
								</tr>
								<tr>
									<td>Docente: <b><?php echo $TraerNotasPorDocenteMateriaCursoYannio[0]->DOCENTE;?></b></td>
								</tr>
								<tr>
									<td>Secci&oacute;n/Curso: <b><?php echo $TraerNotasPorDocenteMateriaCursoYannio[0]->SECCION." (".$TraerNotasPorDocenteMateriaCursoYannio[0]->curso_turno.")";?></b></td>
								</tr>
								<tr>
									<td>Materia: <b><?php echo $TraerNotasPorDocenteMateriaCursoYannio[0]->materia_nombre;?></b></td>
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
												siguiente es para armar los encabezados de los periodos de la tabla
												dinamicamete, dependiendo de los periodos encontrados asi se generara
												las columnas dimamicante.
												Meto el resultado ($alumnosEncontrados->PERIODO) traido de controlador en un array solo el perido
												para luego quitar los valores repetidos y solo tome los indeces unicos y quite los repetidos con la funcion
												array_unique, luego itero ese arrary para amar las columnas de las notas
												esto se hace porque la liberia de PDF dara error si las celdas de las tablas no estan completas
											*/
											$datosEnarray = array();
											foreach($TraerNotasPorDocenteMateriaCursoYannio as $alumnosEncontrados)
											{
												$datosEnarray[]=$alumnosEncontrados->PERIODO;
												
											}
											$resultadoPeriodos = array_unique($datosEnarray);
											//print_r($resultado);
											foreach($resultadoPeriodos as $preidos):
												
											?>
												<th><?php echo $preidos;?></th>
												
											<?php endforeach;?>
											  <th>Promedio</th>
											</tr>
											
											
										  </thead>
										  <tbody>
											<?php 
												/*
												arrar para acumular los alumnos aplazados y calcular las notas dependiendo de los
												peridodos encontrados, los alumnos aplazados se devide entre el total de peridos, ya sean ordinarios mas extraordinarios, a los no aplazados solo se les divide por los peridodos ordinarios, esta validacion se utiliza en el 2° foreach in_array
												*/
												$aplazados = array();
												foreach($TraerAlumnosAplazados as $alumnosAplazadosEncontrados):
													
														$aplazados[] = $alumnosAplazadosEncontrados->id_alumno;
													
												endforeach;
											
												//print_r($aplazados);
												/*
													NOTA:
													el primer foreach recorre todos los resultado encontrado para iterar el resultado de los alumnos
													se crea la variable $banderaAlumno para utilizarla como bandera y no imprimir los registros repetidos;
													luego despues de iterar los alumnos, el segundo foreach se vulve a iterar todo el resultado encontrado igual que el primer foreach pero solo se iteran las notas y armar las columnas dinamicamente para cada nota ya que las notas estan en filas no en columnas, en el segundo foreac de iteracion de notas imprimira solo las notas que correspondan al alumno iterado del primer foreach;
													dentro del segundo foreach al iterar las notas al final calcula el promedio dividiendolo por le numero de
													 vueltas por cada nota del alumno
													*/
											$banderaAlumno = "";
											//1° FOREACH
											foreach($TraerNotasPorDocenteMateriaCursoYannio as $alumnosEncontrados):
												
											?>
											<tr>
												<?php if($banderaAlumno != $alumnosEncontrados->alumno_codigo)
												{
													$banderaAlumno = $alumnosEncontrados->alumno_codigo;
												?>
												 <td><?php echo $alumnosEncontrados->alumno_codigo;?> </td>
												 <td><?php echo $alumnosEncontrados->NOMBRE;?> </td>
												 <?php 
												 $promedio = 0;
												 $vueltas = 0;
												 //1° FOREACH
												foreach($TraerNotasPorDocenteMateriaCursoYannio as $notasEncontradas):
												if($alumnosEncontrados->alumno_codigo == $notasEncontradas->alumno_codigo)
												{
													
													/*
													NOTA: preguntar como es el proceso de suma y division de notas cuando un alumno reprueba
													si se suman todos los peridos y se dividen entre los periodos validos y no de recuperacion
													o si la nota del ultimo perido se remplaza por la del de recuperacion y no se toma en cuenta la del ultimo periodo ordinario
													*/
													if(in_array($alumnosEncontrados->id_alumno, $aplazados))
													{
														$vueltas = $TraerNumerosDePeriodos->RECUPERACION + $TraerNumerosDePeriodos->ORDINARIO;
													}
													else
													{
														$vueltas = $TraerNumerosDePeriodos->ORDINARIO; 
													}
													
													
													$promedio = $promedio + $notasEncontradas->N_1;
												?>
												<td style="text-align:right;"><?php echo $notasEncontradas->N_1;?></td>
												
												<?php 
												} 
												endforeach;
												
												?>
												
												<td style="text-align:right;"><?php echo number_format($promedio/$vueltas, 2);?></td>
												<?php
												} 
												?>
												
											</tr>
											
											<?php endforeach;?>
										  </tbody>
										</table>
										
                                </div>
                            
                                </div>
                            
							



 