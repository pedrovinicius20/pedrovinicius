DEAGRI-TCC
=========================

## Informações Gerais
Classe que adapta o pacote abntex2 para as normas do Departamento de Engenharia Agrícola e o  da Universidade Federal de Sergipe. O abntex2 (http://www.abntex.net.br/) é uma classe que implementa as normas da ABNT para os usuários LaTex.

Tendo como base o material customizado pelo Departamento de Computação DPCOMP-UFS



Estão disponíveis os seguintes arquivos para download:
- dea-abntex2.cls         `Pacote com as regras gerais do template`
- Graduacao.sty             `Estilo de formatação para os Trabalhos de conslusão de curso`
Mestrado`
- Modelo-TCC-DEA.tex      `Modelo para os Trabalhos de conclusão de curso`

Sugerimos escrever documentos por cima do arquivo de modelo .tex fornecido, com toda sua estrutura de pastas. Pra quem utilizar outro modelo, é preciso colocar a classe adequada:

```latex
\documentclass[
	% -- opções das classes --
    % (...)
	]{deagri-abntex2}
```

Com relação ao pacote abntex2, foram modificadas as seguintes páginas:
- Fontes -> Times New Roman
- Sumário -> Tradicional, com hierarquia entre capítulos e seções
- Listas -> Ilustrações, Tabelas e Códigos
- Capa -> Imagens da UFS adicionadas
- Folha de rosto
- Ficha catalográfica
- Folha de Aprovação

## Pacotes

Lista mínima de pacotes a serem instalados em distribuições Ubuntu/Mint linux
* texlive
* texlive-base
* texlive-latex-base
* abntex
* texlive-fonts-recommended
* texlive-lang-portuguese
* texlive-latex-recommended
* texlive-science
* texlive-publishers
* texlive-latex-extra
* preview-latex-style
* texlive-pictures
* python-pygments
* texlive-font-utils

## Ambiente de desenvolvimento
1. Linux
  * Instalar os pacotes listados anteriormente
  * Escolher uma IDE para latex ou usar um editor de texto simples e compilar o texto com o Makefile que vem no projeto
  * Por conta do pacote minted (http://tug.ctan.org/tex-archive/macros/latex/contrib/minted/minted.pdf), não esquecer de adicionar o comando `-shell-escape` à linha de compilação
  
2. Windows
  * Instalar o miktex
  * Instalar python
  * Adicionar a pasta de instalação do python ao PATH do Windows
  * Instalar python-pip
  * Adicionar a pasta de scritpts do python ao PATH do Windows
  * Executar o comando `pip install pygments` ou `easy_install Pygments` para instalar o Pygments
  * Reiniciar o computador
  * Escolher uma IDE para latex ou usar um editor de texto simples e compilar o texto com o Makefile que vem no projeto
  * Por conta do pacote minted (http://tug.ctan.org/tex-archive/macros/latex/contrib/minted/minted.pdf), não esquecer de adicionar o comando `-shell-escape` à linha de compilação

3. Online (recomendado)
 https://www.overleaf.com/
  * Ambientes online com todos os pacotes latex existentes já prontos para uso, com a opção de compartilhamento de projeto entre várias pessoas
  * Para usar nosso template, basta importar a estrutura de pastas e compilar o texto
  * 
  *AGRADECIMENTOS AO DEPARTAMENTO DE COMPUTAÇÃO PELA CONTRUÇÃO DO ARQUIVO BASE
