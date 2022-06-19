<?php 

//print_r($TraerPermisosUsuario);
?>
<div class="navbar">
                            	<div class="navbar-inner">
	                                <ul class="breadcrumb">
	                                    <i class="icon-chevron-left hide-sidebar"><a href='#' title="Hide Sidebar" rel='tooltip'>&nbsp;</a></i>
	                                    <i class="icon-chevron-right show-sidebar" style="display:none;"><a href='#' title="Show Sidebar" rel='tooltip'>&nbsp;</a></i>
	                                    <li>
	                                        <a href="#">REPORTES</a> <span class="divider">/</span>	
	                                    </li>
	                                    <li class="active">Reporte N&oacute;mina de Alumnos</li>
	                                </ul>
                            	</div>
                        	</div>
							
 <div class="row-fluid" id="lista">
                            <!-- block -->
                            <div class="block">
                                <div class="navbar navbar-inner block-header">
                                    <div class="muted pull-left">Complete los espacios marcados con asterisco (*)</div>
                                </div>
                                <div class="block-content collapse in">
										  <div class="span12">
										 <div class="alert alert-info alert-block">
										
										<h4 class="alert-heading">Informaci&oacute;n</h4>
										 <?php echo $Informacion;?>
										</div>
										  <form  id="form_registro" class="form-horizontal" target="_blank">
											<div class="alert alert-error hide">
														<button class="close" data-dismiss="alert"></button>
														Se han detectado errores, verifique por favor.
													</div>
													<div class="alert alert-success hide">
														<button class="close" data-dismiss="alert"></button>
														Datos procesados correctamente.
													</div>
											<fieldset>
													<div class="control-group">
														<label class="control-label">Secci&oacute;n<span class="required">*</span></label>
														<div class="controls">
															<select class="span6 m-wrap" name="id_curso" id="id_curso">
																
																<option value="">Seleccione...</option>
																<?php 
																	foreach($TraerSeccionesDocenteAnnioActual as $seccionesDelDocenteEncontadas):
																?>
																<option value="<?php echo $seccionesDelDocenteEncontadas->id_curso;?>"><?php echo $seccionesDelDocenteEncontadas->SECCION." (".$seccionesDelDocenteEncontadas->curso_turno.")";?></option>
																<?php endforeach; ?>
															</select>
														</div>
													</div>
													
													
													
														<div class="form-actions">
															<button type="submit" class="btn btn-primary">Generar</button>
														</div>
                                             </fieldset>
											</form>	  
										
                                  
                                </div>
                            
                                </div>
                            </div>
                            <!-- /block -->
							

 </div>

 <script src="<?php echo base_url();?>vendors/jquery-1.9.1.min.js"></script>
 <script>

//------para que funcione el formvalidation
		jQuery(document).ready(function() {   
			FormValidation.init();
			});


//fin del proceso para la busqueda interactiva de las secciones
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
					
							//proceso para generar el reporte
								$.ajax({
									type:"POST",
									url:"<?php echo base_url();?>Reportesnotas/GenerarReporteNominaAlumnos/",
									data:$("#form_registro").serialize(),
									dataType: 'json',//espero un json codificado desde el lengua de programacion
									success:function(data)
										{
											//alert(data);
											if (data.respuesta== 1)
											{
												error1.hide();
												success1.show();
												window.open(data.mensaje);
											}
											else if(data.respuesta == 2)//no hay resultado para generar el reporte
											{
												FormValidation.scrollTo(error1, -350); // para que suba y ver el mensaje de error
												//$('.alert-error').val(data);
												$(".alert-error").empty();
												$('.alert-error').append(data.mensaje);
												//alert(data);
												error1.show();
												success1.hide();
											}
											else
											{
												FormValidation.scrollTo(error1, -350); // para que suba y ver el mensaje de error
												//$('.alert-error').val(data);
												$(".alert-error").empty();
												$('.alert-error').append("Debe completar todos los datos." + data.mensaje);
												//alert(data);
												error1.show();
												success1.hide();
											}
										},
									error: function(resultado) {
										FormValidation.scrollTo(error1, -350); // para que suba y ver el mensaje de error
												//$('.alert-error').val(data);
												$(".alert-error").empty();
												$('.alert-error').append("Hubieron ERRORES desconocidos, informe a un administrador.");
												//alert(data);
												error1.show();
												success1.hide();
									}
								});
							//fin proceso que genera el reporte
					
					
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
							