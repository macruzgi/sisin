<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
 
require_once dirname(__FILE__) . '/tcpdf/tcpdf.php';
 
class Pdf extends TCPDF
{
    function __construct()
    {
        parent::__construct();
    }
    
      //Page header
    public function Header() {
    	   $this->SetFont('times', 'B', 10);
        // Title
       // $this->Cell(0, 15, 'Dirección Nacional de Medicamentos República de El Salvador', 0, false, 'C', 0, '', 0, false, 'M', 'M');
		$this->Cell(0,5,'REPÚBLICA DE EL SALVADOR, C.A',0,1,'C');
		$this->Cell(0,5,'DIRECCIÓN NACIONAL DE MEDICAMENTOS',0,1,'C');
        // Logo
        $image_file = K_PATH_IMAGES.'logosv.gif';
        $this->Image($image_file, 155, 8, 13, '', 'GIF', '', 'T', false, 300, '', false, false, 0, false, false, false);

        $image_file2 = K_PATH_IMAGES.'dnmlogo.png';
        $this->Image($image_file2, 29, 8, 13, '', 'PNG', '', 'T', false, 300, '', false, false, 0, false, false, false);
      
    }
	
	 

    // Page footer
    public function Footer() {
        // Position at 15 mm from bottom
        $fyh =date("d-m-Y H:m:s");
        $this->SetY(-20);
        // Set font
        $this->SetFont('times', 'I', 7);
        // Page number
       // $this->Cell(0, 10, 'Page '.$this->getAliasNumPage().'/'.$this->getAliasNbPages(), 0, false, 'C', 0, '', 0, false, 'T', 'M');     
	   $this->Cell(0,5,'Urb. Jardines del Volcán y Av. Jayaque, Ed. El Gran Bazar, 4ta planta',0,1,'C');
		$this->Cell(0,5,'Ciudad Merliot, Santa Tecla',0,1,'C');
		$this->Cell(0,4,'PBX: (503) 2522-5000; 2522-5001',0,1,'C');
		$this->Cell(0,4,'Correo: info@medicamentos.gob.sv / web: www.medicamentos.gob.sv',0,1,'C');
          
    }
	
	
}
/* application/libraries/Pdf.php */

class Pdf2 extends TCPDF
{
    function __construct()
    {
        parent::__construct();
    }
    
      //Page header
    public function Header() {
           $this->SetFont('times', 'B', 10);
        // Title
        //$this->Cell(0, 15, 'Dirección Nacional de Medicamentos República de El Salvador', 0, false, 'C', 0, '', 0, false, 'M', 'M');
		$this->Cell(0,5,'REPÚBLICA DE EL SALVADOR, C.A',0,1,'C');
		$this->Cell(0,5,'DIRECCIÓN NACIONAL DE MEDICAMENTOS',0,1,'C');
       
        $image_file = K_PATH_IMAGES.'logosv.gif';
        $this->Image($image_file, 250, 10, 10, '', 'GIF', '', 'T', false, 300, '', false, false, 0, false, false, false);

        $image_file2 = K_PATH_IMAGES.'dnmlogo.png';
        $this->Image($image_file2, 29, 10, 10, '', 'PNG', '', 'T', false, 300, '', false, false, 0, false, false, false);
       
      
    }
    
    
    
    
    
    // Page footer
    public function Footer() {
        // Position at 15 mm from bottom
        //this->SetY(-15);
        // Set font
        $this->SetFont('times', 'I', 7);
        // Page number
        //$this->Cell(0, 10, 'Page '.$this->getAliasNumPage().'/'.$this->getAliasNbPages(), 0, false, 'C', 0, '', 0, false, 'T', 'M');
		$this->Cell(0,5,'Urb. Jardines del Volcán y Av. Jayaque, Ed. El Gran Bazar, 4ta planta',0,1,'C');
		$this->Cell(0,5,'Ciudad Merliot, Santa Tecla',0,1,'C');
		$this->Cell(0,4,'PBX: (503) 2522-5000; 2522-5001',0,1,'C');
		$this->Cell(0,4,'Correo: info@medicamentos.gob.sv / web: www.medicamentos.gob.sv',0,1,'C');
    }
    
    
}



