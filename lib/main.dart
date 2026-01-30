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

class _HomeScreenState extends State<HomeScreen>{
  List<String> messages = [];
  final TextEditingController _msgController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemBuilder: (BuildContext context, int index){
            String msg = messages[index];
            return(Text(msg));
          },
          itemCount: messages.length,

      ),
      bottomNavigationBar: Row(
        children: [
          Expanded(
              child: TextField(
                controller: _msgController,
                onSubmitted: (String input){
                  setState(() {
                    messages.add(input);
                  });
                  },
              )),
          IconButton.filled(
              onPressed: (){
                setState(() {
                  messages.add(_msgController.text);
                });
                },
              icon: Icon(Icons.arrow_upward))
        ],),);
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
