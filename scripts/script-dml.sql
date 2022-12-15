/*Script de DML para o sistema Calisto Web*/

--dados
--Usuario
INSERT INTO usuario (cpf_usr, rg_usr, dataNascimento, nomeUsuario, senha, nomeCompleto, tipo_usuario)
VALUES (123123123, '321123321', to_date('01/11/1990', 'dd/mm/yyyy'), 'Josualdo', 'josef', 'Josualdo de Oliveira Machado', 'administrador');

INSERT INTO usuario (cpf_usr, rg_usr, dataNascimento, nomeUsuario, senha, nomeCompleto, tipo_usuario)
VALUES (321456789, '123145647', to_date('01/12/1991', 'dd/mm/yyyy'), 'Francisco', 'franfran', 'Francisco Rui de Mattos', 'professor');

INSERT INTO usuario (cpf_usr, rg_usr, dataNascimento, nomeUsuario, senha, nomeCompleto, tipo_usuario)
VALUES (654987654, '654321122', to_date('01/10/1970', 'dd/mm/yyyy'), 'Eduardo', 'dudu', 'Eduardo Silvo e Silva', 'professor');

INSERT INTO usuario (cpf_usr, rg_usr, dataNascimento, nomeUsuario, senha, nomeCompleto, tipo_usuario)
VALUES (111222333, '333222111', to_date('01/01/1989', 'dd/mm/yyyy'), 'Marcelo', 'marc', 'Marcelo Tsglusits', 'aluno');

INSERT INTO usuario (cpf_usr, rg_usr, dataNascimento, nomeUsuario, senha, nomeCompleto, tipo_usuario)
VALUES (164656589, '124578451', to_date('01/01/1988', 'dd/mm/yyyy'), 'Daniela', 'dani', 'Daniela dos Santos', 'aluno');

INSERT INTO usuario (cpf_usr, rg_usr, dataNascimento, nomeUsuario, senha, nomeCompleto, tipo_usuario)
VALUES (998855123, '121245421', to_date('01/01/1991', 'dd/mm/yyyy'), 'Barbara', 'barbi', 'Barbara da Silva', 'aluno');

INSERT INTO usuario (cpf_usr, rg_usr, dataNascimento, nomeUsuario, senha, nomeCompleto, tipo_usuario)
VALUES (123456789, '333222111', to_date('02/05/1990', 'dd/mm/yyyy'), 'marco', 'm123', 'Marco Vicci', 'aluno');

INSERT INTO usuario (cpf_usr, rg_usr, dataNascimento, nomeUsuario, senha, nomeCompleto, tipo_usuario)
VALUES (987654321, '111222333', to_date('10/06/1993', 'dd/mm/yyyy'), 'raissa', 'r123', 'Raissa Da Silva', 'professor');

INSERT INTO usuario (cpf_usr, rg_usr, dataNascimento, nomeUsuario, senha, nomeCompleto, tipo_usuario)
VALUES (456789123, '159753456', to_date('09/07/1993', 'dd/mm/yyyy'), 'gil', 'preta', 'Preta Gil', 'administrador');

INSERT INTO usuario (cpf_usr, rg_usr, dataNascimento, nomeUsuario, senha, nomeCompleto, tipo_usuario)
VALUES (321987456, '3571159456', to_date('05/03/1991', 'dd/mm/yyyy'), 'jose', 'jj123', 'Jose Antonio da Silva', 'aluno');

INSERT INTO usuario (cpf_usr, rg_usr, dataNascimento, nomeUsuario, senha, nomeCompleto, tipo_usuario)
VALUES (158742963, '123987456', to_date('20/04/1995', 'dd/mm/yyyy'), 'halen', 'h321', 'Phill Halen', 'professor');

INSERT INTO usuario (cpf_usr, rg_usr, dataNascimento, nomeUsuario, senha, nomeCompleto, tipo_usuario)
VALUES (123456689, '123321222', to_date('02/05/1990', 'dd/mm/yyyy'), 'j01', 'j01', 'Jefferson Martins', 'aluno');

INSERT INTO usuario (cpf_usr, rg_usr, dataNascimento, nomeUsuario, senha, nomeCompleto, tipo_usuario)
VALUES (123455789, '123321333', to_date('02/05/1990', 'dd/mm/yyyy'), 'jaum', 'j123', 'Joao Antonio', 'aluno');

INSERT INTO usuario (cpf_usr, rg_usr, dataNascimento, nomeUsuario, senha, nomeCompleto, tipo_usuario)
VALUES (123446789, '123321111', to_date('02/05/1990', 'dd/mm/yyyy'), 'huguinho', 'Hugo Andrade', 'Marco Vicci', 'aluno');

INSERT INTO usuario (cpf_usr, rg_usr, dataNascimento, nomeUsuario, senha, nomeCompleto, tipo_usuario)
VALUES (123356789, '345543444', to_date('02/05/1990', 'dd/mm/yyyy'), 'donald', 'opato', 'Donald da Silva', 'aluno');

INSERT INTO usuario (cpf_usr, rg_usr, dataNascimento, nomeUsuario, senha, nomeCompleto, tipo_usuario)
VALUES (122456789, '345543555', to_date('02/05/1990', 'dd/mm/yyyy'), 'gui', 'guizao', 'Guilherme Antonio Morais', 'aluno');

--curso
INSERT INTO curso (codCurso, nomeCurso, qtdSemetresCurso, qtdMaxSemestresCurso, nroCredTotalCurso)
VALUES (1, 'Bacharelado em Informática', 8, 14, 300);

INSERT INTO curso (codCurso, nomeCurso, qtdSemetresCurso, qtdMaxSemestresCurso, nroCredTotalCurso)
VALUES (2, 'Bacharelado em Ciências de Computação', 10, 18, 400);

INSERT INTO curso (codCurso, nomeCurso, qtdSemetresCurso, qtdMaxSemestresCurso, nroCredTotalCurso)
VALUES (3, 'Física', 8, 14, 300);

INSERT INTO curso (codCurso, nomeCurso, qtdSemetresCurso, qtdMaxSemestresCurso, nroCredTotalCurso)
VALUES (4, 'Arquitetura', 8, 14, 300);

INSERT INTO curso (codCurso, nomeCurso, qtdSemetresCurso, qtdMaxSemestresCurso, nroCredTotalCurso)
VALUES (5, 'Engenharia Elétrica', 10, 18, 400);

INSERT INTO curso (codCurso, nomeCurso, qtdSemetresCurso, qtdMaxSemestresCurso, nroCredTotalCurso)
VALUES (6, 'Engenharia Civil', 10, 18, 400);

INSERT INTO curso (codCurso, nomeCurso, qtdSemetresCurso, qtdMaxSemestresCurso, nroCredTotalCurso)
VALUES (7, 'Engenharia de Minas', 10, 18, 400);

INSERT INTO curso (codCurso, nomeCurso, qtdSemetresCurso, qtdMaxSemestresCurso, nroCredTotalCurso)
VALUES (8, 'Tenologia da Informacao', 8, 14, 300);

--aluno
INSERT INTO aluno(cpfAluno, cidadeOrigemAluno, enderecoAluno, codCursoAluno)
VALUES (123456689, 'Aracaju', 'Av. Jose da Costa, 99', 4);

