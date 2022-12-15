/*Script de criação de tabelas para o sistema Calisto Web*/

/*DROP TABLE*/
DROP SEQUENCE SEQ_CURSO_PK;
DROP TABLE L17_utiliza_discReferencia CASCADE CONSTRAINTS;
DROP TABLE L16_artigo CASCADE CONSTRAINTS;
DROP TABLE L15_livro CASCADE CONSTRAINTS;
DROP TABLE L14_referencia CASCADE CONSTRAINTS;
DROP TABLE L13_usa_aulaEquipamento CASCADE CONSTRAINTS;
DROP TABLE L12_equipamento CASCADE CONSTRAINTS;
DROP TABLE L11_aulaPratica CASCADE CONSTRAINTS;
DROP TABLE L10_possui_cursoInstituto CASCADE CONSTRAINTS;
DROP TABLE L09_cursa CASCADE CONSTRAINTS;
DROP TABLE L08_preRequisito CASCADE CONSTRAINTS;
DROP TABLE L07_disciplina CASCADE CONSTRAINTS;
DROP TABLE L06_instituto CASCADE CONSTRAINTS;
DROP TABLE L05_administrador CASCADE CONSTRAINTS;
DROP TABLE L04_professor CASCADE CONSTRAINTS;
DROP TABLE L03_aluno CASCADE CONSTRAINTS;
DROP TABLE L02_curso CASCADE CONSTRAINTS;
DROP TABLE L01_usuario CASCADE CONSTRAINTS;

CREATE SEQUENCE SEQ_CURSO_PK
      INCREMENT BY 1
      START WITH 1
      MAXVALUE   999999
      NOCACHE
      NOCYCLE;

/*CREATE TABLE*/
CREATE TABLE L01_usuario (
	cpf_usr            NUMBER(15),
	rg_usr             VARCHAR(15) NOT NULL,
	dataNascimento     DATE,         
	nomeUsuario        VARCHAR(50) NOT NULL,
	senha              VARCHAR(15) NOT NULL,
	nomeCompleto       VARCHAR(100),
	tipo_usuario       VARCHAR(15) NOT NULL, --CK
		
	CONSTRAINT pk_usuario PRIMARY KEY (cpf_usr),
	CONSTRAINT usr_psw UNIQUE (nomeUsuario, senha),
	CONSTRAINT ck_tipoUsr CHECK (tipo_Usuario IN ('aluno', 'administrador', 'professor'))
);

CREATE TABLE L02_curso (
	codCurso NUMBER(5), --SQ
	nomeCurso VARCHAR(100)         NOT NULL,
	qtdSemetresCurso NUMBER(2)     DEFAULT 10 NOT NULL,
	qtdMaxSemestresCurso NUMBER(2) DEFAULT 18 NOT NULL,
	nroCredTotalCurso NUMBER(3)    NOT NULL,

	CONSTRAINT pk_curso PRIMARY KEY (codCurso)
);

CREATE TABLE L03_aluno (
	cpfAluno          NUMBER(15),
	cidadeOrigemAluno VARCHAR(50) NOT NULL,
	enderecoAluno     VARCHAR(100)NOT NULL,		
	codCursoAluno     NUMBER(5),
	
	CONSTRAINT pk_aluno PRIMARY KEY (cpfAluno),	
	CONSTRAINT fk_aluno_cpf FOREIGN KEY (cpfAluno) REFERENCES L01_usuario(cpf_usr),
	CONSTRAINT fk_aluno_codCurso FOREIGN KEY (codCursoAluno) REFERENCES L02_curso(codCurso) 
);

CREATE TABLE L04_professor (	
	cpfProfessor      NUMBER(15),
	titulacaoProfessor VARCHAR(50) NOT NULL,  --CK
	categoriaProfessor VARCHAR(10) NOT NULL,  --CK
	codCursoCoordenador NUMBER(5),
	
	CONSTRAINT pk_professor PRIMARY KEY (cpfProfessor),	
	CONSTRAINT fk_professor_cpf FOREIGN KEY (cpfProfessor) REFERENCES L01_usuario(cpf_usr), 
	CONSTRAINT fk_professor_codCurso FOREIGN KEY (codCursoCoordenador) REFERENCES L02_curso(codCurso),
	CONSTRAINT ck_tit_prof CHECK (titulacaoProfessor IN ('graduado','mestre', 'doutor')),
	CONSTRAINT ck_categoria_prof CHECK (categoriaProfessor IN ('C1','C2', 'C3'))
);

CREATE TABLE L05_administrador (
	cpfAdministrador NUMBER(15),
	privilegioAdministrador NUMBER(1) NOT NULL,	--CK

	CONSTRAINT pk_administrador PRIMARY KEY (cpfAdministrador),	
	CONSTRAINT fk_administrador_cpf FOREIGN KEY (cpfAdministrador) REFERENCES L01_usuario(cpf_usr),
	CONSTRAINT ck_priv_adm CHECK (privilegioAdministrador IN (1,2))
);

CREATE TABLE L06_instituto (
	siglaInstituto VARCHAR(5),      
	nomeInstituto VARCHAR(100) NOT NULL,
	cidadeInstituto VARCHAR(50) NOT NULL,
	
	CONSTRAINT pk_inst PRIMARY KEY (siglaInstituto)
);

CREATE TABLE L07_disciplina (
	siglaDisc              VARCHAR(10),
	cpfProfDisc            NUMBER(15),	
	siglaInstitutoDisc       VARCHAR(5),
	QtdCreditosTotalDisc   NUMBER(3),
	QtdAulasTotalDisc      NUMBER(3),	
	SemestreDisc           NUMBER(1) NOT NULL,
	AnoDisc                NUMBER(4) NOT NULL,
	NomeDisc               VARCHAR(50) NOT NULL,
	ProgramaDisc           VARCHAR(300),
	MetodoAvalDisc	       VARCHAR(200),

	CONSTRAINT pk_disciplina PRIMARY KEY (siglaDisc),
	CONSTRAINT fk_disc_cpf     FOREIGN KEY  (cpfProfDisc) REFERENCES L04_professor(cpfProfessor),
	CONSTRAINT fk_disc_sigInst FOREIGN KEY  (siglaInstitutoDisc) REFERENCES L06_instituto(siglaInstituto)
);


CREATE TABLE L08_preRequisito(
	siglaDisc             VARCHAR(10),
	siglaReq              VARCHAR(10),

	CONSTRAINT pk_pre PRIMARY KEY (siglaDisc, siglaReq),
	CONSTRAINT fk_pre FOREIGN KEY (siglaDisc) REFERENCES L07_disciplina(siglaDisc),
	CONSTRAINT fk_pre_req   FOREIGN KEY  (siglaReq) REFERENCES L07_disciplina(siglaDisc)
);

CREATE TABLE L09_cursa (
	cpfCursa              NUMBER(15), 
	siglaDisciplinaCursa  VARCHAR(10),
	anoSemestreCursa     VARCHAR(10) NOT NULL,
	aprovadoCursa        CHAR(1),   --CK
	notaCursa            NUMBER(2), --CK
	nroAulasFreqCursa    NUMBER(3),
	porcentPresencaCursa NUMBER(5,2),
	
	CONSTRAINT pk_cursa PRIMARY KEY (cpfCursa, siglaDisciplinaCursa, anoSemestreCursa),
	CONSTRAINT fk_cursa_cpf FOREIGN KEY (cpfCursa) REFERENCES L03_aluno(cpfAluno),
	CONSTRAINT fk_cursa_siglaDisc FOREIGN KEY (siglaDisciplinaCursa) REFERENCES L07_disciplina (siglaDisc),
	CONSTRAINT ck_aprovado CHECK ( aprovadoCursa in ('S','N','-')),
	CONSTRAINT ck_nota     CHECK ( notaCursa >= 0 and notaCursa <= 10)
);

