import 'package:flutter/material.dart';
Future<void> main () async {
  runApp(MaterialApp(home: MinuteApp()));
}

class MinuteApp extends StatefulWidget {
  const MinuteApp({super.key});

  @override
  State<MinuteApp> createState() => _MinuteAppState();
}

class _MinuteAppState extends State<MinuteApp> {
  int screenIndex = 0;
  List screen = [
    HomeScreen(),
    SettingsScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Minute"),),
      body: screen[screenIndex],
      bottomNavigationBar: NavigationBar(
        destinations: [
          NavigationDestination(icon: Icon(Icons.home), label:"Home"),
          NavigationDestination(icon: Icon(Icons.settings), label: "Settings")],
        onDestinationSelected: (int index){
          setState(() {
            screenIndex = index;
          });
        },
      selectedIndex: screenIndex,),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _messageFieldController = TextEditingController();
  List<String> messages = [];
  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      body: Placeholder(),
      bottomNavigationBar: Column(children: [
        Text("$messages"),
        Row(children: [
          Expanded(child: TextField(
            decoration: InputDecoration(label : Text("Enter message")),
            controller: _messageFieldController,
            onSubmitted: (String input){
              setState(() {
                messages.add(input);
              });
            },
          )),
          IconButton(onPressed: (){
            setState(() {
              messages.add(_messageFieldController.text);
            });
          }, icon: Icon(Icons.send))
        ],)
      ],),
    )
    );
  }
}

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Text("settings");
  }
}
