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
	                                    <li class="active">Reporte Cumplea&ntilde;eros</li>
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
								<div class="alert alert-info alert-block">
										
										<h4 class="alert-heading">Informaci&oacute;n</h4>
										 <?php echo $Informacion;?>
								</div>
					<!-- BEGIN FORM-->
					<form action="#" id="form_registro" class="form-horizontal">
						<fieldset>
							<div class="alert alert-error hide">
								<button class="close" data-dismiss="alert"></button>
								Se han detectado errores, verifique por favor.
							</div>
							<div class="alert alert-success hide">
								<button class="close" data-dismiss="alert"></button>
								Datos procesados correctamente. 
							</div>
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
  								<label class="control-label">Mes<span class="required">*</span></label>
  								<div class="controls">
  									<select class="span3 m-wrap" name="mes" id="mes">
												<option value="">Seleccione...</option>
												<option value="01">ENERO</option>
												<option value="02">FEBRERO</option>
												<option value="03">MARZO</option>
												<option value="04">ABRIL</option>
												<option value="05">MAYO</option>
												<option value="06">JUNIO</option>
												<option value="07">JULIO</option>
												<option value="08">AGOSTO</option>
												<option value="09">SEPTIEMBRE</option>
												<option value="10">OCTUBRE</option>
												<option value="11">NOVIEMBRE</option>
												<option value="12">DICIEMBRE</option>
  									</select>
  								</div>
  							</div>
  							<div class="form-actions">
  								<button type="submit" class="btn btn-primary">Guardar</button>
								
  							</div>
						</fieldset>
					</form>
					<!-- END FORM-->
				</div>
			    </div>
			</div>
                     	<!-- /block -->
		    </div>
                     <!-- /validation -->

 


							

 </div>
 <script src="<?php echo base_url();?>vendors/jquery-1.9.1.min.js"></script>
<script>

//------para que funcione el formvalidation
		jQuery(document).ready(function() {   
			FormValidation.init();
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
                    mes: {
                        required: true
                    },
					id_curso:{
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
					
							/////*******PROCESO PARA generar el reporte
						
								$.ajax({
									type:"POST",
									url:"<?php echo base_url();?>Reportesnotas/GenerarReporteAlumnosCumpleannieros/",
									data:$("#form_registro").serialize(),
									dataType: 'json',//espero un json codificado desde el lengua de programacion
									success:function(data)
										{
											//alert(data);
											if (data.respuesta == 1)
											{
												error1.hide();
												window.open(data.mensaje);
											}
											else
											{
												FormValidation.scrollTo(error1, -350); // para que suba y ver el mensaje de error
												//$('.alert-error').val(data);
												$(".alert-error").empty();
												$('.alert-error').append("Debe completar todos los datos." + data.mensaje);
												//alert(data);
												error1.show();
											}
										},
									error:function(resultdo)
										{
											FormValidation.scrollTo(error1, -1500); // para que suba y ver el mensaje de error
												//$('.alert-error').val(data);
												$(".alert-error").empty();
												$('.alert-error').append("Hubieron ERRORES desconocidos, informe a un administrador.");
												//alert(data);
												error1.show();
										}
								});
							/////*******FIN DEL PROCESO PARA generar el reporte
				
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

							