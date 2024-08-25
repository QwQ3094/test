import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool _useMaterial3 = true;
  bool _brightness = false;

  void _toggleMaterial3(bool value) {
    setState(() {
      _useMaterial3 = value;
    });
  }
  
  void _toggleBrightness(bool value) {
    setState(() {
      _brightness = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView(
        children: [
          PreferenceTitle(text: '主题'),
          
          SwitchPreference(
            iconData: Icons.filter_3,
            title: '使用Material 3',
            subtitle: '选择是否材料设计3',
            isChecked: _useMaterial3,
            onChecked: _toggleMaterial3,
          ),
          SwitchPreference(
            iconData: Icons.brightness_4,
            title: '黑暗模式',
            subtitle: '选择是否开启黑暗模式',
            isChecked: _brightness,
            onChecked: _toggleBrightness,
          ),
        ],
      ),
    );
  }
}

class PreferenceTitle extends StatelessWidget {
  const PreferenceTitle({
    super.key,
    required this.text
  });
  
  final String text;
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Text(
        text,
        style: TextStyle(color: Theme.of(context).primaryColor),
      )
    );
  }
}

class SwitchPreference extends StatefulWidget {
  SwitchPreference({
    super.key,
    required this.iconData,
    required this.title,
    required this.subtitle,
    required this.isChecked,
    required this.onChecked,
  });

  final IconData iconData;
  final String title;
  final String subtitle;
  final bool isChecked;
  final void Function(bool) onChecked;

  @override
  State<SwitchPreference> createState() => _SwitchPreferenceState();
}

class _SwitchPreferenceState extends State<SwitchPreference> {
  IconData get iconData => widget.iconData;
  String get title => widget.title;
  String get subtitle => widget.subtitle;
  bool get isChecked => widget.isChecked;
  Function(bool) get onChecked => widget.onChecked;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(iconData),
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: Switch(
        value: isChecked,
        onChanged: onChecked,
      ),
    );
  }
}
