import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class Exemple5Sol extends StatelessWidget {
  const Exemple5Sol({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Exemple 5. Unbounded Height Error')),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          debugPrint('Límit de mides que rep Column: $constraints');
          return Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    Container(color: Colors.red, height: 100),
                    Container(color: Colors.green, height: 150),
                    Container(color: Colors.blue, height: 200),
                  ],
                ),
              ),
            ],
          );
        },
      ),

      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 200,
            width: 300,
            child: Card.outlined(
              color: Color.fromARGB(255, 255, 255, 190),
              elevation: 8,
              child: Markdown(
                data: """
#### El problema: Unbounded Height Error

En l'exemple 5 anterior, s'ha produit un error *Unbounded Height Error*, que ha impedit el renderitzat del contingut.

Això es deu a que en alguns casos, un widget que rep restriccions **unbounded** no sap com calcular la mida, especialment quan s'usa dins un **scroll**:

```dart
Column(
  children: [
    ListView(
      children: [
        Container(color: Colors.red, height: 100),
        Container(color: Colors.green, height: 150),
        Container(color: Colors.blue, height: 200),
      ],
    ),
  ],
)
```

Aci, el `Column` no té una alçada fixa, i el `ListView` no sap quina alçada ha de tindre. 

Flutter donarà un error d'*alçada unbounded*, perquè `ListView` no pot calcular correctament la mida per al seu renderitzat.

             """,
              ),
            ),
          ),

          SizedBox(
            height: 200,
            width: 300,
            child: Card.outlined(
              color: Color.fromARGB(255, 255, 255, 190),
              elevation: 8,
              child: Markdown(
                data: """
#### Solució: Expanded

Per resoldre el problema, hem afegit un Expanded com a pare del ListView, de manera que ocupe l'espai restant de la Column, proporcionant-li restriccions bounded al ListView.

```dart
Column(
  children: [
  Text("Text de capçalera"),
    Expanded(
      child: ListView(
        children: [
          Container(color: Colors.red, height: 100),
          Container(color: Colors.green, height: 150),
          Container(color: Colors.blue, height: 200),
        ],
      ),
    ),
  ],
);
```

             """,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
