import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pokemon_app/model/pokemon_model.dart';

class PokemonController extends GetxController {
  RxInt currentIndex = 0.obs;
  //this function is gonna fetch data from API and retrun it as an object of dart after decoding it from string to json
  //and then turn it to dart object by using fromJosn() method
  Future<Pokemon> getData() async {
    final url = Uri.parse(
        "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      //ok
      //returning dart object form json url

      //or jsonDecode()
      return Pokemon.fromJson(jsonDecode(response.body));
    } else {
      throw Exception();
    }
  }
}
