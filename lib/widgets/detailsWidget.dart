import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pokemon_app/model/pokemon_model.dart';

class DetailWidget extends GetWidget {
  final PokemonElement pokemonElement;

  DetailWidget(this.pokemonElement);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          height: MediaQuery.of(context).size.height / 1.5,
          width: MediaQuery.of(context).size.width - 20,
          left: 10.0,
          top: MediaQuery.of(context).size.height * 0.1,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SizedBox(
                  height: 70.0,
                ),
                Text(
                  pokemonElement.name,
                  style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                ),
                Text("Height: ${pokemonElement.height}"),
                Text("Weight: ${pokemonElement.weight}"),
                Text(
                  "Types",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: pokemonElement.type
                      .map((t) => FilterChip(
                          backgroundColor: Colors.amber,
                          label: Text("${t}"),
                          onSelected: (b) {}))
                      .toList(),
                ),
                Text("Weakness", style: TextStyle(fontWeight: FontWeight.bold)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: pokemonElement.weaknesses
                      .map((t) => FilterChip(
                          backgroundColor: Colors.red,
                          label: Text(
                            t.toString(),
                            style: TextStyle(color: Colors.white),
                          ),
                          onSelected: (b) {}))
                      .toList(),
                ),
                Text("Next Evolution",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: pokemonElement.nextEvolution == null
                      ? <Widget>[Text("This is the final form")]
                      : pokemonElement.nextEvolution
                          .map((n) => FilterChip(
                                backgroundColor: Colors.green,
                                label: Text(
                                  n.name,
                                  style: TextStyle(color: Colors.white),
                                ),
                                onSelected: (b) {},
                              ))
                          .toList(),
                )
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Hero(
              tag: pokemonElement.img,
              child: Container(
                height: 200.0,
                width: 200.0,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(pokemonElement.img))),
              )),
        )
      ],
    );
  }
}
