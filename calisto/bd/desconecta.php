<?php
	// Desconexão do Oracle usando OCI
	oci_close($bd);
	$erro = oci_error();
	include("bd_erro.php");
?>
