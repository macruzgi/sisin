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
	                                        <a href="<?php echo base_url();?>Usuarios/DocentesUsuarios/">Docentes/Usuarios</a> <span class="divider">/</span>
	                                    </li>
	                                    <li class="active">Nuevo Docentes/Usuarios</li>
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
					<form action="#" id="form_sample_1" class="form-horizontal">
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
  									<input type="text" name="docente_nombre" id="docente_nombre" value="<?php if(isset($TraerDocenteUsuario)) echo $TraerDocenteUsuario->docente_nombre;?>" data-required="1" class="span6 m-wrap"/>
									<input type="hidden" name="id_docente" id="id_docente" value="<?php if(isset($TraerDocenteUsuario)) echo $TraerDocenteUsuario->id_docente;?>" data-required="1" class="span6 m-wrap"/>
  								</div>
  							</div>
							
							<div class="control-group">
  								<label class="control-label">Apellidos<span class="required">*</span></label>
  								<div class="controls">
  									<input type="text" name="docente_apellido" id="docente_apellido" value="<?php if(isset($TraerDocenteUsuario)) echo $TraerDocenteUsuario->docente_apellido;?>" data-required="1" class="span6 m-wrap"/>
  								</div>
  							</div>
							<div class="control-group">
								<label class="control-label" for="date01">Fecha de nacimiento<span class="required">*</span></label>
								<div class="controls">
									<input type="text" class="input-xlarge datepicker" name="docente_fecha_nacimiento" id="date01" value="<?php if(isset($TraerDocenteUsuario)) echo date("d/m/Y", strtotime($TraerDocenteUsuario->docente_fecha_nacimiento));?>">
									<p class="help-block">Elija y de click fuera del calendario</p>
								</div>
							</div>
							<div class="control-group">
  								<label class="control-label">Direcci&oacute;n<span class="required">*</span></label>
  								<div class="controls">
  									<textarea class="input-xlarge textarea" style="width: 610px; height: 200px; display: block;" placeholder="Digite la dierecci&oacute;n de residencia ..." name ="docente_direccion" id="docente_direccion"><?php if(isset($TraerDocenteUsuario)) echo $TraerDocenteUsuario->docente_direccion;?></textarea>
  								</div>
  							</div>
							<div class="control-group">
  								<label class="control-label">Departamento<span class="required">*</span></label>
  								<div class="controls">
  									<select class="span6 m-wrap" name="id_departamento" id="id_departamento">
  										
										<option value="<?php if(isset($TraerDocenteUsuario)) {echo $TraerDocenteUsuario->id_departamento;} else {echo "";}?>"><?php if(isset($TraerDocenteUsuario)) {echo $TraerDocenteUsuario->departamento_nombre;} else {echo "Seleccione...";}?></option>
										<?php 
											foreach($TaerDepartamentos as $departamentosEncontados):
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
  										
										<option value="<?php if(isset($TraerDocenteUsuario)) {echo $TraerDocenteUsuario->id_municipio;} else {echo "";}?>"><?php if(isset($TraerDocenteUsuario)) {echo $TraerDocenteUsuario->municipio_nombre;} else {echo "Seleccione...";}?></option>
										
  									</select>
  								</div>
  							</div>
							<div class="control-group">
  								<label class="control-label">Especialidad<span class="required">*</span></label>
  								<div class="controls">
  									<select class="span6 m-wrap" name="id_especialidad" id="id_especialidad">
  										
										<option value="<?php if(isset($TraerDocenteUsuario)) {echo $TraerDocenteUsuario->id_especialidad;} else {echo "";}?>"><?php if(isset($TraerDocenteUsuario)) {echo $TraerDocenteUsuario->especialidad_nombre;} else {echo "Seleccione...";}?></option>
										<?php 
											foreach($TraerEspecialidades as $especialidadesEncontadas):
										?>
										<option value="<?php echo $especialidadesEncontadas->id_especialidad;?>"><?php echo $especialidadesEncontadas->ESPECIALIDAD;?></option>
										<?php endforeach; ?>
  									</select>
  								</div>
  							</div>
  							<h4>Datos del Usuario</h4>
							<div class="control-group">
  								<label class="control-label">Usuario/E-mail<span class="required">*</span></label>
  								<div class="controls">
  									<input type="text" name="usuario" id="usuario" value="<?php if(isset($TraerDocenteUsuario)) echo $TraerDocenteUsuario->usuario;?>" data-required="1" class="span6 m-wrap"/>
  								</div>
  							</div>
							<div class="control-group">
  								<label class="control-label">Clave<span class="required">*</span></label>
  								<div class="controls">
  									<input type="password" name="clave" id="clave" data-required="1" class="span6 m-wrap"/>
  								</div>
  							</div>
							<div class="control-group">
  								<label class="control-label">Repita clave<span class="required">*</span></label>
  								<div class="controls">
  									<input type="password" name="clave_re" id="clave_re" data-required="1" class="span6 m-wrap"/>
  								</div>
  							</div>
							
							<div class="control-group">
  								<label class="control-label">Rol del usuarios<span class="required">*</span></label>
  								<div class="controls">
  									<select class="span6 m-wrap" name="id_rol" id="id_rol">
  										
										<option value="<?php if(isset($TraerDocenteUsuario)) {echo $TraerDocenteUsuario->id_rol;} else {echo "";}?>"><?php if(isset($TraerDocenteUsuario)) {echo $TraerDocenteUsuario->rol_nombre;} else {echo "Seleccione...";}?></option>
										<?php 
											foreach($TaerRolesUsuarios as $rolesEncontados):
										?>
										<option value="<?php echo $rolesEncontados->id_rol;?>"><?php echo $rolesEncontados->rol_nombre;?></option>
										<?php endforeach; ?>
  									</select>
  								</div>
  							</div>
  							<div class="form-actions">
  								<button type="submit" class="btn btn-primary">Guardar</button>
								<!--NOTA: este boton lo comentare ya que no es bueno que el rol administrador resetea las claves
								para eso estara la opcion del perfil del usuario-->
								<!--button type="button" class="btn btn-info" id="btnCambiarClave">Recambiar clave</button-->
  							
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

 