CREATE TABLE L10_possui_cursoInstituto (
	codCursoP      NUMBER(5),
	sigInstitutoP  VARCHAR(5),

	CONSTRAINT pk_possui PRIMARY KEY (codCursoP,sigInstitutoP),
	CONSTRAINT fk_possui_codCurso FOREIGN KEY  (codCursoP) REFERENCES L02_curso(codCurso),
	CONSTRAINT fk_possui_sigInst  FOREIGN KEY  (sigInstitutoP) REFERENCES L06_instituto(siglaInstituto)	
);

CREATE TABLE L11_aulaPratica (
	siglaDisciplinaAP  VARCHAR(10),
	dataAP             date,
	
	CONSTRAINT pk_AP PRIMARY KEY (siglaDisciplinaAP,dataAP),
	CONSTRAINT fk_AP FOREIGN KEY  (siglaDisciplinaAP) REFERENCES L07_disciplina(siglaDisc)
);

CREATE TABLE L12_equipamento (
	codEquipamento NUMBER(5),
	nomeEquipamento VARCHAR(50),

	CONSTRAINT pk_eqpto PRIMARY KEY (codEquipamento)
);

CREATE TABLE L13_usa_aulaEquipamento (
	codEquipamento_usa NUMBER(5),
	siglaDiscAP_usa  VARCHAR(10),
	dataAP_usa             date,
	
	CONSTRAINT pk_usa PRIMARY KEY (codEquipamento_usa,siglaDiscAP_usa,dataAP_usa),
	CONSTRAINT fk_usa_eqpto FOREIGN KEY (codEquipamento_usa) REFERENCES L12_equipamento(codEquipamento),
	CONSTRAINT fk_usa_AP    FOREIGN KEY (siglaDiscAP_usa,dataAP_usa) REFERENCES L11_aulaPratica(siglaDisciplinaAP,dataAP)
);

CREATE TABLE L14_referencia (
	codReferencia NUMBER(5),
	qtdPaginas    NUMBER(4),
	descricao     VARCHAR(100),
	titulo        VARCHAR(200) NOT NULL,
	autor         VARCHAR(200) NOT NULL,
	tipoReferencia VARCHAR(10) NOT NULL, --CK
	
	CONSTRAINT pk_ref PRIMARY KEY (codReferencia),
	CONSTRAINT ck_ CHECK ( tipoReferencia in ('artigo','livro','outro'))
);

CREATE TABLE L15_livro (
	codLivro NUMBER(5),
	editora  VARCHAR(50),
	
	CONSTRAINT pk_liv PRIMARY KEY (codLivro),
	CONSTRAINT fk_liv_ref FOREIGN KEY (codLivro) REFERENCES L14_referencia(codReferencia)
);

CREATE TABLE L16_artigo (
	codArtigo NUMBER(5),
	url       VARCHAR(100),
	conferencia VARCHAR(100),

	CONSTRAINT pk_art PRIMARY KEY (codArtigo),
	CONSTRAINT fk_art_ref FOREIGN KEY (codArtigo) REFERENCES L14_referencia(codReferencia)  
);

CREATE TABLE L17_utiliza_discReferencia (
	codReferencia_util NUMBER(5),
	sigDisciplina_util VARCHAR(10),
	
	CONSTRAINT pk_util PRIMARY KEY (codReferencia_util,sigDisciplina_util),
	CONSTRAINT fk_util_ref FOREIGN KEY (codReferencia_util) REFERENCES L14_referencia(codReferencia),
	CONSTRAINT fk_util_disc FOREIGN KEY (sigDisciplina_util) REFERENCES L07_disciplina(siglaDisc)
);



/* ************************************************************************************
***************************************************************************************

Script de DDL para o projeto

***************************************************************************************
************************************************************************************ */

--Exercicio 1
/* Essa visão ajuda a recuperar os nomes dos atributos das tabelas e se eles são chave */
CREATE OR REPLACE VIEW V01_ATRIBUTOS AS 
  SELECT TABLE_NAME, COLUMN_NAME, DATA_TYPE, DATA_LENGTH, CONSTRAINT_TYPE
  FROM USER_TAB_COLUMNS
  LEFT JOIN (
    SELECT * 
    FROM USER_CONS_COLUMNS JOIN USER_CONSTRAINTS USING(OWNER, TABLE_NAME, CONSTRAINT_NAME)
    WHERE CONSTRAINT_TYPE = 'P'
  )
  USING(TABLE_NAME, COLUMN_NAME)
  ORDER BY TABLE_NAME, COLUMN_ID;  
  
--Exercicio 2

create or replace view listar_curso_professor_aluno as 
SELECT  NOMECURSO as curso, NOMECOMPLETO as professor_cordenador,null as aluno
FROM l02_curso c, l03_aluno a,l04_professor p, l01_usuario u
WHERE c.codcurso= a.codcursoaluno
AND c.codcurso= p.codcursocoordenador and  u.cpf_usr= p.cpfprofessor
union 
Select  NOMECURSO as curso,null as professor_cordenador  ,null as aluno From l02_curso
where NOMECURSO not in(Select DISTINCT NOMECURSO
From l02_curso c Inner join l03_aluno a On c.codcurso= a.codcursoaluno
Inner join l04_professor p On c.codcurso= p.codcursocoordenador
Inner join l01_usuario u On u.cpf_usr= p.cpfprofessor)
union  
SELECT  NOMECURSO as curso, null as professor_cordenador ,NOMECOMPLETO as aluno
FROM l02_curso c, l03_aluno a,l04_professor p, l01_usuario u
WHERE c.codcurso= a.codcursoaluno
AND c.codcurso= p.codcursocoordenador and  u.cpf_usr= a.cpfaluno
order by curso;

-- Exercicio 3
/* Essa trigger será fundamental para as duas views abaixo */
CREATE OR REPLACE TRIGGER atualiza_aprovado
  BEFORE INSERT OR UPDATE ON L09_CURSA
  FOR EACH ROW
BEGIN
  IF(:NEW.NOTACURSA >= 5) THEN
    :NEW.APROVADOCURSA := 'S';
  ELSE
    :NEW.APROVADOCURSA := 'N';
  END IF;
END atualiza_aprovado;
/

create or replace view aprovados as --  cria uma visao para os alunos que  foram aprovados 
select  NOMEUSUARIO, CPFCURSA as aluno_aprovado ,sigladisciplinacursa as Na___disciplina,ANOSEMESTRECURSA as semestre from l09_cursa ,L01_USUARIO
where APROVADOCURSA='S'and CPFCURSA=CPF_USR ;

create or replace view reprovados as --  cria uma visao  para  os  alunos  que tiveram reprovacoes 
select NOMEUSUARIO,CPFCURSA as aluno_reprovado ,sigladisciplinacursa as Na__disciplina,ANOSEMESTRECURSA as semestre from l09_cursa ,L01_USUARIO
where APROVADOCURSA='N'and CPFCURSA=CPF_USR ;
/


--Exercício 5

/*
Adiciona um atributo à tabela de disciplinas.
Esse atributo conterá o número total de páginas das referências
utilizadas em cada dsiciplina. Será atualizado por um trigger, 
assim que for adicionada ou removida uma referência para a disciplina.
*/
ALTER TABLE L07_DISCIPLINA 
  ADD NroPaginas
    NUMBER(4)
    DEFAULT 0
    NOT NULL;
