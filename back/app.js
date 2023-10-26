// Importar o módulo express (framework para criação das rotas)
const express = require('express');

// Importar o módulo multer (responsável pelo upload de imagens)
const multer = require('multer');

// Importar o módulo cors (responsável por liberar acesso às requisições front-end)
const cors = require('cors');

// Criar objeto APP
const app = express();

// Porta onde irá executar o projeto: localhost:3000
const PORT = 3000;

// Habilitando o uso do CORS (sem ele, o front-end não conseguirá realizar as requisições)
app.use(cors());

// Criando a constante storage, responsável pelo upload da imagem
const storage = multer.diskStorage({
  // Método destionation informa a pasta onde serão salvas as imagens
  destination: function (req, file, cb) {
    cb(null, 'uploads/');
  },
  // Mantêm o nome original da imagem, para criar um padrão de nomes, favor alterar aqui
  filename: function (req, file, cb) {
    cb(null, file.originalname);
  }
});

// Cria o objeto upload, responsável por realizar o upload das imagens
const upload = multer({ storage: storage });

// Rota de boas vindas
app.get('/', function(req, res){
  res.write('Back-end para upload funcionando!');
  res.end();
});

// Rota de upload
app.post('/upload', upload.single('file'), (req, res) => {
  res.send('Arquivo recebido com sucesso.');
});

// Configuração do servidor
app.listen(PORT, () => {
  console.log(`Servidor está rodando na porta ${PORT}`);
});
