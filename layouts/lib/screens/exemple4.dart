import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class Exemple4 extends StatelessWidget {
  const Exemple4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Exemple 4. Overflow')),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          debugPrint('Límit de mides que rep Column: $constraints');
          return Column(
            children: [
              LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  debugPrint(
                    'Límit de mides que rep el Container roig: $constraints',
                  );
                  return Container(color: Colors.red, height: 300);
                },
              ),
              LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  debugPrint(
                    'Límit de mides que rep El Container verd: $constraints',
                  );

                  return Container(color: Colors.green, height: 800);
                },
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
#### Problema:  Overflow

Disposem d'un Column amb dos contenidors com a fills:

```dart
Column(
  children: [
    Container(color: Colors.red, height: 100),
    Container(color: Colors.green, height: 500),
  ],
)
```
El `Column` no aplica cap tipus de restriccions màximes, pel que quan el segon fill intenta créixer més de la mida possible, provoca un desbordament o *overflow*.

La diferència amb el `SizedBox`, és que aquest sí que aplica restriccions de mida màximes, pel que els fills, encara que vulguen créixer més, s'ajusten a aquestes restriccions.

             """,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/exemple4_sol1');
            },
            child: Text("Solució 1: Aplicar Expanded"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/exemple4_sol2');
            },
            child: Text("Solució 2: SingleChildScrollView"),
          ),
        ],
      ),
    );
  }
}
