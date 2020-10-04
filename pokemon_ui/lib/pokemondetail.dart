import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_ui/pokemon.dart';

class PokemonDetail extends StatelessWidget {
  final Pokemon pokemon;
  PokemonDetail({this.pokemon});

  bodyWidget(BuildContext context) => Stack(
        children: <Widget>[
          Positioned(
            height: MediaQuery.of(context).size.height / 1.4,
            width: MediaQuery.of(context).size.width - 20,
            left: 10.0,
            top: MediaQuery.of(context).size.height * 0.1,
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SizedBox(height: 120),
                  Text(pokemon.name,
                      style: TextStyle(
                          fontSize: 25.0, fontWeight: FontWeight.bold)),
                  Text("Height :${pokemon.height}"),
                  Text("Weight :${pokemon.weight}"),
                  Text(
                    "Type",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: pokemon.type
                          .map((t) => FilterChip(
                                label: Text(t),
                                onSelected: (b) {},
                                backgroundColor: Colors.amber,
                              ))
                          .toList()),
                  Text(
                    "Weakness",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: pokemon.weaknesses
                          .map((t) => FilterChip(
                                label: Text(
                                  t,
                                  style: TextStyle(color: Colors.white),
                                ),
                                onSelected: (b) {},
                                backgroundColor: Colors.red,
                              ))
                          .toList()),
                  Text(
                    "Next Evolution",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: pokemon.nextEvolution == null
                          ? <Widget>[Text("This is the final form")]
                          : pokemon.nextEvolution
                              .map((n) => FilterChip(
                                    label: Text(
                                      n.name,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    onSelected: (b) {},
                                    backgroundColor: Colors.green,
                                  ))
                              .toList())
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Hero(
                tag: pokemon.img,
                child: Container(
                  height: 200.0,
                  width: 200.0,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover, image: NetworkImage(pokemon.img))),
                )),
          )
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      appBar: AppBar(
        title: Text(pokemon.name),
        backgroundColor: Colors.cyan,
        elevation: 0.0,
      ),
      body: bodyWidget(context),
    );
  }
}
