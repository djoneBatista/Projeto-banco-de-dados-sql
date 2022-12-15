<?php
	include("constantes.php"); 
	include("conecta.php");
	include("funcoes.php");
	layout_header();
	
	/* Montagem da string de listagem */
	$sql_text = "CALL " . PACOTE2 . PROC_PARTE3 . "(:ref_cursor1, :ref_cursor2, :ref_cursor3)";
	
	$sql_parse	= oci_parse($bd, $sql_text);
	$erro 			= oci_error($bd);
	include("bd_erro.php");
	
	$sql_ref_cursor1 = oci_new_cursor($bd);
	$sql_ref_cursor2 = oci_new_cursor($bd);
	$sql_ref_cursor3 = oci_new_cursor($bd);
	
	oci_bind_by_name($sql_parse, ":ref_cursor1", $sql_ref_cursor1, MAX_TAM_PESQUISA, SQLT_RSET);
	oci_bind_by_name($sql_parse, ":ref_cursor2", $sql_ref_cursor2, MAX_TAM_PESQUISA, SQLT_RSET);
	oci_bind_by_name($sql_parse, ":ref_cursor3", $sql_ref_cursor3, MAX_TAM_PESQUISA, SQLT_RSET);
	
	oci_execute($sql_parse);
	$erro = oci_error($sql_parse);
	include("bd_erro.php");
	
	oci_execute($sql_ref_cursor1);
	$erro = oci_error($sql_ref_cursor1);
	include("bd_erro.php");
	
	oci_execute($sql_ref_cursor2);
	$erro = oci_error($sql_ref_cursor2);
	include("bd_erro.php");
	
	oci_execute($sql_ref_cursor3);
	$erro = oci_error($sql_ref_cursor3);
	include("bd_erro.php");
	
	echo "<b>RELATÓRIO DE ALUNOS REPROVADOS</b><br />\n";
	echo "<hr>\n";
	$anterior = "string_inicializadora";
	while( $linha_detalhe = oci_fetch_row($sql_ref_cursor1) ) {
		if ( $linha_detalhe[0] != $anterior ) {
			echo "<br />\n";
			echo "<u>" . $linha_detalhe[0] . " sofreu reprovação em:</u>\n";
			echo "<br />\n";
		}
		echo "" . $linha_detalhe[1] . "\n";
		echo "<br />\n";
	
		$anterior = $linha_detalhe[0];
	}
	
	echo "<br />\n";
	echo "<b>RELATÓRIO DE ALUNOS COM REPROVAÇÃO, MAS QUE CONSEGUIRAM APROVAÇÃO POSTERIOR</b>\n";
	echo "<hr>\n";
	$anterior = "string_inicializadora";
	while( $linha_detalhe = oci_fetch_row($sql_ref_cursor2) ) {
		if ( $linha_detalhe[0] != $anterior ) {
			echo "<br />\n";
			echo "<u>" . $linha_detalhe[0] . " foi aprovado em:</u>\n";
			echo "<br />\n";
		}
		echo "" . $linha_detalhe[1] . "\n";
		echo "<br />\n";
	
		$anterior = $linha_detalhe[0];
	}
	
	echo "<br />\n";
	echo "<b>RELATÓRIO DE ALUNOS COM REPROVAÇÃO E QUE AINDA PRECISAM REFAZER ALGUMA DISCIPLINA</b>\n";
	echo "<hr>\n";
	$anterior = "string_inicializadora";
	while( $linha_detalhe = oci_fetch_row($sql_ref_cursor3) ) {
		if ( $linha_detalhe[0] != $anterior ) {
			echo "<br />\n";
			echo "<u>" . $linha_detalhe[0] . " precisa refazer:</u>\n";
			echo "<br />\n";
		}
		echo "" . $linha_detalhe[1] . "\n";
		echo "<br />\n";
	
		$anterior = $linha_detalhe[0];
	}
	
	oci_free_statement($sql_parse);
	oci_free_statement($sql_ref_cursor1);
	oci_free_statement($sql_ref_cursor2);
	oci_free_statement($sql_ref_cursor3);
	include("desconecta.php");
	inicio();
	layout_base();
?>