INSERT INTO aluno(cpfAluno, cidadeOrigemAluno, enderecoAluno, codCursoAluno)
VALUES (123455789, 'Rio Branco', 'Av. Jose, 89', 3);

INSERT INTO aluno(cpfAluno, cidadeOrigemAluno, enderecoAluno, codCursoAluno)
VALUES (123446789, 'Belo Horizonte', 'Rua das Orquideas, 29', 8);

INSERT INTO aluno(cpfAluno, cidadeOrigemAluno, enderecoAluno, codCursoAluno)
VALUES (123356789, 'Sao Paulo', 'Rua Seca, 39', 4);

INSERT INTO aluno(cpfAluno, cidadeOrigemAluno, enderecoAluno, codCursoAluno)
VALUES (122456789, 'Rio de Janeiro', 'Av. Mococa, 19', 4);

INSERT INTO aluno(cpfAluno, cidadeOrigemAluno, enderecoAluno, codCursoAluno)
VALUES (164656589, 'Jacarei', 'Rua das Flores, 99', 1);

INSERT INTO aluno(cpfAluno, cidadeOrigemAluno, enderecoAluno, codCursoAluno)
VALUES (998855123, 'Santos', 'Rua dos Morros, 8', 2);

INSERT INTO aluno(cpfAluno, cidadeOrigemAluno, enderecoAluno, codCursoAluno)
VALUES (111222333, 'Diadema', 'Av. Francisco, 288', 4);

INSERT INTO aluno(cpfAluno, cidadeOrigemAluno, enderecoAluno, codCursoAluno)
VALUES (321987456, 'Iracemapolis', 'Av. Jose da Silva, 9', 4);

--professor
INSERT INTO professor(cpfProfessor, titulacaoProfessor, categoriaProfessor, codCursoCoordenador)
VALUES (321456789, 'mestre', 'C1', 1);

INSERT INTO professor(cpfProfessor, titulacaoProfessor, categoriaProfessor, codCursoCoordenador)
VALUES (654987654, 'doutor', 'C3', 2);

INSERT INTO professor(cpfProfessor, titulacaoProfessor, categoriaProfessor, codCursoCoordenador)
VALUES (987654321, 'doutor', 'C3', 3);

INSERT INTO professor(cpfProfessor, titulacaoProfessor, categoriaProfessor, codCursoCoordenador)
VALUES (158742963, 'doutor', 'C2', 4);


--administrador
INSERT INTO administrador(cpfAdministrador, privilegioAdministrador)
VALUES (123123123, 2);

INSERT INTO administrador(cpfAdministrador, privilegioAdministrador)
VALUES (456789123, 1);

--instituto
INSERT INTO instituto(siglaInstituto, nomeInstituto, cidadeInstituto)
VALUES ('ICMC', 'Instituto de Ciências Matemáticas e de Computação', 'São Carlos');

INSERT INTO instituto(siglaInstituto, nomeInstituto, cidadeInstituto)
VALUES ('IQSC', 'Instituto de Química de São Carlos', 'São Carlos');

INSERT INTO instituto(siglaInstituto, nomeInstituto, cidadeInstituto)
VALUES ('IFSC', 'Instituto de Física de São Carlos', 'São Carlos');

INSERT INTO instituto(siglaInstituto, nomeInstituto, cidadeInstituto)
VALUES ('EESC', 'Escola de Engenharia de São Carlos', 'São Carlos');

INSERT INTO instituto(siglaInstituto, nomeInstituto, cidadeInstituto)
VALUES ('IAU', 'Instituto de Arquitetura e Urbanismo', 'São Carlos');

INSERT INTO instituto(siglaInstituto, nomeInstituto, cidadeInstituto)
VALUES ('IA', 'Instituto de Artes', 'Campinas');

INSERT INTO instituto(siglaInstituto, nomeInstituto, cidadeInstituto)
VALUES ('IB', 'Instituto de Biociencias', 'São Paulo');

INSERT INTO instituto(siglaInstituto, nomeInstituto, cidadeInstituto)
VALUES ('IP', 'Instituto de Psicologia', 'São Paulo');

--disciplina
INSERT INTO disciplina(siglaDisc, cpfProfDisc, siglaInstitutoDisc, QtdCreditosTotalDisc, QtdAulasTotalDisc, SemestreDisc, AnoDisc, NomeDisc, ProgramaDisc, MetodoAvalDisc)
VALUES ('SCC01', 321456789, 'ICMC', 30, 10, 1, 2012, 'Banco de Dados', 'Algebra Relacional', 'Média Ponderada');

INSERT INTO disciplina(siglaDisc, cpfProfDisc, siglaInstitutoDisc, QtdCreditosTotalDisc, QtdAulasTotalDisc, SemestreDisc, AnoDisc, NomeDisc, ProgramaDisc, MetodoAvalDisc)
VALUES ('SCC02', 654987654, 'ICMC', 30, 10, 1, 2012, 'Alg 1', 'Algoritmos Gerais', 'Média Ponderada');

INSERT INTO disciplina(siglaDisc, cpfProfDisc, siglaInstitutoDisc, QtdCreditosTotalDisc, QtdAulasTotalDisc, SemestreDisc, AnoDisc, NomeDisc, ProgramaDisc, MetodoAvalDisc)
VALUES ('SCC03', 321456789, 'ICMC', 30, 10, 1, 2012, 'Alg 1', 'Algoritmos Gerais', 'Média Ponderada');

INSERT INTO disciplina(siglaDisc, cpfProfDisc, siglaInstitutoDisc, QtdCreditosTotalDisc, QtdAulasTotalDisc, SemestreDisc, AnoDisc, NomeDisc, ProgramaDisc, MetodoAvalDisc)
VALUES ('SCC04', 654987654, 'ICMC', 30, 10, 1, 2012, 'Alg 1', 'Algoritmos Gerais', 'Média Ponderada');

INSERT INTO disciplina(siglaDisc, cpfProfDisc, siglaInstitutoDisc, QtdCreditosTotalDisc, QtdAulasTotalDisc, SemestreDisc, AnoDisc, NomeDisc, ProgramaDisc, MetodoAvalDisc)
VALUES ('SCC05', 158742963, 'ICMC', 30, 10, 1, 2012, 'Alg 1', 'Algoritmos Gerais', 'Média Ponderada');

INSERT INTO disciplina(siglaDisc, cpfProfDisc, siglaInstitutoDisc, QtdCreditosTotalDisc, QtdAulasTotalDisc, SemestreDisc, AnoDisc, NomeDisc, ProgramaDisc, MetodoAvalDisc)
VALUES ('SCC06', 987654321, 'ICMC', 30, 10, 1, 2012, 'Alg 1', 'Algoritmos Gerais', 'Média Ponderada');

--preRequisito
/*
Aqui foi feita uma alteração semântica importante. Consideramos:
siglaDisc = Sigla da Disciplina, por exemplo SCC02
siglaReq  = Sigla do Requisito, por exemplo SCC01
*/
INSERT INTO preRequisito(siglaDisc, siglaReq)
VALUES ('SCC02', 'SCC01');

INSERT INTO preRequisito(siglaDisc, siglaReq)
VALUES ('SCC05', 'SCC03');

INSERT INTO preRequisito(siglaDisc, siglaReq)
VALUES ('SCC06', 'SCC05');