/

/* Trigger que atualiza o NroPaginas, descrita acima */
create or replace
TRIGGER atu_nropaginas
  BEFORE UPDATE OR INSERT OR DELETE ON L17_UTILIZA_DISCREFERENCIA
  FOR EACH ROW

DECLARE
  v_codref      L17_UTILIZA_DISCREFERENCIA.CODREFERENCIA_UTIL%TYPE;
  v_sigladisc   L17_UTILIZA_DISCREFERENCIA.SIGDISCIPLINA_UTIL%TYPE;
  pag_ref       L14_REFERENCIA.QTDPAGINAS%TYPE;
  pag_ref_velha L14_REFERENCIA.QTDPAGINAS%TYPE;
  
BEGIN
  /* Se estiver inserindo, guarda os valores dos novos dados para atualizar */
  IF UPDATING OR INSERTING THEN
    v_codref     := :NEW.CODREFERENCIA_UTIL;
    v_sigladisc  := :NEW.SIGDISCIPLINA_UTIL;
  /* Se estiver apagando, guarda os valores dos dados apagados */
  ELSE
    v_codref     := :OLD.CODREFERENCIA_UTIL;
    v_sigladisc  := :OLD.SIGDISCIPLINA_UTIL;
  END IF;
  
  /* Descobre o número de páginas da ref. modificada, inserida ou apagada */
  SELECT QTDPAGINAS
    INTO pag_ref
    FROM L14_REFERENCIA
    WHERE CODREFERENCIA = v_codref;
  
  /* O bloco IF abaixo transforma o pag_ref em um número mágico que, quando 
  somado ao valor constante na tupla da disciplina, o atualiza automaticamente,
  independente da operação que tenha sido realizada */
  IF UPDATING THEN
    SELECT QTDPAGINAS
      INTO  pag_ref_velha
      FROM L14_REFERENCIA
      WHERE CODREFERENCIA = :OLD.CODREFERENCIA_UTIL;
    pag_ref := pag_ref - pag_ref_velha;
  ELSIF DELETING THEN 
    pag_ref := pag_ref * -1;
  END IF;
  
  /* Atualiza o número de páginas da disciplina específica */
  UPDATE L07_DISCIPLINA
    SET NROPAGINAS = NROPAGINAS + pag_ref
    WHERE SIGLADISC = v_sigladisc;
  
END atu_nropaginas;
/


/*Pacote com procedimentos que possibilitam atualizar, inserir, remover e 
  listar dados do Sistema Calisto. Os procedimentos especifícios para essas
  operações são genéricos, ou seja, podem ser utilizados para qualquer tabela
  do banco de dados*/

/* *****************************************************************************
***************                CABEÇALHO                ************************
****************************************************************************** */

create or replace
PACKAGE GERENCIAR AS

  /*Tipo de variável usada na declaração dos parâmetros do procedimento LISTAR*/
  TYPE REF_CURSOR IS REF CURSOR;

                           /*PROCEDURE LISTAR*/
  /*A procedure LISTAR é utilizada para fazer consulta em tabelas, cujo nome
  deve ser fornecido, gerando uma lista de dados (todos atributos) e retornando 
  um REF CURSOR para ser usado na aplicação.
  
  Considerações:
  - Passando apenas o nome da tabela, sem valores chaves, a lista de dados
  conterá todas as tuplas da tabela passada como parâmetro;
  - Passando nome da tabela e atributos chaves, o REF CURSOR retornado apontará
  apenas uma única tupla, referente as chaves passadas.
  */
  PROCEDURE LISTAR(apontador OUT REF_CURSOR, nome VARCHAR2,
                    valor_chave_1 VARCHAR2 DEFAULT NULL, 
                    valor_chave_2 VARCHAR2 DEFAULT NULL,
                    valor_chave_3 VARCHAR2 DEFAULT NULL);
                    
                           /*PROCEDURE REMOVER*/
  /*A procedure REMOVER, dado o nome da tabela e seu(s) atributo(s) chave(s),
  exclui o dados relacionandos (tupla)/*/                  
  PROCEDURE REMOVER(n_removidos OUT REF_CURSOR, nome VARCHAR2, 
                   valor_chave_1 VARCHAR2,
                   valor_chave_2 VARCHAR2 DEFAULT NULL, 
                   valor_chave_3 VARCHAR2 DEFAULT NULL);  

                    
                           /*PROCEDURE INSERIR*/                    
  /*A procedure INSERIR inclui dados em uma tabela. Para a inclusão dos dados
  é necessário que forneça o nome da tabela e seus atributos na sequência
  correta, conforme definição da DDL.*/
  PROCEDURE INSERIR(pnome_tabela VARCHAR2,
                    campo_1 VARCHAR2 DEFAULT NULL,
                    campo_2 VARCHAR2 DEFAULT NULL,
                    campo_3 VARCHAR2 DEFAULT NULL,
                    campo_4 VARCHAR2 DEFAULT NULL,
                    campo_5 VARCHAR2 DEFAULT NULL,
                    campo_6 VARCHAR2 DEFAULT NULL,
                    campo_7 VARCHAR2 DEFAULT NULL,
                    campo_8 VARCHAR2 DEFAULT NULL,
                    campo_9 VARCHAR2 DEFAULT NULL,
                    campo_10 VARCHAR2 DEFAULT NULL);
                    
                          /*PROCEDURE ATUALIZAR*/
 /*A procedure ATUALIZAR altera dados em uma tabela. Para a alteração dos dados
  é necessário que forneça o nome da tabela e seus atributos chaves na sequência
  correta, além dos atributos a serem atualizados.*/
 PROCEDURE ATUALIZAR(n_alterados OUT REF_CURSOR, pnome_tabela VARCHAR2, 
                          campo_1 VARCHAR2 DEFAULT NULL,
                          campo_2 VARCHAR2 DEFAULT NULL,
                          campo_3 VARCHAR2 DEFAULT NULL,
                          campo_4 VARCHAR2 DEFAULT NULL,
                          campo_5 VARCHAR2 DEFAULT NULL,
                          campo_6 VARCHAR2 DEFAULT NULL,
                          campo_7 VARCHAR2 DEFAULT NULL,
                          campo_8 VARCHAR2 DEFAULT NULL,
                          campo_9 VARCHAR2 DEFAULT NULL,
                          campo_10 VARCHAR2 DEFAULT NULL);
                          
                          
                    /*PROCEDURES AUXILIARES PARA A APLICAÇÃO*/
                    
                    
   /*A procedure VERIFICA_CHAVES é utilizada para fazer consulta em tabelas, cujo nome
  deve ser fornecido, gerando uma lista de dados (todos atributos) e retornando 
  dois REF CURSORS para serem usados na aplicação.
 
  O objetivo é, dado um conjunto de chaves, verificar se tais chaves identificam
  uma tupla.
  n_tuplas indicará se alguma tupla foi encontrada.
  resultado apontara para a tupla, caso seja encontrada.
  
  Essa procedure foi construída para a função ATUALIZAR da aplicação
  */                         
  PROCEDURE VERIFICA_CHAVES(n_tuplas  OUT REF_CURSOR,
                            resultado OUT REF_CURSOR,
                            nome VARCHAR2,
                            valor_chave_1 VARCHAR2, 
                            valor_chave_2 VARCHAR2 DEFAULT NULL,
                            valor_chave_3 VARCHAR2 DEFAULT NULL);
                            
  /* Esta procedure retorna um ponteiro para uma consulta com todos os atributos
  da databela fornecida como parâmetro, inclusive o tamanho do atributo, seu
  tipo, e se é chave primária ou não */
  PROCEDURE obter_atributos(p_nome_tabela IN VARCHAR2, p_refcur_atributos OUT REF_CURSOR);

  /* Esta procedure retorna um ponteiro para uma consulta com todos os
  atributos-chaves da databela fornecida como parâmetro, inclusive o tamanho do
  atributo e seu tipo */
  PROCEDURE obter_chaves(p_nome_tabela IN VARCHAR2, p_refcur_atributos OUT REF_CURSOR);
  
   /* Esta procedure retorna um ponteiro para uma consulta com todos os nomes de
   tabelas do esquema do usuário */
  PROCEDURE obter_tabelas(p_refcur_tabelas OUT REF_CURSOR);

