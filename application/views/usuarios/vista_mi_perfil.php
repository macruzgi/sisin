<?php 

//print_r($TraerPermisosUsuario);
?>
<div class="navbar">
                            	<div class="navbar-inner">
	                                <ul class="breadcrumb">
	                                    <i class="icon-chevron-left hide-sidebar"><a href='#' title="Hide Sidebar" rel='tooltip'>&nbsp;</a></i>
	                                    <i class="icon-chevron-right show-sidebar" style="display:none;"><a href='#' title="Show Sidebar" rel='tooltip'>&nbsp;</a></i>
	                                    <li>
	                                        <a href="#">Perfil</a> <span class="divider">/</span>	
	                                    </li>
	                                   
	                                    <li class="active">Mi Perfil</li>
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
  								<label class="control-label">Nombre<span class="required">*</span></label>
  								<div class="controls">
  									<span class="label label-info"><?php echo $this->session->userdata("docente_apellido").", ".$this->session->userdata("docente_nombre");?> </span>
  								</div>
  							</div>
							
							<div class="control-group">
  								<label class="control-label">Usuario<span class="required">*</span></label>
  								<div class="controls">
  									<span class="label label-info"><?php echo $this->session->userdata("usuario");?> </span>
  								</div>
  							</div>
							<div class="control-group">
  								<label class="control-label">Clave Anterior<span class="required">*</span></label>
  								<div class="controls">
  									<input type="password" name="clave_anterior" id="clave_anterior" data-required="1" class="span6 m-wrap"/>
  								</div>
  							</div>
							<div class="control-group">
  								<label class="control-label">Nueva Clave<span class="required">*</span></label>
  								<div class="controls">
  									<input type="password" name="clave" id="clave" data-required="1" class="span6 m-wrap"/>
  								</div>
  							</div>
							<div class="control-group">
  								<label class="control-label">Repetir Clave<span class="required">*</span></label>
  								<div class="controls">
  									<input type="password" name="clave_re" id="clave_re" data-required="1" class="span6 m-wrap"/>
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
                    clave_anterior: {
                        minlength: 5,
                        required: true
                    },
                    clave: {
                        required: true,
                        minlength: 5
                    },
                    clave_re: {
                        required: true,
                        minlength: 5
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
						
								/////*******PROCESO PARA CAMBIAR CLAVE
						
								$.ajax({
									type:"POST",
									url:"<?php echo base_url();?>Usuarios/CambiarClave/",
									data:$("#form_registro").serialize(), 
									dataType: 'json',//espero un json
									success:function(data)
										{
											//alert(data);
											if (data.respuesta== 1)
											{
												error1.hide();
												success1.show();
												FormValidation.scrollTo(error1, -350); // para que suba y ver el mensaje de exito
												
												//success1.hide();
												setTimeout(function() {
														location.reload();
													}, 3500);
											}
											else if(data.respuesta== 0)
											{
												FormValidation.scrollTo(error1, -350); // para que suba y ver el mensaje de error
												//$('.alert-error').val(data);
												$(".alert-error").empty();
												$('.alert-error').append(data.mensaje);
												//alert(data);
												error1.show();
											}
											else
											{
												FormValidation.scrollTo(error1, -350); // para que suba y ver el mensaje de error
												//$('.alert-error').val(data);
												$(".alert-error").empty();
												$('.alert-error').append(data.mensaje);
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

							