INSERT INTO preRequisito(siglaDisc, siglaReq)
VALUES ('SCC03', 'SCC02');

--cursa
INSERT INTO cursa(cpfCursa, siglaDisciplinaCursa, anoSemestreCursa, aprovadoCursa, notaCursa, nroAulasFreqCursa, porcentPresencaCursa)
VALUES (164656589, 'SCC01', '01/2012', '-', 0, 5, 50);

INSERT INTO cursa(cpfCursa, siglaDisciplinaCursa, anoSemestreCursa, aprovadoCursa, notaCursa, nroAulasFreqCursa, porcentPresencaCursa)
VALUES (164656589, 'SCC02', '01/2012', '-', 0, 5, 50);

INSERT INTO cursa(cpfCursa, siglaDisciplinaCursa, anoSemestreCursa, aprovadoCursa, notaCursa, nroAulasFreqCursa, porcentPresencaCursa)
VALUES (998855123, 'SCC02', '01/2012', '-', 0, 5, 50);

INSERT INTO cursa(cpfCursa, siglaDisciplinaCursa, anoSemestreCursa, aprovadoCursa, notaCursa, nroAulasFreqCursa, porcentPresencaCursa)
VALUES (111222333, 'SCC01', '01/2012', '-', 0, 5, 50);

INSERT INTO cursa(cpfCursa, siglaDisciplinaCursa, anoSemestreCursa, aprovadoCursa, notaCursa, nroAulasFreqCursa, porcentPresencaCursa)
VALUES (111222333, 'SCC02', '01/2012', '-', 0, 5, 50);

INSERT INTO cursa(cpfCursa, siglaDisciplinaCursa, anoSemestreCursa, aprovadoCursa, notaCursa, nroAulasFreqCursa, porcentPresencaCursa)
VALUES (321987456, 'SCC03', '01/2012', '-', 0, 5, 50);

INSERT INTO cursa(cpfCursa, siglaDisciplinaCursa, anoSemestreCursa, aprovadoCursa, notaCursa, nroAulasFreqCursa, porcentPresencaCursa)
VALUES (111222333, 'SCC03', '01/2012', '-', 0, 5, 50);

INSERT INTO cursa(cpfCursa, siglaDisciplinaCursa, anoSemestreCursa, aprovadoCursa, notaCursa, nroAulasFreqCursa, porcentPresencaCursa)
VALUES (998855123, 'SCC04', '01/2012', '-', 0, 5, 50);

--possui_cursoInstituto
INSERT INTO possui_cursoInstituto(codCursoP, sigInstitutoP) VALUES (1, 'ICMC');
INSERT INTO possui_cursoInstituto(codCursoP, sigInstitutoP) VALUES (2, 'ICMC');
INSERT INTO possui_cursoInstituto(codCursoP, sigInstitutoP) VALUES (3, 'IFSC');
INSERT INTO possui_cursoInstituto(codCursoP, sigInstitutoP) VALUES (4, 'IAU');
INSERT INTO possui_cursoInstituto(codCursoP, sigInstitutoP) VALUES (5, 'EESC');

--aulaPratica
INSERT INTO aulaPratica(siglaDisciplinaAP, dataAP) VALUES ('SCC01', to_date('21/03/2012', 'dd/mm/yyyy'));
INSERT INTO aulaPratica(siglaDisciplinaAP, dataAP) VALUES ('SCC01', to_date('27/03/2012', 'dd/mm/yyyy'));
INSERT INTO aulaPratica(siglaDisciplinaAP, dataAP) VALUES ('SCC01', to_date('04/04/2012', 'dd/mm/yyyy'));
INSERT INTO aulaPratica(siglaDisciplinaAP, dataAP) VALUES ('SCC01', to_date('14/04/2012', 'dd/mm/yyyy'));
INSERT INTO aulaPratica(siglaDisciplinaAP, dataAP) VALUES ('SCC01', to_date('23/04/2012', 'dd/mm/yyyy'));

INSERT INTO aulaPratica(siglaDisciplinaAP, dataAP) VALUES ('SCC02', to_date('21/03/2012', 'dd/mm/yyyy'));
INSERT INTO aulaPratica(siglaDisciplinaAP, dataAP) VALUES ('SCC02', to_date('27/03/2012', 'dd/mm/yyyy'));
INSERT INTO aulaPratica(siglaDisciplinaAP, dataAP) VALUES ('SCC02', to_date('04/04/2012', 'dd/mm/yyyy'));
INSERT INTO aulaPratica(siglaDisciplinaAP, dataAP) VALUES ('SCC02', to_date('14/04/2012', 'dd/mm/yyyy'));
INSERT INTO aulaPratica(siglaDisciplinaAP, dataAP) VALUES ('SCC02', to_date('23/04/2012', 'dd/mm/yyyy'));

INSERT INTO aulaPratica(siglaDisciplinaAP, dataAP) VALUES ('SCC03', to_date('22/03/2012', 'dd/mm/yyyy'));
INSERT INTO aulaPratica(siglaDisciplinaAP, dataAP) VALUES ('SCC03', to_date('28/03/2012', 'dd/mm/yyyy'));
INSERT INTO aulaPratica(siglaDisciplinaAP, dataAP) VALUES ('SCC03', to_date('05/04/2012', 'dd/mm/yyyy'));
INSERT INTO aulaPratica(siglaDisciplinaAP, dataAP) VALUES ('SCC03', to_date('15/04/2012', 'dd/mm/yyyy'));
INSERT INTO aulaPratica(siglaDisciplinaAP, dataAP) VALUES ('SCC03', to_date('24/04/2012', 'dd/mm/yyyy'));

--equipamento
INSERT INTO equipamento(codEquipamento, nomeEquipamento) VALUES (1, 'Projetor');
INSERT INTO equipamento(codEquipamento, nomeEquipamento) VALUES (2, 'Mesa de prototipação');
INSERT INTO equipamento(codEquipamento, nomeEquipamento) VALUES (3, 'FPGA');
INSERT INTO equipamento(codEquipamento, nomeEquipamento) VALUES (4, 'Maquina de Solda');
INSERT INTO equipamento(codEquipamento, nomeEquipamento) VALUES (5, 'ProtoBoard');
INSERT INTO equipamento(codEquipamento, nomeEquipamento) VALUES (6, 'Equipamento de Som');
INSERT INTO equipamento(codEquipamento, nomeEquipamento) VALUES (7, 'Roteador');
INSERT INTO equipamento(codEquipamento, nomeEquipamento) VALUES (8, 'notebook');

