// Banco de dados simulado na memória (Array)
const idososDB = [];

export const cadastrarIdoso = (req, res) => {
    const { nome, idade, observacoesMedicas } = req.body;
    const timestampAtual = new Date().toISOString();

    if (!nome || nome.trim() === "") {
        return res.status(400).json({
            status: "erro",
            mensagem: "O nome do idoso é obrigatório.",
            codigoErro: "NOME_OBRIGATORIO",
            timestamp: timestampAtual
        });
    }

    if (idade === undefined || typeof idade !== 'number' || isNaN(idade)) {
        return res.status(400).json({
            status: "erro",
            mensagem: "Idade inválida ou fora do escopo permitido.",
            codigoErro: "IDADE_INVALIDA",
            timestamp: timestampAtual
        });
    }

    if (idade < 50) {
        return res.status(400).json({
            status: "erro",
            mensagem: "Sistema exclusivo para gerenciamento de idosos (Idade mínima: 50 anos).",
            codigoErro: "IDADE_FORA_DO_ESCOPO",
            timestamp: timestampAtual
        });
    }

    const novoIdoso = {
        idIdoso: idososDB.length + 1,
        nome: nome.trim(),
        idade: idade,
        observacoesMedicas: observacoesMedicas || "",
        dataCadastro: timestampAtual
    };

    idososDB.push(novoIdoso);

    return res.status(201).json({
        status: "sucesso",
        mensagem: "Idoso cadastrado com sucesso",
        dados: novoIdoso
    });
};