class Pdf3 extends TCPDF
{
    function __construct()
    {
        parent::__construct();
    }
    
      //Page header
    public function Header() {
           $this->SetFont('times', 'B', 10);
        // Title
 
		$this->Cell(0,5,'REPÚBLICA DE EL SALVADOR, C.A',0,1,'C');
		$this->Cell(0,5,'DIRECCIÓN NACIONAL DE MEDICAMENTOS',0,1,'C');
		//$this->Cell(0,4,'ESTABLECIMIENTOS FARMACEUTICOS',0,1,'C');
		//$this->Cell(0,4,'LISTA DE CHEQUEO',0,1,'C');	

       
        $image_file = K_PATH_IMAGES.'dnmlogo.png';
       $this->Image($image_file, 165, 8, 28, '', 'PNG', '', 'T', false, 300, '', false, false, 0, false, false, false);

       $image_file2 = K_PATH_IMAGES.'logosv.gif';
        $this->Image($image_file2, 29, 8, 28, '', 'GIF', '', 'T', false, 300, '', false, false, 0, false, false, false);
       
       
    }
    
    
    
    
    
    // Page footer
    public function Footer() {
        // Position at 15 mm from bottom
        //this->SetY(-15);
        // Set font
        $this->SetFont('times', 'I', 7);
        // Page number
        //$this->Cell(0, 10, 'Page '.$this->getAliasNumPage().'/'.$this->getAliasNbPages(), 0, false, 'C', 0, '', 0, false, 'T', 'M');
		$this->Cell(0,5,'Urb. Jardines del Volcán y Av. Jayaque, Ed. El Gran Bazar, 4ta planta',0,1,'C');
		$this->Cell(0,5,'Ciudad Merliot, Santa Tecla',0,1,'C');
		$this->Cell(0,4,'PBX: (503) 2522-5000; 2522-5001',0,1,'C');
		$this->Cell(0,4,'Correo: info@medicamentos.gob.sv / web: www.medicamentos.gob.sv',0,1,'C');	
    }
    
    
}





class Pdf4 extends TCPDF
{
    function __construct()
    {
        parent::__construct();
    }
    
      //Page header
    public function Header() {
           $this->SetFont('times', 'B', 10);
        // Title
        //$this->Cell(0, 15, 'Dirección Nacional de Medicamentos República de El Salvador', 0, false, 'C', 0, '', 0, false, 'M', 'M');
		$this->Cell(0,5,'REPÚBLICA DE EL SALVADOR, C.A',0,1,'C');
		$this->Cell(0,5,'DIRECCIÓN NACIONAL DE MEDICAMENTOS',0,1,'C');
       
        $image_file = K_PATH_IMAGES.'logosv.gif';
        $this->Image($image_file, 300, 10, 28, '', 'GIF', '', 'T', false, 300, '', false, false, 0, false, false, false);

        $image_file2 = K_PATH_IMAGES.'dnmlogo.png';
        $this->Image($image_file2, 50, 10, 28, '', 'PNG', '', 'T', false, 300, '', false, false, 0, false, false, false);
       
      
    }
    
   
    // Page footer
    public function Footer() {
        // Position at 15 mm from bottom
        //this->SetY(-15);
        // Set font
        $this->SetFont('times', 'I', 7);
        // Page number
       // $this->Cell(0, 10, 'Pág. '.$this->getAliasNumPage().'/'.$this->getAliasNbPages(), 0, false, 'C', 0, '', 0, false, 'T', 'M');
		$this->Cell(0,5,'Urb. Jardines del Volcán y Av. Jayaque, Ed. El Gran Bazar, 4ta planta',0,1,'C');
		$this->Cell(0,5,'Ciudad Merliot, Santa Tecla',0,1,'C');
		$this->Cell(0,4,'PBX: (503) 2522-5000; 2522-5001',0,1,'C');
		$this->Cell(0,4,'Correo: info@medicamentos.gob.sv / web: www.medicamentos.gob.sv',0,1,'C');

 
    }  




    
    
}
class PdfCertificacionesSinSesion extends TCPDF
{
    function __construct()
    {
        parent::__construct();
    }
    
