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
	                                        <a href="<?php echo base_url();?>Secciones/AdministrarSecciones/">Secciones</a> <span class="divider">/</span>
	                                    </li>
	                                    <li class="active">Nuevo Secci&oacute;n</li>
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
  								<label class="control-label">A&ntilde;o Lectivo<span class="required"></span></label>
  								<div class="controls">
  									<span class="label label-success"><?php echo @$TraerAnnioLectivo->annio;?></span>
  								</div>
  							</div>
							<div class="control-group">
  								<label class="control-label">Modalidad<span class="required">*</span></label>
  								<div class="controls">
  									<select class="span6 m-wrap" name="id_modalidad" id="id_modalidad">
  										
										<option value="<?php if(isset($TraerSeccion)) {echo $TraerSeccion->id_modalidad;} else {echo "";}?>"><?php if(isset($TraerSeccion)) {echo $TraerSeccion->modalidad_nombre;} else {echo "Seleccione...";}?></option>
										<?php 
											foreach($TraerModalidades as $modalidadesEncontadas):
										?>
										<option value="<?php echo $modalidadesEncontadas->id_modalidad;?>"><?php echo $modalidadesEncontadas->modalidad_nombre;?></option>
										<?php endforeach; ?>
  									</select>
  								</div>
  							</div>
							<div class="control-group">
  								<label class="control-label">Grado/Nivel<span class="required">*</span></label>
  								<div class="controls">
  									<input type="text" name="curso_nivel" id="curso_nivel" value="<?php if(isset($TraerSeccion)) echo $TraerSeccion->curso_nivel;?>" data-required="1" class="span6 m-wrap"/>
									<input type="hidden" name="id_curso" id="id_curso" value="<?php if(isset($TraerSeccion)) echo $TraerSeccion->id_curso;?>" data-required="1" class="span6 m-wrap"/>
  								</div>
  							</div>
							<div class="control-group">
  								<label class="control-label">Secci&oacute;n/aula<span class="required">*</span></label>
  								<div class="controls">
  									<select class="span6 m-wrap" name="curso_identificador" id="curso_identificador">
  										<option value="<?php if(isset($TraerSeccion)) {echo $TraerSeccion->curso_identificador;} else {echo "";}?>"><?php if(isset($TraerSeccion)) {echo $TraerSeccion->curso_identificador;} else {echo "Seleccione...";}?></option>
										<option value="A">A</option>
										<option value="B">B</option>
										<option value="C">C</option>
										<option value="D">D</option>
										<option value="E">E</option>
										<option value="F">F</option>
										<option value="G">G</option>
										<option value="H">H</option>
										<option value="I">I</option>
										<option value="J">J</option>
										<option value="K">K</option>
										<option value="L">L</option>
										<option value="M">M</option>
										<option value="N">N</option>
										<option value="O">O</option>
										<option value="P">P</option>
										<option value="Q">Q</option>
										<option value="R">R</option>
										<option value="S">S</option>
										<option value="T">T</option>
										<option value="U">U</option>
										<option value="V">V</option>
										<option value="W">W</option>
										<option value="X">X</option>
										<option value="Y">Y</option>
										<option value="Z">Z</option>
  									</select>
  								</div>
  							</div>
  							<div class="control-group">
  								<label class="control-label">Turno<span class="required">*</span></label>
  								<div class="controls">
  									<select class="span6 m-wrap" name="curso_turno" id="curso_turno">
  										
										<option value="<?php if(isset($TraerSeccion)) {echo $TraerSeccion->curso_turno;} else {echo "";}?>"><?php if(isset($TraerSeccion)) {echo $TraerSeccion->curso_turno;} else {echo "Seleccione...";}?></option>
										<option value="Matutino">Matutino</option>
										<option value="Vespertino">Vespertino</option>
										<option value="Nocturno">Nocturno</option>
									
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

var id_curso = $("#id_curso").val();
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
                    curso_identificador: {
                        required: true
                    },
                    curso_nivel: {
                        required: true,
						number: true
                    },
                    id_modalidad: {
                        required: true
                    },
					curso_turno:{
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
					
					if(id_curso == "")//es ingreso de registros
					{
								/////*******PROCESO PARA INGREGRESAR REGISTROS
						
								$.ajax({
									type:"POST",
									url:"<?php echo base_url();?>Secciones/AgregarSeccion/",
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
												$('.alert-error').append("Los datos que intente registrar ya existen.");
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
							/////*******FIN DEL PROCESO PARA INGREGRESAR REGISTROS
					}
					else //es actualizacion de registro
					{
						/////*******PROCESO PARA actualizacion de REGISTROS
						
								$.ajax({
									type:"POST",
									url:"<?php echo base_url();?>Secciones/ModificarSeccion/",
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
												$('.alert-error').append("Los datos que intente registrar ya existen.");
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

							