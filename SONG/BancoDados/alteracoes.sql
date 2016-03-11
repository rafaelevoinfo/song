

CREATE TABLE PAIS (
    ID INTEGER NOT NULL,
    NOME VARCHAR(60) CHARACTER SET WIN1252 NOT NULL COLLATE WIN_PTBR,
    SIGLA VARCHAR(10) CHARACTER SET WIN1252 NOT NULL COLLATE WIN_PTBR);

ALTER TABLE PAIS
ADD CONSTRAINT PK_PAIS
PRIMARY KEY (ID);



CREATE TABLE ESTADO (
    ID INTEGER NOT NULL,
    NOME VARCHAR(75) CHARACTER SET WIN1252 NOT NULL COLLATE WIN_PTBR,
    UF VARCHAR(5) CHARACTER SET WIN1252 NOT NULL COLLATE WIN_PTBR,
    ID_PAIS INTEGER NOT NULL);

ALTER TABLE ESTADO
ADD CONSTRAINT PK_ESTADO
PRIMARY KEY (ID);



CREATE TABLE CIDADE (
    ID INTEGER NOT NULL,
    NOME VARCHAR(120) CHARACTER SET WIN1252 NOT NULL COLLATE WIN_PTBR,
    ID_ESTADO INTEGER NOT NULL);

ALTER TABLE CIDADE
ADD CONSTRAINT PK_CIDADE
PRIMARY KEY (ID);



update PESSOA
set PESSOA.TIPO = 6
where PESSOA.TIPO = 1;

update PESSOA
set PESSOA.TIPO = 7
where PESSOA.TIPO = 2;

update PESSOA
set PESSOA.TIPO = 8
where PESSOA.TIPO = 3;


insert into PAIS (ID, NOME, SIGLA)
values (1, 'Brasil', 'BR');

insert into ESTADO (ID, NOME, UF, ID_PAIS)
values (1, 'Acre', 'AC', 1);
insert into ESTADO (ID, NOME, UF, ID_PAIS)
values (2, 'Alagoas', 'AL', 1);
insert into ESTADO (ID, NOME, UF, ID_PAIS)
values (3, 'Amazonas', 'AM', 1);
insert into ESTADO (ID, NOME, UF, ID_PAIS)
values (4, 'Amapá', 'AP', 1);
insert into ESTADO (ID, NOME, UF, ID_PAIS)
values (5, 'Bahia', 'BA', 1);
insert into ESTADO (ID, NOME, UF, ID_PAIS)
values (6, 'Ceará', 'CE', 1);
insert into ESTADO (ID, NOME, UF, ID_PAIS)
values (7, 'Distrito Federal', 'DF', 1);
insert into ESTADO (ID, NOME, UF, ID_PAIS)
values (8, 'Espírito Santo', 'ES', 1);
insert into ESTADO (ID, NOME, UF, ID_PAIS)
values (9, 'Goiás', 'GO', 1);
insert into ESTADO (ID, NOME, UF, ID_PAIS)
values (10, 'Maranhão', 'MA', 1);
insert into ESTADO (ID, NOME, UF, ID_PAIS)
values (11, 'Minas Gerais', 'MG', 1);
insert into ESTADO (ID, NOME, UF, ID_PAIS)
values (12, 'Mato Grosso do Sul', 'MS', 1);
insert into ESTADO (ID, NOME, UF, ID_PAIS)
values (13, 'Mato Grosso', 'MT', 1);
insert into ESTADO (ID, NOME, UF, ID_PAIS)
values (14, 'Pará', 'PA', 1);
insert into ESTADO (ID, NOME, UF, ID_PAIS)
values (15, 'Paraíba', 'PB', 1);
insert into ESTADO (ID, NOME, UF, ID_PAIS)
values (16, 'Pernambuco', 'PE', 1);
insert into ESTADO (ID, NOME, UF, ID_PAIS)
values (17, 'Piauí', 'PI', 1);
insert into ESTADO (ID, NOME, UF, ID_PAIS)
values (18, 'Paraná', 'PR', 1);
insert into ESTADO (ID, NOME, UF, ID_PAIS)
values (19, 'Rio de Janeiro', 'RJ', 1);
insert into ESTADO (ID, NOME, UF, ID_PAIS)
values (20, 'Rio Grande do Norte', 'RN', 1);
insert into ESTADO (ID, NOME, UF, ID_PAIS)
values (21, 'Rondônia', 'RO', 1);
insert into ESTADO (ID, NOME, UF, ID_PAIS)
values (22, 'Roraima', 'RR', 1);
insert into ESTADO (ID, NOME, UF, ID_PAIS)
values (23, 'Rio Grande do Sul', 'RS', 1);
insert into ESTADO (ID, NOME, UF, ID_PAIS)
values (24, 'Santa Catarina', 'SC', 1);
insert into ESTADO (ID, NOME, UF, ID_PAIS)
values (25, 'Sergipe', 'SE', 1);
insert into ESTADO (ID, NOME, UF, ID_PAIS)
values (26, 'São Paulo', 'SP', 1);
insert into ESTADO (ID, NOME, UF, ID_PAIS)
values (27, 'Tocantins', 'TO', 1);


