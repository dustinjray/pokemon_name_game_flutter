import 'dart:convert';

import 'package:http/http.dart';
import 'package:pokemon_name_game/model/pokemon.dart';

String _baseUrl = 'https://pokeapi.co/api/v2/pokemon/';

Future<List<Pokemon>> fetchAllPokemon() async {
  List<Pokemon> res = [];
  print('fetching pokemon...');
  for (int i = 1; i < 152; i++) {
    var resp = await fetchPokemon(i);
    //print('awaited response: $resp');
    res.add(resp);
  }
  //print('res: $res');
  return res;
}

Future<Pokemon> fetchPokemon(int id) {
  final response = get(Uri.parse('$_baseUrl/$id'))
      .then((res) => Pokemon.fromJSON(jsonDecode(res.body)));
  // Pokemon res = Pokemon.fromJSON(jsonDecode(response.body));
  // print(res);
  // return res;
  return response;
}
