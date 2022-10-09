import 'package:flutter/material.dart';
import '/pages/connexion.dart';
import '/pages/inscription.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: const Color.fromRGBO(7, 9, 10, 1),
      )),
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
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(widget.title),
      //),
      body: Container(
        color: const Color.fromARGB(255, 255, 235, 59),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                //color: Colors.red,
                width: 350,
                height: 250,
                margin: const EdgeInsets.only(bottom: 100),
                child: Image.asset('images/3.jpg'),
              ),
              Container(
                alignment: Alignment.center,
                child: const Text(
                  "Build Awesome Apps",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                width: 250,
                child: const Text(
                  "Let's put your creativity on the development highway",
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Container(
                  margin: const EdgeInsets.only(left: 25, right: 25, top: 30),
                  child: SizedBox(
                    height: 45,
                    width: 150,
                    child: ElevatedButton(
                        onPressed: () {
                          var route = MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const Connexion());
                          Navigator.of(context).push(route);
                        },
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Color.alphaBlend(
                                    Colors.transparent, Colors.transparent)),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                    side: const BorderSide(
                                        color: Colors.black)))),
                        child: const Text(
                          'LOGIN',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        )),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 25, right: 25, top: 30),
                  child: SizedBox(
                    height: 45,
                    width: 150,
                    child: ElevatedButton(
                        onPressed: () {
                          var route = MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const Inscription());
                          Navigator.of(context).push(route);
                        },
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                    side: const BorderSide(
                                        color: Colors.black)))),
                        child: const Text(
                          'SIGN UP',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        )),
                  ),
                ),
              ])
            ],
          ),
        ),
      ),
    );
  }
}
