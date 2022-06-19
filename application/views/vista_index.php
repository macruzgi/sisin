<!DOCTYPE html>
<html>
  <head>
    <title>SISIN</title>
    <!-- Bootstrap -->

    <link href="<?php echo base_url();?>bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link href="<?php echo base_url();?>bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" media="screen">
    <link href="<?php echo base_url();?>assets/styles.css" rel="stylesheet" media="screen">
     <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
    <!--script src="<?php echo base_url();?>js/vendor/modernizr-2.6.2-respond-1.1.0.min.js"></script-->
  </head>
  <body id="login">
    <div class="container">

      <form class="form-signin" action ="#" id="form_registro">
		 <div class="alert alert-error hide">
			<button class="close" data-dismiss="alert"></button>
				Se han detectado errores, verifique por favor.
		</div>
		<div class="alert alert-success hide">
			<button class="close" data-dismiss="alert"></button>
				Datos procesados correctamente.
		</div>
        <h2 class="form-signin-heading">Inicie sesi&oacute;n</h2>
				
		<div class="control-group">
			<div class="controls">
				<input type="text" class="input-block-level" placeholder="Usuario/Correo electr&oacute;nico" name ="usuario" id="usuario">				
			</div>
		</div>
		<div class="control-group">
			<div class="controls">
				<input type="password" class="input-block-level" placeholder="Contrase&ntilde;a" name ="clave" id="clave">	
			</div>
		</div>
		<div class="control-group">No soy robot: 
			<div class="controls">
				 <?php echo $Captcha;?>
			</div>
		</div>
		<div class="control-group">
			<div class="controls">
				<input type="text" class="input-block-level" placeholder="Digite la Captcha" name ="captcha" id="captcha" autocomplete="off">	
			</div>
		</div>
        <button class="btn btn-large btn-primary" id="btnIniciar">Iniciar</button>
		<a href="#myAlert" data-toggle="modal" class="btn btn-large btn-success">Credenciales</a>
		<span id="cargando" style ="display:none"><img src='<?php echo base_url();?>images/loading.gif'/></span>
      </form>
		
		    <footer>
                <p>&copy; 2017-<?php echo date("Y");?> <a href="https://macruz-gi.000webhostapp.com" target="_blank">MaCruz-Gi</a></p>
				<p>Cont&aacute;cto: <a href="mailto:giancarlos1029@hotmail">giancarlos1029@hotmail.com</a></p>
            </footer>
	
			<div id="myAlert" class="modal hide">
											<div class="modal-header">
												<button data-dismiss="modal" class="close" type="button">&times;</button>
												<h3>Credenciales, Sistema de Inscripci&oacute;n (SISIN)</h3>
											</div>
											<div class="modal-body">
												<p>Para ver el Demo use las siguientes credenciales:</p>
												<p><span class="label label-info">Rol ADMINISTRADORES,</span> Usuario: cisco1099@gmail.com, Contrase&ntilde;a: 010707</p>
												<p><span class="label label-info">Rol Docentes,</span> Usuario: mari@gmail.com, Contrase&ntilde;a: 010707</p>
											</div>
											<div class="modal-footer">
												<a data-dismiss="modal" class="btn btn-primary" href="#">OK</a>
												<a data-dismiss="modal" class="btn" href="#">Cancelar</a>
											</div>
										</div>
    </div> <!-- /container -->
    <script src="<?php echo base_url();?>vendors/jquery-1.9.1.min.js"></script>
    <script src="<?php echo base_url();?>bootstrap/js/bootstrap.min.js"></script>
	 <script type="text/javascript" src="<?php echo base_url();?>vendors/jquery-validation/dist/jquery.validate.min.js"></script>
	 <script type="text/javascript" src="<?php echo base_url();?>vendors/jquery-validation/dist/mensajes_error_espaniol.js"></script>
		<script src="<?php echo base_url();?>assets/form-validation.js"></script>
		<!--fin validacion de lo sformualrios-->
	<script>

//------para que  funcione el formvalidation carga la funcion
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
                    usuario: {
                        email: true,
                        required: true
                    },
					clave: {
                        minlength: 5,
                        required: true
                    },
					captcha:{
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
					
								/////*******PROCESO PARA INGREGRESAR REGISTROS
						
								$.ajax({
									type:"POST",
									url:"<?php echo base_url();?>Sisin/IniciarSesion/",
									data:$("#form_registro").serialize(),
									beforeSend: function(){
										$("#cargando").show();
									},
									success:function(data)
										{
											//alert(data);
											if (data== 1)
											{
												
												//hubo exito redirijo a la pagina inicio
												window.location.href="<?php echo base_url();?>Inicio/";
											}
											else if(data == 2)//la captcha no coinciden
											{
												FormValidation.scrollTo(error1, -350); // para que suba y ver el mensaje de error
												//$('.alert-error').val(data);
												$(".alert-error").empty();
												$('.alert-error').append("La Captcha no coinciden.");
												//alert(data);
												error1.show();
												$("#cargando").hide();
											}
											else
											{
												FormValidation.scrollTo(error1, -350); // para que suba y ver el mensaje de error
												//$('.alert-error').val(data);
												$(".alert-error").empty();
												$('.alert-error').append(data);
												//alert(data);
												error1.show();
												$("#cargando").hide();
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
  </body>
</html>