      //Page header
    public function Header() {
           $this->SetFont('times', 'B', 10);
        // Title
 
		$this->Cell(0,5,'REPÚBLICA DE EL SALVADOR, C.A',0,1,'C');
		$this->Cell(0,5,'DIRECCIÓN NACIONAL DE MEDICAMENTOS',0,1,'C');
		//$this->Cell(0,4,'LISTA DE CHEQUEO',0,1,'C');	
		/*
			si las imagines las tengo en otra carpete hacer esto
			$image_file = './images/escudo.png';
			$this->Image($image_file, 165, 8, 13, '', 'PNG', '', 'T', false, 300, '', false, false, 0, false, false, false);
			*/
        $image_file = K_PATH_IMAGES.'dnmlogo.png';
       $this->Image($image_file, 165, 8, 28, '', 'PNG', '', 'T', false, 300, '', false, false, 0, false, false, false);

       $image_file2 = K_PATH_IMAGES.'logosv.gif';
        $this->Image($image_file2, 29, 8, 28, '', 'GIF', '', 'T', false, 300, '', false, false, 0, false, false, false);
       
        // Set font helveticaI courierI
     
        // $image_file = K_PATH_IMAGES.'dnmlogo.png';
       //$this->Image($image_file, 180, 10, 20, '', 'PNG', '', 'T', false, 300, '', false, false, 0, false, false, false);
    }

    // Page footer
    public function Footer() {
        // Position at 15 mm from bottom
        //this->SetY(-15);
        // Set font
        $this->SetFont('times', 'I', 7);
		$this->Cell(0,5,'Urb. Jardines del Volcán y Av. Jayaque, Ed. El Gran Bazar, 4ta planta',0,1,'C');
		$this->Cell(0,5,'Ciudad Merliot, Santa Tecla',0,1,'C');
		$this->Cell(0,4,'PBX: (503) 2522-5000; 2522-5001',0,1,'C');
		$this->Cell(0,4,'Correo: info@medicamentos.gob.sv / web: www.medicamentos.gob.sv',0,1,'C');	
    }  
    
}
class PdfSolicitudDenegada extends TCPDF
{
	public $usuario="";
	public $herramienta=""; 
    function __construct()
    {
        parent::__construct();
    }
    
      //Page header
    public function Header() {
           $this->SetFont('times', 'B', 10);
        // Title
 
		$this->Cell(0,5,'REPÚBLICA DE EL SALVADOR, C.A.',0,1,'C');
		$this->Cell(0,5,'DIRECCIÓN NACIONAL DE MEDICAMENTOS',0,1,'C');
		//$this->Cell(0,4,'ESTABLECIMIENTOS FARMACEUTICOS',0,1,'C');
		//$this->Cell(0,4,'LISTA DE CHEQUEO',0,1,'C');	

       
        $image_file = K_PATH_IMAGES.'dnmlogo.png';
       $this->Image($image_file, 165, 8, 28, '', 'PNG', '', 'T', false, 300, '', false, false, 0, false, false, false);

       $image_file2 = K_PATH_IMAGES.'logosv.gif';
        $this->Image($image_file2, 29, 8, 28, '', 'GIF', '', 'T', false, 300, '', false, false, 0, false, false, false);
       
    }

