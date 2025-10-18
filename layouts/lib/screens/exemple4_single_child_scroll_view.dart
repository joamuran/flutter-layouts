import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class Exemple4SingleChildScrollView extends StatelessWidget {
  const Exemple4SingleChildScrollView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exemple 4. Solució amb SingleChildScvrollView'),
      ),

      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          debugPrint(
            'Límit de mides que rep SingleChildSrollView: $constraints',
          );
          return SingleChildScrollView(
            child: LayoutBuilder(
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
#### Solució a l'Overflow amb `SingleChildScrollView`

Envoltem el `Column` amb un giny `SingleChildScrollView`, de manera que s'aplique un scroll en cas d'excedir les dimensions del Column.

```dart
SingleChildScrollView(
child: Column(
    children: [
      Container(color: Colors.red, height: 300),
      Container(color: Colors.green, height: 500),
    ],
  )
)
```
 """,
          ),
        ),
      ),
    );
  }
}
