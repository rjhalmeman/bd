CREATE DATABASE IF NOT EXISTS SFM;
USE SFM;

CREATE TABLE Pessoa (
    cpfPessoa VARCHAR(11) PRIMARY KEY,
    nomePessoa VARCHAR(100),
    contatoPessoa VARCHAR(100),
    enderecoPessoa VARCHAR(255)
);

CREATE TABLE Cliente (
    pessoaCpfPessoa VARCHAR(11),
    PRIMARY KEY (pessoaCpfPessoa),
    FOREIGN KEY (pessoaCpfPessoa) REFERENCES Pessoa(cpfPessoa)
);

CREATE TABLE Cargo (
    idCargo INT AUTO_INCREMENT,
    nomeCargo VARCHAR(45),
    PRIMARY KEY (idCargo)
);

CREATE TABLE Funcionario (
    pessoaCpfPessoa VARCHAR(11),
    cargoIdCargo INT,
    PRIMARY KEY (pessoaCpfPessoa),
    FOREIGN KEY (pessoaCpfPessoa) REFERENCES Pessoa(cpfPessoa),
    FOREIGN KEY (cargoIdCargo) REFERENCES Cargo(idCargo)
);

CREATE TABLE Horario (
    siglaHorario VARCHAR(2) PRIMARY KEY,
    inicioHorario TIME,
    fimHorario TIME
);

CREATE TABLE Servico (
    idServico INT AUTO_INCREMENT,
    nomeServico VARCHAR(45),
    PRIMARY KEY (idServico)
);

CREATE TABLE FuncionarioHasServico (
    funcionarioPessoaCpfPessoa VARCHAR(11),
    servicoIdServico INT,
    PRIMARY KEY (funcionarioPessoaCpfPessoa, servicoIdServico),
    FOREIGN KEY (funcionarioPessoaCpfPessoa) REFERENCES Funcionario(pessoaCpfPessoa),
    FOREIGN KEY (servicoIdServico) REFERENCES Servico(idServico)
);

CREATE TABLE Reserva (
    dataReserva DATE,
    horarioSiglaHorario VARCHAR(2),
    funcionarioPessoaCpfPessoa VARCHAR(11),
    servicoIdServico INT,
    clientePessoaCpfPessoa VARCHAR(11),
    PRIMARY KEY (dataReserva, horarioSiglaHorario, funcionarioPessoaCpfPessoa, servicoIdServico, clientePessoaCpfPessoa),
    FOREIGN KEY (horarioSiglaHorario) REFERENCES Horario(siglaHorario),
    FOREIGN KEY (funcionarioPessoaCpfPessoa) REFERENCES Funcionario(pessoaCpfPessoa),
    FOREIGN KEY (servicoIdServico) REFERENCES Servico(idServico),
    FOREIGN KEY (clientePessoaCpfPessoa) REFERENCES Cliente(pessoaCpfPessoa)
);
