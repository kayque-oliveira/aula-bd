CREATE DATABASE pesquisa WITH ENCODING = 'UTF8';

CREATE TABLE public.usuario(
    cod integer NOT NULL,
    login character varying(255) NOT NULL,
    senha character varying(30) NOT NULL,
    PRIMARY KEY (cod),
    UNIQUE (login, senha)
);

CREATE TABLE public.email(
    usuarioCod integer,
    email character varying(100),
    PRIMARY KEY (usuarioCod, email),
    FOREIGN KEY (usuarioCod) REFERENCES public.usuario (cod)
        	ON UPDATE CASCADE
        	ON DELETE CASCADE
);

CREATE TABLE public.respondente (
    respondenteCod integer NOT NULL,
    cpf character varying(50) NOT NULL,
    PRIMARY KEY (respondenteCod),
    UNIQUE (cpf),
    FOREIGN KEY (respondenteCod) REFERENCES public.usuario (cod)
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);

CREATE TABLE public.agente(
    agenteCod integer NOT NULL,
    cargo  character varying(255) NOT NULL,
    PRIMARY KEY (agenteCod),
    FOREIGN KEY (agenteCod) REFERENCES public.usuario (cod)
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);

CREATE TABLE public.questionario(
    cod integer,
    titulo character varying(255) NOT NULL,
    dataCriacao date,
    dataTermino date,
    agenteCod integer,
    descricao text,
    PRIMARY KEY (cod),
    FOREIGN KEY (agenteCod) REFERENCES public.agente (agenteCod)
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CHECK (dataTermino > dataCriacao)
);

CREATE TABLE public.questao(
    cod integer,
    enunciado character varying(255) NOT NULL,
    tipo character varying(10) NOT NULL,
    PRIMARY KEY (cod),
    CHECK (tipo IN ('subjetiva','objetiva'))
);

CREATE TABLE public.associa(
    questaoCod integer,
    questionarioCod integer,
    obrigatoria boolean NOT NULL,
    peso real NOT NULL,
    PRIMARY KEY (questaoCod, questionarioCod),
    FOREIGN KEY (questaoCod) REFERENCES public.questao (cod)
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    FOREIGN KEY (questionarioCod) REFERENCES public.questionario (cod)
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);

CREATE TABLE public.responde(
    respondentecod integer,
    questaocod integer,
    questionariocod integer,
    resposta text  NOT NULL,
    PRIMARY KEY (respondentecod, questaocod, questionariocod),
    FOREIGN KEY (questaocod) REFERENCES public.questao (cod)
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    FOREIGN KEY (questionariocod) REFERENCES public.questionario (cod)
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    FOREIGN KEY (respondentecod) REFERENCES public.respondente (respondentecod)
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);

INSERT INTO public.usuario(cod, login, senha)
	VALUES
	(1,'Maria Reis','123456789'),
	(2,'Joao Silva','2552acbc'),
	(3,'José Alencar','adbde123'),
	(4,'Helena Maria','123584d'),
	(5,'Priscila Santos','aaaddd'),
	(6,'Gloria Santos','2680145'),
	(7,'Marcos Nogueira','2091992'),
	(8,'Leticia Alencar','aabb123'),
	(9,'Ana Rita','aaabbbcccc'),
	(10,'Marcelo Silva','123456789');

INSERT INTO public.agente(agentecod, cargo)
	VALUES
	(1,'Enfermeira'),
	(2,'Psicologo');

INSERT INTO public.respondente(respondentecod, cpf)
	VALUES
	(3,'362.110.144-55'),
	(4,'121.110.144-55'),
	(5,'111.125.144-40'),
	(6,'180.155.255-55');

INSERT INTO public.questionario(cod, titulo, datacriacao, datatermino, agentecod, descricao)
	VALUES
	(1,'Censo Zona Urbana - Itajuba MG','2019-03-25','2019-04-25',1,'Censo Realizado no Município de Itajubá para o ano de 2019'),
	(2,'Censo Zona Rural - Itajubá MG','2019-03-20','2019-05-20',2,'Censo Realizado no Município de Itajubá para o ano de 2019');

INSERT INTO public.questao(cod, enunciado, tipo)
	VALUES
	(1,'NESTE DOMICÍLIO EXISTE ÁGUA CANALIZADA (ENCANADA)?','objetiva'),
	(2,'EXISTE ENERGIA ELÉTRICA NO DOMICÍLIO?','objetiva'),
	(3,'EXISTE MEDIDOR OU RELÓGIO NO DOMICÍLIO?','objetiva'),
	(4,'QUANTAS PESSOAS MORAVAM NESTE DOMICÍLIO EM 31 DE JANEIRO DE 2019?','objetiva'),
	(5,'QUAL ERA A OCUPAÇÃO QUE EXERCIA NO TRABALHO QUE TINHA?','subjetiva'),
	(6,'QUAL É A SUA CRENÇA RELIGIOSA?','subjetiva');

INSERT INTO public.associa( questaocod, questionariocod, obrigatoria, peso)
	VALUES
	(1,1,True,0.25),
	(2,1,True,0.5),
	(1,2,False,0.3),
	(2,2,False,0.7),
	(3,1,True,0.8),
	(3,2,True,0.1);

INSERT INTO public.responde(respondentecod, questaocod, questionariocod, resposta)
	VALUES
	(3,1,1,'SIM'),
	(3,2,1,'SIM'),
	(4,1,1,'NAO'),
	(4,3,2,'NAO'),
	(5,1,2,'SIM'),
  (3,3,1,'SIM'),
  (3,4,1,'SIM'),
  (3,5,1,'NAO'),
  (3,6,1,'SIM');

INSERT INTO public.email(usuariocod, email)
	VALUES (3, 'jose-alencar@email.com');