insert into CIDADE (ID, NOME, ID_ESTADO)
values (1, 'Afonso Cláudio', 8);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2, 'Água Doce do Norte', 8);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3, 'Águia Branca', 8);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4, 'Alegre', 8);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5, 'Alfredo Chaves', 8);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (6, 'Alto Rio Novo', 8);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (7, 'Anchieta', 8);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (8, 'Apiacá', 8);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (9, 'Aracruz', 8);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (10, 'Atilio Vivacqua', 8);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (11, 'Baixo Guandu', 8);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (12, 'Barra de São Francisco', 8);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (13, 'Boa Esperança', 8);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (14, 'Bom Jesus do Norte', 8);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (15, 'Brejetuba', 8);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (16, 'Cachoeiro de Itapemirim', 8);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (17, 'Cariacica', 8);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (18, 'Castelo', 8);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (19, 'Colatina', 8);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (20, 'Conceição da Barra', 8);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (21, 'Conceição do Castelo', 8);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (22, 'Divino de São Lourenço', 8);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (23, 'Domingos Martins', 8);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (24, 'Dores do Rio Preto', 8);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (25, 'Ecoporanga', 8);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (26, 'Fundão', 8);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (27, 'Governador Lindenberg', 8);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (28, 'Guaçuí', 8);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (29, 'Guarapari', 8);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (30, 'Ibatiba', 8);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (31, 'Ibiraçu', 8);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (32, 'Ibitirama', 8);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (33, 'Iconha', 8);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (34, 'Irupi', 8);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (35, 'Itaguaçu', 8);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (36, 'Itapemirim', 8);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (37, 'Itarana', 8);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (38, 'Iúna', 8);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (39, 'Jaguaré', 8);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (40, 'Jerônimo Monteiro', 8);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (41, 'João Neiva', 8);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (42, 'Laranja da Terra', 8);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (43, 'Linhares', 8);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (44, 'Mantenópolis', 8);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (45, 'Marataízes', 8);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (46, 'Marechal Floriano', 8);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (47, 'Marilândia', 8);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (48, 'Mimoso do Sul', 8);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (49, 'Montanha', 8);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (50, 'Mucurici', 8);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (51, 'Muniz Freire', 8);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (52, 'Muqui', 8);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (53, 'Nova Venécia', 8);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (54, 'Pancas', 8);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (55, 'Pedro Canário', 8);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (56, 'Pinheiros', 8);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (57, 'Piúma', 8);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (58, 'Ponto Belo', 8);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (59, 'Presidente Kennedy', 8);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (60, 'Rio Bananal', 8);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (61, 'Rio Novo do Sul', 8);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (62, 'Santa Leopoldina', 8);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (63, 'Santa Maria de Jetibá', 8);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (64, 'Santa Teresa', 8);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (65, 'São Domingos do Norte', 8);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (66, 'São Gabriel da Palha', 8);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (67, 'São José do Calçado', 8);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (68, 'São Mateus', 8);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (69, 'São Roque do Canaã', 8);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (70, 'Serra', 8);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (71, 'Sooretama', 8);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (72, 'Vargem Alta', 8);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (73, 'Venda Nova do Imigrante', 8);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (74, 'Viana', 8);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (75, 'Vila Pavão', 8);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (76, 'Vila Valério', 8);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (77, 'Vila Velha', 8);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (78, 'Vitória', 8);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (79, 'Acrelândia', 1);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (80, 'Assis Brasil', 1);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (81, 'Brasiléia', 1);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (82, 'Bujari', 1);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (83, 'Capixaba', 1);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (84, 'Cruzeiro do Sul', 1);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (85, 'Epitaciolândia', 1);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (86, 'Feijó', 1);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (87, 'Jordão', 1);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (88, 'Mâncio Lima', 1);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (89, 'Manoel Urbano', 1);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (90, 'Marechal Thaumaturgo', 1);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (91, 'Plácido de Castro', 1);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (92, 'Porto Acre', 1);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (93, 'Porto Walter', 1);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (94, 'Rio Branco', 1);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (95, 'Rodrigues Alves', 1);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (96, 'Santa Rosa do Purus', 1);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (97, 'Sena Madureira', 1);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (98, 'Senador Guiomard', 1);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (99, 'Tarauacá', 1);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (100, 'Xapuri', 1);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (101, 'Água Branca', 2);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (102, 'Anadia', 2);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (103, 'Arapiraca', 2);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (104, 'Atalaia', 2);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (105, 'Barra de Santo Antônio', 2);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (106, 'Barra de São Miguel', 2);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (107, 'Batalha', 2);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (108, 'Belém', 2);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (109, 'Belo Monte', 2);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (110, 'Boca da Mata', 2);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (111, 'Branquinha', 2);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (112, 'Cacimbinhas', 2);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (113, 'Cajueiro', 2);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (114, 'Campestre', 2);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (115, 'Campo Alegre', 2);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (116, 'Campo Grande', 2);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (117, 'Canapi', 2);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (118, 'Capela', 2);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (119, 'Carneiros', 2);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (120, 'Chã Preta', 2);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (121, 'Coité do Nóia', 2);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (122, 'Colônia Leopoldina', 2);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (123, 'Coqueiro Seco', 2);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (124, 'Coruripe', 2);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (125, 'Craíbas', 2);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (126, 'Delmiro Gouveia', 2);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (127, 'Dois Riachos', 2);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (128, 'Estrela de Alagoas', 2);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (129, 'Feira Grande', 2);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (130, 'Feliz Deserto', 2);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (131, 'Flexeiras', 2);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (132, 'Girau do Ponciano', 2);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (133, 'Ibateguara', 2);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (134, 'Igaci', 2);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (135, 'Igreja Nova', 2);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (136, 'Inhapi', 2);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (137, 'Jacaré dos Homens', 2);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (138, 'Jacuípe', 2);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (139, 'Japaratinga', 2);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (140, 'Jaramataia', 2);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (141, 'Jequiá da Praia', 2);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (142, 'Joaquim Gomes', 2);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (143, 'Jundiá', 2);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (144, 'Junqueiro', 2);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (145, 'Lagoa da Canoa', 2);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (146, 'Limoeiro de Anadia', 2);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (147, 'Maceió', 2);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (148, 'Major Isidoro', 2);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (149, 'Mar Vermelho', 2);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (150, 'Maragogi', 2);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (151, 'Maravilha', 2);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (152, 'Marechal Deodoro', 2);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (153, 'Maribondo', 2);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (154, 'Mata Grande', 2);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (155, 'Matriz de Camaragibe', 2);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (156, 'Messias', 2);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (157, 'Minador do Negrão', 2);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (158, 'Monteirópolis', 2);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (159, 'Murici', 2);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (160, 'Novo Lino', 2);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (161, 'Olho dÁgua das Flores', 2);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (162, 'Olho dÁgua do Casado', 2);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (163, 'Olho dÁgua Grande', 2);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (164, 'Olivença', 2);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (165, 'Ouro Branco', 2);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (166, 'Palestina', 2);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (167, 'Palmeira dos Índios', 2);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (168, 'Pão de Açúcar', 2);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (169, 'Pariconha', 2);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (170, 'Paripueira', 2);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (171, 'Passo de Camaragibe', 2);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (172, 'Paulo Jacinto', 2);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (173, 'Penedo', 2);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (174, 'Piaçabuçu', 2);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (175, 'Pilar', 2);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (176, 'Pindoba', 2);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (177, 'Piranhas', 2);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (178, 'Poço das Trincheiras', 2);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (179, 'Porto Calvo', 2);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (180, 'Porto de Pedras', 2);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (181, 'Porto Real do Colégio', 2);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (182, 'Quebrangulo', 2);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (183, 'Rio Largo', 2);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (184, 'Roteiro', 2);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (185, 'Santa Luzia do Norte', 2);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (186, 'Santana do Ipanema', 2);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (187, 'Santana do Mundaú', 2);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (188, 'São Brás', 2);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (189, 'São José da Laje', 2);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (190, 'São José da Tapera', 2);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (191, 'São Luís do Quitunde', 2);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (192, 'São Miguel dos Campos', 2);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (193, 'São Miguel dos Milagres', 2);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (194, 'São Sebastião', 2);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (195, 'Satuba', 2);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (196, 'Senador Rui Palmeira', 2);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (197, 'Tanque dArca', 2);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (198, 'Taquarana', 2);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (199, 'Teotônio Vilela', 2);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (200, 'Traipu', 2);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (201, 'União dos Palmares', 2);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (202, 'Viçosa', 2);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (203, 'Amapá', 4);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (204, 'Calçoene', 4);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (205, 'Cutias', 4);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (206, 'Ferreira Gomes', 4);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (207, 'Itaubal', 4);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (208, 'Laranjal do Jari', 4);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (209, 'Macapá', 4);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (210, 'Mazagão', 4);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (211, 'Oiapoque', 4);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (212, 'Pedra Branca do Amaparí', 4);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (213, 'Porto Grande', 4);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (214, 'Pracuúba', 4);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (215, 'Santana', 4);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (216, 'Serra do Navio', 4);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (217, 'Tartarugalzinho', 4);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (218, 'Vitória do Jari', 4);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (219, 'Alvarães', 3);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (220, 'Amaturá', 3);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (221, 'Anamã', 3);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (222, 'Anori', 3);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (223, 'Apuí', 3);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (224, 'Atalaia do Norte', 3);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (225, 'Autazes', 3);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (226, 'Barcelos', 3);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (227, 'Barreirinha', 3);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (228, 'Benjamin Constant', 3);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (229, 'Beruri', 3);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (230, 'Boa Vista do Ramos', 3);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (231, 'Boca do Acre', 3);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (232, 'Borba', 3);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (233, 'Caapiranga', 3);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (234, 'Canutama', 3);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (235, 'Carauari', 3);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (236, 'Careiro', 3);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (237, 'Careiro da Várzea', 3);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (238, 'Coari', 3);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (239, 'Codajás', 3);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (240, 'Eirunepé', 3);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (241, 'Envira', 3);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (242, 'Fonte Boa', 3);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (243, 'Guajará', 3);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (244, 'Humaitá', 3);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (245, 'Ipixuna', 3);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (246, 'Iranduba', 3);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (247, 'Itacoatiara', 3);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (248, 'Itamarati', 3);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (249, 'Itapiranga', 3);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (250, 'Japurá', 3);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (251, 'Juruá', 3);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (252, 'Jutaí', 3);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (253, 'Lábrea', 3);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (254, 'Manacapuru', 3);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (255, 'Manaquiri', 3);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (256, 'Manaus', 3);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (257, 'Manicoré', 3);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (258, 'Maraã', 3);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (259, 'Maués', 3);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (260, 'Nhamundá', 3);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (261, 'Nova Olinda do Norte', 3);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (262, 'Novo Airão', 3);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (263, 'Novo Aripuanã', 3);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (264, 'Parintins', 3);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (265, 'Pauini', 3);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (266, 'Presidente Figueiredo', 3);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (267, 'Rio Preto da Eva', 3);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (268, 'Santa Isabel do Rio Negro', 3);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (269, 'Santo Antônio do Içá', 3);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (270, 'São Gabriel da Cachoeira', 3);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (271, 'São Paulo de Olivença', 3);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (272, 'São Sebastião do Uatumã', 3);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (273, 'Silves', 3);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (274, 'Tabatinga', 3);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (275, 'Tapauá', 3);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (276, 'Tefé', 3);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (277, 'Tonantins', 3);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (278, 'Uarini', 3);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (279, 'Urucará', 3);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (280, 'Urucurituba', 3);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (281, 'Abaíra', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (282, 'Abaré', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (283, 'Acajutiba', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (284, 'Adustina', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (285, 'Água Fria', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (286, 'Aiquara', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (287, 'Alagoinhas', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (288, 'Alcobaça', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (289, 'Almadina', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (290, 'Amargosa', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (291, 'Amélia Rodrigues', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (292, 'América Dourada', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (293, 'Anagé', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (294, 'Andaraí', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (295, 'Andorinha', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (296, 'Angical', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (297, 'Anguera', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (298, 'Antas', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (299, 'Antônio Cardoso', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (300, 'Antônio Gonçalves', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (301, 'Aporá', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (302, 'Apuarema', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (303, 'Araças', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (304, 'Aracatu', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (305, 'Araci', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (306, 'Aramari', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (307, 'Arataca', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (308, 'Aratuípe', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (309, 'Aurelino Leal', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (310, 'Baianópolis', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (311, 'Baixa Grande', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (312, 'Banzaê', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (313, 'Barra', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (314, 'Barra da Estiva', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (315, 'Barra do Choça', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (316, 'Barra do Mendes', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (317, 'Barra do Rocha', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (318, 'Barreiras', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (319, 'Barro Alto', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (320, 'Barro Preto (antigo Gov. Lomanto Jr.)', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (321, 'Barrocas', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (322, 'Belmonte', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (323, 'Belo Campo', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (324, 'Biritinga', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (325, 'Boa Nova', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (326, 'Boa Vista do Tupim', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (327, 'Bom Jesus da Lapa', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (328, 'Bom Jesus da Serra', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (329, 'Boninal', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (330, 'Bonito', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (331, 'Boquira', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (332, 'Botuporã', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (333, 'Brejões', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (334, 'Brejolândia', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (335, 'Brotas de Macaúbas', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (336, 'Brumado', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (337, 'Buerarema', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (338, 'Buritirama', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (339, 'Caatiba', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (340, 'Cabaceiras do Paraguaçu', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (341, 'Cachoeira', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (342, 'Caculé', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (343, 'Caém', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (344, 'Caetanos', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (345, 'Caetité', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (346, 'Cafarnaum', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (347, 'Cairu', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (348, 'Caldeirão Grande', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (349, 'Camacan', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (350, 'Camaçari', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (351, 'Camamu', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (352, 'Campo Alegre de Lourdes', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (353, 'Campo Formoso', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (354, 'Canápolis', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (355, 'Canarana', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (356, 'Canavieiras', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (357, 'Candeal', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (358, 'Candeias', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (359, 'Candiba', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (360, 'Cândido Sales', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (361, 'Cansanção', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (362, 'Canudos', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (363, 'Capela do Alto Alegre', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (364, 'Capim Grosso', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (365, 'Caraíbas', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (366, 'Caravelas', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (367, 'Cardeal da Silva', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (368, 'Carinhanha', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (369, 'Casa Nova', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (370, 'Castro Alves', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (371, 'Catolândia', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (372, 'Catu', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (373, 'Caturama', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (374, 'Central', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (375, 'Chorrochó', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (376, 'Cícero Dantas', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (377, 'Cipó', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (378, 'Coaraci', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (379, 'Cocos', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (380, 'Conceição da Feira', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (381, 'Conceição do Almeida', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (382, 'Conceição do Coité', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (383, 'Conceição do Jacuípe', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (384, 'Conde', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (385, 'Condeúba', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (386, 'Contendas do Sincorá', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (387, 'Coração de Maria', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (388, 'Cordeiros', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (389, 'Coribe', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (390, 'Coronel João Sá', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (391, 'Correntina', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (392, 'Cotegipe', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (393, 'Cravolândia', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (394, 'Crisópolis', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (395, 'Cristópolis', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (396, 'Cruz das Almas', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (397, 'Curaçá', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (398, 'Dário Meira', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (399, 'Dias dÁvila', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (400, 'Dom Basílio', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (401, 'Dom Macedo Costa', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (402, 'Elísio Medrado', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (403, 'Encruzilhada', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (404, 'Entre Rios', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (405, 'Érico Cardoso', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (406, 'Esplanada', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (407, 'Euclides da Cunha', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (408, 'Eunápolis', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (409, 'Fátima', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (410, 'Feira da Mata', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (411, 'Feira de Santana', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (412, 'Filadélfia', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (413, 'Firmino Alves', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (414, 'Floresta Azul', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (415, 'Formosa do Rio Preto', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (416, 'Gandu', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (417, 'Gavião', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (418, 'Gentio do Ouro', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (419, 'Glória', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (420, 'Gongogi', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (421, 'Governador Mangabeira', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (422, 'Guajeru', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (423, 'Guanambi', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (424, 'Guaratinga', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (425, 'Heliópolis', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (426, 'Iaçu', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (427, 'Ibiassucê', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (428, 'Ibicaraí', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (429, 'Ibicoara', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (430, 'Ibicuí', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (431, 'Ibipeba', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (432, 'Ibipitanga', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (433, 'Ibiquera', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (434, 'Ibirapitanga', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (435, 'Ibirapuã', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (436, 'Ibirataia', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (437, 'Ibitiara', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (438, 'Ibititá', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (439, 'Ibotirama', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (440, 'Ichu', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (441, 'Igaporã', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (442, 'Igrapiúna', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (443, 'Iguaí', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (444, 'Ilhéus', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (445, 'Inhambupe', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (446, 'Ipecaetá', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (447, 'Ipiaú', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (448, 'Ipirá', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (449, 'Ipupiara', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (450, 'Irajuba', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (451, 'Iramaia', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (452, 'Iraquara', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (453, 'Irará', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (454, 'Irecê', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (455, 'Itabela', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (456, 'Itaberaba', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (457, 'Itabuna', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (458, 'Itacaré', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (459, 'Itaeté', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (460, 'Itagi', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (461, 'Itagibá', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (462, 'Itagimirim', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (463, 'Itaguaçu da Bahia', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (464, 'Itaju do Colônia', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (465, 'Itajuípe', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (466, 'Itamaraju', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (467, 'Itamari', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (468, 'Itambé', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (469, 'Itanagra', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (470, 'Itanhém', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (471, 'Itaparica', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (472, 'Itapé', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (473, 'Itapebi', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (474, 'Itapetinga', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (475, 'Itapicuru', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (476, 'Itapitanga', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (477, 'Itaquara', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (478, 'Itarantim', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (479, 'Itatim', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (480, 'Itiruçu', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (481, 'Itiúba', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (482, 'Itororó', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (483, 'Ituaçu', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (484, 'Ituberá', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (485, 'Iuiú', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (486, 'Jaborandi', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (487, 'Jacaraci', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (488, 'Jacobina', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (489, 'Jaguaquara', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (490, 'Jaguarari', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (491, 'Jaguaripe', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (492, 'Jandaíra', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (493, 'Jequié', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (494, 'Jeremoabo', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (495, 'Jiquiriçá', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (496, 'Jitaúna', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (497, 'João Dourado', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (498, 'Juazeiro', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (499, 'Jucuruçu', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (500, 'Jussara', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (501, 'Jussari', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (502, 'Jussiape', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (503, 'Lafaiete Coutinho', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (504, 'Lagoa Real', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (505, 'Laje', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (506, 'Lajedão', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (507, 'Lajedinho', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (508, 'Lajedo do Tabocal', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (509, 'Lamarão', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (510, 'Lapão', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (511, 'Lauro de Freitas', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (512, 'Lençóis', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (513, 'Licínio de Almeida', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (514, 'Livramento de Nossa Senhora', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (515, 'Luís Eduardo Magalhães', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (516, 'Macajuba', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (517, 'Macarani', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (518, 'Macaúbas', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (519, 'Macururé', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (520, 'Madre de Deus', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (521, 'Maetinga', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (522, 'Maiquinique', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (523, 'Mairi', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (524, 'Malhada', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (525, 'Malhada de Pedras', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (526, 'Manoel Vitorino', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (527, 'Mansidão', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (528, 'Maracás', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (529, 'Maragogipe', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (530, 'Maraú', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (531, 'Marcionílio Souza', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (532, 'Mascote', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (533, 'Mata de São João', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (534, 'Matina', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (535, 'Medeiros Neto', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (536, 'Miguel Calmon', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (537, 'Milagres', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (538, 'Mirangaba', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (539, 'Mirante', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (540, 'Monte Santo', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (541, 'Morpará', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (542, 'Morro do Chapéu', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (543, 'Mortugaba', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (544, 'Mucugê', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (545, 'Mucuri', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (546, 'Mulungu do Morro', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (547, 'Mundo Novo', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (548, 'Muniz Ferreira', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (549, 'Muquém de São Francisco', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (550, 'Muritiba', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (551, 'Mutuípe', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (552, 'Nazaré', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (553, 'Nilo Peçanha', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (554, 'Nordestina', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (555, 'Nova Canaã', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (556, 'Nova Fátima', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (557, 'Nova Ibiá', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (558, 'Nova Itarana', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (559, 'Nova Redenção', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (560, 'Nova Soure', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (561, 'Nova Viçosa', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (562, 'Novo Horizonte', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (563, 'Novo Triunfo', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (564, 'Olindina', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (565, 'Oliveira dos Brejinhos', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (566, 'Ouriçangas', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (567, 'Ourolândia', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (568, 'Palmas de Monte Alto', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (569, 'Palmeiras', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (570, 'Paramirim', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (571, 'Paratinga', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (572, 'Paripiranga', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (573, 'Pau Brasil', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (574, 'Paulo Afonso', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (575, 'Pé de Serra', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (576, 'Pedrão', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (577, 'Pedro Alexandre', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (578, 'Piatã', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (579, 'Pilão Arcado', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (580, 'Pindaí', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (581, 'Pindobaçu', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (582, 'Pintadas', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (583, 'Piraí do Norte', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (584, 'Piripá', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (585, 'Piritiba', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (586, 'Planaltino', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (587, 'Planalto', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (588, 'Poções', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (589, 'Pojuca', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (590, 'Ponto Novo', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (591, 'Porto Seguro', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (592, 'Potiraguá', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (593, 'Prado', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (594, 'Presidente Dutra', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (595, 'Presidente Jânio Quadros', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (596, 'Presidente Tancredo Neves', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (597, 'Queimadas', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (598, 'Quijingue', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (599, 'Quixabeira', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (600, 'Rafael Jambeiro', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (601, 'Remanso', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (602, 'Retirolândia', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (603, 'Riachão das Neves', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (604, 'Riachão do Jacuípe', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (605, 'Riacho de Santana', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (606, 'Ribeira do Amparo', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (607, 'Ribeira do Pombal', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (608, 'Ribeirão do Largo', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (609, 'Rio de Contas', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (610, 'Rio do Antônio', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (611, 'Rio do Pires', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (612, 'Rio Real', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (613, 'Rodelas', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (614, 'Ruy Barbosa', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (615, 'Salinas da Margarida', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (616, 'Salvador', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (617, 'Santa Bárbara', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (618, 'Santa Brígida', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (619, 'Santa Cruz Cabrália', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (620, 'Santa Cruz da Vitória', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (621, 'Santa Inês', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (622, 'Santa Luzia', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (623, 'Santa Maria da Vitória', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (624, 'Santa Rita de Cássia', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (625, 'Santa Teresinha', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (626, 'Santaluz', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (627, 'Santana', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (628, 'Santanópolis', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (629, 'Santo Amaro', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (630, 'Santo Antônio de Jesus', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (631, 'Santo Estêvão', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (632, 'São Desidério', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (633, 'São Domingos', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (634, 'São Felipe', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (635, 'São Félix', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (636, 'São Félix do Coribe', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (637, 'São Francisco do Conde', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (638, 'São Gabriel', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (639, 'São Gonçalo dos Campos', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (640, 'São José da Vitória', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (641, 'São José do Jacuípe', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (642, 'São Miguel das Matas', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (643, 'São Sebastião do Passé', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (644, 'Sapeaçu', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (645, 'Sátiro Dias', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (646, 'Saubara', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (647, 'Saúde', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (648, 'Seabra', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (649, 'Sebastião Laranjeiras', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (650, 'Senhor do Bonfim', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (651, 'Sento Sé', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (652, 'Serra do Ramalho', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (653, 'Serra Dourada', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (654, 'Serra Preta', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (655, 'Serrinha', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (656, 'Serrolândia', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (657, 'Simões Filho', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (658, 'Sítio do Mato', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (659, 'Sítio do Quinto', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (660, 'Sobradinho', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (661, 'Souto Soares', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (662, 'Tabocas do Brejo Velho', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (663, 'Tanhaçu', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (664, 'Tanque Novo', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (665, 'Tanquinho', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (666, 'Taperoá', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (667, 'Tapiramutá', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (668, 'Teixeira de Freitas', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (669, 'Teodoro Sampaio', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (670, 'Teofilândia', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (671, 'Teolândia', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (672, 'Terra Nova', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (673, 'Tremedal', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (674, 'Tucano', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (675, 'Uauá', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (676, 'Ubaíra', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (677, 'Ubaitaba', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (678, 'Ubatã', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (679, 'Uibaí', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (680, 'Umburanas', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (681, 'Una', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (682, 'Urandi', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (683, 'Uruçuca', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (684, 'Utinga', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (685, 'Valença', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (686, 'Valente', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (687, 'Várzea da Roça', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (688, 'Várzea do Poço', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (689, 'Várzea Nova', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (690, 'Varzedo', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (691, 'Vera Cruz', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (692, 'Vereda', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (693, 'Vitória da Conquista', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (694, 'Wagner', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (695, 'Wanderley', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (696, 'Wenceslau Guimarães', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (697, 'Xique-Xique', 5);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (698, 'Abaiara', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (699, 'Acarape', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (700, 'Acaraú', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (701, 'Acopiara', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (702, 'Aiuaba', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (703, 'Alcântaras', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (704, 'Altaneira', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (705, 'Alto Santo', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (706, 'Amontada', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (707, 'Antonina do Norte', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (708, 'Apuiarés', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (709, 'Aquiraz', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (710, 'Aracati', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (711, 'Aracoiaba', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (712, 'Ararendá', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (713, 'Araripe', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (714, 'Aratuba', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (715, 'Arneiroz', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (716, 'Assaré', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (717, 'Aurora', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (718, 'Baixio', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (719, 'Banabuiú', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (720, 'Barbalha', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (721, 'Barreira', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (722, 'Barro', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (723, 'Barroquinha', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (724, 'Baturité', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (725, 'Beberibe', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (726, 'Bela Cruz', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (727, 'Boa Viagem', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (728, 'Brejo Santo', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (729, 'Camocim', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (730, 'Campos Sales', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (731, 'Canindé', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (732, 'Capistrano', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (733, 'Caridade', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (734, 'Cariré', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (735, 'Caririaçu', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (736, 'Cariús', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (737, 'Carnaubal', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (738, 'Cascavel', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (739, 'Catarina', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (740, 'Catunda', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (741, 'Caucaia', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (742, 'Cedro', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (743, 'Chaval', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (744, 'Choró', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (745, 'Chorozinho', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (746, 'Coreaú', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (747, 'Crateús', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (748, 'Crato', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (749, 'Croatá', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (750, 'Cruz', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (751, 'Deputado Irapuan Pinheiro', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (752, 'Ererê', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (753, 'Eusébio', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (754, 'Farias Brito', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (755, 'Forquilha', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (756, 'Fortaleza', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (757, 'Fortim', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (758, 'Frecheirinha', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (759, 'General Sampaio', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (760, 'Graça', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (761, 'Granja', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (762, 'Granjeiro', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (763, 'Groaíras', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (764, 'Guaiúba', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (765, 'Guaraciaba do Norte', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (766, 'Guaramiranga', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (767, 'Hidrolândia', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (768, 'Horizonte', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (769, 'Ibaretama', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (770, 'Ibiapina', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (771, 'Ibicuitinga', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (772, 'Icapuí', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (773, 'Icó', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (774, 'Iguatu', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (775, 'Independência', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (776, 'Ipaporanga', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (777, 'Ipaumirim', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (778, 'Ipu', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (779, 'Ipueiras', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (780, 'Iracema', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (781, 'Irauçuba', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (782, 'Itaiçaba', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (783, 'Itaitinga', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (784, 'Itapagé', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (785, 'Itapipoca', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (786, 'Itapiúna', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (787, 'Itarema', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (788, 'Itatira', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (789, 'Jaguaretama', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (790, 'Jaguaribara', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (791, 'Jaguaribe', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (792, 'Jaguaruana', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (793, 'Jardim', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (794, 'Jati', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (795, 'Jijoca de Jericoacoara', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (796, 'Juazeiro do Norte', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (797, 'Jucás', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (798, 'Lavras da Mangabeira', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (799, 'Limoeiro do Norte', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (800, 'Madalena', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (801, 'Maracanaú', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (802, 'Maranguape', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (803, 'Marco', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (804, 'Martinópole', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (805, 'Massapê', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (806, 'Mauriti', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (807, 'Meruoca', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (808, 'Milagres', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (809, 'Milhã', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (810, 'Miraíma', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (811, 'Missão Velha', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (812, 'Mombaça', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (813, 'Monsenhor Tabosa', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (814, 'Morada Nova', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (815, 'Moraújo', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (816, 'Morrinhos', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (817, 'Mucambo', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (818, 'Mulungu', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (819, 'Nova Olinda', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (820, 'Nova Russas', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (821, 'Novo Oriente', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (822, 'Ocara', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (823, 'Orós', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (824, 'Pacajus', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (825, 'Pacatuba', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (826, 'Pacoti', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (827, 'Pacujá', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (828, 'Palhano', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (829, 'Palmácia', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (830, 'Paracuru', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (831, 'Paraipaba', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (832, 'Parambu', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (833, 'Paramoti', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (834, 'Pedra Branca', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (835, 'Penaforte', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (836, 'Pentecoste', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (837, 'Pereiro', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (838, 'Pindoretama', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (839, 'Piquet Carneiro', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (840, 'Pires Ferreira', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (841, 'Poranga', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (842, 'Porteiras', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (843, 'Potengi', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (844, 'Potiretama', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (845, 'Quiterianópolis', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (846, 'Quixadá', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (847, 'Quixelô', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (848, 'Quixeramobim', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (849, 'Quixeré', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (850, 'Redenção', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (851, 'Reriutaba', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (852, 'Russas', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (853, 'Saboeiro', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (854, 'Salitre', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (855, 'Santa Quitéria', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (856, 'Santana do Acaraú', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (857, 'Santana do Cariri', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (858, 'São Benedito', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (859, 'São Gonçalo do Amarante', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (860, 'São João do Jaguaribe', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (861, 'São Luís do Curu', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (862, 'Senador Pompeu', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (863, 'Senador Sá', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (864, 'Sobral', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (865, 'Solonópole', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (866, 'Tabuleiro do Norte', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (867, 'Tamboril', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (868, 'Tarrafas', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (869, 'Tauá', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (870, 'Tejuçuoca', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (871, 'Tianguá', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (872, 'Trairi', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (873, 'Tururu', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (874, 'Ubajara', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (875, 'Umari', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (876, 'Umirim', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (877, 'Uruburetama', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (878, 'Uruoca', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (879, 'Varjota', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (880, 'Várzea Alegre', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (881, 'Viçosa do Ceará', 6);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (882, 'Brasília', 7);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (883, 'Abadia de Goiás', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (884, 'Abadiânia', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (885, 'Acreúna', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (886, 'Adelândia', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (887, 'Água Fria de Goiás', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (888, 'Água Limpa', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (889, 'Águas Lindas de Goiás', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (890, 'Alexânia', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (891, 'Aloândia', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (892, 'Alto Horizonte', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (893, 'Alto Paraíso de Goiás', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (894, 'Alvorada do Norte', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (895, 'Amaralina', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (896, 'Americano do Brasil', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (897, 'Amorinópolis', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (898, 'Anápolis', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (899, 'Anhanguera', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (900, 'Anicuns', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (901, 'Aparecida de Goiânia', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (902, 'Aparecida do Rio Doce', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (903, 'Aporé', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (904, 'Araçu', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (905, 'Aragarças', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (906, 'Aragoiânia', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (907, 'Araguapaz', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (908, 'Arenópolis', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (909, 'Aruanã', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (910, 'Aurilândia', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (911, 'Avelinópolis', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (912, 'Baliza', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (913, 'Barro Alto', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (914, 'Bela Vista de Goiás', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (915, 'Bom Jardim de Goiás', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (916, 'Bom Jesus de Goiás', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (917, 'Bonfinópolis', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (918, 'Bonópolis', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (919, 'Brazabrantes', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (920, 'Britânia', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (921, 'Buriti Alegre', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (922, 'Buriti de Goiás', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (923, 'Buritinópolis', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (924, 'Cabeceiras', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (925, 'Cachoeira Alta', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (926, 'Cachoeira de Goiás', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (927, 'Cachoeira Dourada', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (928, 'Caçu', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (929, 'Caiapônia', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (930, 'Caldas Novas', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (931, 'Caldazinha', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (932, 'Campestre de Goiás', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (933, 'Campinaçu', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (934, 'Campinorte', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (935, 'Campo Alegre de Goiás', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (936, 'Campo Limpo de Goiás', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (937, 'Campos Belos', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (938, 'Campos Verdes', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (939, 'Carmo do Rio Verde', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (940, 'Castelândia', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (941, 'Catalão', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (942, 'Caturaí', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (943, 'Cavalcante', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (944, 'Ceres', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (945, 'Cezarina', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (946, 'Chapadão do Céu', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (947, 'Cidade Ocidental', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (948, 'Cocalzinho de Goiás', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (949, 'Colinas do Sul', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (950, 'Córrego do Ouro', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (951, 'Corumbá de Goiás', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (952, 'Corumbaíba', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (953, 'Cristalina', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (954, 'Cristianópolis', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (955, 'Crixás', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (956, 'Cromínia', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (957, 'Cumari', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (958, 'Damianópolis', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (959, 'Damolândia', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (960, 'Davinópolis', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (961, 'Diorama', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (962, 'Divinópolis de Goiás', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (963, 'Doverlândia', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (964, 'Edealina', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (965, 'Edéia', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (966, 'Estrela do Norte', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (967, 'Faina', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (968, 'Fazenda Nova', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (969, 'Firminópolis', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (970, 'Flores de Goiás', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (971, 'Formosa', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (972, 'Formoso', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (973, 'Gameleira de Goiás', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (974, 'Goianápolis', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (975, 'Goiandira', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (976, 'Goianésia', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (977, 'Goiânia', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (978, 'Goianira', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (979, 'Goiás', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (980, 'Goiatuba', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (981, 'Gouvelândia', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (982, 'Guapó', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (983, 'Guaraíta', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (984, 'Guarani de Goiás', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (985, 'Guarinos', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (986, 'Heitoraí', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (987, 'Hidrolândia', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (988, 'Hidrolina', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (989, 'Iaciara', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (990, 'Inaciolândia', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (991, 'Indiara', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (992, 'Inhumas', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (993, 'Ipameri', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (994, 'Ipiranga de Goiás', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (995, 'Iporá', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (996, 'Israelândia', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (997, 'Itaberaí', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (998, 'Itaguari', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (999, 'Itaguaru', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1000, 'Itajá', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1001, 'Itapaci', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1002, 'Itapirapuã', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1003, 'Itapuranga', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1004, 'Itarumã', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1005, 'Itauçu', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1006, 'Itumbiara', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1007, 'Ivolândia', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1008, 'Jandaia', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1009, 'Jaraguá', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1010, 'Jataí', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1011, 'Jaupaci', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1012, 'Jesúpolis', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1013, 'Joviânia', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1014, 'Jussara', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1015, 'Lagoa Santa', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1016, 'Leopoldo de Bulhões', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1017, 'Luziânia', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1018, 'Mairipotaba', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1019, 'Mambaí', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1020, 'Mara Rosa', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1021, 'Marzagão', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1022, 'Matrinchã', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1023, 'Maurilândia', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1024, 'Mimoso de Goiás', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1025, 'Minaçu', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1026, 'Mineiros', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1027, 'Moiporá', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1028, 'Monte Alegre de Goiás', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1029, 'Montes Claros de Goiás', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1030, 'Montividiu', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1031, 'Montividiu do Norte', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1032, 'Morrinhos', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1033, 'Morro Agudo de Goiás', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1034, 'Mossâmedes', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1035, 'Mozarlândia', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1036, 'Mundo Novo', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1037, 'Mutunópolis', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1038, 'Nazário', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1039, 'Nerópolis', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1040, 'Niquelândia', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1041, 'Nova América', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1042, 'Nova Aurora', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1043, 'Nova Crixás', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1044, 'Nova Glória', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1045, 'Nova Iguaçu de Goiás', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1046, 'Nova Roma', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1047, 'Nova Veneza', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1048, 'Novo Brasil', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1049, 'Novo Gama', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1050, 'Novo Planalto', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1051, 'Orizona', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1052, 'Ouro Verde de Goiás', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1053, 'Ouvidor', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1054, 'Padre Bernardo', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1055, 'Palestina de Goiás', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1056, 'Palmeiras de Goiás', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1057, 'Palmelo', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1058, 'Palminópolis', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1059, 'Panamá', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1060, 'Paranaiguara', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1061, 'Paraúna', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1062, 'Perolândia', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1063, 'Petrolina de Goiás', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1064, 'Pilar de Goiás', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1065, 'Piracanjuba', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1066, 'Piranhas', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1067, 'Pirenópolis', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1068, 'Pires do Rio', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1069, 'Planaltina', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1070, 'Pontalina', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1071, 'Porangatu', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1072, 'Porteirão', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1073, 'Portelândia', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1074, 'Posse', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1075, 'Professor Jamil', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1076, 'Quirinópolis', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1077, 'Rialma', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1078, 'Rianápolis', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1079, 'Rio Quente', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1080, 'Rio Verde', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1081, 'Rubiataba', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1082, 'Sanclerlândia', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1083, 'Santa Bárbara de Goiás', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1084, 'Santa Cruz de Goiás', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1085, 'Santa Fé de Goiás', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1086, 'Santa Helena de Goiás', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1087, 'Santa Isabel', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1088, 'Santa Rita do Araguaia', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1089, 'Santa Rita do Novo Destino', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1090, 'Santa Rosa de Goiás', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1091, 'Santa Tereza de Goiás', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1092, 'Santa Terezinha de Goiás', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1093, 'Santo Antônio da Barra', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1094, 'Santo Antônio de Goiás', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1095, 'Santo Antônio do Descoberto', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1096, 'São Domingos', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1097, 'São Francisco de Goiás', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1098, 'São João dAliança', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1099, 'São João da Paraúna', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1100, 'São Luís de Montes Belos', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1101, 'São Luíz do Norte', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1102, 'São Miguel do Araguaia', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1103, 'São Miguel do Passa Quatro', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1104, 'São Patrício', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1105, 'São Simão', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1106, 'Senador Canedo', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1107, 'Serranópolis', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1108, 'Silvânia', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1109, 'Simolândia', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1110, 'Sítio dAbadia', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1111, 'Taquaral de Goiás', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1112, 'Teresina de Goiás', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1113, 'Terezópolis de Goiás', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1114, 'Três Ranchos', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1115, 'Trindade', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1116, 'Trombas', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1117, 'Turvânia', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1118, 'Turvelândia', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1119, 'Uirapuru', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1120, 'Uruaçu', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1121, 'Uruana', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1122, 'Urutaí', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1123, 'Valparaíso de Goiás', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1124, 'Varjão', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1125, 'Vianópolis', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1126, 'Vicentinópolis', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1127, 'Vila Boa', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1128, 'Vila Propício', 9);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1129, 'Açailândia', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1130, 'Afonso Cunha', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1131, 'Água Doce do Maranhão', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1132, 'Alcântara', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1133, 'Aldeias Altas', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1134, 'Altamira do Maranhão', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1135, 'Alto Alegre do Maranhão', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1136, 'Alto Alegre do Pindaré', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1137, 'Alto Parnaíba', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1138, 'Amapá do Maranhão', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1139, 'Amarante do Maranhão', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1140, 'Anajatuba', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1141, 'Anapurus', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1142, 'Apicum-Açu', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1143, 'Araguanã', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1144, 'Araioses', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1145, 'Arame', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1146, 'Arari', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1147, 'Axixá', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1148, 'Bacabal', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1149, 'Bacabeira', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1150, 'Bacuri', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1151, 'Bacurituba', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1152, 'Balsas', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1153, 'Barão de Grajaú', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1154, 'Barra do Corda', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1155, 'Barreirinhas', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1156, 'Bela Vista do Maranhão', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1157, 'Belágua', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1158, 'Benedito Leite', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1159, 'Bequimão', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1160, 'Bernardo do Mearim', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1161, 'Boa Vista do Gurupi', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1162, 'Bom Jardim', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1163, 'Bom Jesus das Selvas', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1164, 'Bom Lugar', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1165, 'Brejo', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1166, 'Brejo de Areia', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1167, 'Buriti', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1168, 'Buriti Bravo', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1169, 'Buriticupu', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1170, 'Buritirana', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1171, 'Cachoeira Grande', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1172, 'Cajapió', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1173, 'Cajari', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1174, 'Campestre do Maranhão', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1175, 'Cândido Mendes', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1176, 'Cantanhede', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1177, 'Capinzal do Norte', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1178, 'Carolina', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1179, 'Carutapera', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1180, 'Caxias', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1181, 'Cedral', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1182, 'Central do Maranhão', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1183, 'Centro do Guilherme', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1184, 'Centro Novo do Maranhão', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1185, 'Chapadinha', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1186, 'Cidelândia', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1187, 'Codó', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1188, 'Coelho Neto', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1189, 'Colinas', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1190, 'Conceição do Lago-Açu', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1191, 'Coroatá', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1192, 'Cururupu', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1193, 'Davinópolis', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1194, 'Dom Pedro', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1195, 'Duque Bacelar', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1196, 'Esperantinópolis', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1197, 'Estreito', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1198, 'Feira Nova do Maranhão', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1199, 'Fernando Falcão', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1200, 'Formosa da Serra Negra', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1201, 'Fortaleza dos Nogueiras', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1202, 'Fortuna', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1203, 'Godofredo Viana', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1204, 'Gonçalves Dias', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1205, 'Governador Archer', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1206, 'Governador Edison Lobão', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1207, 'Governador Eugênio Barros', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1208, 'Governador Luiz Rocha', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1209, 'Governador Newton Bello', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1210, 'Governador Nunes Freire', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1211, 'Graça Aranha', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1212, 'Grajaú', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1213, 'Guimarães', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1214, 'Humberto de Campos', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1215, 'Icatu', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1216, 'Igarapé do Meio', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1217, 'Igarapé Grande', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1218, 'Imperatriz', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1219, 'Itaipava do Grajaú', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1220, 'Itapecuru Mirim', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1221, 'Itinga do Maranhão', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1222, 'Jatobá', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1223, 'Jenipapo dos Vieiras', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1224, 'João Lisboa', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1225, 'Joselândia', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1226, 'Junco do Maranhão', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1227, 'Lago da Pedra', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1228, 'Lago do Junco', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1229, 'Lago dos Rodrigues', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1230, 'Lago Verde', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1231, 'Lagoa do Mato', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1232, 'Lagoa Grande do Maranhão', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1233, 'Lajeado Novo', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1234, 'Lima Campos', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1235, 'Loreto', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1236, 'Luís Domingues', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1237, 'Magalhães de Almeida', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1238, 'Maracaçumé', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1239, 'Marajá do Sena', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1240, 'Maranhãozinho', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1241, 'Mata Roma', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1242, 'Matinha', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1243, 'Matões', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1244, 'Matões do Norte', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1245, 'Milagres do Maranhão', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1246, 'Mirador', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1247, 'Miranda do Norte', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1248, 'Mirinzal', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1249, 'Monção', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1250, 'Montes Altos', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1251, 'Morros', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1252, 'Nina Rodrigues', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1253, 'Nova Colinas', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1254, 'Nova Iorque', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1255, 'Nova Olinda do Maranhão', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1256, 'Olho dÁgua das Cunhãs', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1257, 'Olinda Nova do Maranhão', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1258, 'Paço do Lumiar', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1259, 'Palmeirândia', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1260, 'Paraibano', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1261, 'Parnarama', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1262, 'Passagem Franca', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1263, 'Pastos Bons', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1264, 'Paulino Neves', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1265, 'Paulo Ramos', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1266, 'Pedreiras', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1267, 'Pedro do Rosário', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1268, 'Penalva', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1269, 'Peri Mirim', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1270, 'Peritoró', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1271, 'Pindaré-Mirim', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1272, 'Pinheiro', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1273, 'Pio XII', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1274, 'Pirapemas', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1275, 'Poção de Pedras', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1276, 'Porto Franco', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1277, 'Porto Rico do Maranhão', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1278, 'Presidente Dutra', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1279, 'Presidente Juscelino', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1280, 'Presidente Médici', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1281, 'Presidente Sarney', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1282, 'Presidente Vargas', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1283, 'Primeira Cruz', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1284, 'Raposa', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1285, 'Riachão', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1286, 'Ribamar Fiquene', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1287, 'Rosário', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1288, 'Sambaíba', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1289, 'Santa Filomena do Maranhão', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1290, 'Santa Helena', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1291, 'Santa Inês', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1292, 'Santa Luzia', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1293, 'Santa Luzia do Paruá', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1294, 'Santa Quitéria do Maranhão', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1295, 'Santa Rita', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1296, 'Santana do Maranhão', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1297, 'Santo Amaro do Maranhão', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1298, 'Santo Antônio dos Lopes', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1299, 'São Benedito do Rio Preto', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1300, 'São Bento', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1301, 'São Bernardo', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1302, 'São Domingos do Azeitão', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1303, 'São Domingos do Maranhão', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1304, 'São Félix de Balsas', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1305, 'São Francisco do Brejão', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1306, 'São Francisco do Maranhão', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1307, 'São João Batista', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1308, 'São João do Carú', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1309, 'São João do Paraíso', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1310, 'São João do Soter', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1311, 'São João dos Patos', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1312, 'São José de Ribamar', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1313, 'São José dos Basílios', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1314, 'São Luís', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1315, 'São Luís Gonzaga do Maranhão', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1316, 'São Mateus do Maranhão', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1317, 'São Pedro da Água Branca', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1318, 'São Pedro dos Crentes', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1319, 'São Raimundo das Mangabeiras', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1320, 'São Raimundo do Doca Bezerra', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1321, 'São Roberto', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1322, 'São Vicente Ferrer', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1323, 'Satubinha', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1324, 'Senador Alexandre Costa', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1325, 'Senador La Rocque', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1326, 'Serrano do Maranhão', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1327, 'Sítio Novo', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1328, 'Sucupira do Norte', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1329, 'Sucupira do Riachão', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1330, 'Tasso Fragoso', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1331, 'Timbiras', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1332, 'Timon', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1333, 'Trizidela do Vale', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1334, 'Tufilândia', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1335, 'Tuntum', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1336, 'Turiaçu', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1337, 'Turilândia', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1338, 'Tutóia', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1339, 'Urbano Santos', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1340, 'Vargem Grande', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1341, 'Viana', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1342, 'Vila Nova dos Martírios', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1343, 'Vitória do Mearim', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1344, 'Vitorino Freire', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1345, 'Zé Doca', 10);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1346, 'Acorizal', 13);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1347, 'Água Boa', 13);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1348, 'Alta Floresta', 13);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1349, 'Alto Araguaia', 13);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1350, 'Alto Boa Vista', 13);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1351, 'Alto Garças', 13);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1352, 'Alto Paraguai', 13);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1353, 'Alto Taquari', 13);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1354, 'Apiacás', 13);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1355, 'Araguaiana', 13);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1356, 'Araguainha', 13);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1357, 'Araputanga', 13);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1358, 'Arenápolis', 13);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1359, 'Aripuanã', 13);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1360, 'Barão de Melgaço', 13);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1361, 'Barra do Bugres', 13);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1362, 'Barra do Garças', 13);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1363, 'Bom Jesus do Araguaia', 13);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1364, 'Brasnorte', 13);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1365, 'Cáceres', 13);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1366, 'Campinápolis', 13);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1367, 'Campo Novo do Parecis', 13);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1368, 'Campo Verde', 13);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1369, 'Campos de Júlio', 13);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1370, 'Canabrava do Norte', 13);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1371, 'Canarana', 13);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1372, 'Carlinda', 13);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1373, 'Castanheira', 13);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1374, 'Chapada dos Guimarães', 13);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1375, 'Cláudia', 13);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1376, 'Cocalinho', 13);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1377, 'Colíder', 13);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1378, 'Colniza', 13);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1379, 'Comodoro', 13);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1380, 'Confresa', 13);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1381, 'Conquista dOeste', 13);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1382, 'Cotriguaçu', 13);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1383, 'Cuiabá', 13);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1384, 'Curvelândia', 13);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1385, 'Curvelândia', 13);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1386, 'Denise', 13);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1387, 'Diamantino', 13);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1388, 'Dom Aquino', 13);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1389, 'Feliz Natal', 13);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1390, 'Figueirópolis dOeste', 13);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1391, 'Gaúcha do Norte', 13);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1392, 'General Carneiro', 13);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1393, 'Glória dOeste', 13);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1394, 'Guarantã do Norte', 13);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1395, 'Guiratinga', 13);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1396, 'Indiavaí', 13);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1397, 'Ipiranga do Norte', 13);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1398, 'Itanhangá', 13);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1399, 'Itaúba', 13);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1400, 'Itiquira', 13);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1401, 'Jaciara', 13);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1402, 'Jangada', 13);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1403, 'Jauru', 13);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1404, 'Juara', 13);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1405, 'Juína', 13);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1406, 'Juruena', 13);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1407, 'Juscimeira', 13);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1408, 'Lambari dOeste', 13);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1409, 'Lucas do Rio Verde', 13);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1410, 'Luciára', 13);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1411, 'Marcelândia', 13);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1412, 'Matupá', 13);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1413, 'Mirassol dOeste', 13);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1414, 'Nobres', 13);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1415, 'Nortelândia', 13);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1416, 'Nossa Senhora do Livramento', 13);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1417, 'Nova Bandeirantes', 13);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1418, 'Nova Brasilândia', 13);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1419, 'Nova Canaã do Norte', 13);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1420, 'Nova Guarita', 13);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1421, 'Nova Lacerda', 13);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1422, 'Nova Marilândia', 13);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1423, 'Nova Maringá', 13);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1424, 'Nova Monte verde', 13);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1425, 'Nova Mutum', 13);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1426, 'Nova Olímpia', 13);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1427, 'Nova Santa Helena', 13);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1428, 'Nova Ubiratã', 13);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1429, 'Nova Xavantina', 13);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1430, 'Novo Horizonte do Norte', 13);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1431, 'Novo Mundo', 13);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1432, 'Novo Santo Antônio', 13);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1433, 'Novo São Joaquim', 13);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1434, 'Paranaíta', 13);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1435, 'Paranatinga', 13);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1436, 'Pedra Preta', 13);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1437, 'Peixoto de Azevedo', 13);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1438, 'Planalto da Serra', 13);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1439, 'Poconé', 13);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1440, 'Pontal do Araguaia', 13);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1441, 'Ponte Branca', 13);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1442, 'Pontes e Lacerda', 13);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1443, 'Porto Alegre do Norte', 13);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1444, 'Porto dos Gaúchos', 13);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1445, 'Porto Esperidião', 13);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1446, 'Porto Estrela', 13);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1447, 'Poxoréo', 13);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1448, 'Primavera do Leste', 13);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1449, 'Querência', 13);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1450, 'Reserva do Cabaçal', 13);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1451, 'Ribeirão Cascalheira', 13);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1452, 'Ribeirãozinho', 13);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1453, 'Rio Branco', 13);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1454, 'Rondolândia', 13);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1455, 'Rondonópolis', 13);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1456, 'Rosário Oeste', 13);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1457, 'Salto do Céu', 13);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1458, 'Santa Carmem', 13);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1459, 'Santa Cruz do Xingu', 13);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1460, 'Santa Rita do Trivelato', 13);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1461, 'Santa Terezinha', 13);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1462, 'Santo Afonso', 13);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1463, 'Santo Antônio do Leste', 13);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1464, 'Santo Antônio do Leverger', 13);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1465, 'São Félix do Araguaia', 13);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1466, 'São José do Povo', 13);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1467, 'São José do Rio Claro', 13);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1468, 'São José do Xingu', 13);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1469, 'São José dos Quatro Marcos', 13);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1470, 'São Pedro da Cipa', 13);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1471, 'Sapezal', 13);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1472, 'Serra Nova Dourada', 13);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1473, 'Sinop', 13);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1474, 'Sorriso', 13);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1475, 'Tabaporã', 13);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1476, 'Tangará da Serra', 13);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1477, 'Tapurah', 13);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1478, 'Terra Nova do Norte', 13);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1479, 'Tesouro', 13);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1480, 'Torixoréu', 13);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1481, 'União do Sul', 13);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1482, 'Vale de São Domingos', 13);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1483, 'Várzea Grande', 13);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1484, 'Vera', 13);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1485, 'Vila Bela da Santíssima Trindade', 13);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1486, 'Vila Rica', 13);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1487, 'Água Clara', 12);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1488, 'Alcinópolis', 12);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1489, 'Amambaí', 12);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1490, 'Anastácio', 12);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1491, 'Anaurilândia', 12);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1492, 'Angélica', 12);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1493, 'Antônio João', 12);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1494, 'Aparecida do Taboado', 12);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1495, 'Aquidauana', 12);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1496, 'Aral Moreira', 12);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1497, 'Bandeirantes', 12);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1498, 'Bataguassu', 12);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1499, 'Bataiporã', 12);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1500, 'Bela Vista', 12);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1501, 'Bodoquena', 12);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1502, 'Bonito', 12);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1503, 'Brasilândia', 12);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1504, 'Caarapó', 12);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1505, 'Camapuã', 12);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1506, 'Campo Grande', 12);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1507, 'Caracol', 12);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1508, 'Cassilândia', 12);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1509, 'Chapadão do Sul', 12);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1510, 'Corguinho', 12);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1511, 'Coronel Sapucaia', 12);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1512, 'Corumbá', 12);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1513, 'Costa Rica', 12);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1514, 'Coxim', 12);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1515, 'Deodápolis', 12);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1516, 'Dois Irmãos do Buriti', 12);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1517, 'Douradina', 12);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1518, 'Dourados', 12);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1519, 'Eldorado', 12);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1520, 'Fátima do Sul', 12);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1521, 'Figueirão', 12);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1522, 'Glória de Dourados', 12);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1523, 'Guia Lopes da Laguna', 12);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1524, 'Iguatemi', 12);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1525, 'Inocência', 12);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1526, 'Itaporã', 12);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1527, 'Itaquiraí', 12);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1528, 'Ivinhema', 12);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1529, 'Japorã', 12);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1530, 'Jaraguari', 12);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1531, 'Jardim', 12);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1532, 'Jateí', 12);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1533, 'Juti', 12);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1534, 'Ladário', 12);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1535, 'Laguna Carapã', 12);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1536, 'Maracaju', 12);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1537, 'Miranda', 12);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1538, 'Mundo Novo', 12);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1539, 'Naviraí', 12);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1540, 'Nioaque', 12);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1541, 'Nova Alvorada do Sul', 12);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1542, 'Nova Andradina', 12);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1543, 'Novo Horizonte do Sul', 12);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1544, 'Paranaíba', 12);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1545, 'Paranhos', 12);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1546, 'Pedro Gomes', 12);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1547, 'Ponta Porã', 12);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1548, 'Porto Murtinho', 12);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1549, 'Ribas do Rio Pardo', 12);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1550, 'Rio Brilhante', 12);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1551, 'Rio Negro', 12);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1552, 'Rio Verde de Mato Grosso', 12);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1553, 'Rochedo', 12);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1554, 'Santa Rita do Pardo', 12);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1555, 'São Gabriel do Oeste', 12);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1556, 'Selvíria', 12);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1557, 'Sete Quedas', 12);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1558, 'Sidrolândia', 12);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1559, 'Sonora', 12);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1560, 'Tacuru', 12);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1561, 'Taquarussu', 12);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1562, 'Terenos', 12);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1563, 'Três Lagoas', 12);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1564, 'Vicentina', 12);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1565, 'Abadia dos Dourados', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1566, 'Abaeté', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1567, 'Abre Campo', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1568, 'Acaiaca', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1569, 'Açucena', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1570, 'Água Boa', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1571, 'Água Comprida', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1572, 'Aguanil', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1573, 'Águas Formosas', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1574, 'Águas Vermelhas', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1575, 'Aimorés', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1576, 'Aiuruoca', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1577, 'Alagoa', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1578, 'Albertina', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1579, 'Além Paraíba', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1580, 'Alfenas', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1581, 'Alfredo Vasconcelos', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1582, 'Almenara', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1583, 'Alpercata', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1584, 'Alpinópolis', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1585, 'Alterosa', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1586, 'Alto Caparaó', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1587, 'Alto Jequitibá', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1588, 'Alto Rio Doce', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1589, 'Alvarenga', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1590, 'Alvinópolis', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1591, 'Alvorada de Minas', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1592, 'Amparo do Serra', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1593, 'Andradas', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1594, 'Andrelândia', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1595, 'Angelândia', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1596, 'Antônio Carlos', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1597, 'Antônio Dias', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1598, 'Antônio Prado de Minas', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1599, 'Araçaí', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1600, 'Aracitaba', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1601, 'Araçuaí', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1602, 'Araguari', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1603, 'Arantina', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1604, 'Araponga', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1605, 'Araporã', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1606, 'Arapuá', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1607, 'Araújos', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1608, 'Araxá', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1609, 'Arceburgo', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1610, 'Arcos', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1611, 'Areado', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1612, 'Argirita', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1613, 'Aricanduva', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1614, 'Arinos', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1615, 'Astolfo Dutra', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1616, 'Ataléia', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1617, 'Augusto de Lima', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1618, 'Baependi', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1619, 'Baldim', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1620, 'Bambuí', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1621, 'Bandeira', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1622, 'Bandeira do Sul', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1623, 'Barão de Cocais', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1624, 'Barão de Monte Alto', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1625, 'Barbacena', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1626, 'Barra Longa', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1627, 'Barroso', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1628, 'Bela Vista de Minas', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1629, 'Belmiro Braga', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1630, 'Belo Horizonte', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1631, 'Belo Oriente', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1632, 'Belo Vale', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1633, 'Berilo', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1634, 'Berizal', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1635, 'Bertópolis', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1636, 'Betim', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1637, 'Bias Fortes', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1638, 'Bicas', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1639, 'Biquinhas', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1640, 'Boa Esperança', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1641, 'Bocaina de Minas', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1642, 'Bocaiúva', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1643, 'Bom Despacho', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1644, 'Bom Jardim de Minas', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1645, 'Bom Jesus da Penha', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1646, 'Bom Jesus do Amparo', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1647, 'Bom Jesus do Galho', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1648, 'Bom Repouso', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1649, 'Bom Sucesso', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1650, 'Bonfim', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1651, 'Bonfinópolis de Minas', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1652, 'Bonito de Minas', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1653, 'Borda da Mata', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1654, 'Botelhos', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1655, 'Botumirim', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1656, 'Brás Pires', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1657, 'Brasilândia de Minas', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1658, 'Brasília de Minas', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1659, 'Brasópolis', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1660, 'Braúnas', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1661, 'Brumadinho', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1662, 'Bueno Brandão', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1663, 'Buenópolis', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1664, 'Bugre', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1665, 'Buritis', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1666, 'Buritizeiro', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1667, 'Cabeceira Grande', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1668, 'Cabo Verde', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1669, 'Cachoeira da Prata', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1670, 'Cachoeira de Minas', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1671, 'Cachoeira de Pajeú', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1672, 'Cachoeira Dourada', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1673, 'Caetanópolis', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1674, 'Caeté', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1675, 'Caiana', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1676, 'Cajuri', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1677, 'Caldas', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1678, 'Camacho', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1679, 'Camanducaia', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1680, 'Cambuí', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1681, 'Cambuquira', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1682, 'Campanário', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1683, 'Campanha', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1684, 'Campestre', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1685, 'Campina Verde', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1686, 'Campo Azul', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1687, 'Campo Belo', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1688, 'Campo do Meio', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1689, 'Campo Florido', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1690, 'Campos Altos', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1691, 'Campos Gerais', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1692, 'Cana Verde', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1693, 'Canaã', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1694, 'Canápolis', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1695, 'Candeias', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1696, 'Cantagalo', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1697, 'Caparaó', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1698, 'Capela Nova', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1699, 'Capelinha', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1700, 'Capetinga', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1701, 'Capim Branco', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1702, 'Capinópolis', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1703, 'Capitão Andrade', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1704, 'Capitão Enéas', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1705, 'Capitólio', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1706, 'Caputira', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1707, 'Caraí', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1708, 'Caranaíba', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1709, 'Carandaí', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1710, 'Carangola', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1711, 'Caratinga', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1712, 'Carbonita', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1713, 'Careaçu', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1714, 'Carlos Chagas', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1715, 'Carmésia', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1716, 'Carmo da Cachoeira', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1717, 'Carmo da Mata', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1718, 'Carmo de Minas', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1719, 'Carmo do Cajuru', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1720, 'Carmo do Paranaíba', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1721, 'Carmo do Rio Claro', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1722, 'Carmópolis de Minas', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1723, 'Carneirinho', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1724, 'Carrancas', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1725, 'Carvalhópolis', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1726, 'Carvalhos', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1727, 'Casa Grande', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1728, 'Cascalho Rico', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1729, 'Cássia', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1730, 'Cataguases', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1731, 'Catas Altas', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1732, 'Catas Altas da Noruega', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1733, 'Catuji', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1734, 'Catuti', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1735, 'Caxambu', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1736, 'Cedro do Abaeté', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1737, 'Central de Minas', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1738, 'Centralina', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1739, 'Chácara', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1740, 'Chalé', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1741, 'Chapada do Norte', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1742, 'Chapada Gaúcha', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1743, 'Chiador', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1744, 'Cipotânea', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1745, 'Claraval', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1746, 'Claro dos Poções', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1747, 'Cláudio', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1748, 'Coimbra', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1749, 'Coluna', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1750, 'Comendador Gomes', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1751, 'Comercinho', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1752, 'Conceição da Aparecida', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1753, 'Conceição da Barra de Minas', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1754, 'Conceição das Alagoas', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1755, 'Conceição das Pedras', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1756, 'Conceição de Ipanema', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1757, 'Conceição do Mato Dentro', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1758, 'Conceição do Pará', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1759, 'Conceição do Rio Verde', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1760, 'Conceição dos Ouros', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1761, 'Cônego Marinho', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1762, 'Confins', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1763, 'Congonhal', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1764, 'Congonhas', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1765, 'Congonhas do Norte', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1766, 'Conquista', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1767, 'Conselheiro Lafaiete', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1768, 'Conselheiro Pena', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1769, 'Consolação', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1770, 'Contagem', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1771, 'Coqueiral', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1772, 'Coração de Jesus', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1773, 'Cordisburgo', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1774, 'Cordislândia', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1775, 'Corinto', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1776, 'Coroaci', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1777, 'Coromandel', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1778, 'Coronel Fabriciano', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1779, 'Coronel Murta', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1780, 'Coronel Pacheco', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1781, 'Coronel Xavier Chaves', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1782, 'Córrego Danta', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1783, 'Córrego do Bom Jesus', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1784, 'Córrego Fundo', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1785, 'Córrego Novo', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1786, 'Couto de Magalhães de Minas', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1787, 'Crisólita', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1788, 'Cristais', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1789, 'Cristália', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1790, 'Cristiano Otoni', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1791, 'Cristina', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1792, 'Crucilândia', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1793, 'Cruzeiro da Fortaleza', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1794, 'Cruzília', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1795, 'Cuparaque', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1796, 'Curral de Dentro', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1797, 'Curvelo', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1798, 'Datas', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1799, 'Delfim Moreira', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1800, 'Delfinópolis', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1801, 'Delta', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1802, 'Descoberto', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1803, 'Desterro de Entre Rios', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1804, 'Desterro do Melo', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1805, 'Diamantina', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1806, 'Diogo de Vasconcelos', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1807, 'Dionísio', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1808, 'Divinésia', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1809, 'Divino', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1810, 'Divino das Laranjeiras', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1811, 'Divinolândia de Minas', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1812, 'Divinópolis', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1813, 'Divisa Alegre', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1814, 'Divisa Nova', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1815, 'Divisópolis', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1816, 'Dom Bosco', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1817, 'Dom Cavati', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1818, 'Dom Joaquim', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1819, 'Dom Silvério', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1820, 'Dom Viçoso', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1821, 'Dona Eusébia', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1822, 'Dores de Campos', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1823, 'Dores de Guanhães', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1824, 'Dores do Indaiá', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1825, 'Dores do Turvo', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1826, 'Doresópolis', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1827, 'Douradoquara', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1828, 'Durandé', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1829, 'Elói Mendes', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1830, 'Engenheiro Caldas', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1831, 'Engenheiro Navarro', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1832, 'Entre Folhas', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1833, 'Entre Rios de Minas', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1834, 'Ervália', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1835, 'Esmeraldas', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1836, 'Espera Feliz', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1837, 'Espinosa', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1838, 'Espírito Santo do Dourado', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1839, 'Estiva', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1840, 'Estrela Dalva', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1841, 'Estrela do Indaiá', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1842, 'Estrela do Sul', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1843, 'Eugenópolis', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1844, 'Ewbank da Câmara', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1845, 'Extrema', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1846, 'Fama', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1847, 'Faria Lemos', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1848, 'Felício dos Santos', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1849, 'Felisburgo', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1850, 'Felixlândia', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1851, 'Fernandes Tourinho', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1852, 'Ferros', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1853, 'Fervedouro', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1854, 'Florestal', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1855, 'Formiga', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1856, 'Formoso', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1857, 'Fortaleza de Minas', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1858, 'Fortuna de Minas', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1859, 'Francisco Badaró', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1860, 'Francisco Dumont', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1861, 'Francisco Sá', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1862, 'Franciscópolis', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1863, 'Frei Gaspar', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1864, 'Frei Inocêncio', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1865, 'Frei Lagonegro', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1866, 'Fronteira', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1867, 'Fronteira dos Vales', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1868, 'Fruta de Leite', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1869, 'Frutal', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1870, 'Funilândia', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1871, 'Galiléia', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1872, 'Gameleiras', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1873, 'Glaucilândia', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1874, 'Goiabeira', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1875, 'Goianá', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1876, 'Gonçalves', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1877, 'Gonzaga', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1878, 'Gouveia', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1879, 'Governador Valadares', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1880, 'Grão Mogol', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1881, 'Grupiara', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1882, 'Guanhães', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1883, 'Guapé', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1884, 'Guaraciaba', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1885, 'Guaraciama', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1886, 'Guaranésia', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1887, 'Guarani', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1888, 'Guarará', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1889, 'Guarda-Mor', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1890, 'Guaxupé', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1891, 'Guidoval', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1892, 'Guimarânia', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1893, 'Guiricema', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1894, 'Gurinhatã', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1895, 'Heliodora', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1896, 'Iapu', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1897, 'Ibertioga', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1898, 'Ibiá', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1899, 'Ibiaí', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1900, 'Ibiracatu', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1901, 'Ibiraci', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1902, 'Ibirité', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1903, 'Ibitiúra de Minas', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1904, 'Ibituruna', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1905, 'Icaraí de Minas', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1906, 'Igarapé', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1907, 'Igaratinga', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1908, 'Iguatama', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1909, 'Ijaci', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1910, 'Ilicínea', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1911, 'Imbé de Minas', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1912, 'Inconfidentes', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1913, 'Indaiabira', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1914, 'Indianópolis', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1915, 'Ingaí', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1916, 'Inhapim', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1917, 'Inhaúma', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1918, 'Inimutaba', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1919, 'Ipaba', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1920, 'Ipanema', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1921, 'Ipatinga', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1922, 'Ipiaçu', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1923, 'Ipuiúna', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1924, 'Iraí de Minas', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1925, 'Itabira', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1926, 'Itabirinha de Mantena', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1927, 'Itabirito', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1928, 'Itacambira', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1929, 'Itacarambi', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1930, 'Itaguara', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1931, 'Itaipé', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1932, 'Itajubá', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1933, 'Itamarandiba', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1934, 'Itamarati de Minas', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1935, 'Itambacuri', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1936, 'Itambé do Mato Dentro', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1937, 'Itamogi', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1938, 'Itamonte', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1939, 'Itanhandu', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1940, 'Itanhomi', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1941, 'Itaobim', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1942, 'Itapagipe', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1943, 'Itapecerica', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1944, 'Itapeva', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1945, 'Itatiaiuçu', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1946, 'Itaú de Minas', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1947, 'Itaúna', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1948, 'Itaverava', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1949, 'Itinga', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1950, 'Itueta', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1951, 'Ituiutaba', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1952, 'Itumirim', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1953, 'Iturama', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1954, 'Itutinga', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1955, 'Jaboticatubas', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1956, 'Jacinto', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1957, 'Jacuí', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1958, 'Jacutinga', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1959, 'Jaguaraçu', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1960, 'Jaíba', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1961, 'Jampruca', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1962, 'Janaúba', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1963, 'Januária', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1964, 'Japaraíba', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1965, 'Japonvar', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1966, 'Jeceaba', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1967, 'Jenipapo de Minas', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1968, 'Jequeri', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1969, 'Jequitaí', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1970, 'Jequitibá', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1971, 'Jequitinhonha', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1972, 'Jesuânia', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1973, 'Joaíma', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1974, 'Joanésia', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1975, 'João Monlevade', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1976, 'João Pinheiro', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1977, 'Joaquim Felício', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1978, 'Jordânia', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1979, 'José Gonçalves de Minas', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1980, 'José Raydan', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1981, 'Josenópolis', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1982, 'Juatuba', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1983, 'Juiz de Fora', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1984, 'Juramento', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1985, 'Juruaia', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1986, 'Juvenília', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1987, 'Ladainha', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1988, 'Lagamar', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1989, 'Lagoa da Prata', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1990, 'Lagoa dos Patos', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1991, 'Lagoa Dourada', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1992, 'Lagoa Formosa', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1993, 'Lagoa Grande', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1994, 'Lagoa Santa', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1995, 'Lajinha', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1996, 'Lambari', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1997, 'Lamim', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1998, 'Laranjal', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (1999, 'Lassance', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2000, 'Lavras', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2001, 'Leandro Ferreira', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2002, 'Leme do Prado', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2003, 'Leopoldina', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2004, 'Liberdade', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2005, 'Lima Duarte', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2006, 'Limeira do Oeste', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2007, 'Lontra', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2008, 'Luisburgo', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2009, 'Luislândia', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2010, 'Luminárias', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2011, 'Luz', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2012, 'Machacalis', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2013, 'Machado', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2014, 'Madre de Deus de Minas', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2015, 'Malacacheta', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2016, 'Mamonas', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2017, 'Manga', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2018, 'Manhuaçu', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2019, 'Manhumirim', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2020, 'Mantena', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2021, 'Mar de Espanha', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2022, 'Maravilhas', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2023, 'Maria da Fé', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2024, 'Mariana', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2025, 'Marilac', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2026, 'Mário Campos', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2027, 'Maripá de Minas', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2028, 'Marliéria', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2029, 'Marmelópolis', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2030, 'Martinho Campos', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2031, 'Martins Soares', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2032, 'Mata Verde', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2033, 'Materlândia', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2034, 'Mateus Leme', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2035, 'Mathias Lobato', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2036, 'Matias Barbosa', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2037, 'Matias Cardoso', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2038, 'Matipó', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2039, 'Mato Verde', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2040, 'Matozinhos', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2041, 'Matutina', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2042, 'Medeiros', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2043, 'Medina', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2044, 'Mendes Pimentel', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2045, 'Mercês', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2046, 'Mesquita', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2047, 'Minas Novas', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2048, 'Minduri', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2049, 'Mirabela', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2050, 'Miradouro', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2051, 'Miraí', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2052, 'Miravânia', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2053, 'Moeda', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2054, 'Moema', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2055, 'Monjolos', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2056, 'Monsenhor Paulo', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2057, 'Montalvânia', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2058, 'Monte Alegre de Minas', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2059, 'Monte Azul', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2060, 'Monte Belo', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2061, 'Monte Carmelo', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2062, 'Monte Formoso', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2063, 'Monte Santo de Minas', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2064, 'Monte Sião', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2065, 'Montes Claros', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2066, 'Montezuma', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2067, 'Morada Nova de Minas', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2068, 'Morro da Garça', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2069, 'Morro do Pilar', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2070, 'Munhoz', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2071, 'Muriaé', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2072, 'Mutum', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2073, 'Muzambinho', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2074, 'Nacip Raydan', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2075, 'Nanuque', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2076, 'Naque', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2077, 'Natalândia', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2078, 'Natércia', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2079, 'Nazareno', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2080, 'Nepomuceno', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2081, 'Ninheira', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2082, 'Nova Belém', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2083, 'Nova Era', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2084, 'Nova Lima', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2085, 'Nova Módica', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2086, 'Nova Ponte', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2087, 'Nova Porteirinha', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2088, 'Nova Resende', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2089, 'Nova Serrana', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2090, 'Nova União', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2091, 'Novo Cruzeiro', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2092, 'Novo Oriente de Minas', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2093, 'Novorizonte', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2094, 'Olaria', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2095, 'Olhos-dÁgua', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2096, 'Olímpio Noronha', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2097, 'Oliveira', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2098, 'Oliveira Fortes', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2099, 'Onça de Pitangui', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2100, 'Oratórios', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2101, 'Orizânia', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2102, 'Ouro Branco', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2103, 'Ouro Fino', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2104, 'Ouro Preto', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2105, 'Ouro Verde de Minas', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2106, 'Padre Carvalho', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2107, 'Padre Paraíso', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2108, 'Pai Pedro', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2109, 'Paineiras', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2110, 'Pains', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2111, 'Paiva', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2112, 'Palma', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2113, 'Palmópolis', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2114, 'Papagaios', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2115, 'Pará de Minas', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2116, 'Paracatu', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2117, 'Paraguaçu', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2118, 'Paraisópolis', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2119, 'Paraopeba', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2120, 'Passa Quatro', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2121, 'Passa Tempo', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2122, 'Passabém', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2123, 'Passa-Vinte', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2124, 'Passos', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2125, 'Patis', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2126, 'Patos de Minas', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2127, 'Patrocínio', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2128, 'Patrocínio do Muriaé', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2129, 'Paula Cândido', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2130, 'Paulistas', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2131, 'Pavão', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2132, 'Peçanha', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2133, 'Pedra Azul', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2134, 'Pedra Bonita', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2135, 'Pedra do Anta', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2136, 'Pedra do Indaiá', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2137, 'Pedra Dourada', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2138, 'Pedralva', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2139, 'Pedras de Maria da Cruz', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2140, 'Pedrinópolis', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2141, 'Pedro Leopoldo', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2142, 'Pedro Teixeira', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2143, 'Pequeri', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2144, 'Pequi', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2145, 'Perdigão', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2146, 'Perdizes', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2147, 'Perdões', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2148, 'Periquito', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2149, 'Pescador', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2150, 'Piau', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2151, 'Piedade de Caratinga', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2152, 'Piedade de Ponte Nova', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2153, 'Piedade do Rio Grande', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2154, 'Piedade dos Gerais', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2155, 'Pimenta', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2156, 'Pingo-dÁgua', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2157, 'Pintópolis', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2158, 'Piracema', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2159, 'Pirajuba', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2160, 'Piranga', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2161, 'Piranguçu', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2162, 'Piranguinho', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2163, 'Pirapetinga', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2164, 'Pirapora', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2165, 'Piraúba', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2166, 'Pitangui', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2167, 'Piumhi', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2168, 'Planura', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2169, 'Poço Fundo', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2170, 'Poços de Caldas', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2171, 'Pocrane', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2172, 'Pompéu', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2173, 'Ponte Nova', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2174, 'Ponto Chique', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2175, 'Ponto dos Volantes', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2176, 'Porteirinha', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2177, 'Porto Firme', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2178, 'Poté', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2179, 'Pouso Alegre', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2180, 'Pouso Alto', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2181, 'Prados', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2182, 'Prata', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2183, 'Pratápolis', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2184, 'Pratinha', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2185, 'Presidente Bernardes', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2186, 'Presidente Juscelino', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2187, 'Presidente Kubitschek', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2188, 'Presidente Olegário', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2189, 'Prudente de Morais', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2190, 'Quartel Geral', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2191, 'Queluzito', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2192, 'Raposos', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2193, 'Raul Soares', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2194, 'Recreio', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2195, 'Reduto', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2196, 'Resende Costa', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2197, 'Resplendor', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2198, 'Ressaquinha', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2199, 'Riachinho', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2200, 'Riacho dos Machados', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2201, 'Ribeirão das Neves', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2202, 'Ribeirão Vermelho', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2203, 'Rio Acima', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2204, 'Rio Casca', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2205, 'Rio do Prado', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2206, 'Rio Doce', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2207, 'Rio Espera', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2208, 'Rio Manso', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2209, 'Rio Novo', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2210, 'Rio Paranaíba', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2211, 'Rio Pardo de Minas', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2212, 'Rio Piracicaba', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2213, 'Rio Pomba', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2214, 'Rio Preto', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2215, 'Rio Vermelho', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2216, 'Ritápolis', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2217, 'Rochedo de Minas', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2218, 'Rodeiro', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2219, 'Romaria', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2220, 'Rosário da Limeira', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2221, 'Rubelita', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2222, 'Rubim', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2223, 'Sabará', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2224, 'Sabinópolis', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2225, 'Sacramento', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2226, 'Salinas', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2227, 'Salto da Divisa', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2228, 'Santa Bárbara', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2229, 'Santa Bárbara do Leste', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2230, 'Santa Bárbara do Monte Verde', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2231, 'Santa Bárbara do Tugúrio', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2232, 'Santa Cruz de Minas', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2233, 'Santa Cruz de Salinas', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2234, 'Santa Cruz do Escalvado', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2235, 'Santa Efigênia de Minas', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2236, 'Santa Fé de Minas', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2237, 'Santa Helena de Minas', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2238, 'Santa Juliana', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2239, 'Santa Luzia', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2240, 'Santa Margarida', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2241, 'Santa Maria de Itabira', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2242, 'Santa Maria do Salto', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2243, 'Santa Maria do Suaçuí', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2244, 'Santa Rita de Caldas', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2245, 'Santa Rita de Ibitipoca', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2246, 'Santa Rita de Jacutinga', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2247, 'Santa Rita de Minas', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2248, 'Santa Rita do Itueto', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2249, 'Santa Rita do Sapucaí', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2250, 'Santa Rosa da Serra', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2251, 'Santa Vitória', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2252, 'Santana da Vargem', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2253, 'Santana de Cataguases', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2254, 'Santana de Pirapama', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2255, 'Santana do Deserto', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2256, 'Santana do Garambéu', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2257, 'Santana do Jacaré', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2258, 'Santana do Manhuaçu', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2259, 'Santana do Paraíso', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2260, 'Santana do Riacho', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2261, 'Santana dos Montes', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2262, 'Santo Antônio do Amparo', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2263, 'Santo Antônio do Aventureiro', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2264, 'Santo Antônio do Grama', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2265, 'Santo Antônio do Itambé', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2266, 'Santo Antônio do Jacinto', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2267, 'Santo Antônio do Monte', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2268, 'Santo Antônio do Retiro', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2269, 'Santo Antônio do Rio Abaixo', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2270, 'Santo Hipólito', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2271, 'Santos Dumont', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2272, 'São Bento Abade', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2273, 'São Brás do Suaçuí', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2274, 'São Domingos das Dores', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2275, 'São Domingos do Prata', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2276, 'São Félix de Minas', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2277, 'São Francisco', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2278, 'São Francisco de Paula', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2279, 'São Francisco de Sales', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2280, 'São Francisco do Glória', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2281, 'São Geraldo', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2282, 'São Geraldo da Piedade', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2283, 'São Geraldo do Baixio', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2284, 'São Gonçalo do Abaeté', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2285, 'São Gonçalo do Pará', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2286, 'São Gonçalo do Rio Abaixo', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2287, 'São Gonçalo do Rio Preto', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2288, 'São Gonçalo do Sapucaí', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2289, 'São Gotardo', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2290, 'São João Batista do Glória', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2291, 'São João da Lagoa', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2292, 'São João da Mata', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2293, 'São João da Ponte', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2294, 'São João das Missões', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2295, 'São João del Rei', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2296, 'São João do Manhuaçu', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2297, 'São João do Manteninha', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2298, 'São João do Oriente', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2299, 'São João do Pacuí', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2300, 'São João do Paraíso', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2301, 'São João Evangelista', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2302, 'São João Nepomuceno', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2303, 'São Joaquim de Bicas', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2304, 'São José da Barra', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2305, 'São José da Lapa', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2306, 'São José da Safira', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2307, 'São José da Varginha', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2308, 'São José do Alegre', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2309, 'São José do Divino', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2310, 'São José do Goiabal', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2311, 'São José do Jacuri', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2312, 'São José do Mantimento', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2313, 'São Lourenço', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2314, 'São Miguel do Anta', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2315, 'São Pedro da União', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2316, 'São Pedro do Suaçuí', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2317, 'São Pedro dos Ferros', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2318, 'São Romão', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2319, 'São Roque de Minas', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2320, 'São Sebastião da Bela Vista', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2321, 'São Sebastião da Vargem Alegre', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2322, 'São Sebastião do Anta', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2323, 'São Sebastião do Maranhão', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2324, 'São Sebastião do Oeste', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2325, 'São Sebastião do Paraíso', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2326, 'São Sebastião do Rio Preto', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2327, 'São Sebastião do Rio Verde', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2328, 'São Thomé das Letras', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2329, 'São Tiago', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2330, 'São Tomás de Aquino', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2331, 'São Vicente de Minas', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2332, 'Sapucaí-Mirim', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2333, 'Sardoá', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2334, 'Sarzedo', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2335, 'Sem-Peixe', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2336, 'Senador Amaral', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2337, 'Senador Cortes', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2338, 'Senador Firmino', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2339, 'Senador José Bento', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2340, 'Senador Modestino Gonçalves', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2341, 'Senhora de Oliveira', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2342, 'Senhora do Porto', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2343, 'Senhora dos Remédios', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2344, 'Sericita', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2345, 'Seritinga', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2346, 'Serra Azul de Minas', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2347, 'Serra da Saudade', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2348, 'Serra do Salitre', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2349, 'Serra dos Aimorés', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2350, 'Serrania', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2351, 'Serranópolis de Minas', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2352, 'Serranos', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2353, 'Serro', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2354, 'Sete Lagoas', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2355, 'Setubinha', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2356, 'Silveirânia', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2357, 'Silvianópolis', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2358, 'Simão Pereira', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2359, 'Simonésia', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2360, 'Sobrália', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2361, 'Soledade de Minas', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2362, 'Tabuleiro', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2363, 'Taiobeiras', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2364, 'Taparuba', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2365, 'Tapira', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2366, 'Tapiraí', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2367, 'Taquaraçu de Minas', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2368, 'Tarumirim', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2369, 'Teixeiras', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2370, 'Teófilo Otoni', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2371, 'Timóteo', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2372, 'Tiradentes', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2373, 'Tiros', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2374, 'Tocantins', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2375, 'Tocos do Moji', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2376, 'Toledo', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2377, 'Tombos', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2378, 'Três Corações', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2379, 'Três Marias', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2380, 'Três Pontas', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2381, 'Tumiritinga', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2382, 'Tupaciguara', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2383, 'Turmalina', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2384, 'Turvolândia', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2385, 'Ubá', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2386, 'Ubaí', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2387, 'Ubaporanga', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2388, 'Uberaba', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2389, 'Uberlândia', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2390, 'Umburatiba', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2391, 'Unaí', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2392, 'União de Minas', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2393, 'Uruana de Minas', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2394, 'Urucânia', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2395, 'Urucuia', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2396, 'Vargem Alegre', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2397, 'Vargem Bonita', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2398, 'Vargem Grande do Rio Pardo', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2399, 'Varginha', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2400, 'Varjão de Minas', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2401, 'Várzea da Palma', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2402, 'Varzelândia', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2403, 'Vazante', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2404, 'Verdelândia', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2405, 'Veredinha', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2406, 'Veríssimo', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2407, 'Vermelho Novo', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2408, 'Vespasiano', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2409, 'Viçosa', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2410, 'Vieiras', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2411, 'Virgem da Lapa', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2412, 'Virgínia', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2413, 'Virginópolis', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2414, 'Virgolândia', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2415, 'Visconde do Rio Branco', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2416, 'Volta Grande', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2417, 'Wenceslau Braz', 11);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2418, 'Abaetetuba', 14);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2419, 'Abel Figueiredo', 14);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2420, 'Acará', 14);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2421, 'Afuá', 14);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2422, 'Água Azul do Norte', 14);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2423, 'Alenquer', 14);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2424, 'Almeirim', 14);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2425, 'Altamira', 14);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2426, 'Anajás', 14);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2427, 'Ananindeua', 14);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2428, 'Anapu', 14);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2429, 'Augusto Corrêa', 14);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2430, 'Aurora do Pará', 14);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2431, 'Aveiro', 14);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2432, 'Bagre', 14);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2433, 'Baião', 14);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2434, 'Bannach', 14);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2435, 'Barcarena', 14);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2436, 'Belém', 14);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2437, 'Belterra', 14);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2438, 'Benevides', 14);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2439, 'Bom Jesus do Tocantins', 14);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2440, 'Bonito', 14);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2441, 'Bragança', 14);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2442, 'Brasil Novo', 14);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2443, 'Brejo Grande do Araguaia', 14);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2444, 'Breu Branco', 14);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2445, 'Breves', 14);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2446, 'Bujaru', 14);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2447, 'Cachoeira do Arari', 14);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2448, 'Cachoeira do Piriá', 14);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2449, 'Cametá', 14);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2450, 'Canaã dos Carajás', 14);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2451, 'Capanema', 14);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2452, 'Capitão Poço', 14);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2453, 'Castanhal', 14);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2454, 'Chaves', 14);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2455, 'Colares', 14);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2456, 'Conceição do Araguaia', 14);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2457, 'Concórdia do Pará', 14);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2458, 'Cumaru do Norte', 14);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2459, 'Curionópolis', 14);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2460, 'Curralinho', 14);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2461, 'Curuá', 14);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2462, 'Curuçá', 14);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2463, 'Dom Eliseu', 14);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2464, 'Eldorado dos Carajás', 14);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2465, 'Faro', 14);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2466, 'Floresta do Araguaia', 14);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2467, 'Garrafão do Norte', 14);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2468, 'Goianésia do Pará', 14);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2469, 'Gurupá', 14);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2470, 'Igarapé-Açu', 14);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2471, 'Igarapé-Miri', 14);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2472, 'Inhangapi', 14);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2473, 'Ipixuna do Pará', 14);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2474, 'Irituia', 14);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2475, 'Itaituba', 14);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2476, 'Itupiranga', 14);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2477, 'Jacareacanga', 14);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2478, 'Jacundá', 14);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2479, 'Juruti', 14);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2480, 'Limoeiro do Ajuru', 14);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2481, 'Mãe do Rio', 14);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2482, 'Magalhães Barata', 14);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2483, 'Marabá', 14);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2484, 'Maracanã', 14);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2485, 'Marapanim', 14);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2486, 'Marituba', 14);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2487, 'Medicilândia', 14);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2488, 'Melgaço', 14);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2489, 'Mocajuba', 14);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2490, 'Moju', 14);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2491, 'Monte Alegre', 14);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2492, 'Muaná', 14);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2493, 'Nova Esperança do Piriá', 14);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2494, 'Nova Ipixuna', 14);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2495, 'Nova Timboteua', 14);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2496, 'Novo Progresso', 14);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2497, 'Novo Repartimento', 14);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2498, 'Óbidos', 14);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2499, 'Oeiras do Pará', 14);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2500, 'Oriximiná', 14);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2501, 'Ourém', 14);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2502, 'Ourilândia do Norte', 14);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2503, 'Pacajá', 14);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2504, 'Palestina do Pará', 14);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2505, 'Paragominas', 14);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2506, 'Parauapebas', 14);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2507, 'Pau dArco', 14);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2508, 'Peixe-Boi', 14);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2509, 'Piçarra', 14);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2510, 'Placas', 14);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2511, 'Ponta de Pedras', 14);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2512, 'Portel', 14);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2513, 'Porto de Moz', 14);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2514, 'Prainha', 14);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2515, 'Primavera', 14);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2516, 'Quatipuru', 14);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2517, 'Redenção', 14);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2518, 'Rio Maria', 14);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2519, 'Rondon do Pará', 14);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2520, 'Rurópolis', 14);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2521, 'Salinópolis', 14);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2522, 'Salvaterra', 14);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2523, 'Santa Bárbara do Pará', 14);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2524, 'Santa Cruz do Arari', 14);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2525, 'Santa Isabel do Pará', 14);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2526, 'Santa Luzia do Pará', 14);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2527, 'Santa Maria das Barreiras', 14);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2528, 'Santa Maria do Pará', 14);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2529, 'Santana do Araguaia', 14);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2530, 'Santarém', 14);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2531, 'Santarém Novo', 14);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2532, 'Santo Antônio do Tauá', 14);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2533, 'São Caetano de Odivelas', 14);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2534, 'São Domingos do Araguaia', 14);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2535, 'São Domingos do Capim', 14);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2536, 'São Félix do Xingu', 14);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2537, 'São Francisco do Pará', 14);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2538, 'São Geraldo do Araguaia', 14);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2539, 'São João da Ponta', 14);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2540, 'São João de Pirabas', 14);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2541, 'São João do Araguaia', 14);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2542, 'São Miguel do Guamá', 14);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2543, 'São Sebastião da Boa Vista', 14);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2544, 'Sapucaia', 14);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2545, 'Senador José Porfírio', 14);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2546, 'Soure', 14);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2547, 'Tailândia', 14);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2548, 'Terra Alta', 14);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2549, 'Terra Santa', 14);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2550, 'Tomé-Açu', 14);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2551, 'Tracuateua', 14);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2552, 'Trairão', 14);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2553, 'Tucumã', 14);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2554, 'Tucuruí', 14);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2555, 'Ulianópolis', 14);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2556, 'Uruará', 14);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2557, 'Vigia', 14);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2558, 'Viseu', 14);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2559, 'Vitória do Xingu', 14);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2560, 'Xinguara', 14);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2561, 'Água Branca', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2562, 'Aguiar', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2563, 'Alagoa Grande', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2564, 'Alagoa Nova', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2565, 'Alagoinha', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2566, 'Alcantil', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2567, 'Algodão de Jandaíra', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2568, 'Alhandra', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2569, 'Amparo', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2570, 'Aparecida', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2571, 'Araçagi', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2572, 'Arara', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2573, 'Araruna', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2574, 'Areia', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2575, 'Areia de Baraúnas', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2576, 'Areial', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2577, 'Aroeiras', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2578, 'Assunção', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2579, 'Baía da Traição', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2580, 'Bananeiras', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2581, 'Baraúna', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2582, 'Barra de Santa Rosa', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2583, 'Barra de Santana', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2584, 'Barra de São Miguel', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2585, 'Bayeux', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2586, 'Belém', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2587, 'Belém do Brejo do Cruz', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2588, 'Bernardino Batista', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2589, 'Boa Ventura', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2590, 'Boa Vista', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2591, 'Bom Jesus', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2592, 'Bom Sucesso', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2593, 'Bonito de Santa Fé', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2594, 'Boqueirão', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2595, 'Borborema', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2596, 'Brejo do Cruz', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2597, 'Brejo dos Santos', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2598, 'Caaporã', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2599, 'Cabaceiras', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2600, 'Cabedelo', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2601, 'Cachoeira dos Índios', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2602, 'Cacimba de Areia', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2603, 'Cacimba de Dentro', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2604, 'Cacimbas', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2605, 'Caiçara', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2606, 'Cajazeiras', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2607, 'Cajazeirinhas', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2608, 'Caldas Brandão', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2609, 'Camalaú', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2610, 'Campina Grande', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2611, 'Campo de Santana', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2612, 'Capim', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2613, 'Caraúbas', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2614, 'Carrapateira', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2615, 'Casserengue', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2616, 'Catingueira', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2617, 'Catolé do Rocha', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2618, 'Caturité', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2619, 'Conceição', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2620, 'Condado', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2621, 'Conde', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2622, 'Congo', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2623, 'Coremas', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2624, 'Coxixola', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2625, 'Cruz do Espírito Santo', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2626, 'Cubati', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2627, 'Cuité', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2628, 'Cuité de Mamanguape', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2629, 'Cuitegi', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2630, 'Curral de Cima', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2631, 'Curral Velho', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2632, 'Damião', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2633, 'Desterro', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2634, 'Diamante', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2635, 'Dona Inês', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2636, 'Duas Estradas', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2637, 'Emas', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2638, 'Esperança', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2639, 'Fagundes', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2640, 'Frei Martinho', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2641, 'Gado Bravo', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2642, 'Guarabira', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2643, 'Gurinhém', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2644, 'Gurjão', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2645, 'Ibiara', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2646, 'Igaracy', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2647, 'Imaculada', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2648, 'Ingá', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2649, 'Itabaiana', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2650, 'Itaporanga', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2651, 'Itapororoca', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2652, 'Itatuba', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2653, 'Jacaraú', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2654, 'Jericó', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2655, 'João Pessoa', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2656, 'Juarez Távora', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2657, 'Juazeirinho', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2658, 'Junco do Seridó', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2659, 'Juripiranga', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2660, 'Juru', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2661, 'Lagoa', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2662, 'Lagoa de Dentro', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2663, 'Lagoa Seca', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2664, 'Lastro', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2665, 'Livramento', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2666, 'Logradouro', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2667, 'Lucena', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2668, 'Mãe dÁgua', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2669, 'Malta', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2670, 'Mamanguape', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2671, 'Manaíra', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2672, 'Marcação', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2673, 'Mari', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2674, 'Marizópolis', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2675, 'Massaranduba', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2676, 'Mataraca', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2677, 'Matinhas', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2678, 'Mato Grosso', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2679, 'Maturéia', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2680, 'Mogeiro', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2681, 'Montadas', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2682, 'Monte Horebe', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2683, 'Monteiro', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2684, 'Mulungu', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2685, 'Natuba', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2686, 'Nazarezinho', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2687, 'Nova Floresta', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2688, 'Nova Olinda', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2689, 'Nova Palmeira', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2690, 'Olho dÁgua', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2691, 'Olivedos', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2692, 'Ouro Velho', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2693, 'Parari', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2694, 'Passagem', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2695, 'Patos', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2696, 'Paulista', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2697, 'Pedra Branca', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2698, 'Pedra Lavrada', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2699, 'Pedras de Fogo', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2700, 'Pedro Régis', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2701, 'Piancó', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2702, 'Picuí', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2703, 'Pilar', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2704, 'Pilões', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2705, 'Pilõezinhos', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2706, 'Pirpirituba', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2707, 'Pitimbu', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2708, 'Pocinhos', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2709, 'Poço Dantas', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2710, 'Poço de José de Moura', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2711, 'Pombal', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2712, 'Prata', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2713, 'Princesa Isabel', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2714, 'Puxinanã', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2715, 'Queimadas', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2716, 'Quixabá', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2717, 'Remígio', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2718, 'Riachão', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2719, 'Riachão do Bacamarte', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2720, 'Riachão do Poço', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2721, 'Riacho de Santo Antônio', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2722, 'Riacho dos Cavalos', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2723, 'Rio Tinto', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2724, 'Salgadinho', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2725, 'Salgado de São Félix', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2726, 'Santa Cecília', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2727, 'Santa Cruz', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2728, 'Santa Helena', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2729, 'Santa Inês', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2730, 'Santa Luzia', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2731, 'Santa Rita', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2732, 'Santa Teresinha', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2733, 'Santana de Mangueira', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2734, 'Santana dos Garrotes', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2735, 'Santarém', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2736, 'Santo André', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2737, 'São Bentinho', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2738, 'São Bento', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2739, 'São Domingos de Pombal', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2740, 'São Domingos do Cariri', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2741, 'São Francisco', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2742, 'São João do Cariri', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2743, 'São João do Rio do Peixe', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2744, 'São João do Tigre', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2745, 'São José da Lagoa Tapada', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2746, 'São José de Caiana', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2747, 'São José de Espinharas', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2748, 'São José de Piranhas', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2749, 'São José de Princesa', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2750, 'São José do Bonfim', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2751, 'São José do Brejo do Cruz', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2752, 'São José do Sabugi', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2753, 'São José dos Cordeiros', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2754, 'São José dos Ramos', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2755, 'São Mamede', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2756, 'São Miguel de Taipu', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2757, 'São Sebastião de Lagoa de Roça', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2758, 'São Sebastião do Umbuzeiro', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2759, 'Sapé', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2760, 'Seridó', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2761, 'Serra Branca', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2762, 'Serra da Raiz', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2763, 'Serra Grande', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2764, 'Serra Redonda', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2765, 'Serraria', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2766, 'Sertãozinho', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2767, 'Sobrado', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2768, 'Solânea', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2769, 'Soledade', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2770, 'Sossêgo', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2771, 'Sousa', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2772, 'Sumé', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2773, 'Taperoá', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2774, 'Tavares', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2775, 'Teixeira', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2776, 'Tenório', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2777, 'Triunfo', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2778, 'Uiraúna', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2779, 'Umbuzeiro', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2780, 'Várzea', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2781, 'Vieirópolis', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2782, 'Vista Serrana', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2783, 'Zabelê', 15);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2784, 'Abatiá', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2785, 'Adrianópolis', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2786, 'Agudos do Sul', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2787, 'Almirante Tamandaré', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2788, 'Altamira do Paraná', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2789, 'Alto Paraíso', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2790, 'Alto Paraná', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2791, 'Alto Piquiri', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2792, 'Altônia', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2793, 'Alvorada do Sul', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2794, 'Amaporã', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2795, 'Ampére', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2796, 'Anahy', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2797, 'Andirá', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2798, 'Ângulo', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2799, 'Antonina', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2800, 'Antônio Olinto', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2801, 'Apucarana', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2802, 'Arapongas', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2803, 'Arapoti', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2804, 'Arapuã', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2805, 'Araruna', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2806, 'Araucária', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2807, 'Ariranha do Ivaí', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2808, 'Assaí', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2809, 'Assis Chateaubriand', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2810, 'Astorga', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2811, 'Atalaia', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2812, 'Balsa Nova', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2813, 'Bandeirantes', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2814, 'Barbosa Ferraz', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2815, 'Barra do Jacaré', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2816, 'Barracão', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2817, 'Bela Vista da Caroba', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2818, 'Bela Vista do Paraíso', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2819, 'Bituruna', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2820, 'Boa Esperança', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2821, 'Boa Esperança do Iguaçu', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2822, 'Boa Ventura de São Roque', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2823, 'Boa Vista da Aparecida', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2824, 'Bocaiúva do Sul', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2825, 'Bom Jesus do Sul', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2826, 'Bom Sucesso', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2827, 'Bom Sucesso do Sul', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2828, 'Borrazópolis', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2829, 'Braganey', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2830, 'Brasilândia do Sul', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2831, 'Cafeara', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2832, 'Cafelândia', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2833, 'Cafezal do Sul', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2834, 'Califórnia', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2835, 'Cambará', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2836, 'Cambé', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2837, 'Cambira', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2838, 'Campina da Lagoa', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2839, 'Campina do Simão', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2840, 'Campina Grande do Sul', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2841, 'Campo Bonito', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2842, 'Campo do Tenente', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2843, 'Campo Largo', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2844, 'Campo Magro', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2845, 'Campo Mourão', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2846, 'Cândido de Abreu', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2847, 'Candói', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2848, 'Cantagalo', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2849, 'Capanema', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2850, 'Capitão Leônidas Marques', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2851, 'Carambeí', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2852, 'Carlópolis', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2853, 'Cascavel', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2854, 'Castro', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2855, 'Catanduvas', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2856, 'Centenário do Sul', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2857, 'Cerro Azul', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2858, 'Céu Azul', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2859, 'Chopinzinho', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2860, 'Cianorte', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2861, 'Cidade Gaúcha', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2862, 'Clevelândia', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2863, 'Colombo', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2864, 'Colorado', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2865, 'Congonhinhas', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2866, 'Conselheiro Mairinck', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2867, 'Contenda', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2868, 'Corbélia', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2869, 'Cornélio Procópio', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2870, 'Coronel Domingos Soares', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2871, 'Coronel Vivida', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2872, 'Corumbataí do Sul', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2873, 'Cruz Machado', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2874, 'Cruzeiro do Iguaçu', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2875, 'Cruzeiro do Oeste', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2876, 'Cruzeiro do Sul', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2877, 'Cruzmaltina', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2878, 'Curitiba', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2879, 'Curiúva', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2880, 'Diamante dOeste', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2881, 'Diamante do Norte', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2882, 'Diamante do Sul', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2883, 'Dois Vizinhos', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2884, 'Douradina', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2885, 'Doutor Camargo', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2886, 'Doutor Ulysses', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2887, 'Enéas Marques', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2888, 'Engenheiro Beltrão', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2889, 'Entre Rios do Oeste', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2890, 'Esperança Nova', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2891, 'Espigão Alto do Iguaçu', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2892, 'Farol', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2893, 'Faxinal', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2894, 'Fazenda Rio Grande', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2895, 'Fênix', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2896, 'Fernandes Pinheiro', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2897, 'Figueira', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2898, 'Flor da Serra do Sul', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2899, 'Floraí', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2900, 'Floresta', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2901, 'Florestópolis', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2902, 'Flórida', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2903, 'Formosa do Oeste', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2904, 'Foz do Iguaçu', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2905, 'Foz do Jordão', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2906, 'Francisco Alves', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2907, 'Francisco Beltrão', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2908, 'General Carneiro', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2909, 'Godoy Moreira', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2910, 'Goioerê', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2911, 'Goioxim', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2912, 'Grandes Rios', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2913, 'Guaíra', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2914, 'Guairaçá', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2915, 'Guamiranga', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2916, 'Guapirama', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2917, 'Guaporema', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2918, 'Guaraci', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2919, 'Guaraniaçu', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2920, 'Guarapuava', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2921, 'Guaraqueçaba', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2922, 'Guaratuba', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2923, 'Honório Serpa', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2924, 'Ibaiti', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2925, 'Ibema', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2926, 'Ibiporã', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2927, 'Icaraíma', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2928, 'Iguaraçu', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2929, 'Iguatu', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2930, 'Imbaú', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2931, 'Imbituva', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2932, 'Inácio Martins', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2933, 'Inajá', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2934, 'Indianópolis', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2935, 'Ipiranga', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2936, 'Iporã', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2937, 'Iracema do Oeste', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2938, 'Irati', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2939, 'Iretama', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2940, 'Itaguajé', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2941, 'Itaipulândia', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2942, 'Itambaracá', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2943, 'Itambé', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2944, 'Itapejara dOeste', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2945, 'Itaperuçu', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2946, 'Itaúna do Sul', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2947, 'Ivaí', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2948, 'Ivaiporã', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2949, 'Ivaté', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2950, 'Ivatuba', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2951, 'Jaboti', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2952, 'Jacarezinho', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2953, 'Jaguapitã', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2954, 'Jaguariaíva', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2955, 'Jandaia do Sul', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2956, 'Janiópolis', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2957, 'Japira', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2958, 'Japurá', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2959, 'Jardim Alegre', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2960, 'Jardim Olinda', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2961, 'Jataizinho', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2962, 'Jesuítas', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2963, 'Joaquim Távora', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2964, 'Jundiaí do Sul', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2965, 'Juranda', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2966, 'Jussara', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2967, 'Kaloré', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2968, 'Lapa', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2969, 'Laranjal', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2970, 'Laranjeiras do Sul', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2971, 'Leópolis', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2972, 'Lidianópolis', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2973, 'Lindoeste', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2974, 'Loanda', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2975, 'Lobato', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2976, 'Londrina', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2977, 'Luiziana', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2978, 'Lunardelli', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2979, 'Lupionópolis', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2980, 'Mallet', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2981, 'Mamborê', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2982, 'Mandaguaçu', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2983, 'Mandaguari', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2984, 'Mandirituba', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2985, 'Manfrinópolis', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2986, 'Mangueirinha', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2987, 'Manoel Ribas', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2988, 'Marechal Cândido Rondon', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2989, 'Maria Helena', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2990, 'Marialva', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2991, 'Marilândia do Sul', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2992, 'Marilena', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2993, 'Mariluz', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2994, 'Maringá', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2995, 'Mariópolis', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2996, 'Maripá', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2997, 'Marmeleiro', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2998, 'Marquinho', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (2999, 'Marumbi', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3000, 'Matelândia', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3001, 'Matinhos', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3002, 'Mato Rico', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3003, 'Mauá da Serra', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3004, 'Medianeira', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3005, 'Mercedes', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3006, 'Mirador', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3007, 'Miraselva', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3008, 'Missal', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3009, 'Moreira Sales', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3010, 'Morretes', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3011, 'Munhoz de Melo', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3012, 'Nossa Senhora das Graças', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3013, 'Nova Aliança do Ivaí', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3014, 'Nova América da Colina', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3015, 'Nova Aurora', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3016, 'Nova Cantu', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3017, 'Nova Esperança', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3018, 'Nova Esperança do Sudoeste', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3019, 'Nova Fátima', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3020, 'Nova Laranjeiras', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3021, 'Nova Londrina', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3022, 'Nova Olímpia', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3023, 'Nova Prata do Iguaçu', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3024, 'Nova Santa Bárbara', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3025, 'Nova Santa Rosa', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3026, 'Nova Tebas', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3027, 'Novo Itacolomi', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3028, 'Ortigueira', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3029, 'Ourizona', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3030, 'Ouro Verde do Oeste', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3031, 'Paiçandu', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3032, 'Palmas', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3033, 'Palmeira', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3034, 'Palmital', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3035, 'Palotina', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3036, 'Paraíso do Norte', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3037, 'Paranacity', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3038, 'Paranaguá', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3039, 'Paranapoema', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3040, 'Paranavaí', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3041, 'Pato Bragado', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3042, 'Pato Branco', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3043, 'Paula Freitas', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3044, 'Paulo Frontin', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3045, 'Peabiru', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3046, 'Perobal', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3047, 'Pérola', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3048, 'Pérola dOeste', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3049, 'Piên', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3050, 'Pinhais', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3051, 'Pinhal de São Bento', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3052, 'Pinhalão', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3053, 'Pinhão', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3054, 'Piraí do Sul', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3055, 'Piraquara', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3056, 'Pitanga', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3057, 'Pitangueiras', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3058, 'Planaltina do Paraná', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3059, 'Planalto', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3060, 'Ponta Grossa', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3061, 'Pontal do Paraná', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3062, 'Porecatu', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3063, 'Porto Amazonas', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3064, 'Porto Barreiro', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3065, 'Porto Rico', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3066, 'Porto Vitória', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3067, 'Prado Ferreira', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3068, 'Pranchita', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3069, 'Presidente Castelo Branco', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3070, 'Primeiro de Maio', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3071, 'Prudentópolis', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3072, 'Quarto Centenário', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3073, 'Quatiguá', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3074, 'Quatro Barras', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3075, 'Quatro Pontes', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3076, 'Quedas do Iguaçu', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3077, 'Querência do Norte', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3078, 'Quinta do Sol', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3079, 'Quitandinha', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3080, 'Ramilândia', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3081, 'Rancho Alegre', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3082, 'Rancho Alegre dOeste', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3083, 'Realeza', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3084, 'Rebouças', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3085, 'Renascença', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3086, 'Reserva', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3087, 'Reserva do Iguaçu', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3088, 'Ribeirão Claro', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3089, 'Ribeirão do Pinhal', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3090, 'Rio Azul', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3091, 'Rio Bom', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3092, 'Rio Bonito do Iguaçu', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3093, 'Rio Branco do Ivaí', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3094, 'Rio Branco do Sul', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3095, 'Rio Negro', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3096, 'Rolândia', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3097, 'Roncador', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3098, 'Rondon', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3099, 'Rosário do Ivaí', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3100, 'Sabáudia', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3101, 'Salgado Filho', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3102, 'Salto do Itararé', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3103, 'Salto do Lontra', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3104, 'Santa Amélia', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3105, 'Santa Cecília do Pavão', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3106, 'Santa Cruz de Monte Castelo', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3107, 'Santa Fé', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3108, 'Santa Helena', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3109, 'Santa Inês', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3110, 'Santa Isabel do Ivaí', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3111, 'Santa Izabel do Oeste', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3112, 'Santa Lúcia', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3113, 'Santa Maria do Oeste', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3114, 'Santa Mariana', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3115, 'Santa Mônica', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3116, 'Santa Tereza do Oeste', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3117, 'Santa Terezinha de Itaipu', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3118, 'Santana do Itararé', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3119, 'Santo Antônio da Platina', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3120, 'Santo Antônio do Caiuá', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3121, 'Santo Antônio do Paraíso', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3122, 'Santo Antônio do Sudoeste', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3123, 'Santo Inácio', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3124, 'São Carlos do Ivaí', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3125, 'São Jerônimo da Serra', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3126, 'São João', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3127, 'São João do Caiuá', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3128, 'São João do Ivaí', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3129, 'São João do Triunfo', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3130, 'São Jorge dOeste', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3131, 'São Jorge do Ivaí', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3132, 'São Jorge do Patrocínio', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3133, 'São José da Boa Vista', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3134, 'São José das Palmeiras', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3135, 'São José dos Pinhais', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3136, 'São Manoel do Paraná', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3137, 'São Mateus do Sul', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3138, 'São Miguel do Iguaçu', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3139, 'São Pedro do Iguaçu', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3140, 'São Pedro do Ivaí', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3141, 'São Pedro do Paraná', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3142, 'São Sebastião da Amoreira', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3143, 'São Tomé', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3144, 'Sapopema', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3145, 'Sarandi', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3146, 'Saudade do Iguaçu', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3147, 'Sengés', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3148, 'Serranópolis do Iguaçu', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3149, 'Sertaneja', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3150, 'Sertanópolis', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3151, 'Siqueira Campos', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3152, 'Sulina', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3153, 'Tamarana', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3154, 'Tamboara', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3155, 'Tapejara', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3156, 'Tapira', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3157, 'Teixeira Soares', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3158, 'Telêmaco Borba', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3159, 'Terra Boa', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3160, 'Terra Rica', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3161, 'Terra Roxa', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3162, 'Tibagi', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3163, 'Tijucas do Sul', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3164, 'Toledo', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3165, 'Tomazina', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3166, 'Três Barras do Paraná', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3167, 'Tunas do Paraná', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3168, 'Tuneiras do Oeste', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3169, 'Tupãssi', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3170, 'Turvo', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3171, 'Ubiratã', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3172, 'Umuarama', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3173, 'União da Vitória', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3174, 'Uniflor', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3175, 'Uraí', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3176, 'Ventania', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3177, 'Vera Cruz do Oeste', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3178, 'Verê', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3179, 'Virmond', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3180, 'Vitorino', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3181, 'Wenceslau Braz', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3182, 'Xambrê', 18);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3183, 'Abreu e Lima', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3184, 'Afogados da Ingazeira', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3185, 'Afrânio', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3186, 'Agrestina', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3187, 'Água Preta', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3188, 'Águas Belas', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3189, 'Alagoinha', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3190, 'Aliança', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3191, 'Altinho', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3192, 'Amaraji', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3193, 'Angelim', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3194, 'Araçoiaba', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3195, 'Araripina', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3196, 'Arcoverde', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3197, 'Barra de Guabiraba', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3198, 'Barreiros', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3199, 'Belém de Maria', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3200, 'Belém de São Francisco', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3201, 'Belo Jardim', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3202, 'Betânia', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3203, 'Bezerros', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3204, 'Bodocó', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3205, 'Bom Conselho', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3206, 'Bom Jardim', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3207, 'Bonito', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3208, 'Brejão', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3209, 'Brejinho', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3210, 'Brejo da Madre de Deus', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3211, 'Buenos Aires', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3212, 'Buíque', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3213, 'Cabo de Santo Agostinho', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3214, 'Cabrobó', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3215, 'Cachoeirinha', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3216, 'Caetés', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3217, 'Calçado', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3218, 'Calumbi', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3219, 'Camaragibe', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3220, 'Camocim de São Félix', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3221, 'Camutanga', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3222, 'Canhotinho', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3223, 'Capoeiras', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3224, 'Carnaíba', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3225, 'Carnaubeira da Penha', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3226, 'Carpina', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3227, 'Caruaru', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3228, 'Casinhas', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3229, 'Catende', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3230, 'Cedro', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3231, 'Chã de Alegria', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3232, 'Chã Grande', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3233, 'Condado', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3234, 'Correntes', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3235, 'Cortês', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3236, 'Cumaru', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3237, 'Cupira', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3238, 'Custódia', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3239, 'Dormentes', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3240, 'Escada', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3241, 'Exu', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3242, 'Feira Nova', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3243, 'Fernando de Noronha', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3244, 'Ferreiros', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3245, 'Flores', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3246, 'Floresta', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3247, 'Frei Miguelinho', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3248, 'Gameleira', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3249, 'Garanhuns', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3250, 'Glória do Goitá', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3251, 'Goiana', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3252, 'Granito', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3253, 'Gravatá', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3254, 'Iati', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3255, 'Ibimirim', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3256, 'Ibirajuba', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3257, 'Igarassu', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3258, 'Iguaraci', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3259, 'Ilha de Itamaracá', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3260, 'Inajá', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3261, 'Ingazeira', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3262, 'Ipojuca', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3263, 'Ipubi', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3264, 'Itacuruba', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3265, 'Itaíba', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3266, 'Itambé', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3267, 'Itapetim', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3268, 'Itapissuma', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3269, 'Itaquitinga', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3270, 'Jaboatão dos Guararapes', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3271, 'Jaqueira', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3272, 'Jataúba', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3273, 'Jatobá', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3274, 'João Alfredo', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3275, 'Joaquim Nabuco', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3276, 'Jucati', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3277, 'Jupi', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3278, 'Jurema', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3279, 'Lagoa do Carro', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3280, 'Lagoa do Itaenga', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3281, 'Lagoa do Ouro', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3282, 'Lagoa dos Gatos', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3283, 'Lagoa Grande', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3284, 'Lajedo', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3285, 'Limoeiro', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3286, 'Macaparana', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3287, 'Machados', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3288, 'Manari', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3289, 'Maraial', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3290, 'Mirandiba', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3291, 'Moreilândia', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3292, 'Moreno', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3293, 'Nazaré da Mata', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3294, 'Olinda', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3295, 'Orobó', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3296, 'Orocó', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3297, 'Ouricuri', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3298, 'Palmares', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3299, 'Palmeirina', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3300, 'Panelas', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3301, 'Paranatama', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3302, 'Parnamirim', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3303, 'Passira', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3304, 'Paudalho', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3305, 'Paulista', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3306, 'Pedra', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3307, 'Pesqueira', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3308, 'Petrolândia', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3309, 'Petrolina', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3310, 'Poção', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3311, 'Pombos', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3312, 'Primavera', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3313, 'Quipapá', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3314, 'Quixaba', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3315, 'Recife', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3316, 'Riacho das Almas', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3317, 'Ribeirão', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3318, 'Rio Formoso', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3319, 'Sairé', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3320, 'Salgadinho', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3321, 'Salgueiro', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3322, 'Saloá', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3323, 'Sanharó', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3324, 'Santa Cruz', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3325, 'Santa Cruz da Baixa Verde', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3326, 'Santa Cruz do Capibaribe', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3327, 'Santa Filomena', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3328, 'Santa Maria da Boa Vista', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3329, 'Santa Maria do Cambucá', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3330, 'Santa Terezinha', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3331, 'São Benedito do Sul', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3332, 'São Bento do Una', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3333, 'São Caitano', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3334, 'São João', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3335, 'São Joaquim do Monte', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3336, 'São José da Coroa Grande', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3337, 'São José do Belmonte', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3338, 'São José do Egito', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3339, 'São Lourenço da Mata', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3340, 'São Vicente Ferrer', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3341, 'Serra Talhada', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3342, 'Serrita', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3343, 'Sertânia', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3344, 'Sirinhaém', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3345, 'Solidão', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3346, 'Surubim', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3347, 'Tabira', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3348, 'Tacaimbó', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3349, 'Tacaratu', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3350, 'Tamandaré', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3351, 'Taquaritinga do Norte', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3352, 'Terezinha', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3353, 'Terra Nova', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3354, 'Timbaúba', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3355, 'Toritama', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3356, 'Tracunhaém', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3357, 'Trindade', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3358, 'Triunfo', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3359, 'Tupanatinga', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3360, 'Tuparetama', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3361, 'Venturosa', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3362, 'Verdejante', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3363, 'Vertente do Lério', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3364, 'Vertentes', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3365, 'Vicência', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3366, 'Vitória de Santo Antão', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3367, 'Xexéu', 16);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3368, 'Acauã', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3369, 'Agricolândia', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3370, 'Água Branca', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3371, 'Alagoinha do Piauí', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3372, 'Alegrete do Piauí', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3373, 'Alto Longá', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3374, 'Altos', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3375, 'Alvorada do Gurguéia', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3376, 'Amarante', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3377, 'Angical do Piauí', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3378, 'Anísio de Abreu', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3379, 'Antônio Almeida', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3380, 'Aroazes', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3381, 'Aroeiras do Itaim', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3382, 'Arraial', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3383, 'Assunção do Piauí', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3384, 'Avelino Lopes', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3385, 'Baixa Grande do Ribeiro', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3386, 'Barra dAlcântara', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3387, 'Barras', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3388, 'Barreiras do Piauí', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3389, 'Barro Duro', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3390, 'Batalha', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3391, 'Bela Vista do Piauí', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3392, 'Belém do Piauí', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3393, 'Beneditinos', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3394, 'Bertolínia', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3395, 'Betânia do Piauí', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3396, 'Boa Hora', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3397, 'Bocaina', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3398, 'Bom Jesus', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3399, 'Bom Princípio do Piauí', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3400, 'Bonfim do Piauí', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3401, 'Boqueirão do Piauí', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3402, 'Brasileira', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3403, 'Brejo do Piauí', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3404, 'Buriti dos Lopes', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3405, 'Buriti dos Montes', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3406, 'Cabeceiras do Piauí', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3407, 'Cajazeiras do Piauí', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3408, 'Cajueiro da Praia', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3409, 'Caldeirão Grande do Piauí', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3410, 'Campinas do Piauí', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3411, 'Campo Alegre do Fidalgo', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3412, 'Campo Grande do Piauí', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3413, 'Campo Largo do Piauí', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3414, 'Campo Maior', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3415, 'Canavieira', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3416, 'Canto do Buriti', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3417, 'Capitão de Campos', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3418, 'Capitão Gervásio Oliveira', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3419, 'Caracol', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3420, 'Caraúbas do Piauí', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3421, 'Caridade do Piauí', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3422, 'Castelo do Piauí', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3423, 'Caxingó', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3424, 'Cocal', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3425, 'Cocal de Telha', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3426, 'Cocal dos Alves', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3427, 'Coivaras', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3428, 'Colônia do Gurguéia', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3429, 'Colônia do Piauí', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3430, 'Conceição do Canindé', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3431, 'Coronel José Dias', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3432, 'Corrente', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3433, 'Cristalândia do Piauí', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3434, 'Cristino Castro', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3435, 'Curimatá', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3436, 'Currais', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3437, 'Curral Novo do Piauí', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3438, 'Curralinhos', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3439, 'Demerval Lobão', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3440, 'Dirceu Arcoverde', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3441, 'Dom Expedito Lopes', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3442, 'Dom Inocêncio', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3443, 'Domingos Mourão', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3444, 'Elesbão Veloso', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3445, 'Eliseu Martins', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3446, 'Esperantina', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3447, 'Fartura do Piauí', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3448, 'Flores do Piauí', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3449, 'Floresta do Piauí', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3450, 'Floriano', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3451, 'Francinópolis', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3452, 'Francisco Ayres', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3453, 'Francisco Macedo', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3454, 'Francisco Santos', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3455, 'Fronteiras', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3456, 'Geminiano', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3457, 'Gilbués', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3458, 'Guadalupe', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3459, 'Guaribas', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3460, 'Hugo Napoleão', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3461, 'Ilha Grande', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3462, 'Inhuma', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3463, 'Ipiranga do Piauí', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3464, 'Isaías Coelho', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3465, 'Itainópolis', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3466, 'Itaueira', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3467, 'Jacobina do Piauí', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3468, 'Jaicós', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3469, 'Jardim do Mulato', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3470, 'Jatobá do Piauí', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3471, 'Jerumenha', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3472, 'João Costa', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3473, 'Joaquim Pires', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3474, 'Joca Marques', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3475, 'José de Freitas', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3476, 'Juazeiro do Piauí', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3477, 'Júlio Borges', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3478, 'Jurema', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3479, 'Lagoa Alegre', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3480, 'Lagoa de São Francisco', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3481, 'Lagoa do Barro do Piauí', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3482, 'Lagoa do Piauí', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3483, 'Lagoa do Sítio', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3484, 'Lagoinha do Piauí', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3485, 'Landri Sales', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3486, 'Luís Correia', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3487, 'Luzilândia', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3488, 'Madeiro', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3489, 'Manoel Emídio', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3490, 'Marcolândia', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3491, 'Marcos Parente', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3492, 'Massapê do Piauí', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3493, 'Matias Olímpio', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3494, 'Miguel Alves', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3495, 'Miguel Leão', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3496, 'Milton Brandão', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3497, 'Monsenhor Gil', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3498, 'Monsenhor Hipólito', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3499, 'Monte Alegre do Piauí', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3500, 'Morro Cabeça no Tempo', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3501, 'Morro do Chapéu do Piauí', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3502, 'Murici dos Portelas', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3503, 'Nazaré do Piauí', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3504, 'Nossa Senhora de Nazaré', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3505, 'Nossa Senhora dos Remédios', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3506, 'Nova Santa Rita', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3507, 'Novo Oriente do Piauí', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3508, 'Novo Santo Antônio', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3509, 'Oeiras', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3510, 'Olho dÁgua do Piauí', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3511, 'Padre Marcos', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3512, 'Paes Landim', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3513, 'Pajeú do Piauí', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3514, 'Palmeira do Piauí', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3515, 'Palmeirais', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3516, 'Paquetá', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3517, 'Parnaguá', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3518, 'Parnaíba', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3519, 'Passagem Franca do Piauí', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3520, 'Patos do Piauí', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3521, 'Pau dArco do Piauí', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3522, 'Paulistana', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3523, 'Pavussu', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3524, 'Pedro II', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3525, 'Pedro Laurentino', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3526, 'Picos', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3527, 'Pimenteiras', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3528, 'Pio IX', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3529, 'Piracuruca', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3530, 'Piripiri', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3531, 'Porto', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3532, 'Porto Alegre do Piauí', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3533, 'Prata do Piauí', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3534, 'Queimada Nova', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3535, 'Redenção do Gurguéia', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3536, 'Regeneração', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3537, 'Riacho Frio', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3538, 'Ribeira do Piauí', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3539, 'Ribeiro Gonçalves', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3540, 'Rio Grande do Piauí', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3541, 'Santa Cruz do Piauí', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3542, 'Santa Cruz dos Milagres', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3543, 'Santa Filomena', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3544, 'Santa Luz', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3545, 'Santa Rosa do Piauí', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3546, 'Santana do Piauí', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3547, 'Santo Antônio de Lisboa', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3548, 'Santo Antônio dos Milagres', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3549, 'Santo Inácio do Piauí', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3550, 'São Braz do Piauí', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3551, 'São Félix do Piauí', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3552, 'São Francisco de Assis do Piauí', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3553, 'São Francisco do Piauí', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3554, 'São Gonçalo do Gurguéia', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3555, 'São Gonçalo do Piauí', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3556, 'São João da Canabrava', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3557, 'São João da Fronteira', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3558, 'São João da Serra', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3559, 'São João da Varjota', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3560, 'São João do Arraial', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3561, 'São João do Piauí', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3562, 'São José do Divino', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3563, 'São José do Peixe', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3564, 'São José do Piauí', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3565, 'São Julião', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3566, 'São Lourenço do Piauí', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3567, 'São Luis do Piauí', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3568, 'São Miguel da Baixa Grande', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3569, 'São Miguel do Fidalgo', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3570, 'São Miguel do Tapuio', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3571, 'São Pedro do Piauí', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3572, 'São Raimundo Nonato', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3573, 'Sebastião Barros', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3574, 'Sebastião Leal', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3575, 'Sigefredo Pacheco', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3576, 'Simões', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3577, 'Simplício Mendes', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3578, 'Socorro do Piauí', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3579, 'Sussuapara', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3580, 'Tamboril do Piauí', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3581, 'Tanque do Piauí', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3582, 'Teresina', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3583, 'União', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3584, 'Uruçuí', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3585, 'Valença do Piauí', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3586, 'Várzea Branca', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3587, 'Várzea Grande', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3588, 'Vera Mendes', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3589, 'Vila Nova do Piauí', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3590, 'Wall Ferraz', 17);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3591, 'Angra dos Reis', 19);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3592, 'Aperibé', 19);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3593, 'Araruama', 19);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3594, 'Areal', 19);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3595, 'Armação dos Búzios', 19);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3596, 'Arraial do Cabo', 19);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3597, 'Barra do Piraí', 19);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3598, 'Barra Mansa', 19);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3599, 'Belford Roxo', 19);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3600, 'Bom Jardim', 19);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3601, 'Bom Jesus do Itabapoana', 19);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3602, 'Cabo Frio', 19);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3603, 'Cachoeiras de Macacu', 19);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3604, 'Cambuci', 19);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3605, 'Campos dos Goytacazes', 19);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3606, 'Cantagalo', 19);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3607, 'Carapebus', 19);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3608, 'Cardoso Moreira', 19);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3609, 'Carmo', 19);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3610, 'Casimiro de Abreu', 19);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3611, 'Comendador Levy Gasparian', 19);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3612, 'Conceição de Macabu', 19);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3613, 'Cordeiro', 19);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3614, 'Duas Barras', 19);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3615, 'Duque de Caxias', 19);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3616, 'Engenheiro Paulo de Frontin', 19);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3617, 'Guapimirim', 19);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3618, 'Iguaba Grande', 19);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3619, 'Itaboraí', 19);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3620, 'Itaguaí', 19);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3621, 'Italva', 19);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3622, 'Itaocara', 19);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3623, 'Itaperuna', 19);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3624, 'Itatiaia', 19);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3625, 'Japeri', 19);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3626, 'Laje do Muriaé', 19);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3627, 'Macaé', 19);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3628, 'Macuco', 19);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3629, 'Magé', 19);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3630, 'Mangaratiba', 19);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3631, 'Maricá', 19);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3632, 'Mendes', 19);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3633, 'Mesquita', 19);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3634, 'Miguel Pereira', 19);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3635, 'Miracema', 19);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3636, 'Natividade', 19);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3637, 'Nilópolis', 19);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3638, 'Niterói', 19);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3639, 'Nova Friburgo', 19);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3640, 'Nova Iguaçu', 19);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3641, 'Paracambi', 19);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3642, 'Paraíba do Sul', 19);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3643, 'Parati', 19);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3644, 'Paty do Alferes', 19);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3645, 'Petrópolis', 19);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3646, 'Pinheiral', 19);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3647, 'Piraí', 19);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3648, 'Porciúncula', 19);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3649, 'Porto Real', 19);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3650, 'Quatis', 19);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3651, 'Queimados', 19);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3652, 'Quissamã', 19);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3653, 'Resende', 19);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3654, 'Rio Bonito', 19);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3655, 'Rio Claro', 19);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3656, 'Rio das Flores', 19);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3657, 'Rio das Ostras', 19);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3658, 'Rio de Janeiro', 19);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3659, 'Santa Maria Madalena', 19);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3660, 'Santo Antônio de Pádua', 19);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3661, 'São Fidélis', 19);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3662, 'São Francisco de Itabapoana', 19);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3663, 'São Gonçalo', 19);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3664, 'São João da Barra', 19);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3665, 'São João de Meriti', 19);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3666, 'São José de Ubá', 19);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3667, 'São José do Vale do Rio Pret', 19);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3668, 'São Pedro da Aldeia', 19);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3669, 'São Sebastião do Alto', 19);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3670, 'Sapucaia', 19);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3671, 'Saquarema', 19);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3672, 'Seropédica', 19);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3673, 'Silva Jardim', 19);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3674, 'Sumidouro', 19);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3675, 'Tanguá', 19);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3676, 'Teresópolis', 19);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3677, 'Trajano de Morais', 19);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3678, 'Três Rios', 19);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3679, 'Valença', 19);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3680, 'Varre-Sai', 19);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3681, 'Vassouras', 19);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3682, 'Volta Redonda', 19);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3683, 'Acari', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3684, 'Açu', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3685, 'Afonso Bezerra', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3686, 'Água Nova', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3687, 'Alexandria', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3688, 'Almino Afonso', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3689, 'Alto do Rodrigues', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3690, 'Angicos', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3691, 'Antônio Martins', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3692, 'Apodi', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3693, 'Areia Branca', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3694, 'Arês', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3695, 'Augusto Severo', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3696, 'Baía Formosa', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3697, 'Baraúna', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3698, 'Barcelona', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3699, 'Bento Fernandes', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3700, 'Bodó', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3701, 'Bom Jesus', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3702, 'Brejinho', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3703, 'Caiçara do Norte', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3704, 'Caiçara do Rio do Vento', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3705, 'Caicó', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3706, 'Campo Redondo', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3707, 'Canguaretama', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3708, 'Caraúbas', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3709, 'Carnaúba dos Dantas', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3710, 'Carnaubais', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3711, 'Ceará-Mirim', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3712, 'Cerro Corá', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3713, 'Coronel Ezequiel', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3714, 'Coronel João Pessoa', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3715, 'Cruzeta', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3716, 'Currais Novos', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3717, 'Doutor Severiano', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3718, 'Encanto', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3719, 'Equador', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3720, 'Espírito Santo', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3721, 'Extremoz', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3722, 'Felipe Guerra', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3723, 'Fernando Pedroza', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3724, 'Florânia', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3725, 'Francisco Dantas', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3726, 'Frutuoso Gomes', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3727, 'Galinhos', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3728, 'Goianinha', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3729, 'Governador Dix-Sept Rosado', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3730, 'Grossos', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3731, 'Guamaré', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3732, 'Ielmo Marinho', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3733, 'Ipanguaçu', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3734, 'Ipueira', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3735, 'Itajá', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3736, 'Itaú', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3737, 'Jaçanã', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3738, 'Jandaíra', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3739, 'Janduís', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3740, 'Januário Cicco', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3741, 'Japi', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3742, 'Jardim de Angicos', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3743, 'Jardim de Piranhas', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3744, 'Jardim do Seridó', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3745, 'João Câmara', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3746, 'João Dias', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3747, 'José da Penha', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3748, 'Jucurutu', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3749, 'Jundiá', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3750, 'Lagoa dAnta', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3751, 'Lagoa de Pedras', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3752, 'Lagoa de Velhos', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3753, 'Lagoa Nova', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3754, 'Lagoa Salgada', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3755, 'Lajes', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3756, 'Lajes Pintadas', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3757, 'Lucrécia', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3758, 'Luís Gomes', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3759, 'Macaíba', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3760, 'Macau', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3761, 'Major Sales', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3762, 'Marcelino Vieira', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3763, 'Martins', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3764, 'Maxaranguape', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3765, 'Messias Targino', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3766, 'Montanhas', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3767, 'Monte Alegre', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3768, 'Monte das Gameleiras', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3769, 'Mossoró', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3770, 'Natal', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3771, 'Nísia Floresta', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3772, 'Nova Cruz', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3773, 'Olho-dÁgua do Borges', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3774, 'Ouro Branco', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3775, 'Paraná', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3776, 'Paraú', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3777, 'Parazinho', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3778, 'Parelhas', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3779, 'Parnamirim', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3780, 'Passa e Fica', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3781, 'Passagem', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3782, 'Patu', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3783, 'Pau dos Ferros', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3784, 'Pedra Grande', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3785, 'Pedra Preta', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3786, 'Pedro Avelino', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3787, 'Pedro Velho', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3788, 'Pendências', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3789, 'Pilões', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3790, 'Poço Branco', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3791, 'Portalegre', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3792, 'Porto do Mangue', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3793, 'Presidente Juscelino', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3794, 'Pureza', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3795, 'Rafael Fernandes', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3796, 'Rafael Godeiro', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3797, 'Riacho da Cruz', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3798, 'Riacho de Santana', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3799, 'Riachuelo', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3800, 'Rio do Fogo', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3801, 'Rodolfo Fernandes', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3802, 'Ruy Barbosa', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3803, 'Santa Cruz', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3804, 'Santa Maria', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3805, 'Santana do Matos', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3806, 'Santana do Seridó', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3807, 'Santo Antônio', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3808, 'São Bento do Norte', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3809, 'São Bento do Trairí', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3810, 'São Fernando', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3811, 'São Francisco do Oeste', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3812, 'São Gonçalo do Amarante', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3813, 'São João do Sabugi', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3814, 'São José de Mipibu', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3815, 'São José do Campestre', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3816, 'São José do Seridó', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3817, 'São Miguel', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3818, 'São Miguel do Gostoso', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3819, 'São Paulo do Potengi', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3820, 'São Pedro', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3821, 'São Rafael', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3822, 'São Tomé', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3823, 'São Vicente', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3824, 'Senador Elói de Souza', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3825, 'Senador Georgino Avelino', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3826, 'Serra de São Bento', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3827, 'Serra do Mel', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3828, 'Serra Negra do Norte', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3829, 'Serrinha', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3830, 'Serrinha dos Pintos', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3831, 'Severiano Melo', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3832, 'Sítio Novo', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3833, 'Taboleiro Grande', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3834, 'Taipu', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3835, 'Tangará', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3836, 'Tenente Ananias', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3837, 'Tenente Laurentino Cruz', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3838, 'Tibau', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3839, 'Tibau do Sul', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3840, 'Timbaúba dos Batistas', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3841, 'Touros', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3842, 'Triunfo Potiguar', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3843, 'Umarizal', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3844, 'Upanema', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3845, 'Várzea', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3846, 'Venha-Ver', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3847, 'Vera Cruz', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3848, 'Viçosa', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3849, 'Vila Flor', 20);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3850, 'Aceguá', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3851, 'Água Santa', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3852, 'Agudo', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3853, 'Ajuricaba', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3854, 'Alecrim', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3855, 'Alegrete', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3856, 'Alegria', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3857, 'Almirante Tamandaré do Sul', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3858, 'Alpestre', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3859, 'Alto Alegre', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3860, 'Alto Feliz', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3861, 'Alvorada', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3862, 'Amaral Ferrador', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3863, 'Ametista do Sul', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3864, 'André da Rocha', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3865, 'Anta Gorda', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3866, 'Antônio Prado', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3867, 'Arambaré', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3868, 'Araricá', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3869, 'Aratiba', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3870, 'Arroio do Meio', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3871, 'Arroio do Padre', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3872, 'Arroio do Sal', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3873, 'Arroio do Tigre', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3874, 'Arroio dos Ratos', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3875, 'Arroio Grande', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3876, 'Arvorezinha', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3877, 'Augusto Pestana', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3878, 'Áurea', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3879, 'Bagé', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3880, 'Balneário Pinhal', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3881, 'Barão', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3882, 'Barão de Cotegipe', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3883, 'Barão do Triunfo', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3884, 'Barra do Guarita', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3885, 'Barra do Quaraí', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3886, 'Barra do Ribeiro', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3887, 'Barra do Rio Azul', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3888, 'Barra Funda', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3889, 'Barracão', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3890, 'Barros Cassal', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3891, 'Benjamin Constant do Sul', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3892, 'Bento Gonçalves', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3893, 'Boa Vista das Missões', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3894, 'Boa Vista do Buricá', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3895, 'Boa Vista do Cadeado', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3896, 'Boa Vista do Incra', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3897, 'Boa Vista do Sul', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3898, 'Bom Jesus', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3899, 'Bom Princípio', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3900, 'Bom Progresso', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3901, 'Bom Retiro do Sul', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3902, 'Boqueirão do Leão', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3903, 'Bossoroca', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3904, 'Bozano', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3905, 'Braga', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3906, 'Brochier', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3907, 'Butiá', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3908, 'Caçapava do Sul', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3909, 'Cacequi', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3910, 'Cachoeira do Sul', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3911, 'Cachoeirinha', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3912, 'Cacique Doble', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3913, 'Caibaté', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3914, 'Caiçara', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3915, 'Camaquã', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3916, 'Camargo', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3917, 'Cambará do Sul', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3918, 'Campestre da Serra', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3919, 'Campina das Missões', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3920, 'Campinas do Sul', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3921, 'Campo Bom', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3922, 'Campo Novo', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3923, 'Campos Borges', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3924, 'Candelária', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3925, 'Cândido Godói', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3926, 'Candiota', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3927, 'Canela', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3928, 'Canguçu', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3929, 'Canoas', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3930, 'Canudos do Vale', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3931, 'Capão Bonito do Sul', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3932, 'Capão da Canoa', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3933, 'Capão do Cipó', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3934, 'Capão do Leão', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3935, 'Capela de Santana', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3936, 'Capitão', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3937, 'Capivari do Sul', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3938, 'Caraá', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3939, 'Carazinho', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3940, 'Carlos Barbosa', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3941, 'Carlos Gomes', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3942, 'Casca', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3943, 'Caseiros', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3944, 'Catuípe', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3945, 'Caxias do Sul', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3946, 'Centenário', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3947, 'Cerrito', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3948, 'Cerro Branco', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3949, 'Cerro Grande', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3950, 'Cerro Grande do Sul', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3951, 'Cerro Largo', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3952, 'Chapada', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3953, 'Charqueadas', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3954, 'Charrua', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3955, 'Chiapeta', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3956, 'Chuí', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3957, 'Chuvisca', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3958, 'Cidreira', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3959, 'Ciríaco', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3960, 'Colinas', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3961, 'Colorado', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3962, 'Condor', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3963, 'Constantina', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3964, 'Coqueiro Baixo', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3965, 'Coqueiros do Sul', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3966, 'Coronel Barros', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3967, 'Coronel Bicaco', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3968, 'Coronel Pilar', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3969, 'Cotiporã', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3970, 'Coxilha', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3971, 'Crissiumal', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3972, 'Cristal', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3973, 'Cristal do Sul', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3974, 'Cruz Alta', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3975, 'Cruzaltense', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3976, 'Cruzeiro do Sul', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3977, 'David Canabarro', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3978, 'Derrubadas', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3979, 'Dezesseis de Novembro', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3980, 'Dilermando de Aguiar', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3981, 'Dois Irmãos', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3982, 'Dois Irmãos das Missões', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3983, 'Dois Lajeados', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3984, 'Dom Feliciano', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3985, 'Dom Pedrito', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3986, 'Dom Pedro de Alcântara', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3987, 'Dona Francisca', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3988, 'Doutor Maurício Cardoso', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3989, 'Doutor Ricardo', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3990, 'Eldorado do Sul', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3991, 'Encantado', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3992, 'Encruzilhada do Sul', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3993, 'Engenho Velho', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3994, 'Entre Rios do Sul', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3995, 'Entre-Ijuís', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3996, 'Erebango', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3997, 'Erechim', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3998, 'Ernestina', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (3999, 'Erval Grande', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4000, 'Erval Seco', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4001, 'Esmeralda', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4002, 'Esperança do Sul', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4003, 'Espumoso', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4004, 'Estação', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4005, 'Estância Velha', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4006, 'Esteio', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4007, 'Estrela', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4008, 'Estrela Velha', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4009, 'Eugênio de Castro', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4010, 'Fagundes Varela', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4011, 'Farroupilha', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4012, 'Faxinal do Soturno', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4013, 'Faxinalzinho', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4014, 'Fazenda Vilanova', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4015, 'Feliz', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4016, 'Flores da Cunha', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4017, 'Floriano Peixoto', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4018, 'Fontoura Xavier', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4019, 'Formigueiro', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4020, 'Forquetinha', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4021, 'Fortaleza dos Valos', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4022, 'Frederico Westphalen', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4023, 'Garibaldi', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4024, 'Garruchos', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4025, 'Gaurama', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4026, 'General Câmara', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4027, 'Gentil', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4028, 'Getúlio Vargas', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4029, 'Giruá', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4030, 'Glorinha', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4031, 'Gramado', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4032, 'Gramado dos Loureiros', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4033, 'Gramado Xavier', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4034, 'Gravataí', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4035, 'Guabiju', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4036, 'Guaíba', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4037, 'Guaporé', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4038, 'Guarani das Missões', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4039, 'Harmonia', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4040, 'Herval', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4041, 'Herveiras', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4042, 'Horizontina', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4043, 'Hulha Negra', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4044, 'Humaitá', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4045, 'Ibarama', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4046, 'Ibiaçá', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4047, 'Ibiraiaras', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4048, 'Ibirapuitã', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4049, 'Ibirubá', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4050, 'Igrejinha', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4051, 'Ijuí', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4052, 'Ilópolis', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4053, 'Imbé', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4054, 'Imigrante', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4055, 'Independência', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4056, 'Inhacorá', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4057, 'Ipê', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4058, 'Ipiranga do Sul', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4059, 'Iraí', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4060, 'Itaara', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4061, 'Itacurubi', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4062, 'Itapuca', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4063, 'Itaqui', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4064, 'Itati', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4065, 'Itatiba do Sul', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4066, 'Ivorá', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4067, 'Ivoti', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4068, 'Jaboticaba', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4069, 'Jacuizinho', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4070, 'Jacutinga', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4071, 'Jaguarão', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4072, 'Jaguari', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4073, 'Jaquirana', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4074, 'Jari', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4075, 'Jóia', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4076, 'Júlio de Castilhos', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4077, 'Lagoa Bonita do Sul', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4078, 'Lagoa dos Três Cantos', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4079, 'Lagoa Vermelha', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4080, 'Lagoão', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4081, 'Lajeado', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4082, 'Lajeado do Bugre', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4083, 'Lavras do Sul', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4084, 'Liberato Salzano', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4085, 'Lindolfo Collor', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4086, 'Linha Nova', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4087, 'Maçambara', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4088, 'Machadinho', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4089, 'Mampituba', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4090, 'Manoel Viana', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4091, 'Maquiné', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4092, 'Maratá', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4093, 'Marau', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4094, 'Marcelino Ramos', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4095, 'Mariana Pimentel', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4096, 'Mariano Moro', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4097, 'Marques de Souza', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4098, 'Mata', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4099, 'Mato Castelhano', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4100, 'Mato Leitão', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4101, 'Mato Queimado', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4102, 'Maximiliano de Almeida', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4103, 'Minas do Leão', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4104, 'Miraguaí', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4105, 'Montauri', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4106, 'Monte Alegre dos Campos', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4107, 'Monte Belo do Sul', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4108, 'Montenegro', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4109, 'Mormaço', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4110, 'Morrinhos do Sul', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4111, 'Morro Redondo', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4112, 'Morro Reuter', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4113, 'Mostardas', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4114, 'Muçum', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4115, 'Muitos Capões', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4116, 'Muliterno', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4117, 'Não-Me-Toque', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4118, 'Nicolau Vergueiro', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4119, 'Nonoai', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4120, 'Nova Alvorada', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4121, 'Nova Araçá', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4122, 'Nova Bassano', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4123, 'Nova Boa Vista', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4124, 'Nova Bréscia', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4125, 'Nova Candelária', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4126, 'Nova Esperança do Sul', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4127, 'Nova Hartz', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4128, 'Nova Pádua', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4129, 'Nova Palma', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4130, 'Nova Petrópolis', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4131, 'Nova Prata', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4132, 'Nova Ramada', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4133, 'Nova Roma do Sul', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4134, 'Nova Santa Rita', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4135, 'Novo Barreiro', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4136, 'Novo Cabrais', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4137, 'Novo Hamburgo', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4138, 'Novo Machado', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4139, 'Novo Tiradentes', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4140, 'Novo Xingu', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4141, 'Osório', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4142, 'Paim Filho', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4143, 'Palmares do Sul', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4144, 'Palmeira das Missões', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4145, 'Palmitinho', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4146, 'Panambi', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4147, 'Pantano Grande', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4148, 'Paraí', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4149, 'Paraíso do Sul', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4150, 'Pareci Novo', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4151, 'Parobé', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4152, 'Passa Sete', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4153, 'Passo do Sobrado', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4154, 'Passo Fundo', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4155, 'Paulo Bento', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4156, 'Paverama', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4157, 'Pedras Altas', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4158, 'Pedro Osório', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4159, 'Pejuçara', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4160, 'Pelotas', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4161, 'Picada Café', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4162, 'Pinhal', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4163, 'Pinhal da Serra', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4164, 'Pinhal Grande', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4165, 'Pinheirinho do Vale', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4166, 'Pinheiro Machado', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4167, 'Pirapó', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4168, 'Piratini', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4169, 'Planalto', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4170, 'Poço das Antas', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4171, 'Pontão', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4172, 'Ponte Preta', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4173, 'Portão', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4174, 'Porto Alegre', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4175, 'Porto Lucena', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4176, 'Porto Mauá', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4177, 'Porto Vera Cruz', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4178, 'Porto Xavier', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4179, 'Pouso Novo', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4180, 'Presidente Lucena', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4181, 'Progresso', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4182, 'Protásio Alves', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4183, 'Putinga', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4184, 'Quaraí', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4185, 'Quatro Irmãos', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4186, 'Quevedos', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4187, 'Quinze de Novembro', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4188, 'Redentora', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4189, 'Relvado', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4190, 'Restinga Seca', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4191, 'Rio dos Índios', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4192, 'Rio Grande', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4193, 'Rio Pardo', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4194, 'Riozinho', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4195, 'Roca Sales', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4196, 'Rodeio Bonito', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4197, 'Rolador', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4198, 'Rolante', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4199, 'Ronda Alta', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4200, 'Rondinha', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4201, 'Roque Gonzales', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4202, 'Rosário do Sul', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4203, 'Sagrada Família', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4204, 'Saldanha Marinho', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4205, 'Salto do Jacuí', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4206, 'Salvador das Missões', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4207, 'Salvador do Sul', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4208, 'Sananduva', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4209, 'Santa Bárbara do Sul', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4210, 'Santa Cecília do Sul', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4211, 'Santa Clara do Sul', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4212, 'Santa Cruz do Sul', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4213, 'Santa Margarida do Sul', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4214, 'Santa Maria', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4215, 'Santa Maria do Herval', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4216, 'Santa Rosa', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4217, 'Santa Tereza', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4218, 'Santa Vitória do Palmar', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4219, 'Santana da Boa Vista', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4220, 'Santana do Livramento', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4221, 'Santiago', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4222, 'Santo Ângelo', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4223, 'Santo Antônio da Patrulha', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4224, 'Santo Antônio das Missões', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4225, 'Santo Antônio do Palma', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4226, 'Santo Antônio do Planalto', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4227, 'Santo Augusto', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4228, 'Santo Cristo', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4229, 'Santo Expedito do Sul', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4230, 'São Borja', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4231, 'São Domingos do Sul', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4232, 'São Francisco de Assis', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4233, 'São Francisco de Paula', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4234, 'São Gabriel', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4235, 'São Jerônimo', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4236, 'São João da Urtiga', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4237, 'São João do Polêsine', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4238, 'São Jorge', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4239, 'São José das Missões', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4240, 'São José do Herval', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4241, 'São José do Hortêncio', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4242, 'São José do Inhacorá', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4243, 'São José do Norte', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4244, 'São José do Ouro', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4245, 'São José do Sul', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4246, 'São José dos Ausentes', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4247, 'São Leopoldo', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4248, 'São Lourenço do Sul', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4249, 'São Luiz Gonzaga', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4250, 'São Marcos', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4251, 'São Martinho', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4252, 'São Martinho da Serra', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4253, 'São Miguel das Missões', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4254, 'São Nicolau', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4255, 'São Paulo das Missões', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4256, 'São Pedro da Serra', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4257, 'São Pedro das Missões', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4258, 'São Pedro do Butiá', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4259, 'São Pedro do Sul', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4260, 'São Sebastião do Caí', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4261, 'São Sepé', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4262, 'São Valentim', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4263, 'São Valentim do Sul', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4264, 'São Valério do Sul', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4265, 'São Vendelino', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4266, 'São Vicente do Sul', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4267, 'Sapiranga', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4268, 'Sapucaia do Sul', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4269, 'Sarandi', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4270, 'Seberi', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4271, 'Sede Nova', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4272, 'Segredo', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4273, 'Selbach', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4274, 'Senador Salgado Filho', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4275, 'Sentinela do Sul', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4276, 'Serafina Corrêa', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4277, 'Sério', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4278, 'Sertão', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4279, 'Sertão Santana', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4280, 'Sete de Setembro', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4281, 'Severiano de Almeida', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4282, 'Silveira Martins', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4283, 'Sinimbu', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4284, 'Sobradinho', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4285, 'Soledade', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4286, 'Tabaí', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4287, 'Tapejara', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4288, 'Tapera', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4289, 'Tapes', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4290, 'Taquara', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4291, 'Taquari', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4292, 'Taquaruçu do Sul', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4293, 'Tavares', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4294, 'Tenente Portela', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4295, 'Terra de Areia', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4296, 'Teutônia', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4297, 'Tio Hugo', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4298, 'Tiradentes do Sul', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4299, 'Toropi', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4300, 'Torres', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4301, 'Tramandaí', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4302, 'Travesseiro', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4303, 'Três Arroios', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4304, 'Três Cachoeiras', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4305, 'Três Coroas', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4306, 'Três de Maio', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4307, 'Três Forquilhas', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4308, 'Três Palmeiras', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4309, 'Três Passos', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4310, 'Trindade do Sul', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4311, 'Triunfo', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4312, 'Tucunduva', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4313, 'Tunas', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4314, 'Tupanci do Sul', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4315, 'Tupanciretã', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4316, 'Tupandi', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4317, 'Tuparendi', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4318, 'Turuçu', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4319, 'Ubiretama', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4320, 'União da Serra', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4321, 'Unistalda', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4322, 'Uruguaiana', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4323, 'Vacaria', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4324, 'Vale do Sol', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4325, 'Vale Real', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4326, 'Vale Verde', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4327, 'Vanini', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4328, 'Venâncio Aires', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4329, 'Vera Cruz', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4330, 'Veranópolis', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4331, 'Vespasiano Correa', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4332, 'Viadutos', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4333, 'Viamão', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4334, 'Vicente Dutra', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4335, 'Victor Graeff', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4336, 'Vila Flores', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4337, 'Vila Lângaro', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4338, 'Vila Maria', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4339, 'Vila Nova do Sul', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4340, 'Vista Alegre', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4341, 'Vista Alegre do Prata', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4342, 'Vista Gaúcha', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4343, 'Vitória das Missões', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4344, 'Westfália', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4345, 'Xangri-lá', 23);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4346, 'Alta Floresta dOeste', 21);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4347, 'Alto Alegre dos Parecis', 21);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4348, 'Alto Paraíso', 21);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4349, 'Alvorada dOeste', 21);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4350, 'Ariquemes', 21);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4351, 'Buritis', 21);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4352, 'Cabixi', 21);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4353, 'Cacaulândia', 21);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4354, 'Cacoal', 21);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4355, 'Campo Novo de Rondônia', 21);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4356, 'Candeias do Jamari', 21);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4357, 'Castanheiras', 21);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4358, 'Cerejeiras', 21);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4359, 'Chupinguaia', 21);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4360, 'Colorado do Oeste', 21);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4361, 'Corumbiara', 21);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4362, 'Costa Marques', 21);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4363, 'Cujubim', 21);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4364, 'Espigão dOeste', 21);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4365, 'Governador Jorge Teixeira', 21);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4366, 'Guajará-Mirim', 21);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4367, 'Itapuã do Oeste', 21);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4368, 'Jaru', 21);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4369, 'Ji-Paraná', 21);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4370, 'Machadinho dOeste', 21);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4371, 'Ministro Andreazza', 21);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4372, 'Mirante da Serra', 21);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4373, 'Monte Negro', 21);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4374, 'Nova Brasilândia dOeste', 21);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4375, 'Nova Mamoré', 21);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4376, 'Nova União', 21);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4377, 'Novo Horizonte do Oeste', 21);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4378, 'Ouro Preto do Oeste', 21);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4379, 'Parecis', 21);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4380, 'Pimenta Bueno', 21);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4381, 'Pimenteiras do Oeste', 21);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4382, 'Porto Velho', 21);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4383, 'Presidente Médici', 21);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4384, 'Primavera de Rondônia', 21);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4385, 'Rio Crespo', 21);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4386, 'Rolim de Moura', 21);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4387, 'Santa Luzia dOeste', 21);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4388, 'São Felipe dOeste', 21);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4389, 'São Francisco do Guaporé', 21);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4390, 'São Miguel do Guaporé', 21);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4391, 'Seringueiras', 21);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4392, 'Teixeirópolis', 21);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4393, 'Theobroma', 21);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4394, 'Urupá', 21);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4395, 'Vale do Anari', 21);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4396, 'Vale do Paraíso', 21);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4397, 'Vilhena', 21);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4398, 'Alto Alegre', 22);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4399, 'Amajari', 22);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4400, 'Boa Vista', 22);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4401, 'Bonfim', 22);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4402, 'Cantá', 22);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4403, 'Caracaraí', 22);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4404, 'Caroebe', 22);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4405, 'Iracema', 22);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4406, 'Mucajaí', 22);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4407, 'Normandia', 22);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4408, 'Pacaraima', 22);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4409, 'Rorainópolis', 22);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4410, 'São João da Baliza', 22);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4411, 'São Luiz', 22);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4412, 'Uiramutã', 22);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4413, 'Abdon Batista', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4414, 'Abelardo Luz', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4415, 'Agrolândia', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4416, 'Agronômica', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4417, 'Água Doce', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4418, 'Águas de Chapecó', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4419, 'Águas Frias', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4420, 'Águas Mornas', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4421, 'Alfredo Wagner', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4422, 'Alto Bela Vista', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4423, 'Anchieta', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4424, 'Angelina', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4425, 'Anita Garibaldi', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4426, 'Anitápolis', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4427, 'Antônio Carlos', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4428, 'Apiúna', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4429, 'Arabutã', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4430, 'Araquari', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4431, 'Araranguá', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4432, 'Armazém', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4433, 'Arroio Trinta', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4434, 'Arvoredo', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4435, 'Ascurra', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4436, 'Atalanta', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4437, 'Aurora', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4438, 'Balneário Arroio do Silva', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4439, 'Balneário Barra do Sul', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4440, 'Balneário Camboriú', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4441, 'Balneário Gaivota', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4442, 'Bandeirante', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4443, 'Barra Bonita', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4444, 'Barra Velha', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4445, 'Bela Vista do Toldo', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4446, 'Belmonte', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4447, 'Benedito Novo', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4448, 'Biguaçu', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4449, 'Blumenau', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4450, 'Bocaina do Sul', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4451, 'Bom Jardim da Serra', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4452, 'Bom Jesus', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4453, 'Bom Jesus do Oeste', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4454, 'Bom Retiro', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4455, 'Bombinhas', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4456, 'Botuverá', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4457, 'Braço do Norte', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4458, 'Braço do Trombudo', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4459, 'Brunópolis', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4460, 'Brusque', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4461, 'Caçador', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4462, 'Caibi', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4463, 'Calmon', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4464, 'Camboriú', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4465, 'Campo Alegre', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4466, 'Campo Belo do Sul', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4467, 'Campo Erê', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4468, 'Campos Novos', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4469, 'Canelinha', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4470, 'Canoinhas', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4471, 'Capão Alto', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4472, 'Capinzal', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4473, 'Capivari de Baixo', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4474, 'Catanduvas', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4475, 'Caxambu do Sul', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4476, 'Celso Ramos', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4477, 'Cerro Negro', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4478, 'Chapadão do Lageado', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4479, 'Chapecó', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4480, 'Cocal do Sul', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4481, 'Concórdia', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4482, 'Cordilheira Alta', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4483, 'Coronel Freitas', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4484, 'Coronel Martins', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4485, 'Correia Pinto', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4486, 'Corupá', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4487, 'Criciúma', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4488, 'Cunha Porã', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4489, 'Cunhataí', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4490, 'Curitibanos', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4491, 'Descanso', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4492, 'Dionísio Cerqueira', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4493, 'Dona Emma', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4494, 'Doutor Pedrinho', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4495, 'Entre Rios', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4496, 'Ermo', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4497, 'Erval Velho', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4498, 'Faxinal dos Guedes', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4499, 'Flor do Sertão', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4500, 'Florianópolis', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4501, 'Formosa do Sul', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4502, 'Forquilhinha', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4503, 'Fraiburgo', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4504, 'Frei Rogério', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4505, 'Galvão', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4506, 'Garopaba', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4507, 'Garuva', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4508, 'Gaspar', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4509, 'Governador Celso Ramos', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4510, 'Grão Pará', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4511, 'Gravatal', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4512, 'Guabiruba', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4513, 'Guaraciaba', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4514, 'Guaramirim', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4515, 'Guarujá do Sul', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4516, 'Guatambú', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4517, 'Herval dOeste', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4518, 'Ibiam', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4519, 'Ibicaré', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4520, 'Ibirama', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4521, 'Içara', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4522, 'Ilhota', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4523, 'Imaruí', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4524, 'Imbituba', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4525, 'Imbuia', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4526, 'Indaial', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4527, 'Iomerê', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4528, 'Ipira', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4529, 'Iporã do Oeste', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4530, 'Ipuaçu', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4531, 'Ipumirim', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4532, 'Iraceminha', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4533, 'Irani', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4534, 'Irati', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4535, 'Irineópolis', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4536, 'Itá', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4537, 'Itaiópolis', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4538, 'Itajaí', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4539, 'Itapema', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4540, 'Itapiranga', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4541, 'Itapoá', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4542, 'Ituporanga', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4543, 'Jaborá', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4544, 'Jacinto Machado', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4545, 'Jaguaruna', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4546, 'Jaraguá do Sul', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4547, 'Jardinópolis', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4548, 'Joaçaba', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4549, 'Joinville', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4550, 'José Boiteux', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4551, 'Jupiá', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4552, 'Lacerdópolis', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4553, 'Lages', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4554, 'Laguna', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4555, 'Lajeado Grande', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4556, 'Laurentino', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4557, 'Lauro Muller', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4558, 'Lebon Régis', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4559, 'Leoberto Leal', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4560, 'Lindóia do Sul', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4561, 'Lontras', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4562, 'Luiz Alves', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4563, 'Luzerna', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4564, 'Macieira', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4565, 'Mafra', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4566, 'Major Gercino', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4567, 'Major Vieira', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4568, 'Maracajá', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4569, 'Maravilha', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4570, 'Marema', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4571, 'Massaranduba', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4572, 'Matos Costa', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4573, 'Meleiro', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4574, 'Mirim Doce', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4575, 'Modelo', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4576, 'Mondaí', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4577, 'Monte Carlo', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4578, 'Monte Castelo', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4579, 'Morro da Fumaça', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4580, 'Morro Grande', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4581, 'Navegantes', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4582, 'Nova Erechim', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4583, 'Nova Itaberaba', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4584, 'Nova Trento', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4585, 'Nova Veneza', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4586, 'Novo Horizonte', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4587, 'Orleans', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4588, 'Otacílio Costa', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4589, 'Ouro', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4590, 'Ouro Verde', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4591, 'Paial', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4592, 'Painel', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4593, 'Palhoça', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4594, 'Palma Sola', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4595, 'Palmeira', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4596, 'Palmitos', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4597, 'Papanduva', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4598, 'Paraíso', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4599, 'Passo de Torres', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4600, 'Passos Maia', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4601, 'Paulo Lopes', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4602, 'Pedras Grandes', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4603, 'Penha', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4604, 'Peritiba', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4605, 'Petrolândia', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4606, 'Piçarras', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4607, 'Pinhalzinho', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4608, 'Pinheiro Preto', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4609, 'Piratuba', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4610, 'Planalto Alegre', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4611, 'Pomerode', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4612, 'Ponte Alta', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4613, 'Ponte Alta do Norte', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4614, 'Ponte Serrada', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4615, 'Porto Belo', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4616, 'Porto União', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4617, 'Pouso Redondo', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4618, 'Praia Grande', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4619, 'Presidente Castelo Branco', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4620, 'Presidente Getúlio', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4621, 'Presidente Nereu', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4622, 'Princesa', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4623, 'Quilombo', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4624, 'Rancho Queimado', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4625, 'Rio das Antas', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4626, 'Rio do Campo', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4627, 'Rio do Oeste', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4628, 'Rio do Sul', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4629, 'Rio dos Cedros', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4630, 'Rio Fortuna', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4631, 'Rio Negrinho', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4632, 'Rio Rufino', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4633, 'Riqueza', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4634, 'Rodeio', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4635, 'Romelândia', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4636, 'Salete', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4637, 'Saltinho', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4638, 'Salto Veloso', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4639, 'Sangão', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4640, 'Santa Cecília', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4641, 'Santa Helena', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4642, 'Santa Rosa de Lima', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4643, 'Santa Rosa do Sul', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4644, 'Santa Terezinha', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4645, 'Santa Terezinha do Progresso', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4646, 'Santiago do Sul', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4647, 'Santo Amaro da Imperatriz', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4648, 'São Bento do Sul', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4649, 'São Bernardino', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4650, 'São Bonifácio', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4651, 'São Carlos', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4652, 'São Cristovão do Sul', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4653, 'São Domingos', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4654, 'São Francisco do Sul', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4655, 'São João Batista', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4656, 'São João do Itaperiú', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4657, 'São João do Oeste', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4658, 'São João do Sul', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4659, 'São Joaquim', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4660, 'São José', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4661, 'São José do Cedro', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4662, 'São José do Cerrito', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4663, 'São Lourenço do Oeste', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4664, 'São Ludgero', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4665, 'São Martinho', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4666, 'São Miguel da Boa Vista', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4667, 'São Miguel do Oeste', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4668, 'São Pedro de Alcântara', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4669, 'Saudades', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4670, 'Schroeder', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4671, 'Seara', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4672, 'Serra Alta', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4673, 'Siderópolis', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4674, 'Sombrio', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4675, 'Sul Brasil', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4676, 'Taió', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4677, 'Tangará', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4678, 'Tigrinhos', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4679, 'Tijucas', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4680, 'Timbé do Sul', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4681, 'Timbó', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4682, 'Timbó Grande', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4683, 'Três Barras', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4684, 'Treviso', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4685, 'Treze de Maio', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4686, 'Treze Tílias', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4687, 'Trombudo Central', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4688, 'Tubarão', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4689, 'Tunápolis', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4690, 'Turvo', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4691, 'União do Oeste', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4692, 'Urubici', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4693, 'Urupema', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4694, 'Urussanga', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4695, 'Vargeão', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4696, 'Vargem', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4697, 'Vargem Bonita', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4698, 'Vidal Ramos', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4699, 'Videira', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4700, 'Vitor Meireles', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4701, 'Witmarsum', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4702, 'Xanxerê', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4703, 'Xavantina', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4704, 'Xaxim', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4705, 'Zortéa', 24);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4706, 'Adamantina', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4707, 'Adolfo', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4708, 'Aguaí', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4709, 'Águas da Prata', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4710, 'Águas de Lindóia', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4711, 'Águas de Santa Bárbara', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4712, 'Águas de São Pedro', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4713, 'Agudos', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4714, 'Alambari', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4715, 'Alfredo Marcondes', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4716, 'Altair', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4717, 'Altinópolis', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4718, 'Alto Alegre', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4719, 'Alumínio', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4720, 'Álvares Florence', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4721, 'Álvares Machado', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4722, 'Álvaro de Carvalho', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4723, 'Alvinlândia', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4724, 'Americana', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4725, 'Américo Brasiliense', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4726, 'Américo de Campos', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4727, 'Amparo', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4728, 'Analândia', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4729, 'Andradina', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4730, 'Angatuba', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4731, 'Anhembi', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4732, 'Anhumas', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4733, 'Aparecida', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4734, 'Aparecida dOeste', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4735, 'Apiaí', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4736, 'Araçariguama', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4737, 'Araçatuba', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4738, 'Araçoiaba da Serra', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4739, 'Aramina', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4740, 'Arandu', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4741, 'Arapeí', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4742, 'Araraquara', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4743, 'Araras', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4744, 'Arco-Íris', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4745, 'Arealva', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4746, 'Areias', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4747, 'Areiópolis', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4748, 'Ariranha', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4749, 'Artur Nogueira', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4750, 'Arujá', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4751, 'Aspásia', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4752, 'Assis', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4753, 'Atibaia', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4754, 'Auriflama', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4755, 'Avaí', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4756, 'Avanhandava', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4757, 'Avaré', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4758, 'Bady Bassitt', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4759, 'Balbinos', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4760, 'Bálsamo', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4761, 'Bananal', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4762, 'Barão de Antonina', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4763, 'Barbosa', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4764, 'Bariri', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4765, 'Barra Bonita', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4766, 'Barra do Chapéu', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4767, 'Barra do Turvo', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4768, 'Barretos', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4769, 'Barrinha', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4770, 'Barueri', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4771, 'Bastos', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4772, 'Batatais', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4773, 'Bauru', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4774, 'Bebedouro', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4775, 'Bento de Abreu', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4776, 'Bernardino de Campos', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4777, 'Bertioga', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4778, 'Bilac', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4779, 'Birigui', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4780, 'Biritiba-Mirim', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4781, 'Boa Esperança do Sul', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4782, 'Bocaina', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4783, 'Bofete', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4784, 'Boituva', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4785, 'Bom Jesus dos Perdões', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4786, 'Bom Sucesso de Itararé', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4787, 'Borá', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4788, 'Boracéia', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4789, 'Borborema', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4790, 'Borebi', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4791, 'Botucatu', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4792, 'Bragança Paulista', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4793, 'Braúna', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4794, 'Brejo Alegre', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4795, 'Brodowski', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4796, 'Brotas', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4797, 'Buri', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4798, 'Buritama', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4799, 'Buritizal', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4800, 'Cabrália Paulista', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4801, 'Cabreúva', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4802, 'Caçapava', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4803, 'Cachoeira Paulista', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4804, 'Caconde', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4805, 'Cafelândia', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4806, 'Caiabu', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4807, 'Caieiras', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4808, 'Caiuá', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4809, 'Cajamar', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4810, 'Cajati', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4811, 'Cajobi', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4812, 'Cajuru', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4813, 'Campina do Monte Alegre', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4814, 'Campinas', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4815, 'Campo Limpo Paulista', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4816, 'Campos do Jordão', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4817, 'Campos Novos Paulista', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4818, 'Cananéia', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4819, 'Canas', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4820, 'Cândido Mota', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4821, 'Cândido Rodrigues', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4822, 'Canitar', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4823, 'Capão Bonito', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4824, 'Capela do Alto', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4825, 'Capivari', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4826, 'Caraguatatuba', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4827, 'Carapicuíba', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4828, 'Cardoso', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4829, 'Casa Branca', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4830, 'Cássia dos Coqueiros', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4831, 'Castilho', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4832, 'Catanduva', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4833, 'Catiguá', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4834, 'Cedral', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4835, 'Cerqueira César', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4836, 'Cerquilho', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4837, 'Cesário Lange', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4838, 'Charqueada', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4839, 'Chavantes', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4840, 'Clementina', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4841, 'Colina', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4842, 'Colômbia', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4843, 'Conchal', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4844, 'Conchas', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4845, 'Cordeirópolis', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4846, 'Coroados', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4847, 'Coronel Macedo', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4848, 'Corumbataí', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4849, 'Cosmópolis', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4850, 'Cosmorama', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4851, 'Cotia', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4852, 'Cravinhos', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4853, 'Cristais Paulista', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4854, 'Cruzália', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4855, 'Cruzeiro', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4856, 'Cubatão', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4857, 'Cunha', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4858, 'Descalvado', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4859, 'Diadema', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4860, 'Dirce Reis', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4861, 'Divinolândia', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4862, 'Dobrada', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4863, 'Dois Córregos', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4864, 'Dolcinópolis', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4865, 'Dourado', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4866, 'Dracena', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4867, 'Duartina', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4868, 'Dumont', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4869, 'Echaporã', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4870, 'Eldorado', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4871, 'Elias Fausto', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4872, 'Elisiário', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4873, 'Embaúba', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4874, 'Embu', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4875, 'Embu-Guaçu', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4876, 'Emilianópolis', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4877, 'Engenheiro Coelho', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4878, 'Espírito Santo do Pinhal', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4879, 'Espírito Santo do Turvo', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4880, 'Estiva Gerbi', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4881, 'Estrela dOeste', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4882, 'Estrela do Norte', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4883, 'Euclides da Cunha Paulista', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4884, 'Fartura', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4885, 'Fernando Prestes', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4886, 'Fernandópolis', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4887, 'Fernão', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4888, 'Ferraz de Vasconcelos', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4889, 'Flora Rica', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4890, 'Floreal', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4891, 'Flórida Paulista', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4892, 'Florínia', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4893, 'Franca', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4894, 'Francisco Morato', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4895, 'Franco da Rocha', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4896, 'Gabriel Monteiro', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4897, 'Gália', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4898, 'Garça', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4899, 'Gastão Vidigal', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4900, 'Gavião Peixoto', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4901, 'General Salgado', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4902, 'Getulina', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4903, 'Glicério', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4904, 'Guaiçara', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4905, 'Guaimbê', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4906, 'Guaíra', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4907, 'Guapiaçu', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4908, 'Guapiara', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4909, 'Guará', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4910, 'Guaraçaí', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4911, 'Guaraci', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4912, 'Guarani dOeste', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4913, 'Guarantã', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4914, 'Guararapes', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4915, 'Guararema', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4916, 'Guaratinguetá', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4917, 'Guareí', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4918, 'Guariba', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4919, 'Guarujá', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4920, 'Guarulhos', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4921, 'Guatapará', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4922, 'Guzolândia', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4923, 'Herculândia', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4924, 'Holambra', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4925, 'Hortolândia', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4926, 'Iacanga', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4927, 'Iacri', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4928, 'Iaras', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4929, 'Ibaté', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4930, 'Ibirá', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4931, 'Ibirarema', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4932, 'Ibitinga', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4933, 'Ibiúna', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4934, 'Icém', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4935, 'Iepê', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4936, 'Igaraçu do Tietê', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4937, 'Igarapava', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4938, 'Igaratá', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4939, 'Iguape', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4940, 'Ilha Comprida', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4941, 'Ilha Solteira', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4942, 'Ilhabela', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4943, 'Indaiatuba', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4944, 'Indiana', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4945, 'Indiaporã', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4946, 'Inúbia Paulista', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4947, 'Ipaussu', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4948, 'Iperó', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4949, 'Ipeúna', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4950, 'Ipiguá', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4951, 'Iporanga', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4952, 'Ipuã', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4953, 'Iracemápolis', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4954, 'Irapuã', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4955, 'Irapuru', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4956, 'Itaberá', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4957, 'Itaí', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4958, 'Itajobi', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4959, 'Itaju', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4960, 'Itanhaém', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4961, 'Itaóca', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4962, 'Itapecerica da Serra', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4963, 'Itapetininga', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4964, 'Itapeva', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4965, 'Itapevi', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4966, 'Itapira', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4967, 'Itapirapuã Paulista', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4968, 'Itápolis', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4969, 'Itaporanga', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4970, 'Itapuí', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4971, 'Itapura', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4972, 'Itaquaquecetuba', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4973, 'Itararé', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4974, 'Itariri', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4975, 'Itatiba', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4976, 'Itatinga', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4977, 'Itirapina', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4978, 'Itirapuã', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4979, 'Itobi', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4980, 'Itu', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4981, 'Itupeva', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4982, 'Ituverava', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4983, 'Jaborandi', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4984, 'Jaboticabal', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4985, 'Jacareí', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4986, 'Jaci', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4987, 'Jacupiranga', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4988, 'Jaguariúna', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4989, 'Jales', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4990, 'Jambeiro', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4991, 'Jandira', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4992, 'Jardinópolis', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4993, 'Jarinu', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4994, 'Jaú', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4995, 'Jeriquara', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4996, 'Joanópolis', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4997, 'João Ramalho', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4998, 'José Bonifácio', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (4999, 'Júlio Mesquita', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5000, 'Jumirim', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5001, 'Jundiaí', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5002, 'Junqueirópolis', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5003, 'Juquiá', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5004, 'Juquitiba', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5005, 'Lagoinha', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5006, 'Laranjal Paulista', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5007, 'Lavínia', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5008, 'Lavrinhas', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5009, 'Leme', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5010, 'Lençóis Paulista', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5011, 'Limeira', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5012, 'Lindóia', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5013, 'Lins', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5014, 'Lorena', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5015, 'Lourdes', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5016, 'Louveira', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5017, 'Lucélia', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5018, 'Lucianópolis', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5019, 'Luís Antônio', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5020, 'Luiziânia', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5021, 'Lupércio', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5022, 'Lutécia', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5023, 'Macatuba', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5024, 'Macaubal', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5025, 'Macedônia', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5026, 'Magda', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5027, 'Mairinque', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5028, 'Mairiporã', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5029, 'Manduri', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5030, 'Marabá Paulista', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5031, 'Maracaí', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5032, 'Marapoama', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5033, 'Mariápolis', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5034, 'Marília', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5035, 'Marinópolis', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5036, 'Martinópolis', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5037, 'Matão', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5038, 'Mauá', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5039, 'Mendonça', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5040, 'Meridiano', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5041, 'Mesópolis', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5042, 'Miguelópolis', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5043, 'Mineiros do Tietê', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5044, 'Mira Estrela', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5045, 'Miracatu', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5046, 'Mirandópolis', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5047, 'Mirante do Paranapanema', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5048, 'Mirassol', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5049, 'Mirassolândia', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5050, 'Mococa', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5051, 'Mogi das Cruzes', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5052, 'Mogi Guaçu', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5053, 'Moji Mirim', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5054, 'Mombuca', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5055, 'Monções', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5056, 'Mongaguá', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5057, 'Monte Alegre do Sul', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5058, 'Monte Alto', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5059, 'Monte Aprazível', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5060, 'Monte Azul Paulista', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5061, 'Monte Castelo', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5062, 'Monte Mor', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5063, 'Monteiro Lobato', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5064, 'Morro Agudo', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5065, 'Morungaba', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5066, 'Motuca', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5067, 'Murutinga do Sul', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5068, 'Nantes', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5069, 'Narandiba', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5070, 'Natividade da Serra', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5071, 'Nazaré Paulista', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5072, 'Neves Paulista', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5073, 'Nhandeara', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5074, 'Nipoã', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5075, 'Nova Aliança', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5076, 'Nova Campina', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5077, 'Nova Canaã Paulista', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5078, 'Nova Castilho', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5079, 'Nova Europa', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5080, 'Nova Granada', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5081, 'Nova Guataporanga', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5082, 'Nova Independência', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5083, 'Nova Luzitânia', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5084, 'Nova Odessa', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5085, 'Novais', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5086, 'Novo Horizonte', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5087, 'Nuporanga', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5088, 'Ocauçu', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5089, 'Óleo', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5090, 'Olímpia', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5091, 'Onda Verde', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5092, 'Oriente', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5093, 'Orindiúva', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5094, 'Orlândia', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5095, 'Osasco', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5096, 'Oscar Bressane', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5097, 'Osvaldo Cruz', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5098, 'Ourinhos', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5099, 'Ouro Verde', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5100, 'Ouroeste', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5101, 'Pacaembu', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5102, 'Palestina', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5103, 'Palmares Paulista', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5104, 'Palmeira dOeste', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5105, 'Palmital', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5106, 'Panorama', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5107, 'Paraguaçu Paulista', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5108, 'Paraibuna', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5109, 'Paraíso', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5110, 'Paranapanema', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5111, 'Paranapuã', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5112, 'Parapuã', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5113, 'Pardinho', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5114, 'Pariquera-Açu', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5115, 'Parisi', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5116, 'Patrocínio Paulista', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5117, 'Paulicéia', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5118, 'Paulínia', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5119, 'Paulistânia', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5120, 'Paulo de Faria', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5121, 'Pederneiras', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5122, 'Pedra Bela', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5123, 'Pedranópolis', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5124, 'Pedregulho', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5125, 'Pedreira', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5126, 'Pedrinhas Paulista', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5127, 'Pedro de Toledo', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5128, 'Penápolis', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5129, 'Pereira Barreto', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5130, 'Pereiras', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5131, 'Peruíbe', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5132, 'Piacatu', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5133, 'Piedade', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5134, 'Pilar do Sul', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5135, 'Pindamonhangaba', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5136, 'Pindorama', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5137, 'Pinhalzinho', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5138, 'Piquerobi', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5139, 'Piquete', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5140, 'Piracaia', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5141, 'Piracicaba', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5142, 'Piraju', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5143, 'Pirajuí', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5144, 'Pirangi', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5145, 'Pirapora do Bom Jesus', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5146, 'Pirapozinho', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5147, 'Pirassununga', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5148, 'Piratininga', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5149, 'Pitangueiras', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5150, 'Planalto', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5151, 'Platina', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5152, 'Poá', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5153, 'Poloni', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5154, 'Pompéia', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5155, 'Pongaí', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5156, 'Pontal', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5157, 'Pontalinda', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5158, 'Pontes Gestal', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5159, 'Populina', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5160, 'Porangaba', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5161, 'Porto Feliz', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5162, 'Porto Ferreira', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5163, 'Potim', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5164, 'Potirendaba', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5165, 'Pracinha', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5166, 'Pradópolis', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5167, 'Praia Grande', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5168, 'Pratânia', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5169, 'Presidente Alves', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5170, 'Presidente Bernardes', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5171, 'Presidente Epitácio', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5172, 'Presidente Prudente', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5173, 'Presidente Venceslau', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5174, 'Promissão', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5175, 'Quadra', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5176, 'Quatá', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5177, 'Queiroz', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5178, 'Queluz', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5179, 'Quintana', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5180, 'Rafard', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5181, 'Rancharia', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5182, 'Redenção da Serra', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5183, 'Regente Feijó', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5184, 'Reginópolis', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5185, 'Registro', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5186, 'Restinga', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5187, 'Ribeira', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5188, 'Ribeirão Bonito', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5189, 'Ribeirão Branco', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5190, 'Ribeirão Corrente', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5191, 'Ribeirão do Sul', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5192, 'Ribeirão dos Índios', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5193, 'Ribeirão Grande', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5194, 'Ribeirão Pires', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5195, 'Ribeirão Preto', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5196, 'Rifaina', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5197, 'Rincão', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5198, 'Rinópolis', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5199, 'Rio Claro', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5200, 'Rio das Pedras', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5201, 'Rio Grande da Serra', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5202, 'Riolândia', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5203, 'Riversul', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5204, 'Rosana', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5205, 'Roseira', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5206, 'Rubiácea', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5207, 'Rubinéia', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5208, 'Sabino', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5209, 'Sagres', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5210, 'Sales', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5211, 'Sales Oliveira', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5212, 'Salesópolis', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5213, 'Salmourão', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5214, 'Saltinho', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5215, 'Salto', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5216, 'Salto de Pirapora', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5217, 'Salto Grande', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5218, 'Sandovalina', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5219, 'Santa Adélia', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5220, 'Santa Albertina', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5221, 'Santa Bárbara dOeste', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5222, 'Santa Branca', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5223, 'Santa Clara dOeste', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5224, 'Santa Cruz da Conceição', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5225, 'Santa Cruz da Esperança', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5226, 'Santa Cruz das Palmeiras', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5227, 'Santa Cruz do Rio Pardo', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5228, 'Santa Ernestina', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5229, 'Santa Fé do Sul', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5230, 'Santa Gertrudes', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5231, 'Santa Isabel', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5232, 'Santa Lúcia', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5233, 'Santa Maria da Serra', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5234, 'Santa Mercedes', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5235, 'Santa Rita dOeste', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5236, 'Santa Rita do Passa Quatro', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5237, 'Santa Rosa de Viterbo', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5238, 'Santa Salete', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5239, 'Santana da Ponte Pensa', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5240, 'Santana de Parnaíba', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5241, 'Santo Anastácio', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5242, 'Santo André', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5243, 'Santo Antônio da Alegria', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5244, 'Santo Antônio de Posse', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5245, 'Santo Antônio do Aracanguá', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5246, 'Santo Antônio do Jardim', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5247, 'Santo Antônio do Pinhal', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5248, 'Santo Expedito', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5249, 'Santópolis do Aguapeí', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5250, 'Santos', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5251, 'São Bento do Sapucaí', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5252, 'São Bernardo do Campo', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5253, 'São Caetano do Sul', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5254, 'São Carlos', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5255, 'São Francisco', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5256, 'São João da Boa Vista', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5257, 'São João das Duas Pontes', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5258, 'São João de Iracema', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5259, 'São João do Pau dAlho', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5260, 'São Joaquim da Barra', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5261, 'São José da Bela Vista', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5262, 'São José do Barreiro', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5263, 'São José do Rio Pardo', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5264, 'São José do Rio Preto', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5265, 'São José dos Campos', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5266, 'São Lourenço da Serra', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5267, 'São Luís do Paraitinga', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5268, 'São Manuel', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5269, 'São Miguel Arcanjo', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5270, 'São Paulo', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5271, 'São Pedro', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5272, 'São Pedro do Turvo', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5273, 'São Roque', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5274, 'São Sebastião', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5275, 'São Sebastião da Grama', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5276, 'São Simão', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5277, 'São Vicente', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5278, 'Sarapuí', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5279, 'Sarutaiá', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5280, 'Sebastianópolis do Sul', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5281, 'Serra Azul', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5282, 'Serra Negra', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5283, 'Serrana', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5284, 'Sertãozinho', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5285, 'Sete Barras', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5286, 'Severínia', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5287, 'Silveiras', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5288, 'Socorro', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5289, 'Sorocaba', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5290, 'Sud Mennucci', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5291, 'Sumaré', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5292, 'Suzanápolis', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5293, 'Suzano', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5294, 'Tabapuã', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5295, 'Tabatinga', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5296, 'Taboão da Serra', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5297, 'Taciba', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5298, 'Taguaí', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5299, 'Taiaçu', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5300, 'Taiúva', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5301, 'Tambaú', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5302, 'Tanabi', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5303, 'Tapiraí', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5304, 'Tapiratiba', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5305, 'Taquaral', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5306, 'Taquaritinga', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5307, 'Taquarituba', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5308, 'Taquarivaí', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5309, 'Tarabai', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5310, 'Tarumã', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5311, 'Tatuí', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5312, 'Taubaté', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5313, 'Tejupá', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5314, 'Teodoro Sampaio', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5315, 'Terra Roxa', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5316, 'Tietê', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5317, 'Timburi', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5318, 'Torre de Pedra', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5319, 'Torrinha', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5320, 'Trabiju', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5321, 'Tremembé', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5322, 'Três Fronteiras', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5323, 'Tuiuti', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5324, 'Tupã', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5325, 'Tupi Paulista', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5326, 'Turiúba', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5327, 'Turmalina', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5328, 'Ubarana', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5329, 'Ubatuba', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5330, 'Ubirajara', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5331, 'Uchoa', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5332, 'União Paulista', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5333, 'Urânia', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5334, 'Uru', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5335, 'Urupês', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5336, 'Valentim Gentil', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5337, 'Valinhos', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5338, 'Valparaíso', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5339, 'Vargem', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5340, 'Vargem Grande do Sul', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5341, 'Vargem Grande Paulista', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5342, 'Várzea Paulista', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5343, 'Vera Cruz', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5344, 'Vinhedo', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5345, 'Viradouro', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5346, 'Vista Alegre do Alto', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5347, 'Vitória Brasil', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5348, 'Votorantim', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5349, 'Votuporanga', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5350, 'Zacarias', 26);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5351, 'Amparo de São Francisco', 25);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5352, 'Aquidabã', 25);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5353, 'Aracaju', 25);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5354, 'Arauá', 25);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5355, 'Areia Branca', 25);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5356, 'Barra dos Coqueiros', 25);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5357, 'Boquim', 25);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5358, 'Brejo Grande', 25);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5359, 'Campo do Brito', 25);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5360, 'Canhoba', 25);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5361, 'Canindé de São Francisco', 25);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5362, 'Capela', 25);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5363, 'Carira', 25);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5364, 'Carmópolis', 25);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5365, 'Cedro de São João', 25);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5366, 'Cristinápolis', 25);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5367, 'Cumbe', 25);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5368, 'Divina Pastora', 25);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5369, 'Estância', 25);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5370, 'Feira Nova', 25);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5371, 'Frei Paulo', 25);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5372, 'Gararu', 25);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5373, 'General Maynard', 25);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5374, 'Gracho Cardoso', 25);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5375, 'Ilha das Flores', 25);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5376, 'Indiaroba', 25);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5377, 'Itabaiana', 25);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5378, 'Itabaianinha', 25);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5379, 'Itabi', 25);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5380, 'Itaporanga dAjuda', 25);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5381, 'Japaratuba', 25);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5382, 'Japoatã', 25);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5383, 'Lagarto', 25);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5384, 'Laranjeiras', 25);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5385, 'Macambira', 25);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5386, 'Malhada dos Bois', 25);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5387, 'Malhador', 25);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5388, 'Maruim', 25);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5389, 'Moita Bonita', 25);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5390, 'Monte Alegre de Sergipe', 25);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5391, 'Muribeca', 25);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5392, 'Neópolis', 25);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5393, 'Nossa Senhora Aparecida', 25);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5394, 'Nossa Senhora da Glória', 25);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5395, 'Nossa Senhora das Dores', 25);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5396, 'Nossa Senhora de Lourdes', 25);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5397, 'Nossa Senhora do Socorro', 25);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5398, 'Pacatuba', 25);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5399, 'Pedra Mole', 25);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5400, 'Pedrinhas', 25);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5401, 'Pinhão', 25);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5402, 'Pirambu', 25);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5403, 'Poço Redondo', 25);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5404, 'Poço Verde', 25);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5405, 'Porto da Folha', 25);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5406, 'Propriá', 25);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5407, 'Riachão do Dantas', 25);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5408, 'Riachuelo', 25);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5409, 'Ribeirópolis', 25);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5410, 'Rosário do Catete', 25);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5411, 'Salgado', 25);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5412, 'Santa Luzia do Itanhy', 25);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5413, 'Santa Rosa de Lima', 25);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5414, 'Santana do São Francisco', 25);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5415, 'Santo Amaro das Brotas', 25);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5416, 'São Cristóvão', 25);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5417, 'São Domingos', 25);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5418, 'São Francisco', 25);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5419, 'São Miguel do Aleixo', 25);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5420, 'Simão Dias', 25);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5421, 'Siriri', 25);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5422, 'Telha', 25);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5423, 'Tobias Barreto', 25);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5424, 'Tomar do Geru', 25);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5425, 'Umbaúba', 25);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5426, 'Abreulândia', 27);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5427, 'Aguiarnópolis', 27);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5428, 'Aliança do Tocantins', 27);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5429, 'Almas', 27);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5430, 'Alvorada', 27);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5431, 'Ananás', 27);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5432, 'Angico', 27);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5433, 'Aparecida do Rio Negro', 27);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5434, 'Aragominas', 27);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5435, 'Araguacema', 27);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5436, 'Araguaçu', 27);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5437, 'Araguaína', 27);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5438, 'Araguanã', 27);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5439, 'Araguatins', 27);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5440, 'Arapoema', 27);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5441, 'Arraias', 27);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5442, 'Augustinópolis', 27);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5443, 'Aurora do Tocantins', 27);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5444, 'Axixá do Tocantins', 27);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5445, 'Babaçulândia', 27);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5446, 'Bandeirantes do Tocantins', 27);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5447, 'Barra do Ouro', 27);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5448, 'Barrolândia', 27);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5449, 'Bernardo Sayão', 27);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5450, 'Bom Jesus do Tocantins', 27);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5451, 'Brasilândia do Tocantins', 27);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5452, 'Brejinho de Nazaré', 27);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5453, 'Buriti do Tocantins', 27);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5454, 'Cachoeirinha', 27);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5455, 'Campos Lindos', 27);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5456, 'Cariri do Tocantins', 27);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5457, 'Carmolândia', 27);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5458, 'Carrasco Bonito', 27);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5459, 'Caseara', 27);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5460, 'Centenário', 27);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5461, 'Chapada da Natividade', 27);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5462, 'Chapada de Areia', 27);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5463, 'Colinas do Tocantins', 27);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5464, 'Colméia', 27);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5465, 'Combinado', 27);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5466, 'Conceição do Tocantins', 27);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5467, 'Couto de Magalhães', 27);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5468, 'Cristalândia', 27);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5469, 'Crixás do Tocantins', 27);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5470, 'Darcinópolis', 27);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5471, 'Dianópolis', 27);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5472, 'Divinópolis do Tocantins', 27);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5473, 'Dois Irmãos do Tocantins', 27);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5474, 'Dueré', 27);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5475, 'Esperantina', 27);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5476, 'Fátima', 27);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5477, 'Figueirópolis', 27);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5478, 'Filadélfia', 27);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5479, 'Formoso do Araguaia', 27);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5480, 'Fortaleza do Tabocão', 27);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5481, 'Goianorte', 27);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5482, 'Goiatins', 27);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5483, 'Guaraí', 27);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5484, 'Gurupi', 27);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5485, 'Ipueiras', 27);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5486, 'Itacajá', 27);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5487, 'Itaguatins', 27);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5488, 'Itapiratins', 27);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5489, 'Itaporã do Tocantins', 27);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5490, 'Jaú do Tocantins', 27);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5491, 'Juarina', 27);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5492, 'Lagoa da Confusão', 27);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5493, 'Lagoa do Tocantins', 27);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5494, 'Lajeado', 27);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5495, 'Lavandeira', 27);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5496, 'Lizarda', 27);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5497, 'Luzinópolis', 27);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5498, 'Marianópolis do Tocantins', 27);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5499, 'Mateiros', 27);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5500, 'Maurilândia do Tocantins', 27);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5501, 'Miracema do Tocantins', 27);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5502, 'Miranorte', 27);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5503, 'Monte do Carmo', 27);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5504, 'Monte Santo do Tocantins', 27);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5505, 'Muricilândia', 27);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5506, 'Natividade', 27);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5507, 'Nazaré', 27);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5508, 'Nova Olinda', 27);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5509, 'Nova Rosalândia', 27);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5510, 'Novo Acordo', 27);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5511, 'Novo Alegre', 27);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5512, 'Novo Jardim', 27);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5513, 'Oliveira de Fátima', 27);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5514, 'Palmas', 27);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5515, 'Palmeirante', 27);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5516, 'Palmeiras do Tocantins', 27);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5517, 'Palmeirópolis', 27);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5518, 'Paraíso do Tocantins', 27);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5519, 'Paranã', 27);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5520, 'Pau dArco', 27);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5521, 'Pedro Afonso', 27);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5522, 'Peixe', 27);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5523, 'Pequizeiro', 27);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5524, 'Pindorama do Tocantins', 27);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5525, 'Piraquê', 27);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5526, 'Pium', 27);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5527, 'Ponte Alta do Bom Jesus', 27);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5528, 'Ponte Alta do Tocantins', 27);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5529, 'Porto Alegre do Tocantins', 27);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5530, 'Porto Nacional', 27);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5531, 'Praia Norte', 27);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5532, 'Presidente Kennedy', 27);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5533, 'Pugmil', 27);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5534, 'Recursolândia', 27);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5535, 'Riachinho', 27);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5536, 'Rio da Conceição', 27);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5537, 'Rio dos Bois', 27);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5538, 'Rio Sono', 27);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5539, 'Sampaio', 27);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5540, 'Sandolândia', 27);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5541, 'Santa Fé do Araguaia', 27);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5542, 'Santa Maria do Tocantins', 27);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5543, 'Santa Rita do Tocantins', 27);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5544, 'Santa Rosa do Tocantins', 27);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5545, 'Santa Tereza do Tocantins', 27);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5546, 'Santa Terezinha do Tocantins', 27);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5547, 'São Bento do Tocantins', 27);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5548, 'São Félix do Tocantins', 27);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5549, 'São Miguel do Tocantins', 27);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5550, 'São Salvador do Tocantins', 27);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5551, 'São Sebastião do Tocantins', 27);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5552, 'São Valério da Natividade', 27);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5553, 'Silvanópolis', 27);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5554, 'Sítio Novo do Tocantins', 27);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5555, 'Sucupira', 27);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5556, 'Taguatinga', 27);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5557, 'Taipas do Tocantins', 27);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5558, 'Talismã', 27);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5559, 'Tocantínia', 27);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5560, 'Tocantinópolis', 27);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5561, 'Tupirama', 27);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5562, 'Tupiratins', 27);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5563, 'Wanderlândia', 27);
insert into CIDADE (ID, NOME, ID_ESTADO)
values (5564, 'Xambioá', 27);