</script>	
							

 </div>
 
 <script src="<?php echo base_url();?>vendors/jquery-1.9.1.min.js"></script>
  <link href="<?php echo base_url();?>vendors/datepicker.css" rel="stylesheet" media="screen">
   <script src="<?php echo base_url();?>vendors/bootstrap-datepicker.js"></script>
<script>
$('.datepicker').datepicker({
    format: 'dd/mm/yyyy'
});
function ActivarDesactivarDatosDocente(valorBoleano)
{
	$("#docente_nombre").prop("disabled", valorBoleano);
	$("#docente_apellido").prop("disabled", valorBoleano);
	$("#docente_direccion").prop("disabled", valorBoleano);
	//$("#docente_nombre").prop("disabled", valorBoleano);
}

function ActivarDesactiva(ValorBoleano)
 {
	  $("#usuario").prop("disabled", ValorBoleano);
	  $("#clave").prop("disabled", ValorBoleano);
	  $("#clave_re").prop("disabled", ValorBoleano);
	  $("#id_docente").prop("disabled", ValorBoleano);
	  $("#id_rol").prop("disabled", ValorBoleano);
 }
 
if($("#id_docente").val() != "")
{
	 ActivarDesactiva(true);
	 $("#id_docente").prop("disabled", false);
	 
	 
}
else
{
	ActivarDesactiva(false);
	 $("#id_docente").prop("disabled", true);
	 $("#btnCambiarClave").hide();
}

