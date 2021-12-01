import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:pokemon_app/model/pokemon_model.dart';
import 'package:pokemon_app/widgets/detailsWidget.dart';

class PokemonDetails extends GetWidget {
  final PokemonElement pokemon;

  PokemonDetails({this.pokemon});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        elevation: 0.0,
        title: Text(pokemon.name),
        centerTitle: true,
      ),
      body: DetailWidget(pokemon),
    );
  }
}
