import 'package:flutter/material.dart';
import 'package:halldenapp/UI/Intray/intray_page.dart';
import 'package:halldenapp/UI/Login/loginscreen.dart';
import 'package:halldenapp/bloc/blocs/user_bloc_provider.dart';
import 'package:halldenapp/models/global.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:halldenapp/models/classes/user.dart';
import 'package:halldenapp/bloc/blocs/user_bloc_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hallden App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
      /*FutureBuilder(
        future: getUser(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.none &&
              snapshot.hasData == Null) {
            return Container();
          }
          return ListView.builder(
            itemCount: snapshot.data.lenght,
            itemBuilder: (context, index) {
              return Column(children: []);
            },
          );
        },
      ),*/
    );
  }

  Future getUser() async {
    var result = await http.get("http://127.0.0.1:5000/api/register");
    print(result.body);
    return result;
  }

  asyncFunc() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
  }

  Future<String> getApiKey() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String apiKey;
    try {
      apiKey = prefs.getString('API_TOKEN');
    } catch (Exception) {
      apiKey = "";
    }
    return apiKey;
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.yellow,
      home: SafeArea(
          child: DefaultTabController(
        length: 3,
        // ignore: unnecessary_new
        child: new Scaffold(
          body: Stack(children: [
            TabBarView(children: [
              // ignore: unnecessary_new
              IntrayPage(),
              // ignore: unnecessary_new
              new Container(
                color: Colors.green,
              ),
              // ignore: unnecessary_new
              new Container(
                color: Colors.red,
              ),
            ]),
            Container(
                padding: EdgeInsets.only(left: 50),
                height: 140,
                // ignore: prefer_const_constructors
                decoration: BoxDecoration(
                    // ignore: prefer_const_constructors
                    borderRadius: BorderRadius.only(
                        bottomRight: const Radius.circular(40),
                        bottomLeft: const Radius.circular(40)),
                    color: Colors.white),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Intray", style: intrayTitleStyle),
                    Container(),
                  ],
                )),
            Container(
              height: 80,
              width: 80,
              margin: EdgeInsets.only(
                  top: 100, left: MediaQuery.of(context).size.width * 0.39),
              child: FloatingActionButton(
                backgroundColor: redColor,
                onPressed: () {},
                child: const Icon(Icons.add, size: 70),
              ),
            )
          ]),
          appBar: new TabBar(
            tabs: [
              const Tab(
                icon: Icon(Icons.home),
              ),
              const Tab(
                icon: Icon(Icons.rss_feed),
              ),
              const Tab(
                icon: Icon(Icons.perm_identity),
              ),
            ],
            labelColor: Colors.black,
            unselectedLabelColor: Colors.blue,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorPadding: EdgeInsets.all(5.0),
            indicatorColor: Colors.transparent,
          ),
          backgroundColor: Colors.white,
        ),
      )),
    );
  }
}
