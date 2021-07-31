## Modelo de Projeto de Automação de Testes Web
Após Baixá-lo. Não se esqueça de mover este script para o repositório correto onde ele deve ser versionado.

### Objetivo do projeto
Desenvolver scripts de automação de teste utilizando Robot Framework

## Setup do projeto
### Pré requisitos:
[Python 3](https://www.python.org/downloads/release/python-385/) (O projeto foi desenvolvido utilizando a versão 3.8.5)  
[Git](https://git-scm.com/download/win)

## Instalando o Python:
Para verificar se já existe uma versão do python instalada em sua máquina, use o seguinte comando:
```batchfile
> python --version
``` 
Caso ele responda com alguma versão (Ex.: Python 3.7.3), será necessário desinstalar a versão atual e fazer o download da versão recomendada.
Para desinstalar o python procure-o na opção "Adicionar ou Remover programas" do Windows.

Em ambientes Windows, faça o download do pacote "Windows x86-64 executable installer" e siga as instruções do instalador.

**ATENÇÃO:**<br />
**- Você deve selecionar no início da instalação a opção  "Add Python 3.8 to PATH"**<br />
**- Ao fim da instalação vc deve escolher a opção "Disable path length limit"**

## Demais instalações:
Após instalar o Python e o Git a partir dos links acima. Você deve abrir o CMD no modo ADMINISTRADOR e usar os comandos abaixo. É importante que você não sai do CMD até que todo o processo esteja concluído.

^
## Clonando repositório remoto
Acesse o CMD como ADMINISTRADOR e digite os comandos abaixo:
```batchfile
> md c:\projetos
> cd c:\projetos
> git clone https://gitlab.com/primecontrol/template-robot-web
``` 

## Ambiente de Desenvolvimento:

Os Ambientes virtuais no python permitem que os projetos rodem de maneira isolada, protegendo o projeto de dependências desnecessárias, garantindo que rode na versão correta da linguagem, etc.
Para instalar, após ter instalado o Python 3 e clonado o projeto, acesse o CMD como ADMINISTRADOR e navegue até a pasta do projeto.

```batchfile
> cd C:\projetos\<pasta do projeto>
```  
Em seguida instale o `virtualenv` da seguinte maneira:  
```batchfile
> pip install virtualenv
```  
Após a instalação, navegue um diretório principal do projeto e execute:  
```batchfile
> virtualenv venv
```  
Um diretório será criado com o nome venv para o ambiente com a seguinte estrutura:
```batchfile
Include/
Lib/
LICENSE.txt
Scripts/
tcl/
```  
Para iniciar o ambiente virtual, rode o script `activate.bat` contido no diretório `Scripts`:
```batchfile
> cd venv
> Scripts\activate.bat
```

## Instalando dependências
Dentro do projeto existe um arquivo `requirements.txt` que contém todas as dependências do projeto.
Instale-as em seu ambiente após ativar o venv. Usando o comando:
```batchfile
> cd ..
> pip install -r requirements.txt
> pip freeze
```
Na resposta do comando ***pip freeze*** devem aparecer instaladas todas as dependencias escritas no arquivo **requirements.txt**
