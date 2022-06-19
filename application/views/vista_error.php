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
							<div class="alert alert-error">
										
										<h4 class="alert-heading">¡ADVERTENCIA!</h4>
										 <?php
											if(isset($error))
												{
													echo $error;
												}
										?> 
							</div>			
	

 <div id="myAlert" class="modal hide">
											<div class="modal-header">
												<button data-dismiss="modal" class="close" type="button">&times;</button>
												<h3>Confirme la eliminaci&oacute;n</h3>
											</div>
											<div class="modal-body">
												<p>Ha eligido elminar el registro, ¿est&aacute; seguro/a?</p>
											</div>
											<div class="modal-footer">
												<a data-dismiss="modal" class="btn btn-danger" href="#" id="linkEliminar">S&iacute;</a>
												<a data-dismiss="modal" class="btn" href="#">NO</a>
											</div>
										</div>
