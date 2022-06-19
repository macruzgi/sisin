<?php 

// print_r($TraerPermisosUsuario);
?>
 <div class="navbar navbar-fixed-top">
            <div class="navbar-inner">
                <div class="container-fluid">
                    <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse"> <span class="icon-bar"></span>
                     <span class="icon-bar"></span>
                     <span class="icon-bar"></span>
                    </a>
                    <a class="brand" href="<?php echo $this->session->userdata("url");?>" target="_blank"><?php echo $this->session->userdata("SIGLAS");?></a>
                    <div class="nav-collapse collapse">
                        <ul class="nav pull-right">
                            <li class="dropdown">
                                <a href="#" role="button" class="dropdown-toggle" data-toggle="dropdown"> <i class="icon-user"></i> <?php echo $this->session->userdata("usuario");?> <i class="caret"></i>

                                </a>
                                <ul class="dropdown-menu">
                                    <li>
                                        <a tabindex="-1" href="<?php echo base_url();?>Inicio/MiPerfil/">Perfil</a>
                                    </li>
                                    <li class="divider"></li>
                                    <li>
                                        <a tabindex="-1" href="<?php echo base_url();?>Sisin/CerrarSesion/">Salir</a>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                        <ul class="nav">
                            <li class="active">
                                <a href="<?php echo base_url();?>Inicio/">Inicio</a>
                            </li>
							<?php 
								$banderaModulo = 0;
								foreach($TraerPermisosUsuario as $permisosEncontrados):
								//$banderaModulo = $permisosEncontrados->id_modulo;
								if($banderaModulo != $permisosEncontrados->id_modulo)
								{
							?>
							
                            <li class="dropdown">
								
										 <a href="#" data-toggle="dropdown" class="dropdown-toggle"><?php echo $permisosEncontrados->nombre_modulo;?> <b class="caret"></b> </a>
								 <ul class="dropdown-menu" id="menu1">
									<?php
										
										//$banderaModuloOpcion=0;
										$banderaModulo = $permisosEncontrados->id_modulo;
										foreach($TraerPermisosUsuario as $permisosEncontradoss):
										$banderaModuloOpcion = $permisosEncontradoss->id_modulo;
										//echo $permisosEncontradoss->id_modulo;
										if($banderaModuloOpcion == $permisosEncontradoss->id_modulo and $banderaModulo == $banderaModuloOpcion)
										{
											//echo "holA";
											$banderaModuloOpcion = $permisosEncontradoss->id_modulo;
											
									?>                               
							  
								
                                   
                                    <li>
                                        <a href="<?php echo base_url().$permisosEncontradoss->nombre_controlador_opcion;?>"><?php echo $permisosEncontradoss->nombre_opcion;?> </a>
                                    </li>
                                    <!--li>
                                        <a href="#">Other Link</a>
                                    </li>
                                    <li class="divider"></li>
                                    <li>
                                        <a href="#">Other Link</a>
                                    </li>
                                    <li>
                                        <a href="#">Other Link</a>
                                    </li-->
                               
								<?php 
										}
										else
										{
											$banderaModuloOpcion = $permisosEncontradoss->id_modulo;
										}
									endforeach;
									?>
								</ul>
                            </li>
							<?php
									$banderaModulo = $permisosEncontrados->id_modulo;
								}
								endforeach;
							?>
                            <!--li class="dropdown">
                                <a href="#" role="button" class="dropdown-toggle" data-toggle="dropdown">Content <i class="caret"></i>

                                </a>
                                <ul class="dropdown-menu">
                                    <li>
                                        <a tabindex="-1" href="#">Blog</a>
                                    </li>
                                    <li>
                                        <a tabindex="-1" href="#">News</a>
                                    </li>
                                    <li>
                                        <a tabindex="-1" href="#">Custom Pages</a>
                                    </li>
                                    <li>
                                        <a tabindex="-1" href="#">Calendar</a>
                                    </li>
                                    <li class="divider"></li>
                                    <li>
                                        <a tabindex="-1" href="#">FAQ</a>
                                    </li>
                                </ul>
                            </li>
                            <li class="dropdown">
                                <a href="#" role="button" class="dropdown-toggle" data-toggle="dropdown">Users <i class="caret"></i>

                                </a>
                                <ul class="dropdown-menu">
                                    <li>
                                        <a tabindex="-1" href="#">User List</a>
                                    </li>
                                    <li>
                                        <a tabindex="-1" href="#">Search</a>
                                    </li>
                                    <li>
                                        <a tabindex="-1" href="#">Permissions</a>
                                    </li>
                                </ul>
                            </li-->
                        </ul>
                    </div>
                    <!--/.nav-collapse -->
                </div>
            </div>
        </div>
        