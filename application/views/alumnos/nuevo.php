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
	                                    <li>
	                                        <a href="<?php echo base_url();?>Alumnos/Administrar/">Alumnos</a> <span class="divider">/</span>
	                                    </li>
	                                    <li class="active">Nuevo Alumno</li>
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
									<div class="block-content collapse in">
                                <div class="span12">
                                    <div id="rootwizard">
                                        <div class="navbar">
                                          <div class="navbar-inner">
                                            <div class="container">
                                        <ul class="nav nav-pills">
                                            <li class="active"><a href="#tab1" data-toggle="tab">Datos del Alumno</a></li>
                                            <li class=""><a href="#tab2" data-toggle="tab">Datos Familiares</a></li>
                                            <li class=""><a href="#tab3" data-toggle="tab">Datos del Responsable</a></li>
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
														<label class="control-label">C&oacute;digo<span class="required"></span></label>
														<div class="controls">
															<span class="label label-success"><?php if(isset($TaerAlumno)) echo $TaerAlumno->alumno_codigo;?></span>
															 <input id="alumno_codigo" type="hidden" name="alumno_codigo" value ="<?php if(isset($TaerAlumno)) echo $TaerAlumno->alumno_codigo;?>">
														</div>
													</div>
							
													
													<div class="control-group">
																  <label class="control-label" for="fileInput">Fotograf&iacute;a</label>
																  <div class="controls">
																	<input class="input-file uniform_on" id="alumno_nombre_foto" type="file" name="alumno_nombre_foto">
																	 <img src='<?php echo base_url();?>fotografias/<?php if(isset($TaerAlumno)) echo $TaerAlumno->alumno_nombre_foto;?>' width="15%" alt="Fotograf&iacute;a"/>
																	 <input id="alumno_nombre_foto_ori" type="hidden" name="alumno_nombre_foto_ori" value ="<?php if(isset($TaerAlumno)) echo $TaerAlumno->alumno_nombre_foto;?>">
																  </div>
													</div>
													<div class="control-group">
														<label class="control-label">Nombres<span class="required">*</span></label>
														<div class="controls">
															<input type="text" name="alumno_nombre" id="alumno_nombre" value="<?php if(isset($TaerAlumno)) echo $TaerAlumno->alumno_nombre;?>" data-required="1" class="span6 m-wrap"/>
															<input type="hidden" name="id_alumno" id="id_alumno" value="<?php if(isset($TaerAlumno)) echo $TaerAlumno->id_alumno;?>" data-required="1" class="span6 m-wrap"/>
														</div>
													</div>
													
													<div class="control-group">
														<label class="control-label">Apellidos<span class="required">*</span></label>
														<div class="controls">
															<input type="text" name="alumno_apellido" id="alumno_apellido" value="<?php if(isset($TaerAlumno)) echo $TaerAlumno->alumno_apellido;?>" data-required="1" class="span6 m-wrap"/>
														</div>
													</div>
													<div class="control-group">
														<label class="control-label">G&eacute;nero<span class="required">*</span></label>
														<div class="controls">
															<select class="span6 m-wrap" name="id_lista" id="id_lista">
																
																<option value="<?php if(isset($TaerAlumno)) {echo $TaerAlumno->id_lista;} else {echo "";}?>"><?php if(isset($TaerAlumno)) {echo $TaerAlumno->lista_valor;} else {echo "Seleccione...";}?></option>
																<?php 
																	foreach($TraerGenero as $generosEncontados):
																?>
																<option value="<?php echo $generosEncontados->id_lista;?>"><?php echo $generosEncontados->lista_valor;?></option>
																<?php endforeach; ?>
															</select>
														</div>
													</div>
												
													<div class="control-group">
														<label class="control-label">Residencia<span class="required">*</span></label>
														<div class="controls">
															<textarea class="input-xlarge textarea" style="width: 610px; height: 200px; display: block;" placeholder="Digite la dierecci&oacute;n de residencia ..." name ="alumno_direccion" id="alumno_direccion"><?php if(isset($TaerAlumno)) echo $TaerAlumno->alumno_direccion;?></textarea>
														</div>
													</div>
													<div class="control-group">
														<label class="control-label">Tel&eacute;fonos<span class="required"></span></label>
														<div class="controls">
															<input type="text" name="alumno_telefonos" id="alumno_telefonos" value="<?php if(isset($TaerAlumno)) echo $TaerAlumno->alumno_telefonos;?>" data-required="1" class="span6 m-wrap"/>
														</div>
													</div>
													<div class="control-group">
														<label class="control-label">Correo<span class="required"></span></label>
														<div class="controls">
															<input type="text" name="alumno_correo" id="alumno_correo" value="<?php if(isset($TaerAlumno)) echo $TaerAlumno->alumno_correo;?>" data-required="1" class="span6 m-wrap"/>
														</div>
													</div>
													<div class="control-group">
																  <label class="control-label" for="date01">Fecha de nacimiento<span class="required">*</span></label>
																  <div class="controls">
																	<input type="text" class="input-xlarge datepicker" name="alumno_fecha_nacimiento" id="date01" value="<?php if(isset($TaerAlumno)) echo date("d/m/Y", strtotime($TaerAlumno->alumno_fecha_nacimiento));?>">
																	<p class="help-block">Elija y de click fuera del calendario</p>
																  </div>
													</div>
													<div class="control-group">
														<label class="control-label">Departamento<span class="required">*</span></label>
														<div class="controls">
															<select class="span6 m-wrap" name="id_departamento" id="id_departamento">
																
																<option value="<?php if(isset($TaerAlumno)) {echo $TaerAlumno->id_departamento;} else {echo "";}?>"><?php if(isset($TaerAlumno)) {echo $TaerAlumno->departamento_nombre;} else {echo "Seleccione...";}?></option>
																<?php 
																	foreach($TraerDepartamentos as $departamentosEncontados):
																?>
																<option value="<?php echo $departamentosEncontados->id_departamento;?>"><?php echo $departamentosEncontados->departamento_nombre;?></option>
																<?php endforeach; ?>
															</select>
														</div>
													</div>
													<div class="control-group">
														<label class="control-label">Municipio<span class="required">*</span></label>
														<div class="controls">
															<select class="span6 m-wrap" name="id_municipio" id="id_municipio">
																
																<option value="<?php if(isset($TaerAlumno)) {echo $TaerAlumno->id_municipio;} else {echo "";}?>"><?php if(isset($TaerAlumno)) {echo $TaerAlumno->municipio_nombre;} else {echo "Seleccione...";}?></option>
																
															</select>
														</div>
													</div>
                                                  </fieldset>
                                             
                                            </div>
                                            <div class="tab-pane" id="tab2">
                                              
                                                  <fieldset>
                                                    <div class="control-group">
														<label class="control-label">Nombres del Padre<span class="required">*</span></label>
														<div class="controls">
															<input type="text" name="dato_nombres_padre" id="dato_nombres_padre" value="<?php if(isset($TaerAlumno)) echo $TaerAlumno->dato_nombres_padre;?>" data-required="1" class="span6 m-wrap"/>
														</div>
													</div>
													<div class="control-group">
														<label class="control-label">Nombres de la Madre<span class="required">*</span></label>
														<div class="controls">
															<input type="text" name="dato_nombres_madre" id="dato_nombres_madre" value="<?php if(isset($TaerAlumno)) echo $TaerAlumno->dato_nombres_madre;?>" data-required="1" class="span6 m-wrap"/>
														</div>
													</div>
													<div class="control-group">
														<label class="control-label">Tel&eacute;fonos<span class="required"></span></label>
														<div class="controls">
															<input type="text" name="dato_telefonos_contacto" id="dato_telefonos_contacto" value="<?php if(isset($TaerAlumno)) echo $TaerAlumno->dato_telefonos_contacto;?>" data-required="1" class="span6 m-wrap"/>
														</div>
													</div>
													<div class="control-group">
														<label class="control-label">Correo<span class="required"></span></label>
														<div class="controls">
															<input type="text" name="dato_correo" id="dato_correo" value="<?php if(isset($TaerAlumno)) echo $TaerAlumno->dato_correo;?>" data-required="1" class="span6 m-wrap"/>
														</div>
													</div>
													<div class="control-group">
														<label class="control-label">Residencia o Lugar de Trabajo<span class="required">*</span></label>
														<div class="controls">
															<textarea class="input-xlarge textarea" style="width: 610px; height: 200px; display: block;" placeholder="Digite la dierecci&oacute;n de residencia ..." name ="dato_lugar_trabajo" id="dato_lugar_trabajo"><?php if(isset($TaerAlumno)) echo $TaerAlumno->dato_lugar_trabajo;?></textarea>
														</div>
													</div>
                                                  </fieldset>
                                             
                                            </div>
                                            <div class="tab-pane" id="tab3">
                                             
                                                  <fieldset>
                                                    <div class="control-group">
														<label class="control-label">Nombre encargado<span class="required">*</span></label>
														<div class="controls">
															<input type="text" name="dato_nombres_responsable" id="dato_nombres_responsable" value="<?php if(isset($TaerAlumno)) echo $TaerAlumno->dato_nombres_responsable;?>" data-required="1" class="span6 m-wrap"/>
														</div>
													</div>
														<div class="control-group">
														<label class="control-label">Tel&eacute;fonos encargado<span class="required"></span></label>
														<div class="controls">
															<input type="text" name="dato_telefono_responsable" id="dato_telefono_responsable" value="<?php if(isset($TaerAlumno)) echo $TaerAlumno->dato_telefono_responsable;?>" data-required="1" class="span6 m-wrap"/>
														</div>
													</div>
														<div class="control-group">
														<label class="control-label">Correo<span class="required"></span></label>
														<div class="controls">
															<input type="text" name="dato_correo_responsable" id="dato_correo_responsable" value="<?php if(isset($TaerAlumno)) echo $TaerAlumno->dato_correo_responsable;?>" data-required="1" class="span6 m-wrap"/>
														</div>
													</div>
														<div class="control-group">
														<label class="control-label">Residencia o Lugar de Trabajo<span class="required">*</span></label>
														<div class="controls">
															<textarea class="input-xlarge textarea" style="width: 610px; height: 200px; display: block;" placeholder="Digite la dierecci&oacute;n de residencia ..." name ="dato_lugar_trabajo_responsable" id="dato_lugar_trabajo_responsable"><?php if(isset($TaerAlumno)) echo $TaerAlumno->dato_lugar_trabajo_responsable;?></textarea>
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
                                </div>
                            </div>
							
				</div>
			    </div>
			</div>
                     	<!-- /block -->
		    </div>
                     <!-- /validation -->

 


							

 </div>
 <link href="<?php echo base_url();?>vendors/datepicker.css" rel="stylesheet" media="screen">
 <script src="<?php echo base_url();?>vendors/jquery-1.9.1.min.js"></script>
 <script src="<?php echo base_url();?>vendors/bootstrap-datepicker.js"></script>
 
 <!-- para el input file cargar archivo-->
  <link href="<?php echo base_url();?>vendors/uniform.default.css" rel="stylesheet" media="screen">
  <link href="<?php echo base_url();?>vendors/chosen.min.css" rel="stylesheet" media="screen">
  <script src="<?php echo base_url();?>vendors/jquery.uniform.min.js"></script>
  <script src="<?php echo base_url();?>vendors/chosen.jquery.min.js"></script>
   <!-- fin del input file cargar archivo-->
