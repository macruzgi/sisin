<?php 

?>

<div class="navbar">
                            	<div class="navbar-inner">
	                                <ul class="breadcrumb">
	                                    <i class="icon-chevron-left hide-sidebar"><a href='#' title="Hide Sidebar" rel='tooltip'>&nbsp;</a></i>
	                                    <i class="icon-chevron-right show-sidebar" style="display:none;"><a href='#' title="Show Sidebar" rel='tooltip'>&nbsp;</a></i>
	                                    <li>
	                                        <a href="#">INSCRIPCIONES</a> <span class="divider">/</span>	
	                                    </li>
	                                    
	                                    <li class="active">Cuotas</li>
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
								
									<div class="alert alert-block">
				
										<h4 class="alert-heading">¡Aviso!</h4>
										 Al marcar una cuota, se actualizar&aacute;n todas sus antesesoras.
										 Por ejemplo, si usted marca marzo y si sus antesesores estan pendientes, se actualizar&aacute;n tambi&eacute;n.
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
														<label class="control-label">Buscar alumno<span class="required"></span></label>
														<div class="controls">
															<input type="text" name="buscar_alumno" id="buscar_alumno" autocomplete="off" class="span6 m-wrap"placeholder ="Digite para empezar a buscar..."/>
																					
															<div class="alert alert-info alert-block" id="listadosEmergentes">
																
																<!--aqui se mostrara el listado emergente de los alumnos encontrados dependiendo 
																de la busqueda interactiva-->
																
															</div>
															
														</div>
													</div>
													<div class="control-group">
														<label class="control-label">Alumno<span class="required">*</span></label>
														<div class="controls">
															<input type="text" name="alumno" id="alumno" data-required="1" class="span6 m-wrap" readonly />
															<input type="hidden" name="id_alumno" id="id_alumno" data-required="1" class="span6 m-wrap"/>
																						
														</div>
													</div>
													<div class="block-content collapse in">
																  <div class="span12">
														  
														
															<table class="table table-striped" id="tbl_alumnos">
																<thead>
																	<tr>
																		<th>Identificador</th>
																		<th>Mes</th>
																		<th>A&ntilde;o</th>
																		<th>Estado</th>
																		<th>Actualizar</th>
																	</tr>
																</thead>
																<tbody>
															
																</tbody>
															</table>
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
                     <!-- /validation -->
						

 </div>
 <script src="<?php echo base_url();?>vendors/jquery-1.9.1.min.js"></script>
<script>

//------para que funcione el formvalidation
		jQuery(document).ready(function() {   
			FormValidation.init();
			});

//proceso para buscar alumnos
$("#buscar_alumno").keyup(function(){
   	
							$.ajax({
									type:"POST",
									url:"<?php echo base_url();?>Aranceles/BusquedaInteractivaAlumnos/",
									data:{buscar_alumno:$("#buscar_alumno").val()},
									//dataType: 'json',//espero un json
									success:function(data)
										{
											//$("#fulanito").append(data[0].NOMBRE);
											$("#listadosEmergentes").html(data);
											  
										}
								});
});
//fin del proceso para la busqueda interactiva de los alumnos para inscribir


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
                    id_calendario_pago: {
                        required: true
                    },
                    alumno: {
                        required: true
                    },
                    id_alumno: {
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
					
				
								/////*******PROCESO PARA inscribir alumno
						
								$.ajax({
									type:"POST",
									url:"<?php echo base_url();?>Aranceles/ActualizarCuotasAlumno/",
									data:$("#form_registro").serialize(),
									success:function(data)
										{
											//alert(data);
											if (data== 1)
											{
												error1.hide();
												success1.show();
												FormValidation.scrollTo(error1, -1550); // para que suba y ver el mensaje de exito
												//$("#form_registro")[0].reset();
												//success1.hide();
												setTimeout(function() {
														  location.reload();
														 success1.hide();
													}, 3500);
											}
											else if(data == 2)//duplicidad
											{
												FormValidation.scrollTo(error1, -1550); // para que suba y ver el mensaje de error
												//$('.alert-error').val(data);
												$(".alert-error").empty();
												$('.alert-error').append("Los datos que intenta registrar ya existen.");
												//alert(data);
												error1.show();
											}
											else
											{
												FormValidation.scrollTo(error1, -1550); // para que suba y ver el mensaje de error
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

							