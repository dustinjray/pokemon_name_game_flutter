import 'package:flutter/material.dart';
import 'package:pokemon_name_game/guess_entry_form.dart';
import 'package:pokemon_name_game/model/pokemon.dart';
import 'package:pokemon_name_game/repository.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  List<Pokemon> _allPokemon = [];

  bool checkGuess(String? guess) {
    if (guess == null || guess.isEmpty) {
      return false;
    }
    bool result = _allPokemon.any((pkmn) {
      bool isMatch = !pkmn.guessed && equalsIgnoreCase(pkmn.name, guess);
      if (isMatch) {
        pkmn.guessed = true;
      }
      return isMatch;
    });
    return result;
  }

  @override
  initState() {
    super.initState();
    fetchAllPokemon().then((pokemons) {
      setState(() {
        _allPokemon = pokemons;
        //print('$_allPokemon: _allPokemon');
        print('setting pokemon list, size: ${_allPokemon.length}');
      });
    });
  }

  bool equalsIgnoreCase(String? str1, String? str2) {
    if ((str1 == null || str1.isEmpty) || (str2 == null || str2.isEmpty)) {
      return false;
    }
    return str1.toLowerCase() == str2.toLowerCase();
  }

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.max, children: [
      Expanded(
        child: SingleChildScrollView(
            child: Column(
                children: _allPokemon
                    .map(
                        (pokemon) => Text(pokemon.guessed ? pokemon.name! : ""))
                    .toList())),
      ),
      GuessEntryForm(checkGuessFunction: checkGuess)
    ]);
  }
}
