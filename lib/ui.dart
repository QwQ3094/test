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

class BusinessScreen extends StatefulWidget {
  const BusinessScreen({super.key});

  @override
  State<BusinessScreen> createState() => _BusinessScreenState();
}

class _BusinessScreenState extends State<BusinessScreen> {
  bool _isSwitched = false;

  void _toggleSwitch(bool value) {
    setState(() {
      _isSwitched = value;
    });
  }

  List<Widget> _getTiles() {
    List<Widget> list = [];
    for (var i = 0; i < 10; i++) {
      list.add(ListTile(
        leading: Icon(Icons.reply),
        title: Text('标题$i'),
        subtitle: Text('这是第$i个ListTile'),
      ));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: _getTiles(),
    );
  }
}

class SchoolScreen extends StatefulWidget {
  const SchoolScreen({super.key});

  @override
  State<SchoolScreen> createState() => _SchoolScreenState();
}

class _SchoolScreenState extends State<SchoolScreen> {
  String _select = 'male';
  bool _isChecked = false;

  void _selectRadio(String? value) {
    setState(() {
      _select = value!;
    });
  }

  void _toggleChecked(bool? checked) {
    setState(() {
      _isChecked = checked!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(25, 25, 25, 8),
          child: const Text('Select your gender.'),
        ),
        ListTile(
          leading: Radio<String>(
            value: 'male',
            groupValue: _select,
            onChanged: _selectRadio,
          ),
          title: const Text('male'),
        ),
        ListTile(
          leading: Radio<String>(
            value: 'female',
            groupValue: _select,
            onChanged: _selectRadio,
          ),
          title: const Text('female'),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(25, 8, 25, 25),
          child: Text('Your gender is $_select'),
        ),

        Padding(
          padding: const EdgeInsets.fromLTRB(25, 25, 25, 8),
          child: const Text('Checkbox tile'),
        ),

        ListTile(
          leading: Checkbox(
            value: _isChecked,
            onChanged: _toggleChecked,
          ),
          title: const Text('test'),
        ),
      ],
    );
  }
}
