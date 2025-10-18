import 'package:flutter/material.dart';
import 'package:layouts/screens/exemple1.dart';
import 'package:layouts/screens/exemple2.dart';
import 'package:layouts/screens/exemple3.dart';
import 'package:layouts/screens/exemple4.dart';
import 'package:layouts/screens/exemple4_single_child_scroll_view.dart';
import 'package:layouts/screens/exemple4_solucio_expanded.dart';
import 'package:layouts/screens/exemple5.dart';
import 'package:layouts/screens/exemple5_sol.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exemples amb Layouts',
      initialRoute: '/',
      routes: {
        '/': (context) => const Menu(),
        '/exemple1': (context) => const Exemple1(),
        '/exemple2': (context) => const Exemple2(),
        '/exemple3': (context) => const Exemple3(),
        '/exemple4': (context) => const Exemple4(),
        '/exemple4_sol1': (context) => const Exemple4SolucioExpanded(),
        '/exemple4_sol2': (context) => const Exemple4SingleChildScrollView(),
        '/exemple5': (context) => const Exemple5(),
        '/exemple5_sol': (context) => const Exemple5Sol(),
      },
    );
  }
}

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Exemples amb Layouts')),
      body: Center(
        child: Padding(
          padding: EdgeInsetsGeometry.all(32),
          child: ListView(
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/exemple1');
                },
                child: Text("Exemple 1. Loose amb Center i Tight amb SizedBox"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/exemple2');
                },
                child: Text(
                  "Exemple 2. Loose amb Center, especificant restriccions",
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/exemple3');
                },
                child: Text("Exemple3: Unbounded Constraints amb ListView"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/exemple4');
                },
                child: Text("Exemple 4. Overflow vertical en Column"),
              ),
              /*ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/exemple4_sol1');
                },
                child: Text("Exemple 4. Solució amb Expanded"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/exemple4_sol2');
                },
                child: Text("Exemple 4. Solució amb SingleChildScrollView"),
              ),*/
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/exemple5');
                },
                child: Text(
                  "Exemple 5. Unbounded Height Error <br> Caldrà  reiniciar l'aplicació!",
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/exemple5_sol');
                },
                child: Text("Exemple 5. Solució amb Expanded."),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
