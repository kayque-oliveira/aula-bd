PGDMP                         w            pesquisa    11.2    11.2 '    ;           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            <           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            =           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            >           1262    17113    pesquisa    DATABASE     �   CREATE DATABASE pesquisa WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Portuguese_Brazil.1252' LC_CTYPE = 'Portuguese_Brazil.1252';
    DROP DATABASE pesquisa;
             postgres    false            �            1259    17143    agente    TABLE     j   CREATE TABLE public.agente (
    agentecod integer NOT NULL,
    cargo character varying(255) NOT NULL
);
    DROP TABLE public.agente;
       public         postgres    false            �            1259    17173    associa    TABLE     �   CREATE TABLE public.associa (
    questaocod integer NOT NULL,
    questionariocod integer NOT NULL,
    obrigatoria boolean NOT NULL,
    peso real NOT NULL
);
    DROP TABLE public.associa;
       public         postgres    false            �            1259    17121    email    TABLE     j   CREATE TABLE public.email (
    usuariocod integer NOT NULL,
    email character varying(100) NOT NULL
);
    DROP TABLE public.email;
       public         postgres    false            �            1259    17167    questao    TABLE     #  CREATE TABLE public.questao (
    cod integer NOT NULL,
    enunciado character varying(255) NOT NULL,
    tipo character varying(10) NOT NULL,
    CONSTRAINT questao_tipo_check CHECK (((tipo)::text = ANY ((ARRAY['subjetiva'::character varying, 'objetiva'::character varying])::text[])))
);
    DROP TABLE public.questao;
       public         postgres    false            �            1259    17153    questionario    TABLE     	  CREATE TABLE public.questionario (
    cod integer NOT NULL,
    titulo character varying(255) NOT NULL,
    datacriacao date,
    datatermino date,
    agentecod integer,
    descricao text,
    CONSTRAINT questionario_check CHECK ((datatermino > datacriacao))
);
     DROP TABLE public.questionario;
       public         postgres    false            �            1259    17188    responde    TABLE     �   CREATE TABLE public.responde (
    respondentecod integer NOT NULL,
    questaocod integer NOT NULL,
    questionariocod integer NOT NULL,
    resposta text NOT NULL
);
    DROP TABLE public.responde;
       public         postgres    false            �            1259    17131    respondente    TABLE     q   CREATE TABLE public.respondente (
    respondentecod integer NOT NULL,
    cpf character varying(50) NOT NULL
);
    DROP TABLE public.respondente;
       public         postgres    false            �            1259    17114    usuario    TABLE     �   CREATE TABLE public.usuario (
    cod integer NOT NULL,
    login character varying(255) NOT NULL,
    senha character varying(30) NOT NULL
);
    DROP TABLE public.usuario;
       public         postgres    false            4          0    17143    agente 
   TABLE DATA               2   COPY public.agente (agentecod, cargo) FROM stdin;
    public       postgres    false    199   _.       7          0    17173    associa 
   TABLE DATA               Q   COPY public.associa (questaocod, questionariocod, obrigatoria, peso) FROM stdin;
    public       postgres    false    202   �.       2          0    17121    email 
   TABLE DATA               2   COPY public.email (usuariocod, email) FROM stdin;
    public       postgres    false    197   �.       6          0    17167    questao 
   TABLE DATA               7   COPY public.questao (cod, enunciado, tipo) FROM stdin;
    public       postgres    false    201   (/       5          0    17153    questionario 
   TABLE DATA               c   COPY public.questionario (cod, titulo, datacriacao, datatermino, agentecod, descricao) FROM stdin;
    public       postgres    false    200   "0       8          0    17188    responde 
   TABLE DATA               Y   COPY public.responde (respondentecod, questaocod, questionariocod, resposta) FROM stdin;
    public       postgres    false    203   �0       3          0    17131    respondente 
   TABLE DATA               :   COPY public.respondente (respondentecod, cpf) FROM stdin;
    public       postgres    false    198   1       1          0    17114    usuario 
   TABLE DATA               4   COPY public.usuario (cod, login, senha) FROM stdin;
    public       postgres    false    196   O1       �
           2606    17147    agente agente_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.agente
    ADD CONSTRAINT agente_pkey PRIMARY KEY (agentecod);
 <   ALTER TABLE ONLY public.agente DROP CONSTRAINT agente_pkey;
       public         postgres    false    199            �
           2606    17177    associa associa_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public.associa
    ADD CONSTRAINT associa_pkey PRIMARY KEY (questaocod, questionariocod);
 >   ALTER TABLE ONLY public.associa DROP CONSTRAINT associa_pkey;
       public         postgres    false    202    202            �
           2606    17125    email email_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.email
    ADD CONSTRAINT email_pkey PRIMARY KEY (usuariocod, email);
 :   ALTER TABLE ONLY public.email DROP CONSTRAINT email_pkey;
       public         postgres    false    197    197            �
           2606    17172    questao questao_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.questao
    ADD CONSTRAINT questao_pkey PRIMARY KEY (cod);
 >   ALTER TABLE ONLY public.questao DROP CONSTRAINT questao_pkey;
       public         postgres    false    201            �
           2606    17161    questionario questionario_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.questionario
    ADD CONSTRAINT questionario_pkey PRIMARY KEY (cod);
 H   ALTER TABLE ONLY public.questionario DROP CONSTRAINT questionario_pkey;
       public         postgres    false    200            �
           2606    17195    responde responde_pkey 
   CONSTRAINT     }   ALTER TABLE ONLY public.responde
    ADD CONSTRAINT responde_pkey PRIMARY KEY (respondentecod, questaocod, questionariocod);
 @   ALTER TABLE ONLY public.responde DROP CONSTRAINT responde_pkey;
       public         postgres    false    203    203    203            �
           2606    17137    respondente respondente_cpf_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.respondente
    ADD CONSTRAINT respondente_cpf_key UNIQUE (cpf);
 I   ALTER TABLE ONLY public.respondente DROP CONSTRAINT respondente_cpf_key;
       public         postgres    false    198            �
           2606    17135    respondente respondente_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.respondente
    ADD CONSTRAINT respondente_pkey PRIMARY KEY (respondentecod);
 F   ALTER TABLE ONLY public.respondente DROP CONSTRAINT respondente_pkey;
       public         postgres    false    198            �
           2606    17120    usuario usuario_login_senha_key 
   CONSTRAINT     b   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_login_senha_key UNIQUE (login, senha);
 I   ALTER TABLE ONLY public.usuario DROP CONSTRAINT usuario_login_senha_key;
       public         postgres    false    196    196            �
           2606    17118    usuario usuario_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (cod);
 >   ALTER TABLE ONLY public.usuario DROP CONSTRAINT usuario_pkey;
       public         postgres    false    196            �
           2606    17148    agente agente_agentecod_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.agente
    ADD CONSTRAINT agente_agentecod_fkey FOREIGN KEY (agentecod) REFERENCES public.usuario(cod);
 F   ALTER TABLE ONLY public.agente DROP CONSTRAINT agente_agentecod_fkey;
       public       postgres    false    199    2718    196            �
           2606    17178    associa associa_questaocod_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.associa
    ADD CONSTRAINT associa_questaocod_fkey FOREIGN KEY (questaocod) REFERENCES public.questao(cod);
 I   ALTER TABLE ONLY public.associa DROP CONSTRAINT associa_questaocod_fkey;
       public       postgres    false    202    2730    201            �
           2606    17183 $   associa associa_questionariocod_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.associa
    ADD CONSTRAINT associa_questionariocod_fkey FOREIGN KEY (questionariocod) REFERENCES public.questionario(cod);
 N   ALTER TABLE ONLY public.associa DROP CONSTRAINT associa_questionariocod_fkey;
       public       postgres    false    202    2728    200            �
           2606    17126    email email_usuariocod_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.email
    ADD CONSTRAINT email_usuariocod_fkey FOREIGN KEY (usuariocod) REFERENCES public.usuario(cod) ON UPDATE CASCADE ON DELETE CASCADE;
 E   ALTER TABLE ONLY public.email DROP CONSTRAINT email_usuariocod_fkey;
       public       postgres    false    196    2718    197            �
           2606    17162 (   questionario questionario_agentecod_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.questionario
    ADD CONSTRAINT questionario_agentecod_fkey FOREIGN KEY (agentecod) REFERENCES public.agente(agentecod);
 R   ALTER TABLE ONLY public.questionario DROP CONSTRAINT questionario_agentecod_fkey;
       public       postgres    false    200    199    2726            �
           2606    17196 !   responde responde_questaocod_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.responde
    ADD CONSTRAINT responde_questaocod_fkey FOREIGN KEY (questaocod) REFERENCES public.questao(cod);
 K   ALTER TABLE ONLY public.responde DROP CONSTRAINT responde_questaocod_fkey;
       public       postgres    false    2730    203    201            �
           2606    17201 &   responde responde_questionariocod_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.responde
    ADD CONSTRAINT responde_questionariocod_fkey FOREIGN KEY (questionariocod) REFERENCES public.questionario(cod);
 P   ALTER TABLE ONLY public.responde DROP CONSTRAINT responde_questionariocod_fkey;
       public       postgres    false    203    200    2728            �
           2606    17206 %   responde responde_respondentecod_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.responde
    ADD CONSTRAINT responde_respondentecod_fkey FOREIGN KEY (respondentecod) REFERENCES public.respondente(respondentecod);
 O   ALTER TABLE ONLY public.responde DROP CONSTRAINT responde_respondentecod_fkey;
       public       postgres    false    2724    198    203            �
           2606    17138 +   respondente respondente_respondentecod_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.respondente
    ADD CONSTRAINT respondente_respondentecod_fkey FOREIGN KEY (respondentecod) REFERENCES public.usuario(cod);
 U   ALTER TABLE ONLY public.respondente DROP CONSTRAINT respondente_respondentecod_fkey;
       public       postgres    false    198    196    2718            4   &   x�3�t�KK-�M�,J�2�(�L���O������ ���      7   M   x�=���0C�x��O��.=g��R����d!��x�C�:��v6�hn���k;~����p#�tv=z��L:q /:�      2   &   x�3���/N�M�I�KN,rH�M���K������� ��	X      6   �   x�u��NC1�眧�ⴀ�T��:5J�6T!�`a�#����#�T:�b�E�?�w�<�D`ı.��hŭSއ��ѣ�k4�[e�p����_�n���'Oa`�e�k/#�H2�I6@2�*����D'j��'����F'������=�K��AZ:9��G��F�@At^`Y��e�FV4���^��o���g��u9�Bʦ2b{U _�ؼp���u]��7kE      5   �   x�3�tN�+�W���KT-JJR�
�%�Y�I�
��F���ƺF�P�	�i�����Y��������[���|xmAf�BJ*Ԍ�
����� C���m*-J́[
Ԁl��i
fRfk� ��J      8   @   x�3�4�`O_.cN#(�,���d�DA,S��T�1D]L�m����;��d�A������ a|�      3   ;   x�Mʹ  ���2��b���t
'�3�IHc�y � ;�8O�<�{,����      1   �   x�E�M
�0��3��	�I��Y�RDEڭ��4�;y/fR����}�8�h���pQ7��z��"}x)m��iz=�6���d�u���]Έ��}cQ�e���@l�i�	��Z�-�B,�O,ھ�Į|cbb�x�;?gw��R{8�ś\��I��V����/T�Zk�y��\���o�n�r@H     