import 'package:flutter/material.dart';
import 'package:flutter_talk/counter_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _title = 'Flutter Talk';

  void changeTitle() {
    setState(() {
      _title = 'Flutter Talk Changed';
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Align(
          alignment: Alignment.topLeft,
          child: Text(_title),
        ),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'TESTE',
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          changeTitle();
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (_) => const CounterPage(),
          //   ),
          // );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
