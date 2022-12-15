<?php
	// Fazendo a conexão com o servidor Oracle
	/*	Não foi possível utilizar a sintaxe fácil, gerava o erro
			ORA-12504: TNS:listener was not given the SERVICE_NAME in CONNECT_DATA
			por isso foi utilizada uma string de conexão TNS
			$servidor = "localhost"; */
	$servidor = "(DESCRIPTION=(ADDRESS_LIST = (ADDRESS = (PROTOCOL = TCP)(HOST = localhost)(PORT = 1521)))(CONNECT_DATA=(SID=orcl)))";
	$usuario = "u3335207";
	$senha = "u3335207";
	
	$bd = oci_connect($usuario, $senha, $servidor);
	$erro = oci_error();
	include("bd_erro.php");
?>