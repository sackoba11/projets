import 'package:flutter/material.dart';

import 'entete.dart';

class Connexions extends StatelessWidget {
  const Connexions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: const Color.fromARGB(206, 5, 60, 116),
          ),
          visualDensity: VisualDensity.adaptivePlatformDensity),
      home: const Connexion(),
    );
  }
}

class Connexion extends StatefulWidget {
  const Connexion({super.key});

  @override
  State<Connexion> createState() => _ConnexionState();
}

class _ConnexionState extends State<Connexion> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            child: entete('tilte', 'subtitle'),
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
            ),
          ),
          Container(
              margin: const EdgeInsets.only(left: 60, right: 30),
              alignment: Alignment.bottomRight,
              // margin: const EdgeInsets.only(left: 80),
              child: InkWell(
                onTap: () {},
                child: const Text(
                  "Forgot Password?",
                  style: TextStyle(
                      color: Color.fromARGB(255, 4, 57, 101),
                      fontWeight: FontWeight.bold),
                ),
              )),
          Container(
            margin: const EdgeInsets.only(left: 25, right: 25, top: 30),
            child: SizedBox(
              height: 45,
              child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    //side: BorderSide(color: Colors.red)
                  ))),
                  child: const Text('Login')),
            ),
          ),
          const SizedBox(
            height: 15,
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
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    //side: BorderSide(color: Colors.red)
                  ))),
                  child: const Text('SIGN UP WITH GOOGLE')),
            ),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Text("Don't have an account ?"),
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
                  "Sign up",
                  style: TextStyle(
                      color: Color.fromARGB(255, 4, 57, 101),
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ]),
        ],
      ),
    );
  }
}