--usa_aulaEquipamento
INSERT INTO usa_aulaEquipamento(codEquipamento_usa, siglaDiscAP_usa, dataAP_usa) VALUES (1, 'SCC01',  to_date('21/03/2012', 'dd/mm/yyyy'));
INSERT INTO usa_aulaEquipamento(codEquipamento_usa, siglaDiscAP_usa, dataAP_usa) VALUES (6, 'SCC01',  to_date('21/03/2012', 'dd/mm/yyyy'));
INSERT INTO usa_aulaEquipamento(codEquipamento_usa, siglaDiscAP_usa, dataAP_usa) VALUES (1, 'SCC01',  to_date('27/03/2012', 'dd/mm/yyyy'));
INSERT INTO usa_aulaEquipamento(codEquipamento_usa, siglaDiscAP_usa, dataAP_usa) VALUES (6, 'SCC01',  to_date('27/03/2012', 'dd/mm/yyyy'));
INSERT INTO usa_aulaEquipamento(codEquipamento_usa, siglaDiscAP_usa, dataAP_usa) VALUES (1, 'SCC01',  to_date('04/04/2012', 'dd/mm/yyyy'));
INSERT INTO usa_aulaEquipamento(codEquipamento_usa, siglaDiscAP_usa, dataAP_usa) VALUES (6, 'SCC01',  to_date('04/04/2012', 'dd/mm/yyyy'));
INSERT INTO usa_aulaEquipamento(codEquipamento_usa, siglaDiscAP_usa, dataAP_usa) VALUES (1, 'SCC01',  to_date('23/04/2012', 'dd/mm/yyyy'));
INSERT INTO usa_aulaEquipamento(codEquipamento_usa, siglaDiscAP_usa, dataAP_usa) VALUES (6, 'SCC01',  to_date('23/04/2012', 'dd/mm/yyyy'));

--referencia
INSERT INTO referencia(codReferencia, qtdPaginas, descricao, titulo, autor, tipoReferencia)
VALUES (1, 10, 'Manual de Ligar um Computador', 'Desvendando o Power Button', 'MicroDum', 'outro');

INSERT INTO referencia(codReferencia, qtdPaginas, descricao, titulo, autor, tipoReferencia)
VALUES (2, 250, 'Introdução a Linguagem C', 'C Completo Total', 'José', 'livro');

INSERT INTO referencia(codReferencia, qtdPaginas, descricao, titulo, autor, tipoReferencia)
VALUES (3, 70, 'Introdução a regras de associação', 'Association Rules: A Survey', 'Aggraw', 'artigo');

INSERT INTO referencia(codReferencia, qtdPaginas, descricao, titulo, autor, tipoReferencia)
VALUES (4, 10, 'A mulher e a cozinha', 'Para a mulher moderna', 'Solucoes', 'outro');

INSERT INTO referencia(codReferencia, qtdPaginas, descricao, titulo, autor, tipoReferencia)
VALUES (5, 250, 'Aprendendo C em dois dias', 'C Completo Total', 'Silva', 'livro');

INSERT INTO referencia(codReferencia, qtdPaginas, descricao, titulo, autor, tipoReferencia)
VALUES (6, 70, 'Introdução a metodos de acesso metricos', 'MAMs', 'C. T. Jr.', 'artigo');

--livro
INSERT INTO livro(codLivro, editora)
VALUES (2, 'Abril');

INSERT INTO livro(codLivro, editora)
VALUES (5, 'Globo');

--artigo
INSERT INTO artigo(codArtigo, url, conferencia)
VALUES (3, 'www.kddsigmod.com/123213', 'kdd sigmod');
INSERT INTO artigo(codArtigo, url, conferencia)
VALUES (6, 'www.acm.com/123456', 'acm');

--utiliza_discReferencia
INSERT INTO utiliza_discReferencia(codReferencia_util, sigDisciplina_util) VALUES (1, 'SCC01');
INSERT INTO utiliza_discReferencia(codReferencia_util, sigDisciplina_util) VALUES (1, 'SCC02');
INSERT INTO utiliza_discReferencia(codReferencia_util, sigDisciplina_util) VALUES (2, 'SCC01');
INSERT INTO utiliza_discReferencia(codReferencia_util, sigDisciplina_util) VALUES (2, 'SCC03');
INSERT INTO utiliza_discReferencia(codReferencia_util, sigDisciplina_util) VALUES (3, 'SCC03');
INSERT INTO utiliza_discReferencia(codReferencia_util, sigDisciplina_util) VALUES (2, 'SCC02');

INSERT INTO utiliza_discReferencia(codReferencia_util, sigDisciplina_util) VALUES (1, 'SCC03');
INSERT INTO utiliza_discReferencia(codReferencia_util, sigDisciplina_util) VALUES (4, 'SCC03');
INSERT INTO utiliza_discReferencia(codReferencia_util, sigDisciplina_util) VALUES (5, 'SCC04');
INSERT INTO utiliza_discReferencia(codReferencia_util, sigDisciplina_util) VALUES (6, 'SCC04');


/* ************************************************************************************
***************************************************************************************

Script de DDL para o projeto

***************************************************************************************
************************************************************************************ */


-- Exercico 3
-- Updates na tebala cursa somente para checagem dos selects
UPDATE L09_CURSA SET NOTACURSA=2 WHERE CPFCURSA=111222333 and ANOSEMESTRECURSA='01/2012';
UPDATE L09_CURSA SET NOTACURSA=10 ,ANOSEMESTRECURSA='01/2013',sigladisciplinacursa='SCC01' WHERE CPFCURSA=111222333 and sigladisciplinacursa='SCC02';
UPDATE L09_CURSA SET NOTACURSA=6.25 WHERE CPFCURSA=164656589 ;   
UPDATE L09_CURSA SET NOTACURSA=3 WHERE CPFCURSA=998855123 ;   
UPDATE L09_CURSA SET NOTACURSA=5.23 WHERE CPFCURSA=321987456 ; 


-- Dados adicionais para testes
--Usuario
INSERT INTO usuario (cpf_usr, rg_usr, dataNascimento, nomeUsuario, senha, nomeCompleto, tipo_usuario)
VALUES (11111111111, '44444222222', to_date('01/11/1990', 'dd/mm/yyyy'), 'Luthor', 'lex', 'Lex Luthor', 'administrador');

INSERT INTO usuario (cpf_usr, rg_usr, dataNascimento, nomeUsuario, senha, nomeCompleto, tipo_usuario)
VALUES (99999999999, '00000000000', to_date('09/07/1993', 'dd/mm/yyyy'), 'Negra', 'matadora', 'Viúva Negra', 'administrador');

INSERT INTO usuario (cpf_usr, rg_usr, dataNascimento, nomeUsuario, senha, nomeCompleto, tipo_usuario)
VALUES (21111111111, '44444222222', to_date('20/04/1995', 'dd/mm/yyyy'), 'Gavio', 'flecha', 'Gavião Arqueiro', 'professor');

INSERT INTO usuario (cpf_usr, rg_usr, dataNascimento, nomeUsuario, senha, nomeCompleto, tipo_usuario)
VALUES (88888888888, '77777777777', to_date('10/06/1993', 'dd/mm/yyyy'), 'America', 'cap', 'Capitão América', 'professor');

INSERT INTO usuario (cpf_usr, rg_usr, dataNascimento, nomeUsuario, senha, nomeCompleto, tipo_usuario)
VALUES (44444222222, '11111111111', to_date('01/12/1991', 'dd/mm/yyyy'), 'Supergirl', 'super', 'Lara Kent', 'professor');

INSERT INTO usuario (cpf_usr, rg_usr, dataNascimento, nomeUsuario, senha, nomeCompleto, tipo_usuario)
VALUES (33333333333, '44444444444', to_date('01/10/1970', 'dd/mm/yyyy'), 'Jhon', 'carter', 'Jhon Carter from Earth', 'aluno');

INSERT INTO usuario (cpf_usr, rg_usr, dataNascimento, nomeUsuario, senha, nomeCompleto, tipo_usuario)
VALUES (44444444444, '33333333333', to_date('01/01/1989', 'dd/mm/yyyy'), 'Loki', 'loco', 'Loki from Asgard', 'aluno');