COMMENT ON COLUMN PESSOA.TIPO IS
'0|NULL - Funcionario
1 - Membro da diretoria
2 - Cliente
3 - Fornecedor
4 - Parceiro
1 - Estagiario
2 - Voluntario
3 - Outros';



ALTER TABLE PESSOA
    ADD ID_CIDADE INTEGER;



ALTER TABLE PESSOA DROP CIDADE;



ALTER TABLE PESSOA
ADD CONSTRAINT FK_PESSOA_1
FOREIGN KEY (ID_CIDADE)
REFERENCES CIDADE(ID)
ON UPDATE CASCADE;


update pessoa set pessoa.id_cidade = 1026;



ALTER TABLE ORGANIZACAO
    ADD ID_CIDADE INTEGER;



ALTER TABLE ORGANIZACAO
ADD CONSTRAINT FK_ORGANIZACAO_1
FOREIGN KEY (ID_CIDADE)
REFERENCES CIDADE(ID)
ON UPDATE CASCADE;



ALTER TABLE ORGANIZACAO DROP CIDADE;

update organizacao set organizacao.id_cidade = 1026;



COMMENT ON COLUMN PESSOA.TIPO IS
'0|NULL - Funcionario
1 - Membro da diretoria
2 - Cliente
3 - Parceiro
4 - Estagiario
5 - Voluntario
6 - Outros';



