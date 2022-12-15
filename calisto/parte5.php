<?php
	include("constantes.php"); 
	include("conecta.php");
	include("funcoes.php");
	layout_header();
	
	/* Montagem da string de listagem */
	$sql_text = "CALL " . PACOTE2 . PROC_PARTE5 . "(:ref_cursor1, :ref_cursor2)";
	
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
	
	echo "<b>RELATÓRIO DE DISCIPLINAS E REFERÊNCIAS</b><br />\n";
	echo "<hr>\n";
	$anterior = "string_inicializadora";
	while( $linha_detalhe = oci_fetch_row($sql_ref_cursor1) ) {
		if ( $linha_detalhe[1] != $anterior ) {
			echo "<br />\n";
			echo "<b>Disciplina: " . $linha_detalhe[1] . "</b> - Total de páginas das referências: \n";
			$total_paginas = oci_fetch_row($sql_ref_cursor2);
			echo $total_paginas[1] . "<br />\n";
			echo "<br />\n";
		}
		echo "<u>Título: " . $linha_detalhe[5] . "</u><br />\n";
		echo "Código: " . $linha_detalhe[2] . "<br />\n";
		echo "Tipo: " . $linha_detalhe[7] . "<br />\n";
		echo "Autor: " . $linha_detalhe[6] . "<br />\n";
		echo "Descrição: " . $linha_detalhe[4] . "<br />\n";
		echo "Número de páginas: " . $linha_detalhe[3] . "<br /><br />\n";
	
		$anterior = $linha_detalhe[1];
	}
	
	/*
	echo "<br />\n";
	echo "<b>RELATÓRIO 2</b>\n";
	echo "<hr>\n";
	$anterior = "string_inicializadora";
	while( $linha_detalhe = oci_fetch_row($sql_ref_cursor2) ) {
		if ( $linha_detalhe[0] != $anterior ) {
			echo "<br />\n";
			echo "<u>" . $linha_detalhe[0] . " :</u>\n";
			echo "<br />\n";
		}
		echo "" . $linha_detalhe[1] . "\n";
		echo "<br />\n";
	
		$anterior = $linha_detalhe[0];
	}
	*/
	
	oci_free_statement($sql_parse);
	oci_free_statement($sql_ref_cursor1);
	oci_free_statement($sql_ref_cursor2);
	include("desconecta.php");
	inicio();
	layout_base();
?>