import 'package:flutter/material.dart';
import 'package:vitenotes/pages/detail.dart';
import 'package:vitenotes/pages/nouvelle_note.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var texte =
        "Ceci 1 est un message de teste de contenu de l'affichage des historiques de messages";
    var titre = "Teste de Titre";
    bool choix = true;
    return Scaffold(
        appBar: AppBar(
          title: const Text("ViteNotes"),
          elevation: 2,
          centerTitle: true,
        ),
        body: GridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 5,
            padding: const EdgeInsets.all(8),
            children: [
              InkWell(
                child: CadreNote(
                    choix: choix, title: titre, details: texte, date: "20h05"),
                onTap: () {
                  var route = MaterialPageRoute(
                      builder: (BuildContext context) => DetailsNotes(
                            choix: choix,
                            texte: texte,
                            titre: titre,
                          ));
                  Navigator.of(context).push(route);
                },
              ),
              CadreNote(
                  choix: false,
                  title: "Titre 2",
                  details:
                      "Ceci 2 est un message de teste de contenu de l'affichage des historiques de messages",
                  date: "20h10"),
              CadreNote(
                  choix: false,
                  title: "Titre 3",
                  details:
                      "Ceci 3 est un message de teste de contenu de l'affichage des historiques de messages",
                  date: "20h14"),
              CadreNote(
                  choix: true,
                  title: "Titre 4",
                  details:
                      "Ceci 4 est un message de teste de contenu de l'affichage des historiques de messages",
                  date: "20h15"),
              CadreNote(
                  choix: false,
                  title: "Titre 4",
                  details:
                      "Ceci 4 est un message de teste de contenu de l'affichage des historiques de messages",
                  date: "20h18"),
              CadreNote(
                  choix: false,
                  title: "Titre 4",
                  details:
                      "Ceci 4 est un message de teste de contenu de l'affichage des historiques de messages",
                  date: "20h20"),
              CadreNote(
                  choix: true,
                  title: "Titre 4",
                  details:
                      "Ceci 4 est un message de teste de contenu de l'affichage des historiques de messages",
                  date: "20h25"),
              CadreNote(
                  choix: true,
                  title: "Titre 4",
                  details:
                      "Ceci 4 est un message de teste de contenu de l'affichage des historiques de messages",
                  date: "20h28"),
            ]),
        floatingActionButton: FloatingActionButton(
            heroTag: 'keys',
            onPressed: () {
              var route = MaterialPageRoute(
                  builder: (BuildContext context) => const Notes());
              Navigator.of(context).push(route);
            },
            child: const Icon(Icons.add)));
  }
}

class CadreNote extends StatelessWidget {
  final String title;
  final String details;
  final String date;
  final bool choix;
  const CadreNote(
      {super.key,
      required this.title,
      required this.details,
      required this.date,
      required this.choix});

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Card(
      elevation: 5,
      //color: Colors.grey.shade200,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: w / 2.7,
                height: h / 30,
                child: Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Center(
                    child: Text(
                      title,
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Icon(
                (choix == true) ? Icons.favorite : Icons.favorite_outline_sharp,
                color: Colors.red,
              )
            ],
          ),
          Container(
              decoration: BoxDecoration(
                  //color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(10)),
              height: h / 7,
              width: w / 2.5,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(details),
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: Text(
                  date,
                  style: TextStyle(color: Colors.grey.shade600),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
