import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pokedex_app/di_container.dart';
import 'package:pokedex_app/features/pokemons/presentation/providers/pokemon_store.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PokemonStore pokemonProvider;
  @override
  void initState() {
    pokemonProvider = getIt<PokemonStore>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(),
          body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          pokemonProvider.fetchPokemons('');
                        },
                        child: const Text('llamar pokemons')),
                  ],
                ),
                SizedBox(
                  height: 300,
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemBuilder: (_, index) {
                        return Text(pokemonProvider.pokemonList[index].name);
                      },
                      itemCount: pokemonProvider.pokemonList.length),
                )
              ]),
        );
      },
    );
  }
}