ALTER TABLE PESSOA
    ADD DATA_NASCIMENTO DATE,
    ADD OBSERVACAO D_DESCRICAO;



COMMENT ON COLUMN PESSOA.TIPO IS
'0|NULL - Funcionario
1 - Membro da diretoria
2 - Cliente
3 - Fornecedor
4 - Parceiro
5 - Estagiario
6 - Voluntario
7 - Outros';



CREATE TABLE FIN_FOR_CLI (
    ID INTEGER NOT NULL,
    ID_CONTATO INTEGER,
    ID_CIDADE INTEGER,
    NOME_FANTASIA D_NOME NOT NULL,
    RAZAO_SOCIAL D_NOME,
    ENDERECO VARCHAR(100),
    BAIRRO VARCHAR(30),
    COMPLEMENTO VARCHAR(100),
    TIPO INTEGER,
    TELEFONE VARCHAR(20),
    CELULAR VARCHAR(20),
    EMAIL VARCHAR(100),
    SITE VARCHAR(100),
    CPF_CNPJ VARCHAR(14),
    INSCRICAO_ESTADUAL VARCHAR(20),
    INSCRICAO_MUNICIPAL VARCHAR(20),
    RAMO_ATIVIDADE VARCHAR(50),
    PESQUISA VARCHAR(100),
    OBSERVACAO D_DESCRICAO);

