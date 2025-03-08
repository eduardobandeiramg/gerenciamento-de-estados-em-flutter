# Gerenciamento de Estados em Flutter
## Conceitos importantes:
* Inherited Widget
* Provider
* Single source of truth
* Store
* BloC
* Redux

## Sobre telas, classes, objetos e estados
No Flutter, toda tela é, na verdade, um objeto de uma classe (que herda de stateless ou stateful widget).
Quando este objeto herda de stateful widget, é possível fazer alerações no estado dele enquanto ele existe em memória.
Essas mudanças tipicamente são alterações em variáveis.
Para que as alterações de estado apareçam na tela, é necessário renderizar ela. O "gatilho" para que isso aconteça é a chamada ao método "setState()".

Assim, pode-se dizer que "estado" nada mais é do que os valores das variáveis do aplicativo em tempo de execução. 

## Single Source of Truth
Trata-se de um conceito onde as informações sobre entidades devem estar centralizadas. Todas as alterações e consultas serão feitas diretamente nesta fonte única.
Esta fonte não deve ser tão volátil quanto uma tela (objeto) que é reconstruída toda vez que é acessada.

Uma abordagem amplamente utilizada é a de "salvar" esses dados em uma classe estática, ou seja, que não é instanciada.
Ela servirá apenas para que seja possível acessar (ou alterar) os valores de suas variáveis.

Também é possível usar a abordagem do "Singleton", que é um padrão de projeto que se assemelha bastante à alternativa de classe estática mencionada anteriormente.

Obs.: 
É possível carregar todos os dados do aplicativo na sua inicialização, para que ele possa acessar esses dados (e alterá-los).
Trata-se de uma alternativa mais econômica e eficiente à puxar dados do banco ao inicializar cada tela.
Porém, em alguns casos, isso pode gerar algo chamado "lazy loading", que é uma demora excessiva para este carregamento inicial.
O pacote Provider provê uma solução para esse problema, permitindo um carregamento gradual dos dados do app.

## Inherited Widget
É uma alternativa fornecida pelo Flutter para gerenciar dados visíveis a toda a aplicação e na árvore de widgets. É bastante burocrático, complexo e de baixo nível.
Para casos mais simples, o pacote Provider é recomendado pela própria equipe do Flutter.

## Provider
É uma biblioteca feita para gerenciamento de estados e recomendado pela própria equipe do Flutter.
Instalação:
`flutter pub add provider`
`flutter pub get`
