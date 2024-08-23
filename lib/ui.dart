import 'package:flutter/material.dart';
import 'navigation.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _counter = 0;
  bool _isSwitched = false;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _toggleSwitch(bool value) {
    setState(() {
      _isSwitched = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pressed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Switch is ${_isSwitched ? 'ON' : 'OFF'}'),
                const SizedBox(width: 10),
                Column(
                  children: [
                    Switch(
                      value: _isSwitched,
                      onChanged: _toggleSwitch,
                    ),
                    Switch(
                      value: _isSwitched,
                      onChanged: _toggleSwitch,
                    ),
                    Switch(
                      value: _isSwitched,
                      onChanged: _toggleSwitch,
                    ),
                  ],
                ),
              ],
            ),
            FilledButton(
              child: const Text('flutter'),
              onPressed: () {
                showTestDialog(context, () {
                  print("Test");
                });
              },
            ),
            const SizedBox(height: 10),
            FilledButton(
              child: const Text('navigation'),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const NavigationScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

void showTestDialog(BuildContext context, VoidCallback onConfirm) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Flutter"),
        content: Text("Welcome to flutter development!!"),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("Cancel"),
          ),
          FilledButton(
            onPressed: () {
              onConfirm();
              Navigator.of(context).pop();
            },
            child: Text("Sure"),
          ),
        ],
      );
    },
  );
}

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const <Widget>[
          Text('Business Screen'),
        ],
      ),
    );
  }
}

class SchoolScreen extends StatelessWidget {
  const SchoolScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const <Widget>[
          Text('School Screen'),
        ],
      ),
    );
  }
}
