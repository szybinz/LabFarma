const medicamentosDB = [];

export const cadastrarMedicamento = (req, res) => {
    const { idosoId, nomeMedicamento, dosagem, horario } = req.body;
    const timestampAtual = new Date().toISOString();

    if (!idosoId || !nomeMedicamento || !horario) {
        return res.status(400).json({
            status: "erro",
            mensagem: "Todos os campos (idosoId, nomeMedicamento, horario) são obrigatórios.",
            codigoErro: "CAMPOS_OBRIGATORIOS",
            timestamp: timestampAtual
        });
    }
    if (dosagem <= 0) {
        return res.status(400).json({
            status: "erro",
            mensagem: "A dosagem deve ser maior que zero.",
            codigoErro: "DOSAGEM_INVALIDA",
            timestamp: timestampAtual
        });
    }

    const novoMedicamento = {
        idMedicamento: medicamentosDB.length + 1,
        idosoId,
        nomeMedicamento,
        dosagem,
        horario,
        dataCadastro: timestampAtual
    };

    medicamentosDB.push(novoMedicamento);

    return res.status(201).json({
        status: "sucesso",
        mensagem: "Medicamento associado com sucesso",
        dados: novoMedicamento
    });
};