//siguiente es para cuando cada vez que se cambie el departamente se cargen los respectivos municipios
$("#id_departamento").change(function() {
	//alert($("#id_departamento").val()); 
	//$("#id_municipio").html($("#id_departamento").val());
	/////*******PROCESO PARA traer los municipos de acuerdo al valor escogido
						
								$.ajax({
									type:"POST",
									url:"<?php echo base_url();?>Usuarios/TraerMunicipios/",
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
/*variables para ver que accion ejecutara el formulario al dar clic en el goton Guardar
ya sea nuevo registro, actualizar registro o resetear contraseña*/
var id_docente 			= $("#id_docente").val();
var es_recambiar_clave 	= 0;

//cuando de clic en el boton cambiar clave me active los datos del usuario y me desactivo los datos del docente.
$("#btnCambiarClave").click(function(){
	//alert("hola");
	ActivarDesactivarDatosDocente(true);
	ActivarDesactiva(false);
	$("#clave_re").prop("disabled", true);
	$("#usuario").prop("disabled", true);
	//asigno un valor distinto  para indicar que es clave de contraseña
	es_recambiar_clave = -1029
});
//------para que funcione el formvalidation
		jQuery(document).ready(function() {   
			FormValidation.init();
			});
		//-----fin form validtion
var FormValidation = function () {

    var handleValidation1 = function() {
        // for more info visit the official plugin documentation: 
            // http://docs.jquery.com/Plugins/Validation

            var form1 = $('#form_sample_1');
            var error1 = $('.alert-error', form1);
            var success1 = $('.alert-success', form1);

            form1.validate({
                errorElement: 'span', //default input error message container
                errorClass: 'help-inline', // default input error message class
                focusInvalid: false, // do not focus the last invalid input
                ignore: "",
                rules: {
                    docente_nombre: {
                        minlength: 5,
                        required: true
                    },
					docente_apellido:{
						minlength: 2,
                        required: true
					},
					docente_direccion:{
						minlength: 5,
                        required: true
					},
                    usuario: {
                        required: true,
                        email: true
                    },
					 clave: {
                        required: true,
                        minlength: 5
                    },
					 clave_re: {
                        required: true,
                        minlength: 5,
						equalTo: "#clave"
                    },
                    id_especialidad: {
                        required: true
                    },
                    id_departamento: {
                        required: true
                    },
                    id_municipio: {
                        required: true
                    },
                    id_rol: {
                        required: true
                    },
					 id_docente: {
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
					
						if(id_docente == "")
						{
						/////*******PROCESO PARA INGREGRESAR REGISTROS
						
								$.ajax({
									type:"POST",
									url:"<?php echo base_url();?>Usuarios/AgregarDocenteUsuario/",
									data:$("#form_sample_1").serialize(),
									success:function(data)
										{
											//alert(data);
											if (data== 1)
											{
												error1.hide();
												success1.show();
												FormValidation.scrollTo(error1, -1500); // para que suba y ver el mensaje de exito
												setTimeout(function() {
														location.reload();
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
							/////*******FIN DEL PROCESO PARA INGREGRESAR REGISTROS
						}
						else if (id_docente != "" && es_recambiar_clave == 0)
						{
							
							/////////***********PROCESO CUANDO SEA ACTUALIZACION DE DATOS
								$.ajax({
									type:"POST",
									url:"<?php echo base_url();?>Usuarios/ModificarDocenteUsuario/",
									data:$("#form_sample_1").serialize(),
									success:function(data)
										{
											//alert(data);
											if (data== 1)
											{
												error1.hide();
												success1.show();
												FormValidation.scrollTo(error1, -1500); // para que suba y ver el mensaje de exito
												//success1.hide();
												setTimeout(function() {
														 success1.hide();
														 location.reload();
													}, 3500);
											}
											else
											{
												//$('.alert-error').val(data);
												$(".alert-error").empty();
												$('.alert-error').append("Debe completar todos los datos." + data);
												//alert(data);
												error1.show();
											}
										}
								});
							/////////***********FIN DEL PROCESO DE ACTUALIZACION DE DATOS
							
							
						}
						else
						{
							////////************RECAMBIAR CONTRSEÑA
								$.ajax({
									type:"POST",
									url:"<?php echo base_url();?>Usuarios/ResetearClave/",
									data:$("#form_sample_1").serialize(),
									success:function(data)
										{
											//alert(data);
											if (data== 1)
											{
												error1.hide();
												success1.show();
												FormValidation.scrollTo(error1, -375); // para que suba y ver el mensaje de exito
												//success1.hide();
												setTimeout(function() {
														 success1.hide();
														 location.reload();
													}, 3500);
											}
											else
											{
												//$('.alert-error').val(data);
												$(".alert-error").empty();
												$('.alert-error').append("Debe completar todos los datos." + data);
												//alert(data);
												error1.show();
											}
										}
								});
							///////*************FRIN RECAMBIAR CONTRASEÑA
						}
                    error1.hide();
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

							