END GERENCIAR;
/


/*Pacote com procedimentos que possibilitam atualizar, inserir, remover e 
  listar dados do Sistema Calisto. Os procedimentos especifícios para essas
  operações são genéricos, ou seja, podem ser utilizados para qualquer tabela
  do banco de dados*/

/* *****************************************************************************
***************                    CORPO                ************************
****************************************************************************** */
  
create or replace
PACKAGE BODY GERENCIAR AS

                          /*PROCEDURE LISTAR*/

  /*A procedure LISTAR é utilizada para fazer consulta em tabelas, cujo nome
  deve ser fornecido, gerando uma lista de dados (todos atributos) e retornando 
  um REF CURSOR para ser usado na aplicação.
  
  Considerações:
  - Passando apenas o nome da tabela, sem valores chaves, a lista de dados
  conterá todas as tuplas da tabela passada como parâmetro;
  - Passando nome da tabela e atributos chaves, o REF CURSOR retornado apontará
  apenas uma única tupla, referente as chaves passadas.
  */                         
    PROCEDURE LISTAR(apontador OUT REF_CURSOR, nome VARCHAR2,
                    valor_chave_1 VARCHAR2 DEFAULT NULL, 
                    valor_chave_2 VARCHAR2 DEFAULT NULL,
                    valor_chave_3 VARCHAR2 DEFAULT NULL) AS
    
    
    qtd_chaves    NUMBER DEFAULT 0; 
    contador      NUMBER;
    nome_tabela   USER_TABLES.TABLE_NAME%TYPE;
    nome_chave    USER_TAB_COLUMNS.COLUMN_NAME%TYPE;
    texto_sql     VARCHAR2(1000);
    sql_text_pk   VARCHAR2(400);
    
  BEGIN
  
    nome_tabela := UPPER(nome);
    texto_sql := 'SELECT * ';
 
  /*caso não seja fornecido atributos chaves, essa verificação IF faz com que
  a consulta seja realizada sem a necessidade de verifica quantidade de chaves
  e nomes dos atributos da tabela passada como parâmetro*/       
  IF (valor_chave_1 > 0) THEN   
    
    /*Verifica quantidade de atibutos chaves da tabela passada como parâmetro.
    Foram usadas as tabelas USER_ind_COLUMNS e USER_CONSTRAINTS do dicionário
    de dados*/
    SELECT COUNT(*)
    INTO qtd_chaves
    FROM USER_CONSTRAINTS CON, USER_IND_COLUMNS IND
    WHERE CON.TABLE_NAME = IND.TABLE_NAME AND
          CON.CONSTRAINT_NAME = IND.INDEX_NAME AND
          CON.TABLE_NAME = nome_tabela AND
          CON.CONSTRAINT_TYPE = 'P';
  
    /*Faz apontador referenciar o primeiro nome da tabela de atributos chaves
    gerada pelo SELECT abaixo. Foram usadas as tabelas USER_CONS_COLUMNS e 
    USER_CONSTRAINTS do dicionário de dados*/
    OPEN apontador FOR
       SELECT column_name
       FROM user_cons_columns  
       WHERE  constraint_name IN (
            SELECT constraint_name
            FROM user_constraints
            WHERE constraint_type = 'P' AND table_name = nome_tabela
       );
    
    contador := 0;
    /*o apontador faz referência a cada nome de atributo chave respeitando 
    quantidade de chaves atribuida a variável qtd_chaves. Em cada LOOP, um nome 
    de atributo chave é armazenado em nome_chave. Esse nome de atributo, junto 
    ao respectivo valor passado como parâmetro é concatenado na varável
    sql_text_pk, que posteriormente é usado na consulta SQL após a clausula
    WHERE.*/
    FOR i IN 1..qtd_chaves LOOP
     FETCH apontador INTO nome_chave;
     
     CASE i 
      
        WHEN(1) THEN
          IF(LENGTH(valor_chave_1) > 0) THEN
            sql_text_pk := sql_text_pk || nome_chave||' LIKE ''%'||valor_chave_1||'%'' AND ';
          END IF;
          
        WHEN(2) THEN
          IF(LENGTH(valor_chave_2) > 0) THEN
            sql_text_pk := sql_text_pk || nome_chave||' LIKE ''%'||valor_chave_2||'%'' AND ';
          END IF;
          
        WHEN(3) THEN
          IF (LENGTH(valor_chave_3) > 0) THEN
            sql_text_pk := sql_text_pk || nome_chave||' LIKE ''%'||valor_chave_3||'%'' AND ';
          END IF;

      END CASE;

    END LOOP;
    
    sql_text_pk := RTRIM(sql_text_pk,'AND ');

    CLOSE apontador;
       
    texto_sql :=  RTRIM(texto_sql, ',') ||
                  ' FROM ' || nome_tabela ||
                  ' WHERE ' ||sql_text_pk; 
                  
  ELSE /*Atribuição realizada apenas se o procedimento for chamado sem 
  falore de atributos chaves*/
    texto_sql :=  RTRIM(texto_sql, ',') ||
                  ' FROM ' || nome_tabela;
      
  END IF; 
  
  OPEN apontador FOR texto_sql;    
    
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      DBMS_OUTPUT.PUT_LINE('A tabela ' || nome_tabela || ' não existe.');
    WHEN OTHERS THEN
      RAISE;
    
END LISTAR;

               /*FIM DA PROCEDURE LISTAR*/

/* *****************************************************************************
********************************************************************************
****************************************************************************** */

                            /*PROCEDURE REMOVER*/
                            
  /*A procedure REMOVER, dado o nome da tabela e seu(s) atributo(s) chave(s),
  exclui os dados relacionandos (tupla)/*/                                           
