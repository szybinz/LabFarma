import express from 'express';
import { cadastrarMedicamento } from '../controllers/medicamentoController.js';

const router = express.Router();

router.post('/medicamentos', cadastrarMedicamento);

export default router;