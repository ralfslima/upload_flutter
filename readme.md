# Instruções para configuração

Projeto desenvolvido em Flutter e Node.js, ensinando a realizar o upload de imagens. O back-end funciona perfeitamente em outras tecnologias como: PHP (Laravel), Java (Spring), Python (Flask e Django), entre outras linguagens/frameworks.

## Configuração do back-end

Abra o projeto no Visual Studio Code, há três dependências que precisarão ser instaladas: Express, Multer e Cors, para instalar todas elas, favor abrir o terminal do Visual Studio Code e executar o comando: **npm i**.

Ainda utilizando o terminal, podemos executar nossa aplicação através do comando: **node app.js**, caso queira verificar o funcionamento, favor acessar o seguinte link via navegador: **localhost:3000**, caso dê tudo certo, será exibida a mensagem: **Back-end para upload funcionando!**, caso haja algum problema, favor entrar em contato.

## Configuração do front-end ##

Abra um novo Visual Studio Code (você terá dois abertos, um para o front-end e outro para o back-end). Selecione a pasta **front** e execute o projeto: **flutter run**.

Todo o front-end está devidamente comentado, foram utilizados dois pacotes para realizar o upload, sendo eles: [Dio](https://pub.dev/packages/dio) e [Image Picker](https://pub.dev/packages/image_picker_web).

Seu projeto Flutter terá apenas dois elementos, um botão para upload e um botão para envio. Para verificar se o envio foi devidamente efetuado, favor olhar o terminal do Visual Studio Code e a pasta **uploads** que está dentro da pasta **back**, juntamente com o arquivo **app.js** do Node.

Fazendo isso, você terá a base para realizar o upload de imagens, agora é só implementar seu projeto, bons estudos ;)