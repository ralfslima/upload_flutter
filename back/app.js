const express = require('express');
const multer = require('multer');
const cors = require('cors');
const app = express();
const PORT = 3000;

app.use(cors());

const storage = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, 'uploads/'); // Diretório de upload
  },
  filename: function (req, file, cb) {
    cb(null, file.originalname); // Nome do arquivo no servidor será o mesmo do original
  }
});

const upload = multer({ storage: storage });

// Rota de upload
app.post('/upload', upload.single('file'), (req, res) => {
  res.send('Arquivo recebido com sucesso.');
});

app.listen(PORT, () => {
  console.log(`Servidor está rodando na porta ${PORT}`);
});
