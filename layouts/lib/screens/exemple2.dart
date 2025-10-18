import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class Exemple2 extends StatelessWidget {
  const Exemple2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exemple 2. Tight Constraints amb SizedBox'),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: 50,
            minHeight: 50,
            maxWidth: 300,
            maxHeight: 300,
          ),
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              debugPrint('Límit de mides que rep SizedBox: $constraints');
              return SizedBox(
                width: 200,
                height: 150,
                child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    debugPrint(
                      'Límit de mides que rep Container: $constraints',
                    );
                    return Container(color: Colors.blue);
                  },
                ),
              );
            },
          ),
        ),
      ),
      floatingActionButton: SizedBox(
        height: 200,
        width: 300,
        child: Card.outlined(
          color: Color.fromARGB(255, 255, 255, 190),
          elevation: 8,
          child: Markdown(
            data: """
#### Tight Constraints amb SizedBox (2)

El giny `Center` estableix les restriccions *loose* mitjançant el widget `ConstrainedBox`:

```dart
Center(
  child: ConstrainedBox(
    constraints: BoxConstraints(
      minWidth: 50, minHeight: 50,
      maxWidth: 300, maxHeight: 300,
    ),
    child: SizedBox(
      width: 200,
      height: 150,
      child: Container(color: Colors.blue),
    ),
  ),
),        
```

En aquest cas, les restriccions són de 50 píxels lògics d'ample per 50 d'alçada i màximes de 300 d'ample per 300 d'alçada.

El `SizedBox` podria establir qualsevol mida  dins d'aquests límits, a la qual s'ajustarà el Container.
             """,
          ),
        ),
      ),
    );
  }
}
