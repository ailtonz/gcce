CREATE DEFINER=`Ailto_user`@`%` PROCEDURE `spCadastroCliente`(IN `p_ID` INT
, IN `p_CADASTRO_TIPO` VARCHAR(2)
, IN `p_CNPJ_CPF` VARCHAR(50)
, IN `p_IE_RG` VARCHAR(50)
, IN `p_NOME` VARCHAR(50)

, IN `p_CEP` VARCHAR(8)
, IN `p_NUMERO` VARCHAR(10)
, IN `p_COMPLEMENTO` VARCHAR(50)
, IN `p_ENDERECO` VARCHAR(200)
, IN `p_BAIRRO` VARCHAR(50)
, IN `p_CIDADE` VARCHAR(50)
, IN `p_ESTADO` VARCHAR(2)

, IN `p_CONTATO` VARCHAR(50)
, IN `p_TELEFONE` VARCHAR(50)
, IN `p_EMAIL` VARCHAR(120)

, IN `p_CADASTRO_PROPAGANDA` VARCHAR(50)
, IN `p_CADASTRO_OBSERVACAO` VARCHAR(50)
, IN `p_CADASTRO_STATUS` VARCHAR(50)

, IN `p_USUARIO` VARCHAR(10)
)
	LANGUAGE SQL
	NOT DETERMINISTIC
	CONTAINS SQL
	SQL SECURITY DEFINER
	COMMENT ''
BEGIN
DECLARE p_CATEGORIA 	VARCHAR(50);
#teste de uso
SET p_CATEGORIA = 'CLIENTE';

IF p_ID = "0" THEN
 INSERT INTO cadastros
         (
			CADASTRO_TIPO	,
			CNPJ_CPF	,
			IE_RG		,
			NOME		,

			CEP		       ,
			NUMERO		   ,
			COMPLEMENTO    ,			
			ENDERECO       , 
			BAIRRO	       ,
			CIDADE         ,
			ESTADO	       ,

			CONTATO		,
            TELEFONE	,
			EMAIL		,
			
			CADASTRO_PROPAGANDA	,
			CADASTRO_OBSERVACAO	,
			CADASTRO_STATUS 		,

			REGISTRO_CATEGORIA,
			REGISTRO_INSERT_EMISSAO	,
			REGISTRO_INSERT_USUARIO ,
			REGISTRO_UPDATE_EMISSAO	,
			REGISTRO_UPDATE_USUARIO 
         )
    VALUES 
         (
			trim(ucase(p_CADASTRO_TIPO)),
            trim(ucase(p_CNPJ_CPF)) , 
			trim(ucase(p_IE_RG))   	, 
			trim(ucase(p_NOME))   	, 
			
			trim(ucase(p_CEP))  	, 
			p_NUMERO				,
			trim(ucase(p_COMPLEMENTO))	,			
			trim(ucase(p_ENDERECO))   	, 
			trim(ucase(p_BAIRRO))   	, 
			trim(ucase(p_CIDADE))   	, 
			trim(ucase(p_ESTADO))   	, 

			trim(ucase(p_CONTATO))  , 
            p_TELEFONE   			, 
			trim(lcase(p_EMAIL))   	, 

			trim(ucase(p_CADASTRO_PROPAGANDA)), 
			trim(ucase(p_CADASTRO_OBSERVACAO)), 
			trim(ucase(p_CADASTRO_STATUS))   , 
			
			p_CATEGORIA,
			
			now()						 , 				
			trim(ucase(p_USUARIO)),
			now()						 , 				
			trim(ucase(p_USUARIO)) 	
         );
ELSEIF p_ID <> "0" THEN

	IF p_NOME <> "" THEN
		UPDATE cadastros
			SET 
				CADASTRO_TIPO	=	trim(ucase(p_CADASTRO_TIPO)) , 
				CNPJ_CPF	=	trim(ucase(p_CNPJ_CPF)) , 
				IE_RG		=	trim(ucase(p_IE_RG))   	, 
				NOME		=	trim(ucase(p_NOME))   	, 

			
				CEP 			= trim(ucase(p_CEP))   	 	 , 
				NUMERO			= p_NUMERO					 ,
				COMPLEMENTO		= trim(ucase(p_COMPLEMENTO)) , 
				ENDERECO 		= trim(ucase(p_ENDERECO))    , 				
				BAIRRO 			= trim(ucase(p_BAIRRO))   	 , 				
				CIDADE 			= trim(ucase(p_CIDADE))      , 
				ESTADO 			= trim(ucase(p_ESTADO))      ,  

				CONTATO		=	trim(ucase(p_CONTATO))  , 
                TELEFONE	=	p_TELEFONE   			, 
				EMAIL		=	trim(lcase(p_EMAIL))   	,				
                
                
				CADASTRO_PROPAGANDA	=	trim(ucase(p_CADASTRO_PROPAGANDA))   ,
				CADASTRO_OBSERVACAO	=	trim(ucase(p_CADASTRO_OBSERVACAO))   ,
				CADASTRO_STATUS	=	trim(ucase(p_CADASTRO_STATUS))   ,
				
				REGISTRO_UPDATE_USUARIO   	= ucase(p_USUARIO) 	,
				REGISTRO_UPDATE_EMISSAO		= now()	
				
			WHERE ID = p_ID;
	ELSE
		DELETE FROM cadastros WHERE ID = p_ID;
	END IF;
	
END IF; 
         
END