PROCEDURE REMOVER(n_removidos OUT REF_CURSOR, nome VARCHAR2, 
                   valor_chave_1 VARCHAR2,
                   valor_chave_2 VARCHAR2 DEFAULT NULL, 
                   valor_chave_3 VARCHAR2 DEFAULT NULL) AS

    nome_tabela USER_TABLES.TABLE_NAME%TYPE;
    nome_chave  USER_TAB_COLUMNS.COLUMN_NAME%TYPE;
    
    /*string utilizada para conter os atributos chaves relacionados aos 
    respectivos nomes para uso no comando de exclusão em SQL.*/
    sql_text_pk VARCHAR2(500) DEFAULT NULL;

    TYPE REF_CURSOR IS REF CURSOR;
    apontador REF_CURSOR;

    qtd_chaves NUMBER;
    contador NUMBER DEFAULT 0;
    
    EXCESSAO_CHAVES EXCEPTION;    

  BEGIN

    nome_tabela := UPPER(nome);    
  
    /*Conta quantidade de atibutos chaves da tabela passada como parâmetro e
    armazena o valor na variável qtd_chaves. Foram usadas as tabelas 
    USER_ind_COLUMNS e USER_CONSTRAINTS do dicionário de dados*/    
     SELECT COUNT(*)
     INTO qtd_chaves
     FROM USER_CONSTRAINTS CON, USER_IND_COLUMNS IND
     WHERE CON.TABLE_NAME = IND.TABLE_NAME AND
          CON.CONSTRAINT_NAME = IND.INDEX_NAME AND
          CON.TABLE_NAME = nome_tabela AND
          CON.CONSTRAINT_TYPE = 'P';
 
    /*Inicia apontador para tabela de nomes dos atributos da tabela passada.*/ 
    OPEN apontador FOR SELECT column_name
                       FROM user_tab_columns
                       WHERE table_name = nome_tabela;
    
     contador := 1;
     
     /*LOOP que processa o código interno um número de vezes igual à quantidade
     de chaves armazenada em qtd..chaves. O apontador, iniciado acima, avança
     até o último atributo chave após execução deste LOOP. 
     Para cada atributo chave é estabelecido a igualdade entre o valor passado
     (valor_chave_1, valor_chave_2, valor_chave_3) e o nome do atributo
     (nome_chave) respectivo. A estrutura formada é armazenada na 
     string SQL_text_pk*/
     FOR i IN 1..qtd_chaves LOOP
       FETCH apontador INTO nome_chave;
       EXIT WHEN apontador%NOTFOUND;
       
       CASE i

        WHEN(1) THEN IF(LENGTH(valor_chave_1) > 0) THEN
              sql_text_pk := sql_text_pk||nome_chave||' = '''||valor_chave_1||''' AND ';
                  END IF;

        WHEN(2) THEN IF(LENGTH(valor_chave_2) > 0) THEN
              sql_text_pk := sql_text_pk||nome_chave||' = '''||valor_chave_2||''' AND '; 
              contador := contador + 1;
                  END IF;

          WHEN(3) THEN IF(LENGTH(valor_chave_3) > 0) THEN
              sql_text_pk := sql_text_pk||nome_chave||' = '''||valor_chave_3||''' AND '; 
              contador := contador + 1;
                  END IF;

         END CASE;
     END LOOP;
     
     sql_text_pk := RTRIM(sql_text_pk,'AND ');

    CLOSE apontador;
             
    /*A variável contador tem valor igual ao número de parâmetros chaves 
    passao ao chamar o procedimento. Caso seu valor seja diferente da quantidade
    de atribuotos chaves da tabela passada, é enviado uma nitificação de erro*/
    
    -- Conta o número de registros que serao apagados
    OPEN n_removidos FOR 'SELECT COUNT(*) FROM ' || nome_tabela || ' WHERE ' || sql_text_pk;

    IF (contador = qtd_chaves) THEN
        /*Realiza exclusão da tupla da tabela passada*/
        EXECUTE IMMEDIATE 'DELETE FROM ' || nome_tabela ||
                      ' WHERE '||sql_text_pk;
    ELSE
        RAISE EXCESSAO_CHAVES;
    END IF;
        
  EXCEPTION
   WHEN EXCESSAO_CHAVES THEN
          RAISE_APPLICATION_ERROR(-20030,'Número de parâmetros chaves insuficiente!');
    
   WHEN OTHERS THEN       
      CASE SQLCODE
        WHEN -00001 THEN
          RAISE_APPLICATION_ERROR(-20001, 'A exclusão falhou por causa de ' ||
                                  'restrição de chave primária!');
        WHEN -01400 THEN
          RAISE_APPLICATION_ERROR(-20140, 'A exclusão falhou por causa de ' ||
                                  'restrição de atributo não nulo!');
        WHEN -02290 THEN
          RAISE_APPLICATION_ERROR(-20229, 'A exclusão falhou por causa de ' ||
                                  'restrição de verificação de categoria!');
        WHEN -02292 THEN
          RAISE_APPLICATION_ERROR(-20292, 'A exclusão falhou por causa de ' ||
                                  'restrição de chave estrangeira!');  
        ELSE
             RAISE;
      END CASE;
      
   END REMOVER;

                      /*FIM DA PROCEDURE REMOVER*/ 

/* *****************************************************************************
********************************************************************************
****************************************************************************** */

                   /*PROCEDURE DE INSERÇÃO DE DADOS*/
                   
  /*A procedure INSERIR inclui dados em uma tabela. Para a inclusão dos dados
  é necessário que forneça o nome da tabela e seus atributos na sequência
  correta, conforme definição da DDL.*/     
  PROCEDURE INSERIR(pnome_tabela VARCHAR2,
                    campo_1 VARCHAR2 DEFAULT NULL,
                    campo_2 VARCHAR2 DEFAULT NULL,
                    campo_3 VARCHAR2 DEFAULT NULL,
                    campo_4 VARCHAR2 DEFAULT NULL,
                    campo_5 VARCHAR2 DEFAULT NULL,
                    campo_6 VARCHAR2 DEFAULT NULL,
                    campo_7 VARCHAR2 DEFAULT NULL,
                    campo_8 VARCHAR2 DEFAULT NULL,
                    campo_9 VARCHAR2 DEFAULT NULL,
                    campo_10 VARCHAR2 DEFAULT NULL) AS

    sql_text          VARCHAR2(200);
    sql_text_valores  VARCHAR2(200);
    sql_text_completo VARCHAR2(400);

    /*Declara cursor do tipo REF CURSOR e cria a variável ref_nome_atributo do
    tipo REF CURSOR.*/
    TYPE REFCURSOR IS REF CURSOR;
    ref_nome_atributo REFCURSOR;

    nome_atributo user_tab_columns.column_name%TYPE;
    contador NUMBER DEFAULT 0;

  BEGIN
    /*Inicia apontador para tabela de nomes dos atributos da tabela passada.
    Utiliza tabela USER_TAB_COLUMNS do dicionário de dados*/
    OPEN ref_nome_atributo FOR
      SELECT column_name 
      FROM user_tab_columns
      WHERE table_name = UPPER(pnome_tabela); 

    /*Inicia a estrutura SQL que fará a inserção dos dados na tabela passada
    como parâmetro*/   
    sql_text := 'INSERT INTO '||pnome_tabela||'(';

    contador := 0;
    
    /* Esse loop implementa o processo de criação da string SQL
    que tem como finalidade inserir os dados no banco. Os nomes do atributos são
    armazenados em sql_text e os valores em SQL_text_valores.*/
    LOOP
      FETCH ref_nome_atributo INTO nome_atributo;
      EXIT WHEN ref_nome_atributo%NOTFOUND;

      contador := contador + 1;
      CASE contador
        WHEN(1) THEN IF(LENGTH(campo_1) > 0) THEN
            sql_text := sql_text||nome_atributo||',';
            sql_text_valores := sql_text_valores||''''||campo_1||''''||',';
          END IF;
        WHEN(2) THEN IF(LENGTH(campo_2) > 0) THEN
            sql_text := sql_text||nome_atributo||',';
            sql_text_valores := sql_text_valores||''''||campo_2||''''||',';
          END IF;
        WHEN(3) THEN IF(LENGTH(campo_3) > 0) THEN
            sql_text := sql_text||nome_atributo||',';
            sql_text_valores := sql_text_valores||''''||campo_3||''''||',';
          END IF;
        WHEN(4) THEN IF (LENGTH(campo_4) > 0) THEN
            sql_text := sql_text||nome_atributo||',';
            sql_text_valores := sql_text_valores||''''||campo_4||''''||',';
          END IF;
        WHEN(5) THEN IF (LENGTH(campo_5) > 0) THEN
            sql_text := sql_text||nome_atributo||',';
            sql_text_valores := sql_text_valores||''''||campo_5||''''||',';
          END IF;
        WHEN(6) THEN IF (LENGTH(campo_6) > 0) THEN
            sql_text := sql_text||nome_atributo||',';
            sql_text_valores := sql_text_valores||''''||campo_6||''''||',';
          END IF;
        WHEN(7) THEN IF (LENGTH(campo_7) > 0) THEN
            sql_text := sql_text||nome_atributo||',';
            sql_text_valores := sql_text_valores||''''||campo_7||''''||',';
          END IF;
        WHEN(8) THEN IF (LENGTH(campo_8) > 0) THEN
            sql_text := sql_text||nome_atributo||',';
            sql_text_valores := sql_text_valores||''''||campo_8||''''||',';
          END IF;
        WHEN(9) THEN IF (LENGTH(campo_9) > 0) THEN
            sql_text := sql_text||nome_atributo||',';
            sql_text_valores := sql_text_valores||''''||campo_9||''''||',';
          END IF;
        WHEN(10) THEN IF (LENGTH(campo_10) > 0) THEN
            sql_text := sql_text||nome_atributo||',';
            sql_text_valores := sql_text_valores||''''||campo_10||''''||',';
        END IF;

      END CASE;
    END LOOP;

    sql_text := TRIM(TRAILING ',' from sql_text);
    sql_text_valores := TRIM(TRAILING ',' from sql_text_valores);
    sql_text_completo := sql_text||')VALUES('||sql_text_valores||')';
    
    EXECUTE IMMEDIATE sql_text_completo;

    EXCEPTION
      WHEN OTHERS THEN
       CASE SQLCODE
        WHEN -00001 THEN
          RAISE_APPLICATION_ERROR(-20001, 'A alteração falhou por causa de ' ||
                                  'restrição de chave primária!');
        WHEN -01400 THEN
          RAISE_APPLICATION_ERROR(-20140, 'A alteração falhou por causa de ' ||
                                  'restrição de atributo não nulo!');
        WHEN -02290 THEN
          RAISE_APPLICATION_ERROR(-20229, 'A alteração falhou por causa de ' ||
                                  'restrição de verificação de categoria!');
        WHEN -02292 THEN
          RAISE_APPLICATION_ERROR(-20292, 'A exclusão falhou por causa de ' ||
                                          'restrição de chave estrangeira!');                  
        ELSE
          RAISE;
      END CASE;
      
  END INSERIR;
  
            /*FIM DA PROCEDURE DE INSERÇÃO DE DADOS*/
            
/* *****************************************************************************
********************************************************************************
****************************************************************************** */
  
                        /*PROCEDURE ATUALIZAR*/
                        
  /*A procedure ATUALIZAR altera dados em uma tabela. Para a alteração dos dados
  é necessário que forneça o nome da tabela e seus atributos chaves na sequência
  correta, além dos atributos a serem atualizados.*/
           
  PROCEDURE ATUALIZAR(n_alterados OUT REF_CURSOR, pnome_tabela VARCHAR2,
                          campo_1 VARCHAR2 DEFAULT NULL,
                          campo_2 VARCHAR2 DEFAULT NULL,
                          campo_3 VARCHAR2 DEFAULT NULL,
                          campo_4 VARCHAR2 DEFAULT NULL,
                          campo_5 VARCHAR2 DEFAULT NULL,
                          campo_6 VARCHAR2 DEFAULT NULL,
                          campo_7 VARCHAR2 DEFAULT NULL,
                          campo_8 VARCHAR2 DEFAULT NULL,
                          campo_9 VARCHAR2 DEFAULT NULL,
                          campo_10 VARCHAR2 DEFAULT NULL) AS

  sql_text_pk       VARCHAR2(400) DEFAULT NULL;
  sql_text          VARCHAR2(400) DEFAULT NULL;
  sql_text_completo VARCHAR2(400) DEFAULT NULL;

  TYPE REFCURSOR IS REF CURSOR;
  Ref_nome_atributo REFCURSOR;

  --Variável utilizada para armazenar contagem do número de chaves
  qtd_chaves NUMBER(1);

  nome_atributo user_tab_columns.column_name%TYPE;
  nome_atributo_pk user_tab_columns.column_name%TYPE;

  contador NUMBER DEFAULT 0;
  EXCESSAO_CHAVES EXCEPTION;

  BEGIN
  
  /*Busca em SQL que faz a contagem do número de atributos chaves da tabela*/
  SELECT COUNT(*)
    INTO qtd_chaves
    FROM USER_CONSTRAINTS CON, USER_IND_COLUMNS IND
    WHERE CON.TABLE_NAME = IND.TABLE_NAME AND
          CON.CONSTRAINT_NAME = IND.INDEX_NAME AND
          CON.TABLE_NAME = pnome_tabela AND
          CON.CONSTRAINT_TYPE = 'P';
  
    OPEN ref_nome_atributo FOR
      SELECT column_name 
      FROM user_tab_columns
      WHERE table_name = UPPER(pnome_tabela); 

    
    contador := 1;
    /*Faz referência a cada atributo chave respeitando quantidade de chaves*/
    FOR i IN 1..qtd_chaves LOOP
     FETCH ref_nome_atributo INTO nome_atributo;
     EXIT WHEN ref_nome_atributo%NOTFOUND;
     
     CASE contador 
      
        WHEN(1) THEN
          IF(LENGTH(campo_1) > 0) THEN
            sql_text_pk := sql_text_pk || nome_atributo||' = '''||campo_1||''' AND ';
          END IF;
          
        WHEN(2) THEN
          IF(LENGTH(campo_2) > 0) THEN
            sql_text_pk := sql_text_pk || nome_atributo||' = '''||campo_2||''' AND ';
            contador := contador + 1;
          END IF;
          
        WHEN(3) THEN
          IF (LENGTH(campo_3) > 0) THEN
            sql_text_pk := sql_text_pk || nome_atributo||' = '''||campo_3||''' AND ';
            contador := contador + 1;
          END IF;

      END CASE;

    END LOOP;
    
    sql_text_pk := RTRIM(sql_text_pk,'AND ');

    IF (contador < qtd_chaves) THEN
        RAISE EXCESSAO_CHAVES;
    END IF;
   
    sql_text :=  'UPDATE '||pnome_tabela||' SET ';
    
    contador := qtd_chaves + 1;
    LOOP
      FETCH ref_nome_atributo INTO nome_atributo;
      EXIT WHEN ref_nome_atributo%NOTFOUND;
      
      CASE contador
        WHEN(2) THEN
          IF(LENGTH(campo_2) > 0) THEN
            sql_text := sql_text || nome_atributo||' = '''||campo_2||''',';
          END IF;
        WHEN(3) THEN
          IF(LENGTH(campo_3) > 0) THEN
            sql_text := sql_text || nome_atributo||' = '''||campo_3||''',';
          END IF;
        WHEN(4) THEN
          IF (LENGTH(campo_4) > 0) THEN
            sql_text := sql_text || nome_atributo||' = '''||campo_4||''',';
          END IF;
        WHEN(5) THEN
          IF (LENGTH(campo_5) > 0) THEN
            sql_text := sql_text || nome_atributo||' = '''||campo_5||''',';
          END IF;
        WHEN(6) THEN
          IF (LENGTH(campo_6) > 0) THEN
            sql_text := sql_text || nome_atributo||' = '''||campo_6||''',';
          END IF;
        WHEN(7) THEN
          IF (LENGTH(campo_7) > 0) THEN
            sql_text := sql_text || nome_atributo||' = '''||campo_7||''',';
          END IF;
        WHEN(8) THEN
          IF (LENGTH(campo_8) > 0) THEN
            sql_text := sql_text || nome_atributo||' = '''||campo_8||''',';
          END IF;
        WHEN(9) THEN
          IF (LENGTH(campo_9) > 0) THEN
            sql_text := sql_text || nome_atributo||' = '''||campo_9||''',';
          END IF;
        WHEN(10) THEN
          IF (LENGTH(campo_10) > 0) THEN
            sql_text := sql_text || nome_atributo||' = '''||campo_10||''',';
          END IF;

      END CASE;
      
      contador := contador + 1;
    END LOOP;

    CLOSE ref_nome_atributo;

    -- Conta o número de registros que serao alterados
    OPEN n_alterados FOR 'SELECT COUNT(*) FROM ' || UPPER(pnome_tabela) || ' WHERE ' || sql_text_pk;
    
    sql_text := TRIM(TRAILING ',' FROM sql_text);
    sql_text_completo := sql_text||' WHERE '||sql_text_pk;

    --DBMS_OUTPUT.PUT_LINE(sql_text_completo);
    EXECUTE IMMEDIATE sql_text_completo;

    EXCEPTION
    WHEN EXCESSAO_CHAVES THEN
          RAISE_APPLICATION_ERROR(-20030,'Número de parâmetros chaves insuficiente!');
    
    WHEN OTHERS THEN
      CASE SQLCODE
        WHEN -00001 THEN
          RAISE_APPLICATION_ERROR(-20001, 'A alteração falhou por causa de ' ||
                                  'restrição de chave primária!');
        WHEN -01400 THEN
          RAISE_APPLICATION_ERROR(-20140, 'A alteração falhou por causa de ' ||
                                  'restrição de atributo não nulo!');
        WHEN -02290 THEN
          RAISE_APPLICATION_ERROR(-20229, 'A alteração falhou por causa de ' ||
                                  'restrição de verificação de categoria!');
        WHEN -02292 THEN
          RAISE_APPLICATION_ERROR(-20292, 'A exclusão falhou por causa de ' ||
                                          'restrição de chave estrangeira!');                  
       ELSE
          RAISE;
      END CASE;

  END ATUALIZAR;
                  /*FIM DA PROCEDURE DE ATUALIZAÇÃO DE DADOS*/


/* *****************************************************************************
********************************************************************************
***************************************************************************** */

                   /*PROCEDURES AUXILIARES PARA A APLICAÇÃO*/

 
                          /*PROCEDURE VERIFICA_CHAVES*/

  /*A procedure VERIFICA_CHAVES é utilizada para fazer consulta em tabelas, cujo nome
  deve ser fornecido, gerando uma lista de dados (todos atributos) e retornando 
  dois REF CURSORS para serem usados na aplicação.
 
  O objetivo é, dado um conjunto de chaves, verificar se tais chaves identificam
  uma tupla.
  n_tuplas indicará se alguma tupla foi encontrada.
  resultado apontara para a tupla, caso seja encontrada.
  
  Essa procedure foi construída para a função ATUALIZAR da aplicação
  */                         
  PROCEDURE VERIFICA_CHAVES(n_tuplas  OUT REF_CURSOR,
                            resultado OUT REF_CURSOR,
                            nome VARCHAR2,
                            valor_chave_1 VARCHAR2, 
                            valor_chave_2 VARCHAR2 DEFAULT NULL,
                            valor_chave_3 VARCHAR2 DEFAULT NULL) AS
    
    qtd_chaves    NUMBER DEFAULT 0; 
    contador      NUMBER;
    nome_tabela   USER_TABLES.TABLE_NAME%TYPE;
    nome_chave    USER_TAB_COLUMNS.COLUMN_NAME%TYPE;
    texto_sql     VARCHAR2(1000);
    sql_text_pk   VARCHAR2(1000);
    
  BEGIN
  
    nome_tabela := UPPER(nome);
    
    /*Verifica quantidade de atibutos chaves da tabela passada como parâmetro.
    Foram usadas as tabelas USER_ind_COLUMNS e USER_CONSTRAINTS do dicionário
    de dados*/
    SELECT COUNT(*)
    INTO qtd_chaves
    FROM V01_ATRIBUTOS
    WHERE TABLE_NAME = nome_tabela AND CONSTRAINT_TYPE = 'P';
  
    /*Faz apontador referenciar o primeiro nome da tabela de atributos chaves
    gerada pelo SELECT abaixo. Foram usadas as tabelas USER_CONS_COLUMNS e 
    USER_CONSTRAINTS do dicionário de dados*/
    OPEN resultado FOR
       SELECT column_name
       FROM V01_ATRIBUTOS  
       WHERE TABLE_NAME = nome_tabela AND CONSTRAINT_TYPE = 'P';
    
    contador := 0;
    /*o apontador faz referência a cada nome de atributo chave respeitando 
    quantidade de chaves atribuida a variável qtd_chaves. Em cada LOOP, um nome 
    de atributo chave é armazenado em nome_chave. Esse nome de atributo, junto 
    ao respectivo valor passado como parâmetro é concatenado na varável
    sql_text_pk, que posteriormente é usado na consulta SQL após a clausula
    WHERE.*/
    FOR i IN 1..qtd_chaves LOOP
     FETCH resultado INTO nome_chave;
     
     CASE i 
      
        WHEN(1) THEN
          IF(LENGTH(valor_chave_1) > 0) THEN
            sql_text_pk := sql_text_pk || nome_chave||' = '''||valor_chave_1||''' AND ';
          END IF;
          
        WHEN(2) THEN
          IF(LENGTH(valor_chave_2) > 0) THEN
            sql_text_pk := sql_text_pk || nome_chave||' = '''||valor_chave_2||''' AND ';
          END IF;
          
        WHEN(3) THEN
          IF (LENGTH(valor_chave_3) > 0) THEN
            sql_text_pk := sql_text_pk || nome_chave||' = '''||valor_chave_3||''' AND ';
          END IF;

      END CASE;

    END LOOP;
    
    sql_text_pk := RTRIM(sql_text_pk,'AND ');

    CLOSE resultado;
       
    texto_sql :=  'SELECT * FROM ' || nome_tabela ||
                  ' WHERE ' || sql_text_pk; 
  
    /* Retorna o conjunto de tuplas */
    OPEN resultado FOR texto_sql;
    
    /* Retorna a quantidade de tuplas */
    OPEN n_tuplas FOR 'SELECT COUNT(*) FROM ' || nome_tabela ||
                      ' WHERE ' || sql_text_pk; 
    
  EXCEPTION
    WHEN OTHERS THEN
      RAISE;
    
END VERIFICA_CHAVES;

               /*FIM DA PROCEDURE VERIFICA_CHAVES*/
 
 
  
  /* Esta procedure retorna um ponteiro para uma consulta com todos os atributos
  da databela fornecida como parâmetro, inclusive o tamanho do atributo, seu
  tipo, e se é chave primária ou não */
  PROCEDURE obter_atributos(p_nome_tabela IN VARCHAR2,
                            p_refcur_atributos OUT REF_CURSOR) AS
  
    nome_tabela USER_TABLES.TABLE_NAME%TYPE;

  BEGIN
    nome_tabela := UPPER(p_nome_tabela);
    
    OPEN p_refcur_atributos FOR 
      SELECT COLUMN_NAME, DATA_LENGTH, DATA_TYPE, CONSTRAINT_TYPE
      FROM V01_ATRIBUTOS
      WHERE TABLE_NAME = nome_tabela;
  
  END obter_atributos;
  
  
  /* Esta procedure retorna um ponteiro para uma consulta
     com todos os atributos-chaves da databela fornecida como parâmetro,
     inclusive o tamanho do atributo e seu tipo */
  PROCEDURE obter_chaves(p_nome_tabela IN VARCHAR2, 
                         p_refcur_atributos OUT REF_CURSOR) AS
  
    nome_tabela USER_TABLES.TABLE_NAME%TYPE;

  BEGIN
    nome_tabela := UPPER(p_nome_tabela);
    
    OPEN p_refcur_atributos FOR 
      SELECT COLUMN_NAME, DATA_LENGTH, DATA_TYPE
      FROM V01_ATRIBUTOS
      WHERE TABLE_NAME = nome_tabela AND CONSTRAINT_TYPE = 'P';
  
  END obter_chaves;
  
  
  /* Esta procedure retorna um ponteiro para uma consulta
     com todos os nomes de tabelas do esquema do usuário */
  PROCEDURE obter_tabelas(p_refcur_tabelas OUT REF_CURSOR) AS
  BEGIN
  
    OPEN p_refcur_tabelas FOR 
      SELECT TABLE_NAME
      FROM USER_TABLES
      ORDER BY TABLE_NAME;
  
  END obter_tabelas;

END GERENCIAR;
/


--Exercicios 2 a 5

-- Primeira etapa..  HEADER do PACKAGE

create or replace
PACKAGE Consultas AS

 type refx is ref cursor;
  
 /* Procedimento do exercício 2 */
 PROCEDURE listar_curso_prof_aluno(p_x out Consultas.refx);
 
 /* Procedimento do exercício 3 */
 PROCEDURE relatorio_repetentes(p_x1 out Consultas.refx, p_x2 out Consultas.refx, p_x3 out Consultas.refx);
 
 /* Procedimento do exercício 4 */
 PROCEDURE list_pre_req(p_x out Consultas.refx);
 
 /* Procedimento do exercício 5 */
 PROCEDURE lista_info_disc_refer(p_x1 out Consultas.refx, p_x2 out Consultas.refx);
  
END Consultas; 
/



--------------------------------------------------
-- Segunda etapa.. BODY do PACKAGE
create or replace
PACKAGE BODY Consultas AS 
   
  PROCEDURE listar_curso_prof_aluno(p_x out Consultas.refx) AS 
  	BEGIN      
      open p_x for select * from listar_curso_professor_aluno;
    END listar_curso_prof_aluno;

---------------------------------
  
  PROCEDURE relatorio_repetentes(p_x1 out Consultas.refx, p_x2 out Consultas.refx, p_x3 out Consultas.refx) AS 
  	BEGIN      
      open p_x1 for select reprovados.NOMEUSUARIO as alunos_repetentes,reprovados.Na__disciplina as Na_disciplina 
                    from reprovados; 
                    -- quais alunos são repetentes  em quais disciplinas reprovaram.
      open p_x2 for select  aprovados.NOMEUSUARIO as alunos_que_refizeram,aprovados.na___disciplina as e_passaram_na_disciplina 
                    from reprovados,aprovados 
                    where aprovados.aluno_aprovado=reprovados.aluno_reprovado 
                    and aprovados.na___disciplina=reprovados.na__disciplina;
                    --disciplinas onde houve reprovação,indicar para cada uma se um dado aluno já conseguiu conclusão ;
      open p_x3 for select Alunos_que_devem_refazer_a,disciplina 
                    from(
                      select reprovados.NOMEUSUARIO as Alunos_que_devem_refazer_a,reprovados.Na__disciplina as disciplina 
                      from reprovados
                      MINUS  --  faz a diferença entre dois select
                      select reprovados.NOMEUSUARIO as Alunos_que_devem_refazer_a,reprovados.Na__disciplina as disciplina
                      from reprovados,aprovados 
                      where aprovados.aluno_aprovado=reprovados.aluno_reprovado 
                      and aprovados.na___disciplina=reprovados.na__disciplina);
                    --Com relação apenas a estas disciplinas onde houve reprovação,indicar para cada uma se um dado aluno ainda precisa refazê-la;
    END relatorio_repetentes;
    
--------------------------

    PROCEDURE list_pre_req(p_x out Consultas.refx) AS
    
      v_disc prerequisito.sigladisc%TYPE;
      v_req prerequisito.siglareq%TYPE;
      counter NUMBER;
      i NUMBER;
      sqltext VARCHAR2(2000);

      TYPE refCursorDisc IS REF CURSOR;
        emString refCursorDisc;
        disc l07_disciplina.sigladisc%TYPE;      
        
      BEGIN 
        OPEN emString FOR SELECT sigladisc from l07_disciplina order by sigladisc;
        LOOP
          Fetch emString INTO disc;
          EXIT WHEN emString%NOTFOUND;
          DBMS_OUTPUT.PUT_LINE(disc);
    
          SELECT count(siglareq) into counter 
          FROM prerequisito 
          WHERE sigladisc = disc;
    
          i:= 1;
          WHILE i <= counter
          LOOP    
            sqltext:= sqltext || 'SELECT sigladisc, siglareq FROM prerequisito WHERE sigladisc = ''' || disc || ''' UNION ' ;
            i := i + 1;
          END LOOP;
          
        END LOOP;
        sqltext:= sqltext || ' SELECT sigladisc, siglareq FROM l07_disciplina LEFT JOIN l08_prerequisito USING(sigladisc)';
        
        open p_x for sqltext;

      EXCEPTION /* exceções associadas ao SELECT INTO */
      WHEN NO_DATA_FOUND THEN dbms_output.put_line('.');
    END list_pre_req;
    
--------------------------------

    PROCEDURE lista_info_disc_refer (p_x1 out Consultas.refx, p_x2 out Consultas.refx) AS
    
      sql_text VARCHAR2(2600);
      sql_text2 VARCHAR2(2600);
    
      TYPE cursor_type IS REF CURSOR;
    
      emString cursor_type;
      disc l07_disciplina.sigladisc%TYPE;

      BEGIN  
        sql_text := ' '; 
        sql_text2 := ' '; 
   
        OPEN emString FOR select sigladisc from l07_disciplina;
        LOOP
          FETCH emString INTO disc;
          EXIT WHEN emString%NOTFOUND;
          --para mostrar informacoes sobre as referencias
          sql_text := sql_text || 'select * from l17_utiliza_discreferencia,l14_referencia where CODREFERENCIA_UTIL=CODREFERENCIA and SIGDISCIPLINA_UTIL= ''' || disc || '''' || ' UNION ';
 
          -- para o calculo do total de paginas 
          sql_text2 := sql_text2 || 'select SIGDISCIPLINA_UTIL, sum (QTDPAGINAS) as total_paginas from l17_utiliza_discreferencia,l14_referencia where CODREFERENCIA_UTIL=CODREFERENCIA and SIGDISCIPLINA_UTIL='''|| disc ||'''' || ' GROUP BY SIGDISCIPLINA_UTIL UNION ';
   
        END LOOP;
        sql_text := rtrim(sql_text, 'UNION ') || ' order by 2'; -- 2 é a coluna de SIGDISCIPLINA_UTIL
        sql_text2 := rtrim(sql_text2, 'UNION ')|| ' order by 1'; -- 2 é a coluna de SIGDISCIPLINA_UTIL
        
        --dbms_output.put_line(sql_text);
        --dbms_output.put_line(sql_text2);
        
        open p_x1 for sql_text;
        open p_x2 for sql_text2;
        
      EXCEPTION /* exceções associadas ao SELECT INTO */
        WHEN NO_DATA_FOUND THEN  dbms_output.put_line('.');
    END lista_info_disc_refer;
    
END Consultas;