INSERT INTO usuario (cpf_usr, rg_usr, dataNascimento, nomeUsuario, senha, nomeCompleto, tipo_usuario)
VALUES (55555555555, '66666666666', to_date('01/01/1988', 'dd/mm/yyyy'), 'Maravilha', 'mara', 'Mulher Maravilha', 'aluno');

INSERT INTO usuario (cpf_usr, rg_usr, dataNascimento, nomeUsuario, senha, nomeCompleto, tipo_usuario)
VALUES (66666666666, '55555555555', to_date('01/01/1991', 'dd/mm/yyyy'), 'Batiman', 'batima', 'Batiman o Homem-Morcegão', 'aluno');

INSERT INTO usuario (cpf_usr, rg_usr, dataNascimento, nomeUsuario, senha, nomeCompleto, tipo_usuario)
VALUES (77777777777, '88888888888', to_date('02/05/1990', 'dd/mm/yyyy'), 'Thor', 'thor', 'Thor Deus do Trovão', 'aluno');

INSERT INTO usuario (cpf_usr, rg_usr, dataNascimento, nomeUsuario, senha, nomeCompleto, tipo_usuario)
VALUES (00000000000, '99999999999', to_date('05/03/1991', 'dd/mm/yyyy'), 'HomemDeFerro', 'jarvis', 'Tony Stark', 'aluno');

INSERT INTO usuario (cpf_usr, rg_usr, dataNascimento, nomeUsuario, senha, nomeCompleto, tipo_usuario)
VALUES (88444222222, '21111111111', to_date('02/05/1990', 'dd/mm/yyyy'), 'Hulk', 'smash', 'Dr. Bruce Banner', 'aluno');

INSERT INTO usuario (cpf_usr, rg_usr, dataNascimento, nomeUsuario, senha, nomeCompleto, tipo_usuario)
VALUES (23333333333, '24444444444', to_date('02/05/1990', 'dd/mm/yyyy'), 'Odin', 'deus', 'Odin Deus de Asgard', 'aluno');

INSERT INTO usuario (cpf_usr, rg_usr, dataNascimento, nomeUsuario, senha, nomeCompleto, tipo_usuario)
VALUES (24444444444, '23333333333', to_date('02/05/1990', 'dd/mm/yyyy'), 'Superman', 'krypton', 'Clark Kent', 'aluno');

INSERT INTO usuario (cpf_usr, rg_usr, dataNascimento, nomeUsuario, senha, nomeCompleto, tipo_usuario)
VALUES (25555555555, '26666666666', to_date('02/05/1990', 'dd/mm/yyyy'), 'Peixe', 'mar', 'Aquaman', 'aluno');

INSERT INTO usuario (cpf_usr, rg_usr, dataNascimento, nomeUsuario, senha, nomeCompleto, tipo_usuario)
VALUES (26666666666, '25555555555', to_date('02/05/1990', 'dd/mm/yyyy'), 'Lanterna', 'verde', 'Lanterna Verde', 'aluno');

--curso
INSERT INTO curso (codCurso, nomeCurso, qtdSemetresCurso, qtdMaxSemestresCurso, nroCredTotalCurso)
VALUES (9, 'Bacharelado em Supereroísmo', 8, 14, 300);

INSERT INTO curso (codCurso, nomeCurso, qtdSemetresCurso, qtdMaxSemestresCurso, nroCredTotalCurso)
VALUES (10, 'Bacharelado em Ciências Ocultas', 10, 18, 400);

INSERT INTO curso (codCurso, nomeCurso, qtdSemetresCurso, qtdMaxSemestresCurso, nroCredTotalCurso)
VALUES (11, 'Bacharelado em Salvamento de Universo', 8, 14, 300);

INSERT INTO curso (codCurso, nomeCurso, qtdSemetresCurso, qtdMaxSemestresCurso, nroCredTotalCurso)
VALUES (12, 'Arquitetura de Artefatos Místicos', 8, 14, 300);

--aluno
INSERT INTO aluno(cpfAluno, cidadeOrigemAluno, enderecoAluno, codCursoAluno)
VALUES (44444444444, 'Rio Branco', 'Av. Jose, 89', 10);

INSERT INTO aluno(cpfAluno, cidadeOrigemAluno, enderecoAluno, codCursoAluno)
VALUES (33333333333, 'Rio Branco', 'Av. Jose, 89', 10);

INSERT INTO aluno(cpfAluno, cidadeOrigemAluno, enderecoAluno, codCursoAluno)
VALUES (55555555555, 'Belo Horizonte', 'Rua das Orquideas, 29', 11);

INSERT INTO aluno(cpfAluno, cidadeOrigemAluno, enderecoAluno, codCursoAluno)
VALUES (66666666666, 'Sao Paulo', 'Rua Seca, 39', 12);

INSERT INTO aluno(cpfAluno, cidadeOrigemAluno, enderecoAluno, codCursoAluno)
VALUES (77777777777, 'Rio de Janeiro', 'Av. Mococa, 19', 9);

INSERT INTO aluno(cpfAluno, cidadeOrigemAluno, enderecoAluno, codCursoAluno)
VALUES (00000000000, 'Jacarei', 'Rua das Flores, 99', 10);

INSERT INTO aluno(cpfAluno, cidadeOrigemAluno, enderecoAluno, codCursoAluno)
VALUES (88444222222, 'Santos', 'Rua dos Morros, 8', 11);

INSERT INTO aluno(cpfAluno, cidadeOrigemAluno, enderecoAluno, codCursoAluno)
VALUES (23333333333, 'Diadema', 'Av. Francisco, 288', 12);

INSERT INTO aluno(cpfAluno, cidadeOrigemAluno, enderecoAluno, codCursoAluno)
VALUES (24444444444, 'Iracemapolis', 'Av. Jose da Silva, 9', 9);

INSERT INTO aluno(cpfAluno, cidadeOrigemAluno, enderecoAluno, codCursoAluno)
VALUES (25555555555, 'Iracemapolis', 'Av. Jose da Silva, 9', 10);

INSERT INTO aluno(cpfAluno, cidadeOrigemAluno, enderecoAluno, codCursoAluno)
VALUES (26666666666, 'Iracemapolis', 'Av. Jose da Silva, 9', 11);

--professor
INSERT INTO professor(cpfProfessor, titulacaoProfessor, categoriaProfessor, codCursoCoordenador)
VALUES (21111111111, 'mestre', 'C1', 9);

INSERT INTO professor(cpfProfessor, titulacaoProfessor, categoriaProfessor, codCursoCoordenador)
VALUES (88888888888, 'doutor', 'C3', 10);

INSERT INTO professor(cpfProfessor, titulacaoProfessor, categoriaProfessor, codCursoCoordenador)
VALUES (44444222222, 'mestre', 'C2', 11);

INSERT INTO professor(cpfProfessor, titulacaoProfessor, categoriaProfessor, codCursoCoordenador)
VALUES (33333333333, 'doutor', 'C3', 12);


--administrador
INSERT INTO administrador(cpfAdministrador, privilegioAdministrador)
VALUES (11111111111, 2);

INSERT INTO administrador(cpfAdministrador, privilegioAdministrador)
VALUES (99999999999, 1);

