import '../widgets/character_item_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/constants/app_colors.dart';
import '../../data/cubit/cubit/character_cubit.dart';
import '../../data/cubit/cubit/character_state.dart';
import '../../data/models/character_model/character_model.dart';
import '../widgets/character_item_view.dart';

class CharacterScreen extends StatefulWidget {
  const CharacterScreen({super.key});

  @override
  State<CharacterScreen> createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharacterScreen> {
  @override
  void initState() {
    super.initState();
    // });
  }

  Widget buildBlocWidget() {
    return BlocBuilder<CharacterCubit, CharacterState>(
      builder: (context, state) {
        if (state is CharactersLoading) {
          return const Center(
              child: CircularProgressIndicator(color: AppColors.myYellow));
        } else if (state is CharactersLoaded) {
          return buildLoadedListWidgets(state.characters);
        } else if (state is CharactersError) {
          return Center(
              child: Text(state.message, // ✅ استخدام `message` بدلاً من `e`
                  style: const TextStyle(color: Colors.red)));
        }
        return const Center(child: Text('No Data Available'));
      },
    );
  }

  Widget buildLoadedListWidgets(List<CharacterModel> characters) {
    return Container(
      width: double.infinity,
      color: AppColors.myGrey,
      child: buildCharactersList(characters),
    );
  }

  Widget buildCharactersList(List<CharacterModel> characters) {
    return GridView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const ClampingScrollPhysics (),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisSpacing: 1,
        childAspectRatio: 3 / 2,
        mainAxisSpacing: 1,
        crossAxisCount: 2,
      ),
      itemCount: characters.length,
      itemBuilder: (context, index) {
        return CharacterItemViewBody(character: characters[index]);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.myYellow,
        centerTitle: true,
        title: const Text(
          'Character Screen',
          style: TextStyle(color: AppColors.myGrey),
        ),
      ),
      body: buildBlocWidget(),
    );
  }
}
