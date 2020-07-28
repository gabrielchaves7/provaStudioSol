# prova_studio_sol

Prova prática do processo seletivo da Studio Sol

## Instalação

- É necessário ter um editor de código, android studio, vscode, recomendo o android studio. Esse link aqui
pode te ajudar https://flutter.dev/docs/get-started/editor
- Caso você ainda não tenha o ambiente configurado para rodar um projeto em flutter, é só seguir:
 o passo a passo desse link: https://flutter.dev/docs/get-started/install 
- Após terminar o passo a passo dos dois links acima, é só abrir o projeto que ele estará pronto 
para rodar \o/ Caso algo dê errado, podem me mandar um email gabrielbum@gmail.com ou uma mensagem no
whatsapp (31) 98249-9345.

## Conceitos do projeto

### Arquitetura

O projeto foi organizado de modo que:
- As chamadas HTTPS estão dentro da pasta repositório.
- A regra de negócio está dentro dos providers, que ficam na pasta repositório.
- A pasta view é referente a "páginas" do aplicativo (no nosso caso só temos uma).
- As widgets, que podem ser reutilizadas em qualquer parte do código, ficam dentro da pasta widgets.

###  O que eu pensei na hora de fazer a prova

Ao começar a desenvolver a widget relativa ao led, eu decidi separar isso em partes, para facilitar
a reutilização e também a evolução do projeto. Por isso, criei uma widget que representa os segmentos, 
LED_SEGMENTO_WIDGET, uma outra que representa apenas um dígito, LED_UNITARIO_WIDGET, e por fim a 
LED_DISPLAY_WIDGET, que recebe um número e calcula quantos LED_UNITARIO_WIDGET ela vai precisar para 
exibir este número.
 
Desse jeito, fica fácil criar outras widgets de led, por exemplo um led de letras, reaproveitando o 
LED_SEGMENTO_WIDGET, ou até exibir um número maior, visto que a LED_DISPLAY_WIDGET não limita o 
tamanho do número que ela pode receber, essa limitação é feita no text_form_field do palpite.