    // Page footer
    public function Footer() {
        // Position at 15 mm from bottom
        //this->SetY(-15);
        // Set font
		 $this->SetFont('times', 'B', 10); 
		 $this->Cell(0,5,'________________________________________________',0,1,'C');
		$this->Cell(0,5,'DRA. REINA LEONOR MORALES DE ACOSTA',0,1,'C');
		$this->Cell(0,5,'DIRECTOR(A) EJECUTIVO(A)',0,1,'C');
		$this->SetFont('times', 'B', 6);
		$this->Cell(0,5,$this->usuario,0,1,'R');
		$this->Cell(0,5,$this->herramienta,0,1,'R');
		
		$this->ln(5);
        $this->SetFont('times', 'I', 7);
		$this->Cell(0,5,'Urb. Jardines del Volcán y Av. Jayaque, Ed. El Gran Bazar, 4ta planta',0,1,'C');
		$this->Cell(0,5,'Ciudad Merliot, Santa Tecla',0,1,'C');
		$this->Cell(0,4,'PBX: (503) 2522-5000; 2522-5001',0,1,'C');
		$this->Cell(0,4,'Correo: info@medicamentos.gob.sv / web: www.medicamentos.gob.sv',0,1,'C');	
    }  
    
}
class PdfSolicitudPreveinido extends TCPDF
{
    function __construct()
    {
        parent::__construct();
    }
    
      //Page header
    public function Header() {
           $this->SetFont('times', 'B', 10);
        // Title
 
		$this->Cell(0,5,'REPÚBLICA DE EL SALVADOR, C.A.',0,1,'C');
		$this->Cell(0,5,'DIRECCIÓN NACIONAL DE MEDICAMENTOS',0,1,'C');
		//$this->Cell(0,4,'ESTABLECIMIENTOS FARMACEUTICOS',0,1,'C');
		//$this->Cell(0,4,'LISTA DE CHEQUEO',0,1,'C');	

       
        $image_file = K_PATH_IMAGES.'dnmlogo.png';
       $this->Image($image_file, 165, 8, 28, '', 'PNG', '', 'T', false, 300, '', false, false, 0, false, false, false);

       $image_file2 = K_PATH_IMAGES.'logosv.gif';
        $this->Image($image_file2, 29, 8, 28, '', 'GIF', '', 'T', false, 300, '', false, false, 0, false, false, false);
       
        // Set font helveticaI courierI
     
        // $image_file = K_PATH_IMAGES.'dnmlogo.png';
       //$this->Image($image_file, 180, 10, 20, '', 'PNG', '', 'T', false, 300, '', false, false, 0, false, false, false);
    }

    // Page footer
    public function Footer() {
        // Position at 15 mm from bottom
        //this->SetY(-15);
        // Set font
        $this->SetFont('times', 'I', 7);
		$this->Cell(0,5,'Urb. Jardines del Volcán y Av. Jayaque, Ed. El Gran Bazar, 4ta planta',0,1,'C');
		$this->Cell(0,5,'Ciudad Merliot, Santa Tecla',0,1,'C');
		$this->Cell(0,4,'PBX: (503) 2522-5000; 2522-5001',0,1,'C');
		$this->Cell(0,4,'Correo: info@medicamentos.gob.sv / web: www.medicamentos.gob.sv',0,1,'C');	
    }  
    
}
class PdfOficio extends TCPDF
{
	public $usuario="";//variable publica rque recibe el usurio desde las vista o controladores
	public $tituloReporte=""; //variable publica rque recibe el numero de herramiente desde las vista o controladores
    function __construct()
    {
        parent::__construct();
    }
    
      //Page header
    public function Header() {
           $this->SetFont('courier', 'B', 10);
        // Title
 
		$this->Cell(0,5,'NOMBRE DEL CENTRO EDUCATIVO',0,1,'C');
		$this->Cell(0,5,'SIGLAS',0,1,'C');
		$this->Cell(0,5,'DISTRITO: X-X',0,1,'C');
		$this->Cell(0,5,'CÓDIGO DE INFRAESTRUCTURA: XXXX',0,1,'C');	
		$this->Cell(0,5,$this->tituloReporte,0,1,'C');	
       
        //$image_file = K_PATH_IMAGES.'dnmlogo.png';
       $this->Image("./fotografias/Logo_TV_2015.png", 165, 8, 28, '', 'PNG', '', 'T', false, 300, '', false, false, 0, false, false, false);

       //$image_file2 = K_PATH_IMAGES.'logosv.gif';
        $this->Image("./images/logosv.gif", 29, 8, 28, '', 'GIF', '', 'T', false, 300, '', false, false, 0, false, false, false);
       
    }