ALTER TABLE FIN_FOR_CLI
ADD CONSTRAINT PK_FIN_FOR_CLI
PRIMARY KEY (ID);

COMMENT ON COLUMN FIN_FOR_CLI.TIPO IS
'1 - Financiador
2 - Fornecedor
3 - Cliente';

CREATE SEQUENCE GEN_FIN_FOR_CLI;



COMMENT ON TABLE FIN_FOR_CLI IS 'Tabela com as informacoes de
Financiadores
Fornecedores
Clientes';



ALTER TABLE FIN_FOR_CLI
ADD CONSTRAINT FK_FIN_FOR_CLI_1
FOREIGN KEY (ID_CONTATO)
REFERENCES PESSOA(ID)
ON UPDATE CASCADE;



ALTER TABLE FIN_FOR_CLI
ADD CONSTRAINT FK_FIN_FOR_CLI_2
FOREIGN KEY (ID_CIDADE)
REFERENCES ATIVIDADE(ID)
ON UPDATE CASCADE;



ALTER TABLE FIN_FOR_CLI
ADD CONSTRAINT UNQ1_FIN_FOR_CLI
UNIQUE (NOME_FANTASIA);

ALTER TABLE FIN_FOR_CLI
ADD CONSTRAINT UNQ2_FIN_FOR_CLI
UNIQUE (CPF_CNPJ);



