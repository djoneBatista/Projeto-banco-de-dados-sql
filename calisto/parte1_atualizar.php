<?php
	include("constantes.php"); 
	include("conecta.php");
	include("funcoes.php");
	layout_header();
	
	$tabela = $_GET["tabela"];
	$acao = "parte1_atualizar.php/?tabela=" . $tabela . "\"";

	if ( !isset($_POST["fase2"]) and !isset($_POST["fase3"]) ) {
		/* Fase 1: preencher o formulário para busca das chaves*/
		
		$sql_text				= "CALL " . PACOTE1 . "obter_chaves('" . $tabela . "', :ref_cursor)";
		$sql_parse			= oci_parse($bd, $sql_text);
		$erro = oci_error($bd);
		include("bd_erro.php");
		
		$sql_ref_cursor = oci_new_cursor($bd);
		
		oci_bind_by_name($sql_parse, ":ref_cursor", $sql_ref_cursor, MAX_TAM_NOME_ATRIBUTO, SQLT_RSET);
		
		oci_execute($sql_parse);
		$erro = oci_error($sql_parse);
		include("bd_erro.php");
		
		oci_execute($sql_ref_cursor);
		$erro = oci_error($sql_ref_cursor);
		include("bd_erro.php");
		
		echo "<!-- Tabela: " . $tabela . " -->\n";
		echo "<b>VALORES DAS CHAVES PRIMÁRIAS PARA ATUALIZAÇÃO - TABELA \"" . $tabela . "\"</b><br />\n";
		echo "<hr>\n";
		echo "Por favor, informe os valores das chaves primárias para realizar a busca. TODAS devem ser informadas.<br />\n";
		echo "<form id=\"form_remover_fase1\" name=\"form_remover_fase1\" action=\"" . $acao . "\" method=\"post\">\n";
		echo "<form id=\"form_atualizar_fase1\" name=\"form_atualizar_fase1\" action=\"" . $acao . "\" method=\"post\">\n";
		include("formulario_chave.php");
		echo "	<br/>\n";
		echo "	<input type=\"hidden\" name=\"fase2\" value=1>\n"; //manda para a próxima fase
		echo "	<input type=\"submit\" value=\"Submeter\">\n";
		echo "</form>\n";
	}

	elseif ( isset($_POST["fase2"]) ) {
		/* Fase 2: preencher o formulário com os dados par atualizar*/
		
		/*
		Primeiro temos que checar se as chaves fornecidas são válidas.
		Caso positivo, pegar os dados para preencher o formulário.
		Caso negativo, informar.
		*/
		
		/* Montagem da string de busca */
		$sql_text = "CALL " . PACOTE1 . "VERIFICA_CHAVES(:ref_cursor1, :ref_cursor2, '" . $tabela . "', ";

		foreach($_POST as $chave => $valor) {
			/* Se não for um controle hidden CAMPO_DATE */
			if ( (strpos($chave, "CAMPO_DATE") === false) and !($chave == "fase2") ) {
				/* Se o atributo atual for uma data... */
				if (isset($_POST["CAMPO_DATE_" . $chave])) {
					$valor =  "to_date('" . $valor . "', 'dd/mm/yyyy')";
				}
				else {
					$valor =  "'" . $valor . "'";
				}
				$sql_text = $sql_text . $valor . ", ";
			}
		}
		$sql_text = rtrim($sql_text, ", ") . ")";
		
		//echo "<br />$sql_text<br /><br />";
		
		$sql_parse	= oci_parse($bd, $sql_text);
		$erro 			= oci_error($bd);
		include("bd_erro.php");
		
		$sql_ref_cursor1 = oci_new_cursor($bd);
		$sql_ref_cursor2 = oci_new_cursor($bd);
		
		oci_bind_by_name($sql_parse, ":ref_cursor1", $sql_ref_cursor1, MAX_TAM_PESQUISA, SQLT_RSET);
		oci_bind_by_name($sql_parse, ":ref_cursor2", $sql_ref_cursor2, MAX_TAM_PESQUISA, SQLT_RSET);
		
		oci_execute($sql_parse);
		$erro = oci_error($sql_parse);
		include("bd_erro.php");
		
		oci_execute($sql_ref_cursor1);
		$erro = oci_error($sql_ref_cursor1);
		include("bd_erro.php");
		
		oci_execute($sql_ref_cursor2);
		$erro = oci_error($sql_ref_cursor2);
		include("bd_erro.php");		
			
		$sucesso = oci_fetch_row($sql_ref_cursor1);
		
		/* Se as chaves fornecidas não identificaram tupla alguma... */
		if ( $sucesso[0] == 0 ) {
			echo "<b>FALHA NA ATUALIZAÇÃO - TABELA \"" . $tabela . "\"</b><br />\n";
			echo "<hr>\n";
			echo "	<br />Nenhum registro encontrado! Por favor verifique os valores chaves fornecidos.<br /><br />";
		}
		/* Caso contrário... */
		else {
			$dados_carregados = oci_fetch_row($sql_ref_cursor2);
		
			/* Agora sim, montar o formulário */
			
			$sql_text				= "CALL " . PACOTE1 . "obter_atributos('" . $tabela . "', :ref_cursor)";
			$sql_parse			= oci_parse($bd, $sql_text);
			$erro = oci_error($bd);
			include("bd_erro.php");
			
			$sql_ref_cursor = oci_new_cursor($bd);
			
			oci_bind_by_name($sql_parse, ":ref_cursor", $sql_ref_cursor, MAX_TAM_NOME_ATRIBUTO, SQLT_RSET);
			
			oci_execute($sql_parse);
			$erro = oci_error($sql_parse);
			include("bd_erro.php");
			
			oci_execute($sql_ref_cursor);
			$erro = oci_error($sql_ref_cursor);
			include("bd_erro.php");
			
			echo "<!-- Tabela: " . $tabela . " -->\n";
			echo "<b>FORMULÁRIO PARA ATUALIZAÇÃO - TABELA \"" . $tabela . "\"</b><br />\n";
			echo "<hr>\n";
			echo "Os campos marcados com * são de preenchimento obrigatório.<br />\n";
			echo "<form id=\"form_atualizar_fase2\" name=\"form_atualizar_fase2\" action=\"" . $acao . "\" method=\"post\">\n";
			
			//include("formulario_corpo.php");
			
			$i = 0;
			echo "<table border='1' cellpadding=\"0\" cellspacing=\"10\">\n";
			while($dados_atributo = oci_fetch_row($sql_ref_cursor)) {
				//echo "Dados $i: " .$dados_carregados[$i];
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
				echo "			<input type=\"text\" name=\"" . $dados_atributo[0] . "\" id=\"" . $dados_atributo[0] . "\" maxlength=" . $dados_atributo[1] . " size=" . TAM_CAIXA_TEXTO . " value=\"" . $dados_carregados[$i] . "\">\n";
				echo "		</td>\n";
				/* echo "$dados_atributo[0], $dados_atributo[1], $dados_atributo[2]<br />\n"; */
				echo "	</tr>\n";
				$i++;
			}
			echo "	</table>\n";
			echo "	<br/>\n";
			echo "	<input type=\"hidden\" name=\"fase3\" value=1>\n"; //manda para a próxima fase
			echo "	<input type=\"submit\" value=\"Submeter\">\n";
			echo "</form>\n";
		}				
	}
	
	else {
		/* Fase 3: inserir na base */
		
		/* Montagem da string de atualização */
		$sql_text = "CALL " . PACOTE1 . PROC_ATUALIZAR . "(:ref_cursor, '" . $tabela . "', ";
		
		foreach($_POST as $chave => $valor) {
			/* Se não for um controle hidden CAMPO_DATE */
			if ( (strpos($chave, "CAMPO_DATE") === false) and (strpos($chave, "fase") === false) ) {
				/* Se o atributo atual for uma data... */
				if (isset($_POST["CAMPO_DATE_" . $chave])) {
					$valor =  "to_date('" . $valor . "', 'dd/mm/yyyy')";
				}
				else {
					$valor =  "'" . $valor . "'";
				}
				$sql_text = $sql_text . $valor . ", ";
			}
		}
		$sql_text = rtrim($sql_text, ", ") . ")";
		
		/* echo "<br />$sql_text<br /><br />"; */
		
		$sql_parse	= oci_parse($bd, $sql_text);
		$erro 			= oci_error($bd);
		include("bd_erro.php");
		
		$sql_ref_cursor = oci_new_cursor($bd);
		
		oci_bind_by_name($sql_parse, ":ref_cursor", $sql_ref_cursor, MAX_TAM_NOME_ATRIBUTO, SQLT_RSET);
		
		oci_execute($sql_parse);
		$erro = oci_error($sql_parse);
		include("bd_erro.php");
		
		oci_execute($sql_ref_cursor);
		$erro = oci_error($sql_ref_cursor);
		include("bd_erro.php");
		
		$sucesso = oci_fetch_row($sql_ref_cursor);
		
		if ( $sucesso[0] == 0 ) {
			echo "<b>FALHA NA ATUALIZAÇÃO - TABELA \"" . $tabela . "\"</b><br />\n";
			echo "<hr>\n";
			echo "	<br />Nenhum registro foi atualizado! Por favor verifique os valores chaves fornecidos.<br /><br />";
		}
		else {
			echo "<b>CONFIRMAÇÃO DE ATUALIZAÇÃO - TABELA \"" . $tabela . "\"</b><br />\n";
			echo "<hr>\n";
			echo "	<br />Dados atualizados com sucesso!<br /><br />";
		}
		
		oci_free_statement($sql_parse);
	}
	include("desconecta.php");
	inicio();
	layout_base();
?>