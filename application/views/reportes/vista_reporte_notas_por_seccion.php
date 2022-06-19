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
	                                    <li class="active">Reporte Notas por Secci&oacute;n</li>
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
										  <form action="<?php echo base_url();?>Reportesnotas/GenerarReporteNotasPorSeccion" method ="POST" id="form_registro" class="form-horizontal" target="_blank">
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
														<label class="control-label">Buscar Secci&oacute;n/Curso<span class="required"></span></label>
														<div class="controls">
															<input type="text" name="buscar_curso" id="buscar_curso" autocomplete="off" class="span6 m-wrap" placeholder ="Digite la secci&oacute;n-curso, modalidad o a&ntilde;o lectivo para empezar a buscar..." />
																					
															<div class="alert alert-info alert-block" id="listadosEmergentes">
																
																
																
															</div>
															
														</div>
													</div>
													<div class="control-group">
														<label class="control-label">Secci&oacute;n/Curso<span class="required">*</span></label>
														<div class="controls">
															<input type="text" name="el_curso" id="el_curso" data-required="1" class="span6 m-wrap" readonly />
															<input type="hidden" name="id_curso" id="id_curso" data-required="1" class="span6 m-wrap"/>
															<input type="hidden" name="annio" id="annio" data-required="1" class="span6 m-wrap"/>
																						
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

			//siguiente es para cuando cada vez que se cambie el departamente se cargen los respectivos municipios
$("#id_materia").change(function() {
	
	/////*******PROCESO PARA traer los municipos de acuerdo al valor escogido
						
								$.ajax({
									type:"POST",
									url:"<?php echo base_url();?>Reportesnotas/TraerSeccionesPorMateriasDelDocente/",
									data:{id_materia:$("#id_materia").val()},
									dataType: 'json',//espero un json
									success:function(data)
										{
											$("#id_curso").find('option').remove();
											  $("#id_curso").append("<option value=''>Seleccione...</option>");
											  $.each(data, function (key, valor) // indice, valor
												{
													$("#id_curso").append("<option value=" + valor.id_curso + ">" + valor.SECCION + "</option>");
												});
										}
								});
								
							/////*******FIN DEL PROCESO PARA cargar REGISTROS
});
//proceso para buscar interactivamente las secciones
$("#buscar_curso").keyup(function(){
   	
							$.ajax({
									type:"POST",
									url:"<?php echo base_url();?>Reportesnotas/BusquedaInteractivaSeccionesDelDocenteReporteNotas/",
									data:{buscar_curso:$("#buscar_curso").val()},
									//dataType: 'json',//espero un json
									success:function(data)
										{
											//$("#fulanito").append(data[0].NOMBRE);
											$("#listadosEmergentes").html(data);
											  
										}
								});
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
                    },
                    el_curso: {
                        required: true
                    },
					annio:{
						required:true
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
					
							form.submit();
							
					
					
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
							