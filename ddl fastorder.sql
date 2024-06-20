-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema fast_order
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS fast_order DEFAULT CHARACTER SET utf8 ;
USE fast_order ;

-- -----------------------------------------------------
-- Table fast_order.usuarios
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS fast_order.usuarios (
  id_usuario VARCHAR(36) NOT NULL,
  nome VARCHAR(45) NOT NULL,
  cpf VARCHAR(11) NOT NULL,
  funcao ENUM('admin', 'vendedor', 'fornecedor') NOT NULL,
  data_nascimento DATE NOT NULL,
  email VARCHAR(100) NOT NULL,
  senha VARCHAR(60) NOT NULL,
  telefone VARCHAR(20) NOT NULL,
  PRIMARY KEY (id_usuario),
  UNIQUE INDEX cpf_UNIQUE (cpf ASC) VISIBLE,
  UNIQUE INDEX email_UNIQUE (email ASC) VISIBLE,
  UNIQUE INDEX telefone_UNIQUE (telefone ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table fast_order.unidades
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS fast_order.unidades (
  id_unidade VARCHAR(36) NOT NULL,
  nome VARCHAR(45) NOT NULL,
  descricao VARCHAR(200) NULL,
  tipo ENUM('venda', 'fornecimento') NOT NULL,
  local POINT NULL,
  PRIMARY KEY (id_unidade))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table fast_order.pedidos
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS fast_order.pedidos (
  id_pedido VARCHAR(36) NOT NULL,
  data_criacao DATETIME NOT NULL,
  previsao_entrega DATETIME NOT NULL,
  data_recebimento DATETIME NULL,
  status ENUM('em aberto', 'recusado', 'aceito', 'em producao', 'saiu para entrega', 'recebido', 'recebido com erro') NOT NULL,
  usuarios_idusuario VARCHAR(36) NOT NULL,
  unidade_entrega VARCHAR(36) NOT NULL,
  unidade_fornecimento VARCHAR(36) NOT NULL,
  PRIMARY KEY (id_pedido),
  INDEX fk_pedidos_usuarios_idx (usuarios_idusuario ASC) VISIBLE,
  INDEX fk_pedidos_unidades1_idx (unidade_entrega ASC) VISIBLE,
  INDEX fk_pedidos_unidades2_idx (unidade_fornecimento ASC) VISIBLE,
  CONSTRAINT fk_pedidos_usuarios
    FOREIGN KEY (usuarios_idusuario)
    REFERENCES fast_order.usuarios (id_usuario)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_pedidos_unidades1
    FOREIGN KEY (unidade_entrega)
    REFERENCES fast_order.unidades (id_unidade)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_pedidos_unidades2
    FOREIGN KEY (unidade_fornecimento)
    REFERENCES fast_order.unidades (id_unidade)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table fast_order.produtos
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS fast_order.produtos (
  id_produto VARCHAR(36) NOT NULL,
  nome VARCHAR(45) NOT NULL,
  descricao VARCHAR(200) NULL,
  Tipo ENUM('salgado', 'doce') NOT NULL,
  PRIMARY KEY (id_produto),
  UNIQUE INDEX nome_UNIQUE (nome ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table fast_order.usuarios_unidades
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS fast_order.usuarios_unidades (
  id_usuario VARCHAR(36) NOT NULL,
  id_unidade VARCHAR(36) NOT NULL,
  data_inicial DATE NOT NULL,
  data_final DATE NULL,
  PRIMARY KEY (id_usuario, id_unidade),
  INDEX fk_usuarios_has_unidades_unidades1_idx (id_unidade ASC) VISIBLE,
  INDEX fk_usuarios_has_unidades_usuarios1_idx (id_usuario ASC) VISIBLE,
  CONSTRAINT fk_usuarios_has_unidades_usuarios1
    FOREIGN KEY (id_usuario)
    REFERENCES fast_order.usuarios (id_usuario)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_usuarios_has_unidades_unidades1
    FOREIGN KEY (id_unidade)
    REFERENCES fast_order.unidades (id_unidade)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table fast_order.itens_pedidos
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS fast_order.itens_pedidos (
  id_produto VARCHAR(36) NOT NULL,
  id_pedido VARCHAR(36) NOT NULL,
  quantidade INT NOT NULL,
  observacao VARCHAR(200) NULL,
  PRIMARY KEY (id_produto, id_pedido),
  INDEX fk_produtos_has_pedidos_pedidos1_idx (id_pedido ASC) VISIBLE,
  INDEX fk_produtos_has_pedidos_produtos1_idx (id_produto ASC) VISIBLE,
  CONSTRAINT fk_produtos_has_pedidos_produtos1
    FOREIGN KEY (id_produto)
    REFERENCES fast_order.produtos (id_produto)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_produtos_has_pedidos_pedidos1
    FOREIGN KEY (id_pedido)
    REFERENCES fast_order.pedidos (id_pedido)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;