    // Page footer
    public function Footer() {
        // Position at 15 mm from bottom
        //this->SetY(-15);
        // Set font
		date_default_timezone_set('America/El_Salvador');
		$this->ln(5);
        $this->SetFont('courier', 'I', 7);
		$this->Cell(0,5,'Dirección del centro educativo',0,1,'C');
		$this->Cell(0,4,'Teléfonos: xxxx-xxxx',0,1,'C');
		//$this->Cell(0, 5, 'Pág. '.$this->getAliasNumPage().'/'.$this->getAliasNbPages(), 0, false, 'C', 0, '', 0, false, 'T', 'M');
		$this->SetFont('courier', 'I', 6);
		//$this->Cell(0, 2, 'Fecha y Hora de impresión: '.date("d/m/Y H:i:s"),0,1,'C');
		$this->Cell(20, 5, date("d/m/Y H:i:s"), 0, false, 'L', 0, '', 0, false, 'T', 'M');   
		$this->Cell(110, 5, 'Usuario: '.$this->usuario, 0, false, 'C', 0, '', 0, false, 'T', 'M'); 
		$this->Cell(40, 5, 'Pág. '.$this->getAliasNumPage().'/'.$this->getAliasNbPages(), 0, false, 'R', 0, '', 0, false, 'T', 'M');
		
    }  
    
}
class PdfDictamenes extends TCPDF
{
	public $usuario="";
	public $herramienta=""; 
    function __construct()
    {
        parent::__construct();
    }
    
      //Page header
    public function Header() {
           $this->SetFont('times', 'B', 10);
        // Title
 
		$this->Cell(0,5,'REPÚBLICA DE EL SALVADOR, C.A.',0,1,'C');
		$this->Cell(0,5,'DIRECCIÓN NACIONAL DE MEDICAMENTOS',0,1,'C');
		//$this->Cell(0,4,'ESTABLECIMIENTOS FARMACEUTICOS',0,1,'C');
		//$this->Cell(0,4,'LISTA DE CHEQUEO',0,1,'C');	

       
        $image_file = K_PATH_IMAGES.'dnmlogo.png';
       $this->Image($image_file, 165, 8, 28, '', 'PNG', '', 'T', false, 300, '', false, false, 0, false, false, false);

       $image_file2 = K_PATH_IMAGES.'logosv.gif';
        $this->Image($image_file2, 29, 8, 28, '', 'GIF', '', 'T', false, 300, '', false, false, 0, false, false, false);
       
    }

    // Page footer
    public function Footer() {
        // Position at 15 mm from bottom
        //this->SetY(-15);
        // Set font
		 $this->SetFont('times', 'B', 10); 
		 $this->Cell(0,5,'________________________________________________',0,1,'C');
		$this->Cell(0,5,"LIC. VICTOR MANUEL DOMÍNGUEZ",0,1,'C');
		$this->Cell(0,5,'JEFE DE LA UNIDAD JURÍDICA',0,1,'C');
		$this->SetFont('times', 'B', 6);
		$this->Cell(0,5,$this->usuario,0,1,'R');
		$this->Cell(0,5,$this->herramienta,0,1,'R');
		
		$this->ln(5);
        $this->SetFont('times', 'I', 7);
		$this->Cell(0,5,'Urb. Jardines del Volcán y Av. Jayaque, Ed. El Gran Bazar, 4ta planta',0,1,'C');
		$this->Cell(0,5,'Ciudad Merliot, Santa Tecla',0,1,'C');
		$this->Cell(0,4,'PBX: (503) 2522-5000; 2522-5001',0,1,'C');
		$this->Cell(0,4,'Correo: info@medicamentos.gob.sv / web: www.medicamentos.gob.sv',0,1,'C');	
    }  
    
}

/* application/libraries/Pdf.php */