update RDB$RELATION_FIELDS set
RDB$NULL_FLAG = 1
where (RDB$FIELD_NAME = 'ID_CONTATO') and
(RDB$RELATION_NAME = 'FIN_FOR_CLI')
;



ALTER TABLE FIN_FOR_CLI DROP CONSTRAINT FK_FIN_FOR_CLI_2;

ALTER TABLE FIN_FOR_CLI
ADD CONSTRAINT FK_FIN_FOR_CLI_2
FOREIGN KEY (ID_CIDADE)
REFERENCES CIDADE(ID)
ON UPDATE CASCADE
USING INDEX FK_FIN_FOR_CLI_2;



ALTER TABLE FIN_FOR_CLI DROP CONSTRAINT UNQ2_FIN_FOR_CLI;

ALTER TABLE FIN_FOR_CLI
ADD CONSTRAINT UNQ2_FIN_FOR_CLI
UNIQUE (CPF_CNPJ,TIPO)
USING INDEX UNQ2_FIN_FOR_CLI;

ALTER TABLE FIN_FOR_CLI
ADD CONSTRAINT UNQ1_FIN_FOR_CLI
UNIQUE (RAZAO_SOCIAL,TIPO);

ALTER TABLE FIN_FOR_CLI
ADD CONSTRAINT UNQ3_FIN_FOR_CLI
UNIQUE (NOME_FANTASIA,TIPO);



