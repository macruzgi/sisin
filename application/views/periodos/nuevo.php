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
	                                        <a href="<?php echo base_url();?>Periodos/Administrar/">Per&iacute;odos</a> <span class="divider">/</span>
	                                    </li>
	                                    <li class="active">Nuevo Per&iacute;odo</li>
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
				<div class="alert alert-block">
				
					<h4 class="alert-heading">¡Aviso!</h4>
					 Al registrar un nuevo per&iacute;odo el actual se CERRAR&Aacute; y ya no se podr&aacute;n realizar operaciones sobre &eacute;ste.  Si marca la opci&oacute;n que es per&iacute;odo de recuperaci&oacute;n indica que el a&ntilde;o lectivo est&aacute; por culminar, este proceso es irrebersible.
				</div>
                <div class="span12">
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
  								<label class="control-label">A&ntilde;o Lectivo - Per&iacute;odo<span class="required"></span></label>
  								<div class="controls">
  									<span class="label label-success"><?php
									//print_r($TaerIdYAnnioLectivoActual);
									
									echo @$TaerIdYAnnioLectivoActual[0]->annio."-".@$TaerIdYAnnioLectivoActual[1]->periodo_nombre." (".@$TaerIdYAnnioLectivoActual[1]->periodo_numero.")";?></span>
  								</div>
  							</div>
  							<div class="control-group">
  								<label class="control-label">N&uacute;mero del Per&iacute;odo<span class="required">*</span></label>
  								<div class="controls">
  									<input type="text" name="periodo_numero" id="periodo_numero" data-required="1" class="span6 m-wrap"/>
									<input type="hidden" name="id_periodo" id="id_periodo" data-required="1" class="span6 m-wrap"/>
  								</div>
  							</div>
							
							<div class="control-group">
  								<label class="control-label">Nombre del Per&iacute;odo (si aplicase)<span class="required"></span></label>
  								<div class="controls">
  									<input type="text" name="periodo_nombre" id="periodo_nombre" data-required="1" class="span6 m-wrap"/>
  								</div>
  							</div>
							<div class="control-group">
  								<label class="control-label">¿Es per&iacute;odo de recuperaci&oacute;n?<span class="required"></span></label>
  								<div class="controls">
  									<div class="checker" id="uniform-optionsCheckbox"><span class="checked">
									<input class="uniform_on" type="checkbox" id="periodo_recuperacion" name ="periodo_recuperacion"></span></div>
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
                    periodo_nombre: {
                        minlength: 5
                    },
                    periodo_numero: {
                        number: true
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
                    //success1.show();
                    //error1.hide();
						
								/////*******PROCESO PARA INGREGRESAR REGISTROS
						
								$.ajax({
									type:"POST",
									url:"<?php echo base_url();?>Periodos/AgregarPeriodo/",
									data:$("#form_registro").serialize(),
									dataType: 'json',//espero un json codificado desde el lengua de programacion
									success:function(data)
										{
											//alert(data);
											if (data.respuesta == 1)
											{
												error1.hide();
												success1.show();
												FormValidation.scrollTo(error1, -450); // para que suba y ver el mensaje de exito
												setTimeout(function() {
														 location.reload();
													}, 3500);
											}
											else if(data.respuesta == 2)// hay duplicidad de indice
											{
												FormValidation.scrollTo(error1, -450); // para que suba y ver el mensaje de error
												success1.hide();
												$(".alert-error").empty();
												$('.alert-error').append(data.mensaje);
												//alert(data);
												error1.show();
											}
											else if(data.respuesta == 3)// perido de recuperacion para el año lectivo actual ya existe
											{
												FormValidation.scrollTo(error1, -450); // para que suba y ver el mensaje de error
												success1.hide();
												$(".alert-error").empty();
												$('.alert-error').append(data.mensaje);
												//alert(data);
												error1.show();
											}
											else
											{
												FormValidation.scrollTo(error1, -450); // para que suba y ver el mensaje de error
												success1.hide();
												$(".alert-error").empty();
												$('.alert-error').append("Debe completar todos los datos. " + data.mensaje);
												//alert(data);
												error1.show();
											}
										},
									error:function(resultdo)
										{
											FormValidation.scrollTo(error1, -450); // para que suba y ver el mensaje de error
												success1.hiden();
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

							