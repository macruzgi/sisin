<?php 

//print_r($TraerPermisosUsuario);
?>
<style>
.listadosEmergentes{
	color:#3a87ad;background-color:#d9edf7;border-color:#bce8f1;
	
	
}
</style>
<div class="navbar">
                            	<div class="navbar-inner">
	                                <ul class="breadcrumb">
	                                    <i class="icon-chevron-left hide-sidebar"><a href='#' title="Hide Sidebar" rel='tooltip'>&nbsp;</a></i>
	                                    <i class="icon-chevron-right show-sidebar" style="display:none;"><a href='#' title="Show Sidebar" rel='tooltip'>&nbsp;</a></i>
	                                    <li>
	                                        <a href="#">INSCRIPCIONES</a> <span class="divider">/</span>	
	                                    </li>
	                                    
	                                    <li class="active">Inscribir Alumnos</li>
	                                </ul>
                            	</div>
                        	</div>
							
 <div class="row-fluid">
         <!-- validation -->
                    <div class="row-fluid">
                         <!-- block -->
                        <div class="block">
                            <div class="navbar navbar-inner block-header">
                                <div class="muted pull-left">Complete los espacios marcados con asterisco (*)</div>
                            </div>
                            <div class="block-content collapse in">
                                <div class="span12">
								<!-- bloc de pestañas-->
									 <div id="rootwizard">
                                        <div class="navbar">
                                          <div class="navbar-inner">
                                            <div class="container">
                                        <ul class="nav nav-pills">
                                            <li class="active"><a href="#tab1" data-toggle="tab">Inscribir Alumno</a></li>
                                            <li class=""><a href="#tab2" data-toggle="tab">Alumnos Inscritos</a></li>
                                        </ul>
                                         </div>
                                          </div>
                                        </div>
                                         <div class="alert alert-info alert-block">
										
										<h4 class="alert-heading">Informaci&oacute;n</h4>
										 <?php echo $Informacion;?>
										</div>
										  <form action="#" class="form-horizontal" id="form_registro">
										  <div class="alert alert-error hide">
														<button class="close" data-dismiss="alert"></button>
														Se han detectado errores, verifique por favor.
													</div>
													<div class="alert alert-success hide">
														<button class="close" data-dismiss="alert"></button>
														Datos procesados correctamente.
													</div>
                                        <div class="tab-content">
												
                                            <div class="tab-pane active" id="tab1">
                                             
                                                  <fieldset>
													<div class="control-group">
														<label class="control-label">Secci&oacute;n<span class="required">*</span></label>
														<div class="controls">
															<select class="span6 m-wrap" name="id_curso" id="id_curso">
																
																<option value="">Seleccione...</option>
																<?php 
																	foreach($TraerSeccionesDelDocente as $seccionesDelDocenteEncontadas):
																?>
																<option value="<?php echo $seccionesDelDocenteEncontadas->id_curso;?>"><?php echo $seccionesDelDocenteEncontadas->SECCION." (".$seccionesDelDocenteEncontadas->curso_turno.")";?></option>
																<?php endforeach; ?>
															</select>
														</div>
													</div>
													<div class="control-group">
														<label class="control-label">Buscar alumno<span class="required"></span></label>
														<div class="controls">
															<input type="text" name="buscar_alumno" id="buscar_alumno" autocomplete="off" class="span6 m-wrap" placeholder ="Digite el Nombre, Apellido o C&oacute;digo del Alumno para iniciar la b&uacute;squeda..." />
																					
															<div class="alert alert-info alert-block" id="listadosEmergentes">
																
																
																
															</div>
															
														</div>
													</div>
													<div class="control-group">
														<label class="control-label">Alumno<span class="required">*</span></label>
														<div class="controls">
															<input type="text" name="alumno" id="alumno" data-required="1" class="span6 m-wrap" readonly />
															<input type="hidden" name="id_alumno" id="id_alumno" data-required="1" class="span6 m-wrap"/>
																						
														</div>
													</div>
                                                  </fieldset>
                                             
                                            </div>
                                            <div class="tab-pane" id="tab2">
                                              
                                                  <fieldset>
                                                   
														
														<div class="block-content collapse in">
																  <div class="span12">
														  
														
															<table class="table table-striped" id="tbl_alumnos">
																<thead>
																	<tr>
																		<th>C&oacute;digo</th>
																		<th>Nombre</th>
																		<th>Acci&oacute;n</th>
																	</tr>
																</thead>
																<tbody>
															
																</tbody>
															</table>
														</div>
													
														</div>
													
                                                  </fieldset>
                                             
                                            </div>
                                           
                                            	
                                        </div>  
										<div class="form-actions">
  								<button type="submit" class="btn btn-primary">Guardar</button>
  							</div>
										</form>
                                    </div>
                                
								
								<!--fin block de pestañas-->
					
						</div>
					</div>
				</div>
                 
		    </div>
                     <!-- /validation -->

 


 <div id="myAlert" class="modal hide">
											<div class="modal-header">
												<button data-dismiss="modal" class="close" type="button">&times;</button>
												<h3>Confirme la acci&oacute;n</h3>
											</div>
											<div class="modal-body">
												<p>Ha eligido desinscribir a un alumno, ¿est&aacute; seguro/a?</p>
											</div>
											<div class="modal-footer">
												<a data-dismiss="modal" class="btn btn-danger" href="#" id="linkEliminar">S&iacute;</a>
												<a data-dismiss="modal" class="btn" href="#" id="linkDesistir">NO</a>
											</div>
										</div>							

 </div>
 <script src="<?php echo base_url();?>vendors/jquery-1.9.1.min.js"></script>
