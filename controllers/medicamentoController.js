const medicamentosDB = [];

export const cadastrarMedicamento = (req, res) => {
    const { idosoId, nomeMedicamento, dosagem, horario } = req.body;
    const timestampAtual = new Date().toISOString();

    // Validação de campos obrigatórios (Mitigando F6 do FMEA)
    if (!idosoId || !nomeMedicamento || !horario) {
        return res.status(400).json({
            status: "erro",
            mensagem: "Todos os campos (idosoId, nomeMedicamento, horario) são obrigatórios.",
            codigoErro: "CAMPOS_OBRIGATORIOS",
            timestamp: timestampAtual
        });
    }

    // Validação de limite numérico (Mitigando F21 do FMEA)
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