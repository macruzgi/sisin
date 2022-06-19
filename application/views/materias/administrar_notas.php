<?php 

//print_r($TraerPermisosUsuario);
?>

<div class="navbar">
                            	<div class="navbar-inner">
	                                <ul class="breadcrumb">
	                                    <i class="icon-chevron-left hide-sidebar"><a href='#' title="Hide Sidebar" rel='tooltip'>&nbsp;</a></i>
	                                    <i class="icon-chevron-right show-sidebar" style="display:none;"><a href='#' title="Show Sidebar" rel='tooltip'>&nbsp;</a></i>
	                                    <li>
	                                        <a href="#">PROCESOS</a> <span class="divider">/</span>	
	                                    </li>
	                                    
	                                    <li class="active">Notas</li>
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
                                            <li class="active"><a href="#tab1" data-toggle="tab">Ingresar Notas</a></li>
                                            <!--li class=""><a href="#tab2" data-toggle="tab">Alumnos Inscritos</a></li-->
                                        </ul>
                                         </div>
                                          </div>
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
														<label class="control-label">Per&iacute;odo en curso<span class="required"></span></label>
														<div class="controls">
														<?php 
																$aviso = "";
																if(isset($InforamcionPeriodo))
																{
																	$aviso ="success";
																}
																else
																{
																	$aviso ="important";
																}
																	?>
														
															<span class="label label-<?php echo $aviso;?>"><?php if(isset($InforamcionPeriodo)){ echo $InforamcionPeriodo->periodo_numero." ".$InforamcionPeriodo->periodo_nombre;} else { echo "NO HAY PER&Iacute;ODO ACTIVO";}?></span>
															<input type="hidden" name="periodo_recuperacion" id="periodo_recuperacion" value="<?php if(isset($InforamcionPeriodo)){ echo $InforamcionPeriodo->periodo_recuperacion;} else { echo "";}?>" data-required="1" class="span6 m-wrap"/>
														</div>
													</div>
													<div class="control-group">
														<label class="control-label">Materia<span class="required">*</span></label>
														<div class="controls">
															<select class="span6 m-wrap" name="id_materia" id="id_materia">
																
																<option value="">Seleccione...</option>
																<?php 
																	foreach($TraerMateriasDelDocente as $materiasDelDocenteEncontadas):
																?>
																<option value="<?php echo $materiasDelDocenteEncontadas->id_materia;?>"><?php echo $materiasDelDocenteEncontadas->materia_nombre;?></option>
																<?php endforeach; ?>
															</select>
														</div>
													</div>
													<div class="control-group">
														<label class="control-label">Secci&oacute;n<span class="required">*</span></label>
														<div class="controls">
															<select class="span6 m-wrap" name="id_curso" id="id_curso">
																
																<option value="">Seleccione...</option>
																
															</select>
														</div>
													</div>
													
														<div class="block-content collapse in">
																  <div class="span12">
														  
														
															<table class="table table-striped" id="tbl_alumnos">
																<thead>
																	<tr>
																		<th>C&oacute;digo</th>
																		<th>Nombre</th>
																		<th>Nota</th>
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

//siguiente es para cuando cada vez que se cambie el departamente se cargen los respectivos municipios
$("#id_materia").change(function() {
	$("#tbl_alumnos").find('td').remove();
	/////*******PROCESO PARA traer los municipos de acuerdo al valor escogido
						
								$.ajax({
									type:"POST",
									url:"<?php echo base_url();?>Materias/TraerSeccionesPorMateriasDelDocente/",
									data:{id_materia:$("#id_materia").val()},
									dataType: 'json',//espero un json
									success:function(data)
										{
											$("#id_curso").find('option').remove();
											  $("#id_curso").append("<option value=''>Seleccione...</option>");
											  $.each(data, function (key, valor) // indice, valor
												{
													$("#id_curso").append("<option value=" + valor.id_curso + ">" + valor.SECCION +  " (" + valor.curso_turno + ")</option>");
												});
										}
								});
								
							/////*******FIN DEL PROCESO PARA cargar REGISTROS
});
			
//siguiente es para cuando cada vez que se cambie la seccion
$("#id_curso").change(function() {
	
	/////*******PROCESO PARA traer los alumnos incscritos en la seccion seleccionada
						
								$.ajax({
									type:"POST",
									url:"<?php echo base_url();?>Inscripciones/TraerAlumnosInscritosEnSeccionConNotaYsinNota/",
									data:{id_curso:$("#id_curso").val(), id_materia:$("#id_materia").val(), periodo_recuperacion:$("#periodo_recuperacion").val()},
									dataType: 'json',//espero un json
									success:function(data)
										{
											$("#tbl_alumnos").find('td').remove();
											
											//$("#fulanito").append(data[0].NOMBRE);
											  var variableReadOnly = "";
											  $.each(data, function (key, valor) // indice, valor
												{
													if(valor.esta_aprobado == "NO")
													{
														variableReadOnly ="readOnly";
													}
													else
													{
														variableReadOnly ="";
													}
													$('#tbl_alumnos tbody').append("<tr><td>"+ valor.alumno_codigo + "</td><td>" + valor.NOMBRE + "</td><td>" + "<input type='text' name='nota[]' id='nota' autocomplete='off' class='span6 m-wrap' value ='"+ valor.N_1 + "'" + variableReadOnly + " /><input type='hidden' name='id_alumno[]' id='id_alumno' readOnly autocomplete='off' class='span6 m-wrap' value = "+ valor.id_alumno +" /></td></tr>");
													
												});
										}
								});
								
							/////*******FIN DEL PROCESO 
});


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
                    id_materia: {
                        required: true
                    },
                    id_curso: {
                        required: true
                    },
					nota:{
						required: true
					},
					id_alumno:{
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
									url:"<?php echo base_url();?>Materias/AgregarNotas/",
									data:$("#form_registro").serialize(),
									success:function(data)
										{
											//alert(data);
											if (data== 1)
											{
												error1.hide();
												success1.show();
												FormValidation.scrollTo(error1, -1550); // para que suba y ver el mensaje de exito
												//$("#form_registro")[0].reset();
												//success1.hide();
												setTimeout(function() {
														  location.reload();
														 success1.hide();
													}, 3500);
											}
											else if(data == 3)//los rangos de notas son invalidos
											{
												FormValidation.scrollTo(error1, -1550); // para que suba y ver el mensaje de error
												//$('.alert-error').val(data);
												$(".alert-error").empty();
												$('.alert-error').append("Las notas deben estar entre el rango de 0 a 10.");
												//alert(data);
												error1.show();
											}
											else
											{
												FormValidation.scrollTo(error1, -1350); // para que suba y ver el mensaje de error
												//$('.alert-error').val(data);
												$(".alert-error").empty();
												$('.alert-error').append("Debe completar todos los datos." + data);
												//alert(data);
												error1.show();
											}
										},
									 error: function(result) {
										FormValidation.scrollTo(error1, -1350); // para que suba y ver el mensaje de error
												//$('.alert-error').val(data);
												$(".alert-error").empty();
												$('.alert-error').append("Hubieron ERRORES desconocidos, informe a un administrador.");
												//alert(data);
												error1.show();
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

							