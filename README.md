# Gerenciamento de Estados em Flutter

## Conceitos importantes:

* Inherited Widget
* Provider
* Single source of truth
* Store
* BloC
* Redux

## Sobre telas, classes, objetos e estados

No Flutter, toda tela é, na verdade, um objeto de uma classe (que herda de stateless ou stateful
widget).
Quando este objeto herda de stateful widget, é possível fazer alerações no estado dele enquanto ele
existe em memória.
Essas mudanças tipicamente são alterações em variáveis.
Para que as alterações de estado apareçam na tela, é necessário renderizar ela. O "gatilho" para que
isso aconteça é a chamada ao método "setState()".

Assim, pode-se dizer que "estado" nada mais é do que os valores das variáveis do aplicativo em tempo
de execução.

## Single Source of Truth

Trata-se de um conceito onde as informações sobre entidades devem estar centralizadas. Todas as
alterações e consultas serão feitas diretamente nesta fonte única.
Esta fonte não deve ser tão volátil quanto uma tela (objeto) que é reconstruída toda vez que é
acessada.

Uma abordagem amplamente utilizada é a de "salvar" esses dados em uma classe estática, ou seja, que
não é instanciada.
Ela servirá apenas para que seja possível acessar (ou alterar) os valores de suas variáveis.

Também é possível usar a abordagem do "Singleton", que é um padrão de projeto que se assemelha
bastante à alternativa de classe estática mencionada anteriormente.

Obs.:
É possível carregar todos os dados do aplicativo na sua inicialização, para que ele possa acessar
esses dados (e alterá-los).
Trata-se de uma alternativa mais econômica e eficiente à puxar dados do banco ao inicializar cada
tela.
Porém, em alguns casos, isso pode gerar algo chamado "lazy loading", que é uma demora excessiva para
este carregamento inicial.
O pacote Provider provê uma solução para esse problema, permitindo um carregamento gradual dos dados
do app.

Diferença fundamental entre Classe Estática armazenando dados e uso de Gerenciamento de Estados como
o Provider:

* No primeiro caso, o aplicativo não sabe quando alguma alteração ocorreu na Classe Estática. Ou
  seja, caso os dados precisem estar sempre atualizados para todaa as telas de forma igual, é
  necessário adicionar um "informante", que irá avisar quando alguma mudança ocorrer.

## Inherited Widget

É uma alternativa fornecida pelo Flutter para gerenciar dados visíveis a toda a aplicação e na
árvore de widgets. É bastante burocrático, complexo e de baixo nível.
Para casos mais simples, o pacote Provider é recomendado pela própria equipe do Flutter.

## Provider

É uma biblioteca feita para gerenciamento de estados e recomendado pela própria equipe do Flutter.
Instalação:

`dart flutter pub add provider`

`dart flutter pub get`

Uma vez feita a instalação, realizam-se os seguintes passos:

1. Criar classe "single source of truth" que irá avisar aos ouvintes quando uma mudança ocorrer (por
   exemplo: classe "Eventos", que avisará quando houverem mudanças ).
    * Fazer a classe extender de "ChangeNotifier" do Material
    * Definir os avisos para os ouvintes nas funções em que isso é necessário:
      `notifyListeners();`
2. Configurar o ChangeNotifier na classe main
    * Importar o provider (`import "package:provider/provider.dart"`)
    * Inserir o ChangeNotifierProvider no topo da árvore de widgets do aplicativo:

```dart
      void main() {
  runApp(
      ChangeNotifierProvider(
          create: (context) => ConstrutorDaClasse(lista: []),
          child: MyApp()
      )
  );
}
```

3. Configurar o listener
    * Na tela que "ouvirá" as mudanças da classe ChangeNotifier, cria-se um objeto do tipo Consumer,
      com o parâmetro de tipo recebendo a classe do tipo ChangeNotifier e implementando, no
      Consumer, a função anônima que retornará o Widget desejado com os dados atualizados do
      ChangeNotifier para o parâmetro "builder". Exemplo:
    * Importar o provider (`import "package:provider/provider.dart"`)
    * Chamar o Consumer para ouvir as mudanças no ChangeNotifier:

```dart
      body: Consumer<Eventos>
(
builder: (BuildContext context, Eventos objeto, Widget? widget){
return ListView(children: objeto.listaEventos) }
);
```

Observações:

1. O Consumer é um Widget de árvore, ou seja, ele consegue ler dados se for definido dentro da
   árvore de widgets. Em alguns casos, como em variáveis ou métodos de alto nível (fora da árvore) a
   alternativa é usar o "Provider.of". Exemplo:
   `var listaEventos = Provider.of<Eventos>(context, listen: true/false)`
O Provider.of também pode ser usado para acessar diretamente o ChangeNotifier sem precisar implementar um Consumer (mais fácil). 
2. E se houver mais de um ChangeNotifier? Configurar o MultiProvider como topo da árvore de widgets:

```dart
void main() {
  runApp(
      MultiProvider(providers: [
        ChangeNotifierProvider(
          create: (context) => ConstrutorDaClasse1(lista: []),
        ),
        ChangeNotifierProvider(
          create: (context) => ConstrutorDaClasse2(lista: []),
        )
      ],
          child: myApp())
  );
}

```
