import 'package:flutter/material.dart';

class DetailsNotes extends StatelessWidget {
  final String titre;
  final String texte;
  final bool choix;
  const DetailsNotes(
      {super.key,
      required this.titre,
      required this.texte,
      required this.choix});

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Détails de la note"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Card(
            elevation: 5,
            //color: Colors.grey.shade300,
            margin: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: w / 1.25,
                  height: h / 20,
                  child: Center(
                      child: Text(
                    titre,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  )),
                ),
                Icon(
                  (choix == true)
                      ? Icons.favorite
                      : Icons.favorite_outline_sharp,
                  color: Colors.red,
                )
              ],
            ),
          ),
          Card(
            elevation: 5,
            //color: Colors.grey.shade300,
            child: SizedBox(
              height: h / 1.3,
              width: w - 20,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  texte,
                  style: const TextStyle(fontSize: 18),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
