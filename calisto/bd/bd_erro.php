<?php
		if ( !($erro === false) ) {
			echo "<hr>\n";
			echo "	<center>\n";
			echo "	<img src=\"/calisto/imagens/erro.png\" alt=\"=(\" width=\"166\" height=\"171\" align=\"center\" />\n";
			echo "	</center><br />\n";
			echo "	Sinto muito, mas houve um erro ao tentar acessar a base de dados. Você pode verificar as informações sobre o erro abaixo:<br /><br />\n";
			echo "	<table border=0>\n";
			echo "		<tr><td>Número do erro:</td><td>" . $erro["code"] . "</td></tr>\n";
			echo "		<tr><td>Descrição do erro:</td><td>" . $erro["message"] . "</td></tr>\n";
			echo "		<tr><td>Instrução geradora:</td><td>" . $erro["sqltext"] . "</td></tr>\n";
			echo "	</table>\n";
			echo "	\n";
			echo "<hr><br />\n";
			include("desconecta.php");
			inicio();
			layout_base();
			exit;
		}
?>