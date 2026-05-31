import express from 'express';
import idosoRoutes from './routes/idosoRoutes.js';
import medicamentoRoutes from './routes/medicamentoRoutes.js';
const app = express();
app.use(express.json());

app.use('/api', idosoRoutes);
app.use('/api', medicamentoRoutes);

const PORT = 8080;
app.listen(PORT, () => {
    console.log(` Servidor rodando em http://localhost:${PORT}`);
});