--instituto
INSERT INTO instituto(siglaInstituto, nomeInstituto, cidadeInstituto)
VALUES ('STARK', 'Instituto de Pesquisa Tony Stark', 'New York');

INSERT INTO instituto(siglaInstituto, nomeInstituto, cidadeInstituto)
VALUES ('SHELD', 'Instituto para Salvar o Mundo', 'Top Secret');


--disciplina
INSERT INTO disciplina(siglaDisc, cpfProfDisc, siglaInstitutoDisc, QtdCreditosTotalDisc, QtdAulasTotalDisc, SemestreDisc, AnoDisc, NomeDisc, ProgramaDisc, MetodoAvalDisc)
VALUES ('STK01', 21111111111, 'STARK', 30, 10, 1, 2012, 'Introdução à Robótica', 'Como fazer seu próprio Homem de Ferro.', 'Média Ponderada');

INSERT INTO disciplina(siglaDisc, cpfProfDisc, siglaInstitutoDisc, QtdCreditosTotalDisc, QtdAulasTotalDisc, SemestreDisc, AnoDisc, NomeDisc, ProgramaDisc, MetodoAvalDisc)
VALUES ('STK02', 88888888888, 'STARK', 30, 10, 1, 2012, 'Tecnologia em ARC', 'Como colocar geradores de energia no tórax', 'Média Ponderada');

INSERT INTO disciplina(siglaDisc, cpfProfDisc, siglaInstitutoDisc, QtdCreditosTotalDisc, QtdAulasTotalDisc, SemestreDisc, AnoDisc, NomeDisc, ProgramaDisc, MetodoAvalDisc)
VALUES ('STK03', 44444222222, 'STARK', 30, 10, 1, 2012, 'Fundamentos do Bilhão', 'Como deve agir um bilionário filantropo playboy.', 'Média Ponderada');

INSERT INTO disciplina(siglaDisc, cpfProfDisc, siglaInstitutoDisc, QtdCreditosTotalDisc, QtdAulasTotalDisc, SemestreDisc, AnoDisc, NomeDisc, ProgramaDisc, MetodoAvalDisc)
VALUES ('SHI01', 44444222222, 'SHELD', 30, 10, 1, 2012, 'Fundamentos de Destruição', 'Como evitar que aconteça.', 'Média Ponderada');

INSERT INTO disciplina(siglaDisc, cpfProfDisc, siglaInstitutoDisc, QtdCreditosTotalDisc, QtdAulasTotalDisc, SemestreDisc, AnoDisc, NomeDisc, ProgramaDisc, MetodoAvalDisc)
VALUES ('SHI02', 88888888888, 'SHELD', 30, 10, 1, 2012, 'Introdução à Mitologia', 'Você não acredita, mas é tudov verdade.', 'Média Ponderada');

INSERT INTO disciplina(siglaDisc, cpfProfDisc, siglaInstitutoDisc, QtdCreditosTotalDisc, QtdAulasTotalDisc, SemestreDisc, AnoDisc, NomeDisc, ProgramaDisc, MetodoAvalDisc)
VALUES ('SHI03', 21111111111, 'SHELD', 30, 10, 1, 2012, 'Física Gravitacional III', 'Como levantar o Martelo de Mijolnir', 'Média Ponderada');

--preRequisito
/*
Aqui foi feita uma alteração semântica importante. Consideramos:
siglaDisc = Sigla da Disciplina, por exemplo SCC02
siglaReq  = Sigla do Requisito, por exemplo SCC01
*/
INSERT INTO preRequisito(siglaDisc, siglaReq)
VALUES ('SHI02', 'SHI01');

INSERT INTO preRequisito(siglaDisc, siglaReq)
VALUES ('SHI03', 'SHI01');

INSERT INTO preRequisito(siglaDisc, siglaReq)
VALUES ('SHI03', 'SHI02');

INSERT INTO preRequisito(siglaDisc, siglaReq)
VALUES ('STK02', 'STK01');

INSERT INTO preRequisito(siglaDisc, siglaReq)
VALUES ('STK03', 'STK01');

INSERT INTO preRequisito(siglaDisc, siglaReq)
VALUES ('STK03', 'STK02');

--cursa
INSERT INTO cursa(cpfCursa, siglaDisciplinaCursa, anoSemestreCursa, aprovadoCursa, notaCursa, nroAulasFreqCursa, porcentPresencaCursa)
VALUES (33333333333, 'STK01', '01/2011', '-', 1, 5, 50);

INSERT INTO cursa(cpfCursa, siglaDisciplinaCursa, anoSemestreCursa, aprovadoCursa, notaCursa, nroAulasFreqCursa, porcentPresencaCursa)
VALUES (33333333333, 'STK01', '01/2012', '-', 6, 5, 50);

INSERT INTO cursa(cpfCursa, siglaDisciplinaCursa, anoSemestreCursa, aprovadoCursa, notaCursa, nroAulasFreqCursa, porcentPresencaCursa)
VALUES (33333333333, 'STK03', '01/2012', '-', 10, 5, 50);

INSERT INTO cursa(cpfCursa, siglaDisciplinaCursa, anoSemestreCursa, aprovadoCursa, notaCursa, nroAulasFreqCursa, porcentPresencaCursa)
VALUES (44444444444, 'SHI02', '01/2012', '-', 2, 5, 50);

INSERT INTO cursa(cpfCursa, siglaDisciplinaCursa, anoSemestreCursa, aprovadoCursa, notaCursa, nroAulasFreqCursa, porcentPresencaCursa)
VALUES (44444444444, 'SHI03', '01/2012', '-', 9, 5, 50);

INSERT INTO cursa(cpfCursa, siglaDisciplinaCursa, anoSemestreCursa, aprovadoCursa, notaCursa, nroAulasFreqCursa, porcentPresencaCursa)
VALUES (55555555555, 'STK02', '01/2012', '-', 3, 5, 50);

INSERT INTO cursa(cpfCursa, siglaDisciplinaCursa, anoSemestreCursa, aprovadoCursa, notaCursa, nroAulasFreqCursa, porcentPresencaCursa)
VALUES (55555555555, 'SHI01', '01/2011', '-', 3, 5, 50);

INSERT INTO cursa(cpfCursa, siglaDisciplinaCursa, anoSemestreCursa, aprovadoCursa, notaCursa, nroAulasFreqCursa, porcentPresencaCursa)
VALUES (55555555555, 'SHI01', '01/2012', '-', 8, 5, 50);

INSERT INTO cursa(cpfCursa, siglaDisciplinaCursa, anoSemestreCursa, aprovadoCursa, notaCursa, nroAulasFreqCursa, porcentPresencaCursa)
VALUES (66666666666, 'SHI02', '01/2012', '-', 4, 5, 50);

INSERT INTO cursa(cpfCursa, siglaDisciplinaCursa, anoSemestreCursa, aprovadoCursa, notaCursa, nroAulasFreqCursa, porcentPresencaCursa)
VALUES (66666666666, 'STK01', '01/2012', '-', 7, 5, 50);

INSERT INTO cursa(cpfCursa, siglaDisciplinaCursa, anoSemestreCursa, aprovadoCursa, notaCursa, nroAulasFreqCursa, porcentPresencaCursa)
VALUES (77777777777, 'SHI03', '01/2011', '-', 1, 5, 50);

