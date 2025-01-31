import 'package:flutter/material.dart';
import 'package:shared_pref_demo/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shared Pref',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}









class SharedPref extends StatefulWidget {
  const SharedPref({super.key});

  @override
  State<SharedPref> createState() => _SharedPrefState();
}

class _SharedPrefState extends State<SharedPref> {
  static const String KEY_NAME = 'name';
   var nameValue = "NO Value Saved";
  final nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    getData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 32,right: 32,),
              child: TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  hintText: "Write Somethings"
                ),
              ),
            ),
            const SizedBox(height: 10,),
            ElevatedButton(
              onPressed: () async{
                final prefs = await SharedPreferences.getInstance();
                prefs.setString(KEY_NAME, nameController.text.toString());
                // final getName =prefs.getString(KEY_NAME);
                // nameValue = getName??"No value found";
                // setState(() {
                //
                // });

              },
              child: const Text("Click it"),
            ),
            const SizedBox(height: 10,),
            Text(nameValue),
          ],
        ),
      ),
    );
  }

  void getData() async{
    final prefs = await SharedPreferences.getInstance();
    final getName = prefs.getString(KEY_NAME);
    nameValue = getName ?? "No Value Saved";
    setState(() {

    });
  }
}