COMMENT ON COLUMN PESSOA.TIPO IS
'0|NULL - Funcionario
1 - Membro da diretoria
2 - Cliente
3 - Fornecedor
4 - Financiador
5 - Parceiro
6 - Estagiario
7 - Voluntario
8 - Outros';


INSERT INTO ESPECIE (ID, NOME, NOME_CIENTIFICO, FAMILIA_BOTANICA, OBSERVACAO)
             VALUES (1, 'Aroeira', 'Myracrodruon urundeuva', ' Anacardiaceae', NULL);
INSERT INTO ESPECIE (ID, NOME, NOME_CIENTIFICO, FAMILIA_BOTANICA, OBSERVACAO)
             VALUES (2, ' Angico-do-cerrado', 'Anadenanthera peregrina var. falcata', 'Leguminosae-Mimosoideae', NULL);
INSERT INTO ESPECIE (ID, NOME, NOME_CIENTIFICO, FAMILIA_BOTANICA, OBSERVACAO)
             VALUES (3, ' Baru', 'Dipteryx alata', 'Leguminosae', NULL);
INSERT INTO ESPECIE (ID, NOME, NOME_CIENTIFICO, FAMILIA_BOTANICA, OBSERVACAO)
             VALUES (4, ' Boca-boa', 'Buchenavia tomentosa', 'Combretaceae', NULL);
