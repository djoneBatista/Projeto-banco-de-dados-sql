<?php
	include("constantes.php"); 
	include("conecta.php");
	include("funcoes.php");
	layout_header();
	
	/* Montagem da string de listagem */
	$sql_text = "CALL " . PACOTE2 . PROC_PARTE2 . "(:ref_cursor)";
	
	$sql_parse	= oci_parse($bd, $sql_text);
	$erro 			= oci_error($bd);
	include("bd_erro.php");
	
	$sql_ref_cursor = oci_new_cursor($bd);
	
	oci_bind_by_name($sql_parse, ":ref_cursor", $sql_ref_cursor, MAX_TAM_PESQUISA, SQLT_RSET);
	
	oci_execute($sql_parse);
	$erro = oci_error($sql_parse);
	include("bd_erro.php");
	
	oci_execute($sql_ref_cursor);
	$erro = oci_error($sql_ref_cursor);
	include("bd_erro.php");
	
	$n_alunos = 0;
	echo "<b>LISTAGEM DOS CURSOS DO SISTEMA</b><br />\n";
	echo "<hr>\n";
	while( $linha_detalhe = oci_fetch_row($sql_ref_cursor) ) {
		if ( $linha_detalhe[2] == null ) {
			echo "<br />\n";
			echo "<b>Curso: " . $linha_detalhe[0] . " - Professor(a) coordenador(a): " . $linha_detalhe[1] . "</b>\n";
			echo "<br />\n";
			echo "<u>Alunos(as) matriculados(as):</u>\n";
			echo "<br />\n";
		}
		else {
			echo "" . $linha_detalhe[2] . "\n";
			echo "<br />\n";
			$n_alunos++;
		}
	}
	
	oci_free_statement($sql_parse);
	oci_free_statement($sql_ref_cursor);
	include("desconecta.php");
	inicio();
	layout_base();
?>
