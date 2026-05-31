import express from 'express';
import { cadastrarIdoso } from '../controllers/idosoController.js';

const router = express.Router();

router.post('/idosos', cadastrarIdoso);

export default router;