<!DOCTYPE html>
<html class="no-js">
    
    <head>
        <title>SISIN</title>
        <!-- Bootstrap -->
        <link href="<?php echo base_url();?>bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
        <link href="<?php echo base_url();?>bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" media="screen">
        <link href="<?php echo base_url();?>vendors/easypiechart/jquery.easy-pie-chart.css" rel="stylesheet" media="screen">
        <link href="<?php echo base_url();?>assets/styles.css" rel="stylesheet" media="screen">
		 <link href="<?php echo base_url();?>assets/DT_bootstrap.css" rel="stylesheet" media="screen">
        <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
        <!--[if lt IE 9]>
            <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
        <script src="<?php echo base_url();?>vendors/modernizr-2.6.2-respond-1.1.0.min.js"></script>
    </head>
    
    <body>
		<!--PRIMER CORTE MENU SUPERIOR-->
			<?php $this->load->view("includes/menu_superior");?>
		<!--FIN PRIMER CORRTE MENU SUPERIOR-->
	
       <div class="container-fluid">
            <div class="row-fluid">
                
                <!--/span-->
                <div class="span12" id="content">
					<!--SEGUNDO CORTE CUERPO CONTENIDO-->
						<?php $this->load->view($contenido);?>
					<!--FIN SEGUNDO CORTE CUERPO CONTENIDO-->
                </div>
            </div>
            <hr>
            <footer>
                <p>&copy; 2017-<?php echo date("Y");?> <a href="https://macruz-gi.000webhostapp.com" target="_blank">MaCruz-Gi</a></p>
				<p>Cont&aacute;cto: <a href="mailto:giancarlos1029@hotmail">giancarlos1029@hotmail.com</a></p>
            </footer>
        </div>
        <!--/.fluid-container-->
        <script src="<?php echo base_url();?>vendors/jquery-1.9.1.min.js"></script>
        <script src="<?php echo base_url();?>bootstrap/js/bootstrap.min.js"></script>
        <script src="<?php echo base_url();?>vendors/easypiechart/jquery.easy-pie-chart.js"></script>
        <script src="<?php echo base_url();?>assets/scripts.js"></script>
		<!-- para los datatables--->
		<script src="<?php echo base_url();?>vendors/datatables/js/jquery.dataTables.min.js"></script>
		<script src="<?php echo base_url();?>assets/DT_bootstrap.js"></script>
		
		<!---fin datatables-->
		<!-- para la validacion de los formualrios-->
		<script type="text/javascript" src="<?php echo base_url();?>vendors/jquery-validation/dist/jquery.validate.min.js"></script>
		<script type="text/javascript" src="<?php echo base_url();?>vendors/jquery-validation/dist/mensajes_error_espaniol.js"></script>
		<!--script src="<?php echo base_url();?>assets/form-validation.js"></script-->
		<!--fin validacion de lo sformualrios-->
		
        <script>
		
        $(function() {
            // Easy pie charts
            $('.chart').easyPieChart({animate: 1000});
        });
        </script>
    </body>

</html>