INSERT INTO cursa(cpfCursa, siglaDisciplinaCursa, anoSemestreCursa, aprovadoCursa, notaCursa, nroAulasFreqCursa, porcentPresencaCursa)
VALUES (77777777777, 'SHI03', '01/2012', '-', 5, 5, 50);

INSERT INTO cursa(cpfCursa, siglaDisciplinaCursa, anoSemestreCursa, aprovadoCursa, notaCursa, nroAulasFreqCursa, porcentPresencaCursa)
VALUES (77777777777, 'STK02', '01/2012', '-', 6, 5, 50);

INSERT INTO cursa(cpfCursa, siglaDisciplinaCursa, anoSemestreCursa, aprovadoCursa, notaCursa, nroAulasFreqCursa, porcentPresencaCursa)
VALUES (00000000000, 'SHI02', '01/2012', '-', 4, 5, 50);

INSERT INTO cursa(cpfCursa, siglaDisciplinaCursa, anoSemestreCursa, aprovadoCursa, notaCursa, nroAulasFreqCursa, porcentPresencaCursa)
VALUES (00000000000, 'STK03', '01/2012', '-', 7, 5, 50);

INSERT INTO cursa(cpfCursa, siglaDisciplinaCursa, anoSemestreCursa, aprovadoCursa, notaCursa, nroAulasFreqCursa, porcentPresencaCursa)
VALUES (88444222222, 'SHI01', '01/2012', '-', 3, 5, 50);

INSERT INTO cursa(cpfCursa, siglaDisciplinaCursa, anoSemestreCursa, aprovadoCursa, notaCursa, nroAulasFreqCursa, porcentPresencaCursa)
VALUES (88444222222, 'SHI02', '01/2012', '-', 8, 5, 50);

INSERT INTO cursa(cpfCursa, siglaDisciplinaCursa, anoSemestreCursa, aprovadoCursa, notaCursa, nroAulasFreqCursa, porcentPresencaCursa)
VALUES (23333333333, 'SHI03', '01/2012', '-', 2, 5, 50);

INSERT INTO cursa(cpfCursa, siglaDisciplinaCursa, anoSemestreCursa, aprovadoCursa, notaCursa, nroAulasFreqCursa, porcentPresencaCursa)
VALUES (23333333333, 'STK01', '01/2012', '-', 9, 5, 50);

INSERT INTO cursa(cpfCursa, siglaDisciplinaCursa, anoSemestreCursa, aprovadoCursa, notaCursa, nroAulasFreqCursa, porcentPresencaCursa)
VALUES (24444444444, 'STK03', '01/2011', '-', 1, 5, 50);

INSERT INTO cursa(cpfCursa, siglaDisciplinaCursa, anoSemestreCursa, aprovadoCursa, notaCursa, nroAulasFreqCursa, porcentPresencaCursa)
VALUES (24444444444, 'STK03', '01/2012', '-', 7, 5, 50);

INSERT INTO cursa(cpfCursa, siglaDisciplinaCursa, anoSemestreCursa, aprovadoCursa, notaCursa, nroAulasFreqCursa, porcentPresencaCursa)
VALUES (24444444444, 'STK02', '01/2012', '-', 10, 5, 50);

INSERT INTO cursa(cpfCursa, siglaDisciplinaCursa, anoSemestreCursa, aprovadoCursa, notaCursa, nroAulasFreqCursa, porcentPresencaCursa)
VALUES (25555555555, 'SHI02', '01/2012', '-', 3, 5, 50);

INSERT INTO cursa(cpfCursa, siglaDisciplinaCursa, anoSemestreCursa, aprovadoCursa, notaCursa, nroAulasFreqCursa, porcentPresencaCursa)
VALUES (25555555555, 'SHI03', '01/2012', '-', 7, 5, 50);

INSERT INTO cursa(cpfCursa, siglaDisciplinaCursa, anoSemestreCursa, aprovadoCursa, notaCursa, nroAulasFreqCursa, porcentPresencaCursa)
VALUES (26666666666, 'SHI03', '01/2012', '-', 2, 5, 50);

INSERT INTO cursa(cpfCursa, siglaDisciplinaCursa, anoSemestreCursa, aprovadoCursa, notaCursa, nroAulasFreqCursa, porcentPresencaCursa)
VALUES (26666666666, 'SHI01', '01/2012', '-', 8, 5, 50);


--possui_cursoInstituto
INSERT INTO possui_cursoInstituto(codCursoP, sigInstitutoP) VALUES (9, 'STARK');
INSERT INTO possui_cursoInstituto(codCursoP, sigInstitutoP) VALUES (10, 'STARK');
INSERT INTO possui_cursoInstituto(codCursoP, sigInstitutoP) VALUES (11, 'SHELD');
INSERT INTO possui_cursoInstituto(codCursoP, sigInstitutoP) VALUES (12, 'SHELD');


--referencia
INSERT INTO referencia(codReferencia, qtdPaginas, descricao, titulo, autor, tipoReferencia)
VALUES (7, 120, 'Como parafusar um parafuso', 'O mistério da chave de fenda', 'Tony Stark', 'outro');

INSERT INTO referencia(codReferencia, qtdPaginas, descricao, titulo, autor, tipoReferencia)
VALUES (8, 250, 'Introdução a Linguagem PHP', 'PHP Completo Total', 'José PHP', 'outro');

INSERT INTO referencia(codReferencia, qtdPaginas, descricao, titulo, autor, tipoReferencia)
VALUES (9, 300, 'Dicionário Houaiss', 'Pai dos Burros', 'Eu que não fui', 'outro');

INSERT INTO referencia(codReferencia, qtdPaginas, descricao, titulo, autor, tipoReferencia)
VALUES (10, 500, 'A mulher e a Porrada', 'Para a mulher moderna', 'Viúva Negra', 'outro');

INSERT INTO referencia(codReferencia, qtdPaginas, descricao, titulo, autor, tipoReferencia)
VALUES (11, 200, 'Como fugir da Kryptonita', 'Não morra na Terra', 'Superman', 'livro');

INSERT INTO referencia(codReferencia, qtdPaginas, descricao, titulo, autor, tipoReferencia)
VALUES (12, 100, 'Flechas Mágicas', 'Tudo sobre flechas', 'Gavião Negro', 'livro');

--livro
INSERT INTO livro(codLivro, editora)
VALUES (11, 'Kent Editora');

INSERT INTO livro(codLivro, editora)
VALUES (12, 'SHELD Editora');

--utiliza_discReferencia
INSERT INTO utiliza_discReferencia(codReferencia_util, sigDisciplina_util) VALUES (7, 'STK01');
INSERT INTO utiliza_discReferencia(codReferencia_util, sigDisciplina_util) VALUES (8, 'STK01');
INSERT INTO utiliza_discReferencia(codReferencia_util, sigDisciplina_util) VALUES (9, 'STK02');
INSERT INTO utiliza_discReferencia(codReferencia_util, sigDisciplina_util) VALUES (10, 'STK02');
INSERT INTO utiliza_discReferencia(codReferencia_util, sigDisciplina_util) VALUES (11, 'STK03');
INSERT INTO utiliza_discReferencia(codReferencia_util, sigDisciplina_util) VALUES (12, 'STK03');
INSERT INTO utiliza_discReferencia(codReferencia_util, sigDisciplina_util) VALUES (7, 'SHI01');
INSERT INTO utiliza_discReferencia(codReferencia_util, sigDisciplina_util) VALUES (8, 'SHI02');
INSERT INTO utiliza_discReferencia(codReferencia_util, sigDisciplina_util) VALUES (9, 'SCC04');
INSERT INTO utiliza_discReferencia(codReferencia_util, sigDisciplina_util) VALUES (10, 'SHI03');


