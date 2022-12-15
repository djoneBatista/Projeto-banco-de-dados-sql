<?php
	include("constantes.php"); 
	include("conecta.php");
	include("funcoes.php");
	layout_header();
	
	$tabela = $_GET["tabela"];
	$acao = "parte1_inserir.php/?tabela=" . $tabela . "\"";

	if ( !isset($_POST["fase2"]) ) {
		/* Fase 1: preencher o formulário */
		
		$sql_text		= "CALL " . PACOTE1 . "obter_atributos('" . $tabela . "', :ref_cursor)";
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
		echo "<b>FORMULÁRIO PARA INSERÇÃO - TABELA \"" . $tabela . "\"</b><br />\n";
		echo "<hr>\n";
		echo "Os campos marcados com * são de preenchimento obrigatório.<br />\n";
		echo "<form id=\"form_inserir_fase1\" name=\"form_inserir_fase1\" action=\"" . $acao . "\" method=\"post\">\n";
		include("formulario_corpo.php");
		echo "	<br/>\n";
		echo "	<input type=\"hidden\" name=\"fase2\" value=1>\n";
		echo "	<input type=\"submit\" value=\"Submeter\">\n";
		echo "</form>\n";
	}

	/* Depois de ter submetido os campos */
	else {
		/* Fase 2: inserir  */
		
		/* Montagem da string de inserção */
		$sql_text = "CALL " . PACOTE1 . PROC_INSERIR . "('" . $_GET["tabela"] . "', ";
		
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
		
		$sql_parse = oci_parse($bd, $sql_text);
		$erro = oci_error($bd);
		include("bd_erro.php");
		
		oci_execute($sql_parse);
		$erro = oci_error($sql_parse);
		include("bd_erro.php");
		
		oci_free_statement($sql_parse);
		
		echo "<b>CONFIRMAÇÃO DE INSERÇÃO - TABELA \"" . $tabela . "\"</b><br />\n";
		echo "<hr>\n";
		echo "	<br />Dados inseridos com sucesso!<br /><br />";
	}
	include("desconecta.php");
	inicio();
	layout_base();
?>
