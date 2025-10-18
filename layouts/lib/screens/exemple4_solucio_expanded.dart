import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class Exemple4SolucioExpanded extends StatelessWidget {
  const Exemple4SolucioExpanded({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Exemple 4. Solució amb Expanded')),

      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          debugPrint('Límit de mides que rep Column: $constraints');
          return Column(
            children: [
              LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  debugPrint(
                    'Límit de mides que rep Container roig: $constraints',
                  );
                  return Container(color: Colors.red, height: 300);
                },
              ),
              Expanded(
                child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    debugPrint(
                      'Límit de mides que rep Container verd: $constraints',
                    );
                    return Container(color: Colors.green);
                  },
                ),
              ),
            ],
          );
        },
      ),

      floatingActionButton: SizedBox(
        height: 200,
        width: 300,
        child: Card.outlined(
          color: Color.fromARGB(255, 255, 255, 190),
          elevation: 8,
          child: Markdown(
            data: """
#### Solució a l'Overflow amb `Expanded`

Amb **`Expanded`** permetem que els fills ompliguen l'espai disponible. Per exemple, si en lloc d'afegir una alçada concreta al contenidor verd, l'afegim dins un `Expanded`:

```dart
Column(
  children: [
    Container(color: Colors.red, height: 300),
    Expanded(child: Container(color: Colors.green)),
  ],
)
```
             """,
          ),
        ),
      ),
    );
  }
}
