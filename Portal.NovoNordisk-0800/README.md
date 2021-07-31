# Tabela de conteúdos
=================
<!--ts-->
   * [Introdução](#Introdução)
   * [Dependências](#Dependencias)
   * [Executando testes](#executando-testes)
<!--te-->

# Introdução
Este modelo servirá de base para a construção de novos testes de front-end automatizados utilizando o robot framework. A arquitetura proposta aqui visa facilitar a padronização dos projetos, o intercâmbio de informações e a adaptação dos testadores em novas células.

# Dependências
O ambiente precisa ter o [Python](https://www.python.org/downloads/) instalado e recomendamos o uso do [Atom](https://atom.io/) como editor padrão no nosso projeto de automação front-end.

Após clonar o repositório, **não se esqueça de colocar os diretórios gitwork\epharma.AutomationFrontend\webdrivers e gitwork\epharma.AutomationFrontend\Oracle_instantclient_19_10 na variável de ambiente _PATH_**. O primeiro diretório, webdrivers, contém os drivers necessários para controlar os browsers, enquanto o diretório Oracle_instantclient_19_10 contém os arquivos necessários para a conexão com o database da oracle. Nota: gitwork corresponde a raíz do seu diretório do git.

**Instale as dependências!** Para instalar, navegue até o diretório _Portal.SuperaPBS_, então execute:
```bash
$ pip install -r requirements.txt
```

# Executando testes
Navegue até o diretório TestSuite, em seguida execute:
```bash
$ robot -d ..\Results\ Portal.SuperaPBS.robot
```

### 🛠 Tecnologias
As seguintes ferramentas foram usadas na construção do projeto:

- [Python](https://www.python.org/downloads/)
- [Atom](https://atom.io/)
