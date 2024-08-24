import 'package:flutter/material.dart';

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

  void _showFieldDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Dialog'),
          content: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Text',
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Cancel"),
            ),
            FilledButton(
              onPressed: () {
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 15, 15, 8),
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
          padding: const EdgeInsets.fromLTRB(15, 8, 15, 15),
          child: Text('Your gender is $_select'),
        ),

        Padding(
          padding: const EdgeInsets.fromLTRB(15, 15, 15, 8),
          child: const Text('Checkbox tile'),
        ),

        ListTile(
          leading: Checkbox(
            value: _isChecked,
            onChanged: _toggleChecked,
          ),
          title: const Text('test'),
        ),

        Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Text field'),

              SizedBox(height: 15),

              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Text',
                ),
              ),

              SizedBox(height: 15),

              FilledButton(
                child: const Text('dialog'),
                onPressed: () {
                  _showFieldDialog(context);
                }
              ),
            ],
          ),
        ),
      ],
    );
  }
}
