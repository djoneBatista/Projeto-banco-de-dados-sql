<?php
		echo "<table border='1' cellpadding=\"0\" cellspacing=\"10\">\n";
		while($dados_atributo = oci_fetch_row($sql_ref_cursor)) {
			/*
			Na array $dados_atributo:
			[0] é o nome
			[1] é o tipo
			[2] é o tamanho máximo
			[3] é 'P' se o campor fizer parte da chave primária
			*/
			echo "	<tr>\n";
			echo "		<td>\n";
			if ( $dados_atributo[3] == "P") {
				echo "*";
			}
			echo "			" . $dados_atributo[0] . ": ";
			if ($dados_atributo[2] == "DATE") {
				echo "(dd/mm/aaaa)";
			}
			echo "\n";
			echo "		</td>\n";
			echo "		<td>\n";
			if ($dados_atributo[2] == "DATE") {
				/*
				Os campos tipo DATE dão trabalho...
				Tenho que detectar isso e tratar criando um controle de formulário escondido
				o qual será passado pelo POST ao destino em $acao... esse destino utilizará
				o campo escondido para detectar o campo DATE e tratá-lo adequadamente.
				Além disso tenhao que aumentar a caixa de texto para que caiba dd/mm/aaaa.
				*/
				echo "			<input type=\"hidden\" name=\"CAMPO_DATE_" . $dados_atributo[0] . "\" id=\"CAMPO_DATE_" . $dados_atributo[0] . " value=\"" . $dados_atributo[2] . "\">\n";
				$dados_atributo[1] = 10;
			}
			echo "			<input type=\"text\" name=\"" . $dados_atributo[0] . "\" id=\"" . $dados_atributo[0] . "\" maxlength=" . $dados_atributo[1] . " size=" . TAM_CAIXA_TEXTO . ">\n";
			echo "		</td>\n";
			/* echo "$dados_atributo[0], $dados_atributo[1], $dados_atributo[2]<br />\n"; */
			echo "	</tr>\n";
		}
		echo "	</table>\n";
?>