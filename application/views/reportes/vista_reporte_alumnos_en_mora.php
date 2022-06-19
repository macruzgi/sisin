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
									
	                                    <li>
	                                       
											<li class="active">Reporte Alumnos en mora</li>
	                                    </li>
	                                    <!--li class="active">Tools</li-->
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
                                          <label class="control-label">Docente<span class="required">*</span></label>
                                          <div class="controls">
                                            <select id="id_docente" class="chzn-select" style="width: 377px;" name="id_docente">
                                              <option value ="">Seleccione...</option>
											  <?php foreach($TraerDocentes as $docentesEncontrados):?>
                                              <option value="<?php echo $docentesEncontrados->id_docente;?>"><?php echo $docentesEncontrados->docente_apellido." ".$docentesEncontrados->docente_nombre;?></option>
                                              <?php endforeach;?>
                                            </select>
                                          </div>
                             </div>
							  <div class="control-group">
                                          <label class="control-label">A&ntilde;o<span class="required">*</span></label>
                                          <div class="controls">
                                            <select class="chzn-select" style="width: 377px;" name="id_annio_lectivo" id="id_annio_lectivo">
                                              <option value ="">Seleccione...</option>
											  <?php foreach($TraerAnniosLectivos as $anniosEncontrados):?>
                                              <option value="<?php echo $anniosEncontrados->id_annio_lectivo;?>"><?php echo $anniosEncontrados->annio;?></option>
                                              <?php endforeach;?>
                                            </select>
                                          </div>
                             </div>
							 <div class="block-content collapse in">
							 <div class="span12">
								<table class="table table-striped" id="tbl_secciones">
										<thead>
											<tr>
												<th>Identificador</th>
												<th>Secci&oacute;n/Curso</th>
												
												<th>Generar</th>
											</tr>
										</thead>
										<tbody>
										</tbody>
								</table>
							</div>
							</div>
							
  							<div class="form-actions">
  								
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
 <link href="<?php echo base_url();?>vendors/uniform.default.css" rel="stylesheet" media="screen">
 <script src="<?php echo base_url();?>vendors/jquery.uniform.min.js"></script>
 <!-- para el select con buscador-->
  <link href="<?php echo base_url();?>vendors/chosen.min.css" rel="stylesheet" media="screen">
  <script src="<?php echo base_url();?>vendors/chosen.jquery.min.js"></script>
   <!-- fin del select con buscador-->

 <script>
$(".chzn-select").chosen();//para el select con busqueda
$(".uniform_on").uniform();//para el checkbox con estilo

//------para que funcione el formvalidation
		jQuery(document).ready(function() {   
			FormValidation.init();
			});
		//-----fin form validtion
//cada vez que cambie el combo del docente que limpie la tabla de secciones
$("#id_docente").change(function() {
	$("#tbl_secciones").find('td').remove();
});
//siguiente es para cuando cada vez que se cambie el docente se carguen las secciones que da clases
$("#id_annio_lectivo").change(function() {
	/////*******PROCESO PARA traer las secciones del docente a las que imparte o ha impartido clases
					//valido para ver si ambos cambos tiene valor
					if($("#id_annio_lectivo").val() != "" && $("#id_docente").val() != "")
					{
						$.ajax({
									type:"POST",
									url:"<?php echo base_url();?>ReportesNotas/ReporteTraerSeccionesDelDocenteCualesquiera/",
									data:{id_docente:$("#id_docente").val(), id_annio_lectivo:$("#id_annio_lectivo").val()},
									dataType: 'json',//espero un json
									success:function(data)
										{
											$("#tbl_secciones").find('td').remove();
											
											//$("#fulanito").append(data[0].NOMBRE);
											
											  $.each(data, function (key, valor) // indice, valor
												{
													$('#tbl_secciones tbody').append("<tr><td>"+ valor.id_curso + "</td><td>" + valor.SECCION + " (" + valor.curso_turno + ")</td><td>" + "<a href='#' data-toggle='modal'  class='btn btn-primary' OnClick=\"EliminarDato(\'" + valor.id_curso +"\',\'" + valor.id_annio_lectivo + "\')\"'><i class='icon-file icon-white'></i> </a></td></tr>");
													
												});
										}
								});
					}
								
								
							/////*******FIN DEL PROCESO 
});
function EliminarDato(id_curso, id_annio_lectivo)
{
	//procesanod el reporte
	$.ajax({
				type:"POST",
				url:"<?php echo base_url();?>ReportesNotas/GenerarReporteAlumnosEnMora/",
				data:{id_curso:id_curso, id_annio_lectivo:id_annio_lectivo},
				dataType: 'json',//espero un json
									success:function(data)
										{
											//alert(data);
											if (data.respuesta== 1)
											{
												window.open(data.mensaje);
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
	//fin del proceso del reporte
}

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
                    id_docente: {
                       required: true
                    },
					id_materia: {
                        required: true
                    },
					id_curso: {
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

							