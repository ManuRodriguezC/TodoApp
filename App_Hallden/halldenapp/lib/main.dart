import 'package:flutter/material.dart';
import 'package:halldenapp/UI/Intray/intray_page.dart';
import 'package:halldenapp/models/global.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hallden App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
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