<script>

//------para que funcione el formvalidation
		jQuery(document).ready(function() {   
			FormValidation.init();
			});


//siguiente es para cuando cada vez que se cambie la seccion
$("#id_curso").change(function() {
	
	/////*******PROCESO PARA traer los alumnos incscritos en la seccion seleccionada
						
								$.ajax({
									type:"POST",
									url:"<?php echo base_url();?>Inscripciones/TraerAlumnosInscritosEnSeccion/",
									data:{id_curso:$("#id_curso").val()},
									dataType: 'json',//espero un json
									success:function(data)
										{
											$("#tbl_alumnos").find('td').remove();
											
											//$("#fulanito").append(data[0].NOMBRE);
											
											  $.each(data, function (key, valor) // indice, valor
												{
													$('#tbl_alumnos tbody').append("<tr><td>"+ valor.alumno_codigo + "</td><td>" + valor.NOMBRE + "</td><td>" + "<a href='#myAlert' data-toggle='modal'  class='btn btn-danger' OnClick=\"EliminarDato(\'" + valor.id_detalle_alumno +"\',\'" + valor.id_curso +"\',\'" + valor.id_alumno + "\')\"'><i class=' icon-remove icon-white'></i> </a></td></tr>");
													
												});
										}
								});
								
							/////*******FIN DEL PROCESO 
});

//proceso para buscar alumnos
$("#buscar_alumno").keyup(function(){
   	
							$.ajax({
									type:"POST",
									url:"<?php echo base_url();?>Inscripciones/BuscarInteractivaAlumnos/",
									data:{buscar_alumno:$("#buscar_alumno").val()},
									//dataType: 'json',//espero un json
									success:function(data)
										{
											//$("#fulanito").append(data[0].NOMBRE);
											$("#listadosEmergentes").html(data);
											  
										}
								});
});
//fin del proceso para la busqueda interactiva de los alumnos para inscribir

//funcion que eliminara un alumno de la seccion seleccionada (desmatricular)
function EliminarDato(id_detalle_alumno, id_curso, id_alumno)
{
	  var form1 = $('#form_registro');
      var error1 = $('.alert-error', form1);
      var success1 = $('.alert-success', form1);
	//doy clic en el boton SI de myAlert
	$("#linkEliminar").click(function(){
		//proceso para eliminara un alumno de la seccion seleccionada desmatricular
			$.ajax({
									type:"POST",
									url:"<?php echo base_url();?>Inscripciones/DesinscribirAlumno/",
									data:{id_detalle_alumno:id_detalle_alumno, id_alumno:id_alumno},
									//dataType: "json", // para indicarle que espero un JSON
									success:function(data)
										{
											if(data==1)
											{
												error1.hide();
												success1.show();
												FormValidation.scrollTo(error1, -550); // para que suba y ver el mensaje de exito
												
												setTimeout(function() {
														 
														 success1.hide();
													}, 3500);
												 /////*******PROCESO PARA traer los alumnos incscritos en la seccion seleccionada
						
													$.ajax({
														type:"POST",
														url:"<?php echo base_url();?>Inscripciones/TraerAlumnosInscritosEnSeccion/",
														data:{id_curso:$("#id_curso").val()},
														dataType: 'json',//espero un json
														success:function(data)
															{
																$("#tbl_alumnos").find('td').remove();
																
																//$("#fulanito").append(data[0].NOMBRE);
																
																  $.each(data, function (key, valor) // indice, valor
																	{
																		$('#tbl_alumnos tbody').append("<tr><td>"+ valor.alumno_codigo + "</td><td>" + valor.NOMBRE + "</td><td>" + "<a href='#myAlert' data-toggle='modal'  class='btn btn-danger' OnClick=\"EliminarDato(\'" + valor.id_detalle_alumno +"\',\'" + valor.id_curso + "\')\"'><i class=' icon-remove icon-white'></i> </a></td></tr>");
																		
																	});
															}
													});
													
												/////*******FIN DEL PROCESO 
											}
											else if(data == 3) //no puede desmatricular al alumno sleccionado
											{
												FormValidation.scrollTo(error1, -350); // para que suba y ver el mensaje de error
												$(".alert-error").empty();
												$('.alert-error').append("No puede desmatricular al alumno/a, ya tiene notas. Consulte a los administradores");
												error1.show();
											}
											else
											{
												
											}
										}
								});
	
	 
});

}
		//-----fin form validtion