<script>

//------para que funcione el formvalidation
		jQuery(document).ready(function() {   
			FormValidation.init();
			});
		//-----fin form validtion
$('.datepicker').datepicker({
    format: 'dd/mm/yyyy'
});
$(".uniform_on").uniform();//para el diseño del boton de buscar archivo
//siguiente es para cuando cada vez que se cambie el departamente se cargen los respectivos municipios
$("#id_departamento").change(function() {
	
	/////*******PROCESO PARA traer los municipos de acuerdo al valor escogido
						
								$.ajax({
									type:"POST",
									url:"<?php echo base_url();?>Alumnos/TraerMunicipios/",
									data:{id_departamento:$("#id_departamento").val()},
									dataType: 'json',//espero un json
									success:function(data)
										{
											$("#id_municipio").find('option').remove();
											  $.each(data, function (key, valor) // indice, valor
												{
													$("#id_municipio").append("<option value=" + valor.id_municipio + ">" + valor.municipio_nombre + "</option>");
												});
										}
								});
								
							/////*******FIN DEL PROCESO PARA cargar REGISTROS
});
//variable para ver si es ingresar registro o actualizacion		
var id_alumno = $("#id_alumno").val();
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
                    alumno_nombre: {
                        minlength: 5,
                        required: true
                    },
					alumno_apellido: {
                        minlength: 4,
                        required: true
                    },
					id_lista: {
                       required: true
                    },
					alumno_direccion: {
                        minlength: 5,
                        required: true
                    },
                    alumno_correo: {
                          email: true
                    },
					alumno_fecha_nacimiento: {
                         required: true
                    },
					dato_nombres_padre: {
                        minlength: 5,
                        required: true
                    },
					dato_nombres_madre: {
                        minlength: 5,
                        required: true
                    },
					 dato_correo: {
                          email: true
                    },
					dato_nombres_responsable: {
                        minlength: 5,
                        required: true
                    },
					dato_lugar_trabajo: {
                        minlength: 5,
                        required: true
                    },
					dato_lugar_trabajo_responsable: {
                        minlength: 5,
                        required: true
                    },
					 dato_correo_responsable: {
                          email: true
                    },
                    id_departamento: {
                        required: true
                    },
                    id_municipio: {
                        required: true
                    }
                },

                invalidHandler: function (event, validator) { //display error alert on form submit              
                    success1.hide();
                    error1.show();
                    FormValidation.scrollTo(error1, -1500);
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
                    //success1.show();
                    //error1.hide();
						if(id_alumno == "")//es un nuevo registro
						{
								/////*******PROCESO PARA INGREGRESAR REGISTROS
								/*para subir la imagen con ajax*/
								var inputFile = $('input[name=alumno_nombre_foto]');
												
								var fileToUpload = inputFile[0].files[0];
								//se crea un objeto tipo form data
								var formData = new FormData();
								//agrego el objeto respetivo que contiene la imagen
								formData.append("alumno_nombre_foto", fileToUpload);
								// para poder enviar los otros datos es necesario hacer esto con el formulario
								//y asi enviar todos los datos junto a los archivos
								var otros_datos =  $("#form_registro").serializeArray();
								$.each(otros_datos,function(key,input){
										//itero y agrego cada caja de texto la vairable formData
										formData.append(input.name,input.value);
									});
								$.ajax({
									type:"POST",
									url:"<?php echo base_url();?>Alumnos/AgregarAlumno/",
									data:formData,
									processData: false,
									contentType: false,
									success:function(data)
										{
											/*
												var inputFile = $('input[name=alumno_nombre_foto]');
												
													var fileToUpload = inputFile[0].files[0];
													// make sure there is file to upload
													if (fileToUpload != 'undefined') {
														// provide the form data
														// that would be sent to sever through ajax
														var formData = new FormData();
														formData.append("alumno_nombre_foto", fileToUpload);

														// now upload the file using $.ajax
														$.ajax({
															url:"<?php echo base_url();?>Alumnos/SubirFoto/",
															type: 'POST',
															data: formData,
															processData: false,
															contentType: false,
															success: function() {
																
															}
														});
													}
											*/
											//alert(data);
											if (data== 1)
											{
												error1.hide();
												success1.show();
												FormValidation.scrollTo(error1, -1500); // para que suba y ver el mensaje de exito
												//$("#form_registro")[0].reset();
												//success1.hide();
													
												setTimeout(function() {
														 success1.hide();
														 location.reload();
													}, 3500);
											}
											else if(data == 2)//ya no ha codigos disponibles
											{
												FormValidation.scrollTo(error1, -1450); // para que suba y ver el mensaje de error
												//$('.alert-error').val(data);
												$(".alert-error").empty();
												$('.alert-error').append("Ya no hay c&oacute;digos disponibles para asiganar, avise a un administrador.");
												//alert(data);
												error1.show();
											}
											else
											{
												FormValidation.scrollTo(error1, -1500); // para que suba y ver el mensaje de error
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
						else//es una actualizacion
						{
							/////*******PROCESO PARA actualizacion de REGISTROS
								/*para subir la imagen con ajax*/
								var inputFile = $('input[name=alumno_nombre_foto]');
												
								var fileToUpload = inputFile[0].files[0];
								//se crea un objeto tipo form data
								var formData = new FormData();
								//agrego el objeto respetivo que contiene la imagen
								formData.append("alumno_nombre_foto", fileToUpload);
								// para poder enviar los otros datos es necesario hacer esto con el formulario
								//y asi enviar todos los datos junto a los archivos
								var otros_datos =  $("#form_registro").serializeArray();
								$.each(otros_datos,function(key,input){
										//itero y agrego cada caja de texto la vairable formData
										formData.append(input.name,input.value);
									});
								$.ajax({
									type:"POST",
									url:"<?php echo base_url();?>Alumnos/ModificarAlumno",
									data:formData,
									processData: false,
									contentType: false,
									success:function(data)
										{
											//alert(data);
											if (data== 1)
											{
												error1.hide();
												success1.show();
												FormValidation.scrollTo(error1, -1500); // para que suba y ver el mensaje de exito
												//$("#form_registro")[0].reset();
												//success1.hide();
												setTimeout(function() {
														  location.reload();
														 success1.hide();
													}, 3500);
											}
											else
											{
												FormValidation.scrollTo(error1, -1500); // para que suba y ver el mensaje de error
												//$('.alert-error').val(data);
												$(".alert-error").empty();
												$('.alert-error').append("Debe completar todos los datos." + data);
												//alert(data);
												error1.show();
											}
										}
								});
							/////*******FIN DEL PROCESO PARA actualizacion de REGISTROS
							
						}
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

							