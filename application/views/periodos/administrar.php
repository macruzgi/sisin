<?php 

//print_r($TraerPermisosUsuario);
?>

<div class="navbar">
                            	<div class="navbar-inner">
	                                <ul class="breadcrumb">
	                                    <i class="icon-chevron-left hide-sidebar"><a href='#' title="Hide Sidebar" rel='tooltip'>&nbsp;</a></i>
	                                    <i class="icon-chevron-right show-sidebar" style="display:none;"><a href='#' title="Show Sidebar" rel='tooltip'>&nbsp;</a></i>
	                                    <li>
	                                        <a href="#">CAT&Aacute;LOGOS</a> <span class="divider">/</span>	
	                                    </li>
	                                    <li class="active">Per&iacute;odos</li>
	                                    
	                                </ul>
                            	</div>
                        	</div>
							
 <div class="row-fluid" id="lista">
                            <!-- block -->
                            <div class="block">
                                <div class="navbar navbar-inner block-header">
                                    <div class="muted pull-left">Administistar Per&iacute;odos</div>
                                </div>
                                <div class="block-content collapse in">
										  <div class="span12">
                                   <div class="table-toolbar">
                                      <div class="btn-group">
                                         <a href="<?php echo base_url();?>Periodos/Nuevo/"><button class="btn btn-success">Agregar Nuevo <i class="icon-plus icon-white"></i></button></a>
                                      </div>
                                      <div class="btn-group pull-right">
                                         <!--button data-toggle="dropdown" class="btn dropdown-toggle">Tools <span class="caret"></span></button>
                                         <ul class="dropdown-menu">
                                            <li><a href="#">Print</a></li>
                                            <li><a href="#">Save as PDF</a></li>
                                            <li><a href="#">Export to Excel</a></li>
                                         </ul-->
                                      </div>
                                   </div>
                                    
                                    <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="example2">
                                        <thead>
                                            <tr>
                                                <th>Identificador</th>
                                                <th>N&uacute;mero #</th>
                                                <th>Nombre del Per&iacute;odo</th>
                                                <th>Estado</th>
												<th>Fecha</th>
												<th>Acci&oacute;n</th>
                                            </tr>
                                        </thead>
                                        <tbody>
										<?php 
											foreach($TraerPeridos as $periodosEncontrados):
										?>	
                                            <tr class="odd gradeX">
                                                <td><?php echo $periodosEncontrados->id_periodo;?></td>
                                                <td><?php echo $periodosEncontrados->periodo_numero;?></td>
                                                <td><?php echo $periodosEncontrados->periodo_nombre;?></td>
												<td><?php echo $periodosEncontrados->ESTADO;?></td>
												<td class="center"><?php echo date("d/m/Y", strtotime($periodosEncontrados->fecha_creacion));?></td>
												<td>
												
												
												<!--a href="#myModal" data-toggle="modal"  class="btn btn-primary" OnClick="CargarDato('<?php echo $periodosEncontrados->id_periodo;?>')"><i class="icon-eye-open icon-white"></i> </a-->
												
												</td>
												
                                            </tr>
                                        <?php
											endforeach;
										?>  
                                        </tbody>
                                    </table>
                                </div>
                            
                                </div>
                            </div>
                            <!-- /block -->
							

 </div>

 <div id="myAlert" class="modal hide">
											<div class="modal-header">
												<button data-dismiss="modal" class="close" type="button">&times;</button>
												<h3>Confirme la eliminaci&oacute;n</h3>
											</div>
											<div class="modal-body">
												<p>Ha eligido elminar el registro, ¿est&aacute; seguro/a?</p>
											</div>
											<div class="modal-footer">
												<a data-dismiss="modal" class="btn btn-danger" href="#" id="linkEliminar">S&iacute;</a>
												<a data-dismiss="modal" class="btn" href="#" id="linkDesistir">NO</a>
											</div>
										</div>
<div id="myModal" class="modal hide">
											<div class="modal-header">
												<button data-dismiss="modal" class="close" type="button">&times;</button>
												<h4>Asiganci&oacute;n al docente:<span class="label label-success" id="fulanito"></span></h4>
											</div>
											<div class="modal-body">
							<div class="span12">
									<table class="table table-striped" id="tbl_datos">
						              <thead>
						                <tr>
						                  <th>Secci&oacute;n</th>
						                  <th>Materia</th>
										  <th>Quitar</th>
						                </tr>
						              </thead>
						              <tbody>
						               
						              </tbody>
						            </table>
                            </div>
											</div>
</div>
 <script src="<?php echo base_url();?>vendors/jquery-1.9.1.min.js"></script>

 <script>
  
 function ActivarDesactiva(ValorBoleano)
 {
	  $("#usuario").prop("disabled", ValorBoleano);
	  $("#clave").prop("disabled", ValorBoleano);
	  $("#clave_re").prop("disabled", ValorBoleano);
	  $("#id_rol").prop("disabled", ValorBoleano);
 }
function CargarDato(id_docente)
{
	
	$.ajax({
									type:"POST",
									url:"<?php echo base_url();?>Usuarios/TraerMateriasAsigandasYsecciones/",
									data:{id_docente:id_docente},
									dataType: "json", // para indicarle que espero un JSON
									success:function(data)
										{
											
											$("#tbl_datos").find('td').remove();
											$("#fulanito").html('');
											$("#fulanito").append(data[0].NOMBRE);
											
											
											  $.each(data, function (key, valor) // indice, valor
												{
													$('#tbl_datos tbody').append("<tr><td>"+ valor.SECCION + "</td><td>" + valor.materia_nombre + "</td><td>" + "<a href='#myAlert' data-toggle='modal'  class='btn btn-danger' OnClick=\"EliminarDato(\'" + valor.id_detalle +"\',\'" + valor.id_docente + "\')\"'><i class=' icon-remove icon-white'></i> </a></td></tr>");
													
												});
										}
								});

	}

//funcion que eliminara alguna materia seleccionada
function EliminarDato(id_detalle, id_docente)
{
	//oculto la modal al levantarse la myAlert
	$("#myModal").hide();
	//doy clic en el boton SI de myAlert
	$("#linkEliminar").click(function(){
		//proceso para eliminar la materia selectionada con la respectiva seccion
			$.ajax({
									type:"POST",
									url:"<?php echo base_url();?>Usuarios/EliminarMateriaSeccionAsiganda/",
									data:{id_detalle:id_detalle},
									//dataType: "json", // para indicarle que espero un JSON
									success:function(data)
										{
											if(data==1)
											{
											 CargarDato(id_docente);
											 $("#myModal").show();
											}
											else
											{
												
											}
										}
								});
	
	 
});

}
//doy clic en no la modal myAlert
	$("#linkDesistir").click(function(){
		$("#myModal").show();	
	});
</script>						

							