INSERT INTO usuario (cpf_usr, rg_usr, dataNascimento, nomeUsuario, senha, nomeCompleto, tipo_usuario)
VALUES (153123123, '961123321', to_date('01/11/1990', 'dd/mm/yyyy'), 'Josualdo', 'fdsdnhj', 'Josualdo de Oliveira Neto', 'aluno');

INSERT INTO usuario (cpf_usr, rg_usr, dataNascimento, nomeUsuario, senha, nomeCompleto, tipo_usuario)
VALUES (161456789, '963145647', to_date('01/12/1991', 'dd/mm/yyyy'), 'Francisco', 'dgfkow', 'Francisco Rui de barros', 'aluno');

INSERT INTO usuario (cpf_usr, rg_usr, dataNascimento, nomeUsuario, senha, nomeCompleto, tipo_usuario)
VALUES (174987654, '634321122', to_date('01/10/1970', 'dd/mm/yyyy'), 'Eduardo', '236530', 'Eduardo Silvo batista', 'aluno');

INSERT INTO usuario (cpf_usr, rg_usr, dataNascimento, nomeUsuario, senha, nomeCompleto, tipo_usuario)
VALUES (181222333, '1132221652', to_date('01/01/1989', 'dd/mm/yyyy'), 'Marcos', '5622546', 'Marcos cristovão colombo', 'aluno');

INSERT INTO usuario (cpf_usr, rg_usr, dataNascimento, nomeUsuario, senha, nomeCompleto, tipo_usuario)
VALUES (156542963, '123923456', to_date('20/04/1995', 'dd/mm/yyyy'), 'Beline', 'h32221', 'Beline Halen', 'aluno');

INSERT INTO usuario (cpf_usr, rg_usr, dataNascimento, nomeUsuario, senha, nomeCompleto, tipo_usuario)
VALUES (123465489, '123851222', to_date('02/05/1990', 'dd/mm/yyyy'), 'Carlos', 'j0421', 'Carlos Martins', 'aluno');

INSERT INTO usuario (cpf_usr, rg_usr, dataNascimento, nomeUsuario, senha, nomeCompleto, tipo_usuario)
VALUES (3219874685, '3579959456', to_date('05/03/1991', 'dd/mm/yyyy'), 'Antonio', 'jj2572123', 'Antonio Pereira  da Silva', 'aluno');

INSERT INTO usuario (cpf_usr, rg_usr, dataNascimento, nomeUsuario, senha, nomeCompleto, tipo_usuario)
VALUES (1234587789, '123251333', to_date('02/05/1990', 'dd/mm/yyyy'), 'Djone', 'j1423', 'Djone  da  silva', 'aluno');

INSERT INTO usuario (cpf_usr, rg_usr, dataNascimento, nomeUsuario, senha, nomeCompleto, tipo_usuario)
VALUES (164656558, '124578496', to_date('01/01/1988', 'dd/mm/yyyy'), 'Daniel', '75272', 'Daniel dos Santos', 'professor');

INSERT INTO usuario (cpf_usr, rg_usr, dataNascimento, nomeUsuario, senha, nomeCompleto, tipo_usuario)
VALUES (998855168, '121245496', to_date('01/01/1991', 'dd/mm/yyyy'), 'Beatriz', 'vd1251', 'Beatriz da Silva', 'professor');

INSERT INTO usuario (cpf_usr, rg_usr, dataNascimento, nomeUsuario, senha, nomeCompleto, tipo_usuario)
VALUES (123456152, '333222114', to_date('02/05/1990', 'dd/mm/yyyy'), 'Caetano', 'm124223', 'Caetano Vicci', 'professor');

INSERT INTO usuario (cpf_usr, rg_usr, dataNascimento, nomeUsuario, senha, nomeCompleto, tipo_usuario)
VALUES (987654685, '111222312', to_date('10/06/1993', 'dd/mm/yyyy'), 'Rita', 'r2525123', 'Rita Da Silva', 'professor');

INSERT INTO usuario (cpf_usr, rg_usr, dataNascimento, nomeUsuario, senha, nomeCompleto, tipo_usuario)
VALUES (4567891965, '159753411', to_date('09/07/1993', 'dd/mm/yyyy'), 'Gilberto', '122125', 'Gilberto Gil', 'professor');

INSERT INTO usuario (cpf_usr, rg_usr, dataNascimento, nomeUsuario, senha, nomeCompleto, tipo_usuario)
VALUES (123546789, '123385111', to_date('02/05/1990', 'dd/mm/yyyy'), 'Geraldo', 'Hugo588', 'administrador Vicci', 'administrador');

INSERT INTO usuario (cpf_usr, rg_usr, dataNascimento, nomeUsuario, senha, nomeCompleto, tipo_usuario)
VALUES (123355289, '34599444', to_date('02/05/1990', 'dd/mm/yyyy'), 'Paulo', 'op525to', 'Paulo da Silva', 'administrador');

INSERT INTO usuario (cpf_usr, rg_usr, dataNascimento, nomeUsuario, senha, nomeCompleto, tipo_usuario)
VALUES (122432789, '345552555', to_date('02/05/1990', 'dd/mm/yyyy'), 'Cristiano', 'guizao', 'Cristiano Antonio Morais', 'administrador');


--aluno-------------------------------------------------------------------------

INSERT INTO aluno(cpfAluno, cidadeOrigemAluno, enderecoAluno, codCursoAluno)
VALUES (161456789, 'Rio Branco', 'Av. Jose, 89', 1);

INSERT INTO aluno(cpfAluno, cidadeOrigemAluno, enderecoAluno, codCursoAluno)
VALUES (174987654, 'Belo Horizonte', 'Rua das Orquideas, 29', 8);

INSERT INTO aluno(cpfAluno, cidadeOrigemAluno, enderecoAluno, codCursoAluno)
VALUES (181222333, 'Sao Paulo', 'Rua Seca, 39', 4);

INSERT INTO aluno(cpfAluno, cidadeOrigemAluno, enderecoAluno, codCursoAluno)
VALUES (156542963, 'Rio de Janeiro', 'Av. Mococa, 19', 4);

INSERT INTO aluno(cpfAluno, cidadeOrigemAluno, enderecoAluno, codCursoAluno)
VALUES (1234587789, 'Santos', 'Rua dos Morros, 8', 2);


--administrador

INSERT INTO administrador(cpfAdministrador, privilegioAdministrador)
VALUES (987654685, 2);

INSERT INTO administrador(cpfAdministrador, privilegioAdministrador)
VALUES (4567891965, 1);--

INSERT INTO administrador(cpfAdministrador, privilegioAdministrador)
VALUES (123546789, 2);

INSERT INTO administrador(cpfAdministrador, privilegioAdministrador)
VALUES (123355289, 1);

INSERT INTO administrador(cpfAdministrador, privilegioAdministrador)
VALUES (122432789, 1);

COMMIT;