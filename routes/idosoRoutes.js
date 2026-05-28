import express from 'express';
import { cadastrarIdoso } from '../controllers/idosoController.js';

const router = express.Router();

// Define a rota POST e diz que quem resolve ela é o cadastrarIdoso do controller
router.post('/idosos', cadastrarIdoso);

export default router;