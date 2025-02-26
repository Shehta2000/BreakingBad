import '../../data/models/character_model/character_model.dart';
import 'character_item_view_body.dart';
import 'package:flutter/material.dart';

class CharacterItemView extends StatelessWidget {
  final CharacterModel character;
  const CharacterItemView({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return CharacterItemViewBody(character: character);
  }
}

