CREATE SCHEMA salaoFazMilagre;
USE salaoFazMilagre;

CREATE TABLE Pessoa (
    cpfPessoa VARCHAR(11) PRIMARY KEY,
    nomePessoa VARCHAR(100),
    senhaPessoa VARCHAR(20)
);

CREATE TABLE Funcionario (
    pessoaCpfPessoa VARCHAR(11),
    PRIMARY KEY (pessoaCpfPessoa),
    FOREIGN KEY (pessoaCpfPessoa) REFERENCES Pessoa(cpfPessoa)
);

CREATE TABLE Cliente (
    pessoaCpfPessoa VARCHAR(11),
    PRIMARY KEY (pessoaCpfPessoa),
    FOREIGN KEY (pessoaCpfPessoa) REFERENCES Pessoa(cpfPessoa)
);

CREATE TABLE Servico (
    idServico INT PRIMARY KEY,
    nomeServico VARCHAR(45)
);

CREATE TABLE Horario (
    siglaHorario VARCHAR(2) PRIMARY KEY,
    inicioHorario TIME,
    fimHorario TIME
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
