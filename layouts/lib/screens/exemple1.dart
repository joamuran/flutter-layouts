import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class Exemple1 extends StatelessWidget {
  const Exemple1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exemple 1. Tight Constraints amb SizedBox'),
      ),
      body: Center(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            debugPrint('Límit de mides que rep SizedBox: $constraints');
            return SizedBox(
              width: 200,
              height: 150,
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  debugPrint('Límit de mides que rep Container: $constraints');
                  return Container(color: Colors.blue);
                },
              ),
            );
          },
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
#### Tight Constraints amb SizedBox (1)

El giny `Center` envia restriccions *loose* al `SizedBox`, i aquest restriccions tight al `Container`:

```dart
Center(
  child: SizedBox(
    width: 200,
    height: 150,
    child: Container(color: Colors.blue),
  ),
)
```

El `Container` s'ajustarà doncs a la mida de 200x150 establerta pel SizedBox.
""",
          ),
        ),
      ),
    );
  }
}
