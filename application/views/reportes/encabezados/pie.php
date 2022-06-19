<?php
date_default_timezone_set('America/El_Salvador');

?>
<br><br>
				<table class="gridtable" border="0" width ="100%">
							
								<tr>
									<td style ="width:262px;">
									<?php echo date("d/m/Y H:i:s");?>
									</td>
									<td style="text-align:right;width:262px;">Usuario: <?php echo $this->session->userdata("usuario");?>
									</td>
									
								</tr>
								
							</table> 