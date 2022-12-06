import 'package:flutter/material.dart';

class Notes extends StatefulWidget {
  const Notes({super.key});

  @override
  State<Notes> createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  TextEditingController note = TextEditingController();
  TextEditingController titre = TextEditingController();
  bool choix = false;

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Nouvelle Note"),
      ),
      body: ListView(padding: EdgeInsets.only(top: h / 25), children: [
        Card(
          margin: const EdgeInsets.all(10),
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: TextFormField(
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                controller: titre,
                decoration: InputDecoration(
                    suffixIcon: InkWell(
                      onTap: () {
                        setState(() {
                          choix = !choix;
                        });
                      },
                      child: Icon(
                          choix == false
                              ? Icons.favorite_outline_outlined
                              : Icons.favorite,
                          color: Colors.red),
                    ),
                    hintText: "Donnez un Titre",
                    border: UnderlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(20)))),
          ),
        ),
        SizedBox(
          height: h / 1.5,
          child: Card(
            elevation: 3,
            margin: const EdgeInsets.all(10),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: TextFormField(
                style: const TextStyle(fontSize: 18),
                controller: note,
                maxLines: 100,
                autofocus: true,
                decoration: InputDecoration(
                    hintText: "Saisissez votre note",
                    border: UnderlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(20))),
              ),
            ),
          ),
        ),
      ]),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(left: w / 10),
            child: FloatingActionButton(
              heroTag: 'key',
              child: const Icon(Icons.restore_from_trash),
              onPressed: () {
                setState(() {
                  note.text = "";
                  titre.text = "";
                  choix = false;
                });
              },
            ),
          ),
          FloatingActionButton(
            heroTag: 'value',
            child: const Icon(Icons.save_as_rounded),
            onPressed: () {
              print(" Vous avez sauvegardé : ${note.text}");
              note.text = "";
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
