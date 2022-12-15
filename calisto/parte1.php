<?php
	include("funcoes.php");
	echo "<br />";
	layout_header();

	/* Se for a primeira vez que o formulário foi carregado */
	if( !isset($_POST['tabela']) ) {
		include("constantes.php");
		include("conecta.php");
		$acao = "parte1.php";
	
		$sql_text				= "CALL " . PACOTE1 . "obter_tabelas(:ref_cursor)";
		$sql_parse			= oci_parse($bd, $sql_text);
		$erro = oci_error($bd);
		include("bd_erro.php");
		
		$sql_ref_cursor = oci_new_cursor($bd);
		
		oci_bind_by_name($sql_parse, ":ref_cursor", $sql_ref_cursor, MAX_TAM_NOME_TABELA, SQLT_RSET);
		
		oci_execute($sql_parse);
		$erro = oci_error($sql_parse);
		include("bd_erro.php");
		
		oci_execute($sql_ref_cursor);
		$erro = oci_error($sql_ref_cursor);
		include("bd_erro.php");
		
		echo "<b>GERENCIAMENTO DE TABELAS</b>\n";
		echo "<hr>\n";
		
		echo "<b>Por favor selecione a operação desejada:</b><br />\n";
		echo "	<br />\n";
		echo "<form id=\"escolher_tabela\" name=\"escolher_tabela\" action=\"" . $acao . "\" method=\"post\">\n";
		echo "	<input type=\"radio\" name=\"operacao\" value=\"inserir\" />Inserir<br />\n";
		echo "	<input type=\"radio\" name=\"operacao\" value=\"atualizar\" />Atualizar<br />\n";
		echo "	<input type=\"radio\" name=\"operacao\" value=\"listar\" />Listar<br />\n";
		echo "	<input type=\"radio\" name=\"operacao\" value=\"remover\" />Remover<br />\n";
		echo "	<br /><br />\n";
		
		echo "<b>Por favor selecione a tabela:</b><br />\n";
		echo "<hr>\n";
		//echo "	<br />\n";
		echo "	<select name=\"tabela\">\n";
		while($nome_tabela = oci_fetch_row($sql_ref_cursor)) {	
			echo "		<option value=\"" . $nome_tabela[0] . "\">" . $nome_tabela[0] . "</option>\n";
		}
		echo "	</select>\n";
		echo "	<br /><br />\n";
		echo "	<input type=\"submit\" value=\"Submeter\">\n";
		echo "</form>\n";
		echo "<br />\n";
		
		oci_free_statement($sql_parse);
		oci_free_statement($sql_ref_cursor);
		include('desconecta.php');
	}
	
	/* Senão, se foi pressionado o botão Submeter */
	else {
		$tabela = $_POST["tabela"];
		
		if ( isset($_POST["operacao"]) ) {
			ir_para("parte1_" . $_POST["operacao"] . ".php/?tabela=" . $tabela);
		}
		else {
			echo "<b>NENHUMA OPERAÇÃO SELECIONADA</b>\n";
			echo "<hr>\n";
			echo "<br />Por favor, escolha uma operação!<br />\n";
			echo "<br />\n";
			echo "<a href=\"/calisto/parte1.php\">Voltar</a>\n";
		}
	}
	inicio();
	layout_base();
?>