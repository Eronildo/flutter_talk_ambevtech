import 'dart:async';

import 'package:flutter/material.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

sealed class CounterState {}

class CounterInitial extends CounterState {}

class CounterError extends CounterState {
  final Exception exception;
  CounterError({required this.exception});
}

class CounterData extends CounterState {
  int state;
  CounterData({required this.state});
}

class _CounterPageState extends State<CounterPage> {
  CounterState state = CounterInitial();
  late StreamSubscription subscription;

  @override
  void initState() {
    super.initState();

    final stream = countStream(10);
    subscription = stream.listen((event) {
      setState(() {
        state = event;
      });
    });
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  Future<String> getMessage(String message) async {
    await Future.delayed(const Duration(seconds: 3));

    return Future.error(Exception('Erro no servidor'));
  }

  Stream<CounterState> countStream(int to) async* {
    yield CounterInitial();
    for (int i = 1; i <= to; i++) {
      await Future.delayed(const Duration(seconds: 3));
      if (i == 4 || i == 9) {
        yield CounterError(exception: Exception('Intentional exception'));
      } else {
        yield CounterData(state: i);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            switch (state) {
              CounterInitial() => const CircularProgressIndicator.adaptive(),
              CounterError(exception: final error) => Text('$error'),
              CounterData(state: final count) => Text('$count')
            },
            FutureBuilder(
              future: getMessage('Flutter Talk'),
              builder: (context, snapshot) => switch (snapshot) {
                AsyncSnapshot(hasData: true, data: final data) => Text('$data'),
                AsyncSnapshot(hasError: true, error: final error) =>
                  Text('$error'),
                _ => const CircularProgressIndicator.adaptive()
              },
            ),
          ],
        ),
      ),
    );
  }
}