INSERT INTO ESPECIE (ID, NOME, NOME_CIENTIFICO, FAMILIA_BOTANICA, OBSERVACAO)
             VALUES (5, ' Cafezinho', 'Psychotria carthagenesis', 'Rubiaceae', NULL);
INSERT INTO ESPECIE (ID, NOME, NOME_CIENTIFICO, FAMILIA_BOTANICA, OBSERVACAO)
             VALUES (6, ' Capitão', 'Terminalia argentea', 'Combretaceae', NULL);
INSERT INTO ESPECIE (ID, NOME, NOME_CIENTIFICO, FAMILIA_BOTANICA, OBSERVACAO)
             VALUES (7, ' Caqui-do-cerrado', 'Diospyros hispida', 'Ebenaceae', NULL);
INSERT INTO ESPECIE (ID, NOME, NOME_CIENTIFICO, FAMILIA_BOTANICA, OBSERVACAO)
             VALUES (8, ' Carvoeiro ', 'Tachigali vulgaris', ' Fabaceae', NULL);
INSERT INTO ESPECIE (ID, NOME, NOME_CIENTIFICO, FAMILIA_BOTANICA, OBSERVACAO)
             VALUES (9, ' Goiaba', 'Psidium guajava', 'Myrtaceae', NULL);
INSERT INTO ESPECIE (ID, NOME, NOME_CIENTIFICO, FAMILIA_BOTANICA, OBSERVACAO)
             VALUES (10, ' Ipê-caraiba', 'Handroanthus albus', 'Bignoniaceae', NULL);
INSERT INTO ESPECIE (ID, NOME, NOME_CIENTIFICO, FAMILIA_BOTANICA, OBSERVACAO)
             VALUES (11, ' Jenipapo-de-cavalo', 'Tocoyena formosa', 'Rubiacea', NULL);
INSERT INTO ESPECIE (ID, NOME, NOME_CIENTIFICO, FAMILIA_BOTANICA, OBSERVACAO)
             VALUES (12, ' Lixeira', 'Curatella americana', 'Dilleniaceae.', NULL);
INSERT INTO ESPECIE (ID, NOME, NOME_CIENTIFICO, FAMILIA_BOTANICA, OBSERVACAO)
             VALUES (13, ' Monjoleiro', 'Senegalia polyphylla', ' Fabaceae', NULL);
INSERT INTO ESPECIE (ID, NOME, NOME_CIENTIFICO, FAMILIA_BOTANICA, OBSERVACAO)
             VALUES (14, ' Murici-da-mata', 'Byrsonima laxiflora', 'Malpighiaceae', NULL);
INSERT INTO ESPECIE (ID, NOME, NOME_CIENTIFICO, FAMILIA_BOTANICA, OBSERVACAO)
             VALUES (15, ' Murici-miudo', 'Byrsonima spicata', ' Malpighiaceae', NULL);
INSERT INTO ESPECIE (ID, NOME, NOME_CIENTIFICO, FAMILIA_BOTANICA, OBSERVACAO)
             VALUES (16, ' Olho de Cabra', 'Ormosia arborea', 'Fabaceae', NULL);
INSERT INTO ESPECIE (ID, NOME, NOME_CIENTIFICO, FAMILIA_BOTANICA, OBSERVACAO)
             VALUES (17, ' Pau-formiga', 'Triplaris sp.', ' Polygonaceae', NULL);
INSERT INTO ESPECIE (ID, NOME, NOME_CIENTIFICO, FAMILIA_BOTANICA, OBSERVACAO)
             VALUES (18, ' Pau-pombo', 'Tapirira guianensis', 'Anacardiaceae', NULL);
INSERT INTO ESPECIE (ID, NOME, NOME_CIENTIFICO, FAMILIA_BOTANICA, OBSERVACAO)
             VALUES (19, ' Pequi ', 'Caryocar brasiliense', 'Caryocaraceae', NULL);
INSERT INTO ESPECIE (ID, NOME, NOME_CIENTIFICO, FAMILIA_BOTANICA, OBSERVACAO)
             VALUES (20, ' Pimenta-de-macaco', 'Xylopia aromatica', ' Annonaceae', NULL);
INSERT INTO ESPECIE (ID, NOME, NOME_CIENTIFICO, FAMILIA_BOTANICA, OBSERVACAO)
             VALUES (21, ' Pixirica', 'Miconia cubatanensis', 'Melastomatacea', NULL);
INSERT INTO ESPECIE (ID, NOME, NOME_CIENTIFICO, FAMILIA_BOTANICA, OBSERVACAO)
             VALUES (22, ' Pororoca', 'Rapanea gardneriana', ' Myrsinaceae', NULL);
INSERT INTO ESPECIE (ID, NOME, NOME_CIENTIFICO, FAMILIA_BOTANICA, OBSERVACAO)
             VALUES (23, ' Quaresmeira', 'Tibouchina granulosa', ' Melastomataceae', NULL);
INSERT INTO ESPECIE (ID, NOME, NOME_CIENTIFICO, FAMILIA_BOTANICA, OBSERVACAO)
             VALUES (24, ' Tingui', 'Magonia pubescens', ' Sapindaceae', NULL);
INSERT INTO ESPECIE (ID, NOME, NOME_CIENTIFICO, FAMILIA_BOTANICA, OBSERVACAO)
             VALUES (25, ' Unha-de-vaca', 'Bauhinia longifolia', ' Fabaceae', NULL);
INSERT INTO ESPECIE (ID, NOME, NOME_CIENTIFICO, FAMILIA_BOTANICA, OBSERVACAO)
             VALUES (26, ' Veludo-branco', 'Gettarda viburnoides', 'Rubiaceae', NULL);
INSERT INTO ESPECIE (ID, NOME, NOME_CIENTIFICO, FAMILIA_BOTANICA, OBSERVACAO)
             VALUES (27, ' Vinhático', 'Plathymenia Reticulata', ' Fabaceae', NULL);
INSERT INTO ESPECIE (ID, NOME, NOME_CIENTIFICO, FAMILIA_BOTANICA, OBSERVACAO)
             VALUES (28, 'Amendoim bravo', '       Pterogyne nitens', ' Fabaceae', NULL);
INSERT INTO ESPECIE (ID, NOME, NOME_CIENTIFICO, FAMILIA_BOTANICA, OBSERVACAO)
             VALUES (29, 'Angico', 'Anadenanthera macrocarpa', 'Leguminosae-Mimosoideae', NULL);
INSERT INTO ESPECIE (ID, NOME, NOME_CIENTIFICO, FAMILIA_BOTANICA, OBSERVACAO)
             VALUES (30, 'Araça', 'Psidium catteleianum', 'Myrtaceae', NULL);
INSERT INTO ESPECIE (ID, NOME, NOME_CIENTIFICO, FAMILIA_BOTANICA, OBSERVACAO)
             VALUES (31, 'Aroeirinha brava', 'Lithraea molleoides', ' Anacardiaceae', NULL);
INSERT INTO ESPECIE (ID, NOME, NOME_CIENTIFICO, FAMILIA_BOTANICA, OBSERVACAO)
             VALUES (32, 'Arranha- gato', 'Acacia Plumosa', 'Fabaceae', NULL);
INSERT INTO ESPECIE (ID, NOME, NOME_CIENTIFICO, FAMILIA_BOTANICA, OBSERVACAO)
             VALUES (33, 'Balsamim', 'Diptychandra aurantiaca', 'Fabaceae', NULL);
INSERT INTO ESPECIE (ID, NOME, NOME_CIENTIFICO, FAMILIA_BOTANICA, OBSERVACAO)
             VALUES (34, 'Bambuzinho', 'Phyllostachys sp.', 'Bambusoideae', NULL);
INSERT INTO ESPECIE (ID, NOME, NOME_CIENTIFICO, FAMILIA_BOTANICA, OBSERVACAO)
             VALUES (35, 'Camboatá', 'Matayba guianensis', ' Sapindaceae', NULL);
INSERT INTO ESPECIE (ID, NOME, NOME_CIENTIFICO, FAMILIA_BOTANICA, OBSERVACAO)
             VALUES (36, 'Cana-de-macaco', 'Costus spicatus', 'Costaceae.', NULL);
INSERT INTO ESPECIE (ID, NOME, NOME_CIENTIFICO, FAMILIA_BOTANICA, OBSERVACAO)
             VALUES (37, 'Canafistola', 'Peltophorum dubium', 'Fabaceae', NULL);
INSERT INTO ESPECIE (ID, NOME, NOME_CIENTIFICO, FAMILIA_BOTANICA, OBSERVACAO)
             VALUES (38, 'Catinga-de-bode', 'hyptidendron asperrimum', 'Lamiaceae', NULL);
INSERT INTO ESPECIE (ID, NOME, NOME_CIENTIFICO, FAMILIA_BOTANICA, OBSERVACAO)
             VALUES (39, 'Cedro', 'Cedrela fissilis', 'Meliaceae', NULL);
INSERT INTO ESPECIE (ID, NOME, NOME_CIENTIFICO, FAMILIA_BOTANICA, OBSERVACAO)
             VALUES (40, 'Coração -de-negro', 'Peltogyne confertiflora', 'Fabaceae-Caesalpinioideae', NULL);
INSERT INTO ESPECIE (ID, NOME, NOME_CIENTIFICO, FAMILIA_BOTANICA, OBSERVACAO)
             VALUES (41, 'Embaúba', 'Cecropia pachystachya', 'Cecropiaceae', NULL);
INSERT INTO ESPECIE (ID, NOME, NOME_CIENTIFICO, FAMILIA_BOTANICA, OBSERVACAO)
             VALUES (42, 'Embiruçu', ' Pseudobombax longiflorum', 'Bombacaceae', NULL);
INSERT INTO ESPECIE (ID, NOME, NOME_CIENTIFICO, FAMILIA_BOTANICA, OBSERVACAO)
             VALUES (43, 'Farinha Seca', 'Albizia  niopoides', 'Leguminosae-Mimosoideae', NULL);
INSERT INTO ESPECIE (ID, NOME, NOME_CIENTIFICO, FAMILIA_BOTANICA, OBSERVACAO)
             VALUES (44, 'Faveira', 'Dimorphandra mollis', 'Leguminosae-Caesalpinioideae', NULL);
INSERT INTO ESPECIE (ID, NOME, NOME_CIENTIFICO, FAMILIA_BOTANICA, OBSERVACAO)
             VALUES (45, 'Gapuruvu', 'Schizolobium parahyba', 'Leguminosae-Caesalpinioideae', NULL);
INSERT INTO ESPECIE (ID, NOME, NOME_CIENTIFICO, FAMILIA_BOTANICA, OBSERVACAO)
             VALUES (46, 'Genipapo', 'Genipa americana', 'Rubiaceae', NULL);
INSERT INTO ESPECIE (ID, NOME, NOME_CIENTIFICO, FAMILIA_BOTANICA, OBSERVACAO)
             VALUES (47, 'Grumixana', 'Eugenia brasiliensis', 'Myrtaceae', NULL);
INSERT INTO ESPECIE (ID, NOME, NOME_CIENTIFICO, FAMILIA_BOTANICA, OBSERVACAO)
             VALUES (48, 'Guaritá', 'Astronium graveleons', 'Anacardiaceae', NULL);
INSERT INTO ESPECIE (ID, NOME, NOME_CIENTIFICO, FAMILIA_BOTANICA, OBSERVACAO)
             VALUES (49, 'Ingá', 'Ingá laurina', 'Leguminosae-Mimosoideae', NULL);
INSERT INTO ESPECIE (ID, NOME, NOME_CIENTIFICO, FAMILIA_BOTANICA, OBSERVACAO)
             VALUES (50, 'Ipê branco', 'Tabebuia insignis', 'Bignoniaceae', NULL);
INSERT INTO ESPECIE (ID, NOME, NOME_CIENTIFICO, FAMILIA_BOTANICA, OBSERVACAO)
             VALUES (51, 'Ipê Rosa', 'Tabebuia impetiginosa', 'Bignoniaceae', NULL);
INSERT INTO ESPECIE (ID, NOME, NOME_CIENTIFICO, FAMILIA_BOTANICA, OBSERVACAO)
             VALUES (52, 'Ipê Roxo', 'Tabebuia avelanedae', 'Bignoniaceae', NULL);
INSERT INTO ESPECIE (ID, NOME, NOME_CIENTIFICO, FAMILIA_BOTANICA, OBSERVACAO)
             VALUES (53, 'IpêAmarelo', 'Tabebuia ochracea', 'Bignoniaceae', NULL);
INSERT INTO ESPECIE (ID, NOME, NOME_CIENTIFICO, FAMILIA_BOTANICA, OBSERVACAO)
             VALUES (54, 'IpêAmarelo Peludo', 'Tabebuia chrysotricha', 'Bignoniaceae', NULL);
INSERT INTO ESPECIE (ID, NOME, NOME_CIENTIFICO, FAMILIA_BOTANICA, OBSERVACAO)
             VALUES (55, 'Jacaranda boca de sapo', 'Jacaranda brasiliana', 'Bignoniaceae', NULL);
INSERT INTO ESPECIE (ID, NOME, NOME_CIENTIFICO, FAMILIA_BOTANICA, OBSERVACAO)
             VALUES (56, 'Jamelão', 'Syzygium cumini', 'Myrtaceae', NULL);
INSERT INTO ESPECIE (ID, NOME, NOME_CIENTIFICO, FAMILIA_BOTANICA, OBSERVACAO)
             VALUES (57, 'jatoba do mato ', 'Hymenaea Courbaril', 'Leguminosae-Caesalpinioideae', NULL);
INSERT INTO ESPECIE (ID, NOME, NOME_CIENTIFICO, FAMILIA_BOTANICA, OBSERVACAO)
             VALUES (58, 'Jatobá-do-cerrado', 'Hymenaea stigonocarpa', 'Leguminosae-Caesalpinioideae', NULL);
INSERT INTO ESPECIE (ID, NOME, NOME_CIENTIFICO, FAMILIA_BOTANICA, OBSERVACAO)
             VALUES (59, 'Jurubeba', 'Solanum paniculatum', 'Solanaceae', NULL);
INSERT INTO ESPECIE (ID, NOME, NOME_CIENTIFICO, FAMILIA_BOTANICA, OBSERVACAO)
             VALUES (60, 'limão-do-mato', 'Randia sp', 'Rubiaceae', NULL);
INSERT INTO ESPECIE (ID, NOME, NOME_CIENTIFICO, FAMILIA_BOTANICA, OBSERVACAO)
             VALUES (61, 'Maminha-de-porca', 'Zanthoxylum rhoifolium', ' Rutaceae', NULL);
INSERT INTO ESPECIE (ID, NOME, NOME_CIENTIFICO, FAMILIA_BOTANICA, OBSERVACAO)
             VALUES (62, 'Maria pobre', ' Dilodendron Bipinnatum', 'Sapindaceae', NULL);
INSERT INTO ESPECIE (ID, NOME, NOME_CIENTIFICO, FAMILIA_BOTANICA, OBSERVACAO)
             VALUES (63, 'Marmelada', 'Alibertia edullis', 'Rubiaceae', NULL);
INSERT INTO ESPECIE (ID, NOME, NOME_CIENTIFICO, FAMILIA_BOTANICA, OBSERVACAO)
             VALUES (64, 'Mata cachorro', 'Simarouba versicolor', 'Simaroubaceae', NULL);
INSERT INTO ESPECIE (ID, NOME, NOME_CIENTIFICO, FAMILIA_BOTANICA, OBSERVACAO)
             VALUES (65, 'Monjoleiro', 'Acacia polyphylla', 'Leguminosae-Mimosoideae', NULL);
INSERT INTO ESPECIE (ID, NOME, NOME_CIENTIFICO, FAMILIA_BOTANICA, OBSERVACAO)
             VALUES (66, 'Moreira', 'Macluria tinctoria', 'Moraceae', NULL);
INSERT INTO ESPECIE (ID, NOME, NOME_CIENTIFICO, FAMILIA_BOTANICA, OBSERVACAO)
             VALUES (67, 'Mutamba', 'Guazuma ulmifolia', 'Sterculiaceae', NULL);
INSERT INTO ESPECIE (ID, NOME, NOME_CIENTIFICO, FAMILIA_BOTANICA, OBSERVACAO)
             VALUES (68, 'Pau Oléo', ' Copaifera langsdorfii', 'Leguminosae-Caesalpinioideae', NULL);
INSERT INTO ESPECIE (ID, NOME, NOME_CIENTIFICO, FAMILIA_BOTANICA, OBSERVACAO)
             VALUES (69, 'Pau Santo', 'Kielmeyera variabilis', 'Guttiferae(Clusiaceae)', NULL);
INSERT INTO ESPECIE (ID, NOME, NOME_CIENTIFICO, FAMILIA_BOTANICA, OBSERVACAO)
             VALUES (70, 'Pau-jangada', 'Apeiba tibourbou', 'Tiliaceae', NULL);
INSERT INTO ESPECIE (ID, NOME, NOME_CIENTIFICO, FAMILIA_BOTANICA, OBSERVACAO)
             VALUES (71, 'Pindaiba', 'Cardiopetalum calophyllum', 'Annonaceae', NULL);
INSERT INTO ESPECIE (ID, NOME, NOME_CIENTIFICO, FAMILIA_BOTANICA, OBSERVACAO)
             VALUES (72, 'Quebra-foice', 'Mimosa laticifera', 'Leguminosae', NULL);
INSERT INTO ESPECIE (ID, NOME, NOME_CIENTIFICO, FAMILIA_BOTANICA, OBSERVACAO)
             VALUES (73, 'Sucupira-branca', 'Pterodon emarginatus', 'Fabaceae', NULL);
INSERT INTO ESPECIE (ID, NOME, NOME_CIENTIFICO, FAMILIA_BOTANICA, OBSERVACAO)
             VALUES (74, 'Tamboril', 'Enterolobium contortisiliquum', 'Leguminosae-Mimosoideae', NULL);
INSERT INTO ESPECIE (ID, NOME, NOME_CIENTIFICO, FAMILIA_BOTANICA, OBSERVACAO)
             VALUES (75, 'Urucum', 'Bixa orellana', 'Bixaceae', NULL);
INSERT INTO ESPECIE (ID, NOME, NOME_CIENTIFICO, FAMILIA_BOTANICA, OBSERVACAO)
             VALUES (76, 'Genipapo', 'Genipa americana', 'Rubiaceae', NULL);
INSERT INTO ESPECIE (ID, NOME, NOME_CIENTIFICO, FAMILIA_BOTANICA, OBSERVACAO)
             VALUES (77, 'veludinho', 'Guettarda pohliana', ' Rubiaceae', NULL);

COMMIT WORK;




ALTER SEQUENCE GEN_ESPECIE RESTART WITH 77;



CREATE TABLE MATRIZ (
    ID INTEGER NOT NULL,
    NOME INTEGER NOT NULL,
    ID_ESPECIE INTEGER NOT NULL,
    ENDERECO VARCHAR(150),
    LATITUDE NUMERIC(15,6),
    LONGITUDE NUMERIC(15,6),
    DESCRICAO D_DESCRICAO);

ALTER TABLE MATRIZ
ADD CONSTRAINT PK_MATRIZ
PRIMARY KEY (ID);

COMMENT ON COLUMN MATRIZ.ENDERECO IS
'Endereco da matriz (nome da fazenda, sitio, regiao ou qualquer informacao que facilite o retorno a esta matriz)';

CREATE SEQUENCE GEN_MATRIZ;



ALTER TABLE MATRIZ
ADD CONSTRAINT FK_MATRIZ_1
FOREIGN KEY (ID_ESPECIE)
REFERENCES ESPECIE(ID)
ON UPDATE CASCADE;



ALTER TABLE MATRIZ
ADD CONSTRAINT UNQ1_MATRIZ
UNIQUE (NOME);



alter table MATRIZ
alter ID position 1;

alter table MATRIZ
alter ID_ESPECIE position 2;

alter table MATRIZ
alter NOME position 3;

alter table MATRIZ
alter ENDERECO position 4;

alter table MATRIZ
alter LATITUDE position 5;

alter table MATRIZ
alter LONGITUDE position 6;

alter table MATRIZ
alter DESCRICAO position 7;



ALTER TABLE MATRIZ DROP CONSTRAINT UNQ1_MATRIZ;



ALTER TABLE MATRIZ DROP NOME;



ALTER TABLE MATRIZ
    ADD NOME D_NOME NOT NULL;

alter table MATRIZ
alter ID position 1;

alter table MATRIZ
alter ID_ESPECIE position 2;

alter table MATRIZ
alter NOME position 3;

alter table MATRIZ
alter ENDERECO position 4;

alter table MATRIZ
alter LATITUDE position 5;

alter table MATRIZ
alter LONGITUDE position 6;

alter table MATRIZ
alter DESCRICAO position 7;



ALTER TABLE MATRIZ
ADD CONSTRAINT UNQ1_MATRIZ
UNIQUE (NOME);

