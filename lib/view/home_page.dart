import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokemon_app/controller/pokemon_controller.dart';
import 'package:pokemon_app/model/pokemon_model.dart';
import 'package:pokemon_app/view/pokemon_details.dart';

class HomePage extends GetWidget {
  final PokemonController pokemonController = Get.put(PokemonController());
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Pokemon!"),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: FutureBuilder<Pokemon>(
        future: pokemonController.getData(),
        builder: (BuildContext context, AsyncSnapshot<Pokemon> snaphot) {
          if (snaphot.hasData) {
            return GridView.count(
              crossAxisCount: 2,
              children: snaphot.data.pokemon
                  .map((poke) => Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: InkWell(
                          onTap: () {
                            Get.to(() => PokemonDetails(
                                  pokemon: poke,
                                ));
                          },
                          child: Hero(
                            tag: poke.img,
                            child: Card(
                              elevation: 4.0,
                              child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      height: 100, //screenHeight * 0.2
                                      width: 100, //screenWidth * 0.2
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage(poke.img)),
                                      ),
                                    ),
                                    Text(
                                      poke.name,
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ]),
                            ),
                          ),
                        ),
                      ))
                  .toList(),
            );
          } else {
            return Center(
                child: CircularProgressIndicator(
              color: Theme.of(context).primaryColor,
            ));
          }
        },
      ),
      drawer: Drawer(
        elevation: 50,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "POKEMON APP",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.cyan,
                  backgroundColor: Colors.white60),
            ),
            Text(
              "Dm me on any Platform : ",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                backgroundColor: Colors.white60,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              "@Mohannad_Balam",
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.cyan,
                  backgroundColor: Colors.black),
            )
          ],
        ),
        semanticLabel: "Mohannad_balam",
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.cyan,
        child: Icon(Icons.refresh),
        onPressed: () {
          pokemonController.getData();
        },
      ),
    );
  }
}
