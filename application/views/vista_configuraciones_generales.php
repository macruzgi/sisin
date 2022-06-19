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
	                                    
	                                    <li class="active">Configuraciones Generales</li>
	                                </ul>
                            	</div>
                        	</div>
							
 <div class="row-fluid">
         <!-- validation -->
                    <div class="row-fluid">
                         <!-- block -->
                        <div class="block">
                            <div class="navbar navbar-inner block-header">
                                <div class="muted pull-left">Complete los epacios marcados con asterisco (*)</div>
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
                                            <li class="active"><a href="#tab1" data-toggle="tab">Datos de la Instituci&oacute;n</a></li>
                                            <li class=""><a href="#tab2" data-toggle="tab">Datos Grales.</a></li>
                                            <li class=""><a href="#tab3" data-toggle="tab">Otros Datos</a></li>
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
																  <label class="control-label" for="fileInput">Logo</label>
																  <div class="controls">
																	<input class="input-file uniform_on" id="informacion_nombre_logo" type="file" name="informacion_nombre_logo">
																	
																  </div>
																  <img src='<?php echo base_url();?>fotografias/<?php if(isset($TraerDatosGenerales)) echo $TraerDatosGenerales->informacion_nombre_logo;?>' width="15%" alt="LOGO"/>
																  	<input type="hidden" name="informacion_nombre_logo_ori" id="informacion_nombre_logo_ori" value="<?php if(isset($TraerDatosGenerales)) echo $TraerDatosGenerales->informacion_nombre_logo;?>" data-required="1" class="span6 m-wrap"/>
													</div>
													<div class="control-group">
														<label class="control-label">Nombre de la Instituci&oacute;n<span class="required">*</span></label>
														<div class="controls">
															<input type="text" name="informacion_nombre_institucion" id="informacion_nombre_institucion" value="<?php if(isset($TraerDatosGenerales)) echo $TraerDatosGenerales->informacion_nombre_institucion;?>" data-required="1" class="span6 m-wrap"/>
															
														</div>
													</div>
													<div class="control-group">
														<label class="control-label">SIGLAS<span class="required">*</span></label>
														<div class="controls">
															<input type="text" name="informacion_siglas" id="informacion_siglas" value="<?php if(isset($TraerDatosGenerales)) echo $TraerDatosGenerales->informacion_siglas;?>" data-required="1" class="span6 m-wrap"/>
														</div>
													</div>
													
													
													<div class="control-group">
														<label class="control-label">C&oacute;digo de Infraestructura<span class="required">*</span></label>
														<div class="controls">
															<input type="text" name="informacion_codigo_infraestructura" id="informacion_codigo_infraestructura" value="<?php if(isset($TraerDatosGenerales)) echo $TraerDatosGenerales->informacion_codigo_infraestructura;?>" data-required="1" class="span6 m-wrap"/>
														</div>
													</div>
													
													<div class="control-group">
														<label class="control-label">Distrito<span class="required">*</span></label>
														<div class="controls">
															<input type="text" name="informacion_distrito" id="informacion_distrito" value="<?php if(isset($TraerDatosGenerales)) echo $TraerDatosGenerales->informacion_distrito;?>" data-required="1" class="span6 m-wrap"/>
														</div>
													</div>
													
													
                                                  </fieldset>
                                             
                                            </div>
                                            <div class="tab-pane" id="tab2">
                                              
                                                  <fieldset>
												  <div class="control-group">
														<label class="control-label">Direcci&oacute;n<span class="required">*</span></label>
														<div class="controls">
															<textarea class="input-xlarge textarea" style="width: 610px; height: 200px; display: block;" placeholder="Digite la dierecci&oacute;n respectiva..." name ="informacion_direccion" id="informacion_direccion"><?php if(isset($TraerDatosGenerales)) echo $TraerDatosGenerales->informacion_direccion;?></textarea>
														</div>
													</div>
													<div class="control-group">
														<label class="control-label">Tel&eacute;fonos<span class="required">	</span></label>
														<div class="controls">
															<input type="text" name="informacion_telefonos" id="informacion_telefonos" value="<?php if(isset($TraerDatosGenerales)) echo $TraerDatosGenerales->informacion_telefonos;?>" data-required="1" class="span6 m-wrap"/>
														</div>
													</div>
													
													<div class="control-group">
														<label class="control-label">Correo<span class="required"></span></label>
														<div class="controls">
															<input type="text" name="informacion_correo" id="informacion_correo" value="<?php if(isset($TraerDatosGenerales)) echo $TraerDatosGenerales->informacion_correo;?>" data-required="1" class="span6 m-wrap"/>
														</div>
													</div>
													<div class="control-group">
														<label class="control-label">Web-URL<span class="required"></span></label>
														<div class="controls">
															<input name="informacion_url" id="informacion_url" type="text" value="<?php if(isset($TraerDatosGenerales)) echo $TraerDatosGenerales->informacion_url;?>" class="span6 m-wrap"/>
															<span class="help-block">Ej.: http://www.demo.com or http://demo.com</span>
														</div>
													</div>
													<div class="control-group">
														<label class="control-label">Departamento<span class="required">*</span></label>
														<div class="controls">
															<select class="span6 m-wrap" name="id_departamento" id="id_departamento">
																
																<option value="<?php if(isset($TraerDatosGenerales)) {echo $TraerDatosGenerales->id_departamento;} else {echo "";}?>"><?php if(isset($TraerDatosGenerales)) {echo $TraerDatosGenerales->departamento_nombre;} else {echo "Seleccione...";}?></option>
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
																
																<option value="<?php if(isset($TraerDatosGenerales)) {echo $TraerDatosGenerales->id_municipio;} else {echo "";}?>"><?php if(isset($TraerDatosGenerales)) {echo $TraerDatosGenerales->municipio_nombre;} else {echo "Seleccione...";}?></option>
																
															</select>
														</div>
													</div>
                                                    
													
                                                  </fieldset>
                                             
                                            </div>
                                            <div class="tab-pane" id="tab3">
                                             
                                                  <fieldset>
                                                   
													<div class="control-group">
														<label class="control-label">Misi&oacute;n<span class="required"></span></label>
														<div class="controls">
															<textarea class="input-xlarge textarea" style="width: 610px; height: 200px; display: block;" placeholder="Digite la Misi&oacute;n..." name ="informacion_mision" id="informacion_mision"><?php if(isset($TraerDatosGenerales)) echo $TraerDatosGenerales->informacion_mision;?></textarea>
														</div>
													</div>
													<div class="control-group">
														<label class="control-label">Visi&oacute;n<span class="required"></span></label>
														<div class="controls">
															<textarea class="input-xlarge textarea" style="width: 610px; height: 200px; display: block;" placeholder="Digite la Visi&oacute;n..." name ="informacion_vision" id="informacion_vision"><?php if(isset($TraerDatosGenerales)) echo $TraerDatosGenerales->informacion_vision;?></textarea>
														</div>
													</div>
													<div class="control-group">
														<label class="control-label">Valores<span class="required"></span></label>
														<div class="controls">
															<textarea class="input-xlarge textarea" style="width: 610px; height: 200px; display: block;" placeholder="Digite los Valores..." name ="informacion_valores" id="informacion_valores"><?php if(isset($TraerDatosGenerales)) echo $TraerDatosGenerales->informacion_valores;?></textarea>
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
                    informacion_nombre_institucion: {
                        minlength: 5,
                        required: true
                    },
					informacion_siglas: {
                        minlength: 2,
						maxlength: 10,
                        required: true
                    },
					informacion_codigo_infraestructura: {
                       required: true
                    },
					informacion_distrito: {
                        required: true
                    },
					informacion_direccion: {
						 minlength: 5,
                         required: true
                    },
					informacion_mision: {
						 minlength: 5
                    },
					informacion_vision: {
						 minlength: 5
                    },
					informacion_valores: {
						 minlength: 5
                    },
                    informacion_correo: {
                          email: true
                    },
					informacion_url: {
                          url: true
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
								/////*******PROCESO PARA INGREGRESAR ingresar la configuracion
								/*para subir la imagen con ajax*/
								var inputFile = $('input[name=informacion_nombre_logo]');
												
								var fileToUpload = inputFile[0].files[0];
								//se crea un objeto tipo form data
								var formData = new FormData();
								//agrego el objeto respetivo que contiene la imagen
								formData.append("informacion_nombre_logo", fileToUpload);
								// para poder enviar los otros datos es necesario hacer esto con el formulario
								//y asi enviar todos los datos junto a los archivos
								var otros_datos =  $("#form_registro").serializeArray();
								$.each(otros_datos,function(key,input){
										//itero y agrego cada caja de texto la vairable formData
										formData.append(input.name,input.value);
									});
								$.ajax({
									type:"POST",
									url:"<?php echo base_url();?>Inicio/Configurar/",
									data:formData,
									processData: false,
									contentType: false,
									dataType: 'json',//espero un json
									success:function(data)
										{
											//alert(data);
											if (data.respuesta== 1)
											{
												error1.hide();
												success1.show();
												FormValidation.scrollTo(error1, -1500); // para que suba y ver el mensaje de exito
												
												setTimeout(function() {
														 location.reload();
													}, 3500);
													
											}
											else if(data.respuesta == 2)//NO SE PUEDO CARGAR LA IMAGEN
											{
												FormValidation.scrollTo(error1, -1450); // para que suba y ver el mensaje de error
												//$('.alert-error').val(data);
												$(".alert-error").empty();
												$('.alert-error').append(data.mensaje);
												//alert(data);
												error1.show();
											}
											else
											{
												FormValidation.scrollTo(error1, -1500); // para que suba y ver el mensaje de error
												//$('.alert-error').val(data);
												$(".alert-error").empty();
												$('.alert-error').append("Debe completar todos los datos." + data.mensaje);
												//alert(data);
												error1.show();
											}
										}
								});
							/////*******FIN DEL PROCESO PARA INGREGRESAR la configuracion
						
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

							