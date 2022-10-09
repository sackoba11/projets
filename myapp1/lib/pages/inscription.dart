import 'package:flutter/material.dart';
import 'entete.dart';
//import 'saisis.dart';

class Inscription extends StatelessWidget {
  const Inscription({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: const Color.fromARGB(206, 5, 60, 116),
          ),
          visualDensity: VisualDensity.adaptivePlatformDensity),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
            padding: const EdgeInsets.only(top: 60),
            children: <Widget>[
          Column(
            children: [
              Container(
                child: entete("title", "btitle"),
              ),
              Container(
                height: 45,
                margin: const EdgeInsets.only(left: 25, right: 25),
                child: TextFormField(
                  decoration: const InputDecoration(
                      labelText: "Last name",
                      hintText: "Your last name",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)))),
                  keyboardType: TextInputType.text,
                  autocorrect: true,
                  //autofocus: true,
                ),
              ),
              const Card(
                margin: EdgeInsets.only(bottom: 10),
              ),
              Container(
                height: 45,
                margin: const EdgeInsets.only(left: 25, right: 25),
                child: TextFormField(
                  decoration: const InputDecoration(
                      labelText: "First Name",
                      hintText: "Your first name",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)))),
                  autocorrect: true,
                  //autofocus: true,
                  keyboardType: TextInputType.text,
                ),
              ),
              const Card(
                margin: EdgeInsets.only(bottom: 10),
              ),
              Container(
                height: 45,
                margin: const EdgeInsets.only(left: 25, right: 25),
                child: TextFormField(
                  decoration: const InputDecoration(
                      labelText: "Phone Number",
                      hintText: "Your Phone number",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)))),
                  keyboardType: TextInputType.phone,
                  autocorrect: true,
                  //autofocus: true,
                ),
              ),
              const Card(
                margin: EdgeInsets.only(bottom: 10),
              ),
              Container(
                height: 45,
                margin: const EdgeInsets.only(left: 25, right: 25),
                child: TextFormField(
                  decoration: const InputDecoration(
                      labelText: "Email",
                      hintText: "Your email",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)))),
                  keyboardType: TextInputType.text,
                  autocorrect: true,
                  //autofocus: true,
                ),
              ),
              const Card(
                margin: EdgeInsets.only(bottom: 10),
              ),
              Container(
                height: 45,
                margin: const EdgeInsets.only(left: 25, right: 25),
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Password",
                    hintText: "Your password",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                  ),
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  autocorrect: true,
                  //autofocus: true,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 25, right: 25, top: 50),
                child: SizedBox(
                  height: 45,
                  child: ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        //side: BorderSide(color: Colors.red)
                      ))),
                      child: const Text('Create Account')),
                ),
              ),
              Container(
                  color: Colors.red,
                  child: const Text(
                    "OR",
                    style: TextStyle(color: Colors.black),
                  )),
              Container(
                margin: const EdgeInsets.only(left: 25, right: 25, top: 30),
                child: SizedBox(
                  height: 45,
                  child: ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        //side: BorderSide(color: Colors.red)
                      ))),
                      child: const Text('SIGN UP WITH GOOGLE')),
                ),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                const Text("Already have an account ?"),
                Container(
                  alignment: Alignment.bottomRight,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                      // Navigator.push(context,
                      //     MaterialPageRoute<void>(builder: (BuildContext context) {
                      //   return const MyApp();
                      // }));
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(
                          color: Color.fromARGB(255, 4, 57, 101),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ])
            ],
          )
        ]));
  }
}
