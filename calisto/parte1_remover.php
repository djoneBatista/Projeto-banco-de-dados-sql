<?php
	include("constantes.php"); 
	include("conecta.php");
	include("funcoes.php");
	layout_header();
	
	$tabela = $_GET["tabela"];
	$acao = "parte1_remover.php/?tabela=" . $tabela . "\"";

	if ( !isset($_POST["fase2"]) ) {
		/* Fase 1: obter valores das chaves */
		
		$sql_text		= "CALL " . PACOTE1 . "obter_chaves('" . $tabela . "', :ref_cursor)";
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
		
		echo "<!-- Tabela: " . $tabela . " -->\n";
		echo "<b>VALORES DAS CHAVES PRIMÁRIAS PARA REMOÇÃO - TABELA \"" . $tabela . "\"</b><br />\n";
		echo "<hr>\n";
		echo "Por favor, informe os valores das chaves primárias para realizar a busca. TODAS devem ser informadas.<br />\n";
		echo "<form id=\"form_remover_fase1\" name=\"form_remover_fase1\" action=\"" . $acao . "\" method=\"post\">\n";
		include("formulario_chave.php");
		echo "	<br/>\n";
		echo "	<input type=\"hidden\" name=\"fase2\" value=1>\n";
		echo "	<input type=\"submit\" value=\"Submeter\">\n";
		echo "</form>\n";
		
		oci_free_statement($sql_parse);
		oci_free_statement($sql_ref_cursor);
	}

	/* Depois de ter submetido os campos chave */
	else {
		/* Fase 2: executar  */
		
		/* Montagem da string de busca */
		$sql_text = "CALL " . PACOTE1 . PROC_REMOVER . "(:ref_cursor, '" . $tabela . "', ";

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
			echo "<b>FALHA NA REMOÇÃO - TABELA \"" . $tabela . "\"</b><br />\n";
			echo "<hr>\n";
			echo "	<br />Nenhum registro foi removido! Por favor verifique os valores chaves fornecidos.<br /><br />";
		}
		else {
			echo "<b>CONFIRMAÇÃO DE REMOÇÃO - TABELA \"" . $tabela . "\"</b><br />\n";
			echo "<hr>\n";
			echo "	<br />Dados removidos com sucesso!<br /><br />";
		}
		
		oci_free_statement($sql_parse);
	}
	include("desconecta.php");
	inicio();
	layout_base();
?>