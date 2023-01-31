import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // String name = "";

  @override
  void initState() {
    super.initState();
    // islogin();
  }

  // void islogin() async {
  //   SharedPreferences sp = await SharedPreferences.getInstance();
  //   name = sp.getString('string') ?? "";
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shared Preferences"),
      ),
      body: Column(
        children: [
          FutureBuilder(
            future: SharedPreferences.getInstance(),
              builder: (context, AsyncSnapshot<SharedPreferences> snapshot) {
            return Text(snapshot.data!.getString('string').toString());
          })
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          SharedPreferences sp = await SharedPreferences.getInstance();
          sp.setInt('numint', 20);
          sp.setDouble('numdouble', 20.6);
          sp.setString('string', 'Nimra Amjad');
          sp.setBool('islogin', false);
          // name = sp.getString('string') ?? "null he";
          // setState(() {});
          print(sp.getInt('numint'));
          print(sp.getDouble('numdouble'));
          print(sp.getString('string'));
          print(sp.getBool('islogin'));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
