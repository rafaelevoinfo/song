

ALTER TABLE SOLICITACAO_COMPRA
ADD CONSTRAINT FK_SOLICITACAO_COMPRA_1
FOREIGN KEY (ID_PESSOA_SOLICITOU)
REFERENCES PESSOA(ID)
ON UPDATE CASCADE;

ALTER TABLE SOLICITACAO_COMPRA
ADD CONSTRAINT FK_SOLICITACAO_COMPRA_2
FOREIGN KEY (ID_PESSOA_ANALISOU)
REFERENCES PESSOA(ID)
ON UPDATE CASCADE;