var FormValidation = function () {

    var handleValidation1 = function() {
        // for more info visit the official plugin documentation: 
            // http://docs.jquery.com/Plugins/Validation

            var form1 = $('#form_registro');
            var error1 = $('.alert-error', form1);
            var success1 = $('.alert-success', form1);

            form1.validate({
                errorElement: 'span', //default input error message container
                errorClass: 'help-inline', // default input error message class
                focusInvalid: false, // do not focus the last invalid input
                ignore: "",
                rules: {
                    id_curso: {
                        required: true
                    },
                    alumno: {
                        required: true
                    },
                    id_alumno: {
                        required: true
                    }
                },

                invalidHandler: function (event, validator) { //display error alert on form submit              
                    success1.hide();
                    error1.show();
                    FormValidation.scrollTo(error1, -200);
                },

                highlight: function (element) { // hightlight error inputs
                    $(element)
                        .closest('.help-inline').removeClass('ok'); // display OK icon
                    $(element)
                        .closest('.control-group').removeClass('success').addClass('error'); // set error class to the control group
                },

                unhighlight: function (element) { // revert the change done by hightlight
                    $(element)
                        .closest('.control-group').removeClass('error'); // set error class to the control group
                },

                success: function (label) {
                    label
                        .addClass('valid').addClass('help-inline ok') // mark the current input as valid and display OK icon
                    .closest('.control-group').removeClass('error').addClass('success'); // set success class to the control group
                },

                submitHandler: function (form) {
					
				
								/////*******PROCESO PARA inscribir alumno
						
								$.ajax({
									type:"POST",
									url:"<?php echo base_url();?>Inscripciones/InscribirAlumno/",
									data:$("#form_registro").serialize(),
									success:function(data)
										{
											//alert(data);
											if (data== 1)
											{
												error1.hide();
												success1.show();
												FormValidation.scrollTo(error1, -350); // para que suba y ver el mensaje de exito
												//$("#form_registro")[0].reset();
												//success1.hide();
												setTimeout(function() {
														  location.reload();
														 success1.hide();
													}, 3500);
											}
											else if(data == 2)//duplicidad
											{
												FormValidation.scrollTo(error1, -350); // para que suba y ver el mensaje de error
												//$('.alert-error').val(data);
												$(".alert-error").empty();
												$('.alert-error').append("Los datos que intenta registrar ya existen.");
												//alert(data);
												error1.show();
											}
											else if(data == 3)//el alumno no ha pagado la inscripcion
											{
												FormValidation.scrollTo(error1, -350); // para que suba y ver el mensaje de error
												//$('.alert-error').val(data);
												$(".alert-error").empty();
												$('.alert-error').append("El alumno est&aacute; insolvente de la inscripci&oacute;n.");
												//alert(data);
												error1.show();
											}
											else
											{
												FormValidation.scrollTo(error1, -350); // para que suba y ver el mensaje de error
												//$('.alert-error').val(data);
												$(".alert-error").empty();
												$('.alert-error').append("Debe completar todos los datos." + data);
												//alert(data);
												error1.show();
											}
										}
								});
							/////*******FIN DEL PROCESO PARA INGREGRESAR REGISTROS
					
					
                }
            });
    }

    return {
        //main function to initiate the module
        init: function () {

            handleValidation1();

        },

	// wrapper function to scroll to an element
        scrollTo: function (el, offeset) {
            pos = el ? el.offset().top : 0;
            jQuery('html,body').animate({
                    scrollTop: pos + (offeset ? offeset : 0)
                }, 'slow');
        }

    };

}();
</script>	

							