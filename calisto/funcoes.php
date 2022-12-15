<?php
	function voltar() {
		echo "<a href=\"java script:history.back(1)\">Voltar</a>\n";
	}
	
	function inicio() {
		echo "<center>";
		echo "	<a href=\"/calisto/\">Início</a>\n";
		echo "	<br />";
		echo "</center>";
	}

	function ir_para($destino) {
		echo "<script language=\"javascript\">\n";
		echo "	window.location=\"" . $destino . "\";\n";
		echo "</script>\n";
	}
	
	function layout_header() {
		echo "<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\n";
		echo "<html xmlns=\"http://www.w3.org/1999/xhtml\">\n";
		echo "	<head>\n";
		echo "		<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />\n";
		echo "		<title>Sistema Calisto Web - Protótipo</title>\n";
		echo "		<link href=\"css/estilos.css\" rel=\"stylesheet\" type=\"text/css\" />\n";
		echo "	</head>\n";
		echo "	<body>\n";
		echo "		<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n";
		echo "			<tr>\n";
		echo "				<td background=\"/calisto/imagens/1-.jpg\">\n";
		echo "					<img src=\"/calisto/imagens/1-2.jpg\" alt=\"\" width=\"25\" height=\"24\" align=\"right\" />\n";
		echo "					<img src=\"/calisto/imagens/1-1.jpg\" alt=\"\" align=\"left\" />\n";
		echo "				</td>\n";
		echo "			</tr>\n";
		echo "			<tr>\n";
		echo "				<td align=\"center\">\n";
		echo "					<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n";
		echo "						<tr>\n";
		echo "							<td background=\"/calisto/imagens/2-1.jpg\" width=\"25\">\n";
		echo "								<img src=\"/calisto/imagens/2-1.jpg\" alt=\"\" width=\"25\" height=\"24\" />\n";
		echo "							</td>\n";
		echo "							<td>\n";

	}
	
	function layout_base() {
		echo "							</td>\n";
		echo "							<td background=\"/calisto/imagens/2-2.jpg\" width=\"25\">\n";
		echo "								<img src=\"/calisto/imagens/2-2.jpg\" alt=\"\" width=\"25\" height=\"24\" />\n";
		echo "							</td>\n";
		echo "						</tr>\n";
		echo "					</table>\n";
		echo "				</td>\n";
		echo "			</tr>\n";
		echo "			<tr>\n";
		echo "				<td background=\"/calisto/imagens/3-.jpg\">\n";
		echo "					<img src=\"/calisto/imagens/3-2.jpg\" alt=\"\" width=\"25\" height=\"24\" align=\"right\" />\n";
		echo "					<img src=\"/calisto/imagens/3-1.jpg\" alt=\"\" width=\"25\" height=\"24\" align=\"left\" />\n";
		echo "				</td>\n";
		echo "			</tr>\n";
		echo "		</table>\n";
		echo "	</body>\n";
		echo "</html>\n";
	}
?>
