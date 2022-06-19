<?php 

//print_r($TraerPermisosUsuario);
?>
<div class="navbar">
                            	<div class="navbar-inner">
	                                <ul class="breadcrumb">
	                                    <i class="icon-chevron-left hide-sidebar"><a href='#' title="Hide Sidebar" rel='tooltip'>&nbsp;</a></i>
	                                    <i class="icon-chevron-right show-sidebar" style="display:none;"><a href='#' title="Show Sidebar" rel='tooltip'>&nbsp;</a></i>
	                                   
	                                    <li class="active">Inicio</li>
	                                </ul>
                            	</div>
                        	</div>
							

                    <div class="row-fluid">
                        <div class="span6">
                            <!-- block -->
                            <div class="block">
                                <div class="navbar navbar-inner block-header">
                                    <div class="muted pull-left">Bienvenido/a</div>
                                </div>
                                <div class="block-content collapse in">
                                    <div class="span12">
										<div class="alert alert-success alert-block">
											
											<h4 class="alert-heading"><?php  if(isset($TraerDatosGenerales)) echo $TraerDatosGenerales->informacion_siglas;?> </h4>
											<?php  if(isset($TraerDatosGenerales)) echo $TraerDatosGenerales->informacion_nombre_institucion;?>
										</div>
										<img src='<?php echo base_url();?>fotografias/<?php if(isset($TraerDatosGenerales)) echo $TraerDatosGenerales->informacion_nombre_logo;?>' alt="LOGO"/>
                                    </div>
                                </div>
                            </div>
                            <!-- /block -->
                        </div>
                        <div class="span6">
                            <!-- block -->
                            <div class="block">
                                <div class="navbar navbar-inner block-header">
                                    <div class="muted pull-left">Informaci&oacute;n General</div>
                                </div>
                                <div class="block-content collapse in">
                                    <div class="span12">

										
										<table class="table table-bordered table-striped">
											
											<tbody>
											  <tr>
												<td>
												  C&oacute;digo de Infraestructura
												</td>
												<td>
												  <span class="label"><?php if(isset($TraerDatosGenerales)) echo $TraerDatosGenerales->informacion_codigo_infraestructura;?></span>
												</td>
											  </tr>
											  <tr>
												<td>
												  Distrito
												</td>
												<td>
												<span class="label"><?php if(isset($TraerDatosGenerales)) echo $TraerDatosGenerales->informacion_distrito;?></span>
												</td>
											  </tr>
											  <tr>
												<td>
												  Tel&eacute;fono
												</td>
												<td>
												  <span class="label"><?php if(isset($TraerDatosGenerales)) echo $TraerDatosGenerales->informacion_telefonos;?></span>
												</td>
											  </tr>
											  <tr>
												<td>
												  Correo
												</td>
												<td>
												  <span class="label"><?php if(isset($TraerDatosGenerales)) echo $TraerDatosGenerales->informacion_correo;?></span>
												</td>
											  </tr>
											  <tr>
												<td>
												  Web-URL
												</td>
												<td>
												  <span class="label"><?php if(isset($TraerDatosGenerales)) echo $TraerDatosGenerales->informacion_url;?></span>
												</td>
											  </tr>
											  <tr>
												<td>
												  Direcci&oacute;n
												</td>
												<td>
												 <span class="label"><?php if(isset($TraerDatosGenerales)) echo $TraerDatosGenerales->informacion_direccion;?></span>
												</td>
											  </tr>
											  <tr>
												<td>
												  Municipio y Depto.
												</td>
												<td>
												 <span class="label"><?php if(isset($TraerDatosGenerales)) {echo $TraerDatosGenerales->municipio_nombre."-".$TraerDatosGenerales->departamento_nombre;}?></span>
												</td>
											  </tr>
											</tbody>
										  </table>
											<h4>Otros datos</h4>
											<table class="table table-bordered table-striped">
											
											<tbody>
											  <tr>
												<td>
												  Misi&oacute;n
												</td>
												<td>
												  <span class="badge badge-info"><?php if(isset($TraerDatosGenerales)) echo $TraerDatosGenerales->informacion_mision;?></span>
												</td>
											
											  </tr>
											  <tr>
												<td>
												  Visi&oacute;n
												</td>
												<td>
												  <span class="badge badge-info"><?php if(isset($TraerDatosGenerales)) echo $TraerDatosGenerales->informacion_vision;?></span>
												</td>
												
											  </tr>
											  <tr>
												<td>
												  Valores
												</td>
												<td>
												 <span class="badge badge-info"><?php if(isset($TraerDatosGenerales)) echo $TraerDatosGenerales->informacion_valores;?></span>
												</td>
												
											  </tr>
											 
											 
											</tbody>
										  </table>
                                    </div>
                                </div>
                            </div>
                            <!-- /block -->
                        </div>
                    </div>

