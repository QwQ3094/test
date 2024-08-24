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
