import '../widgets/character_item_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/constants/app_colors.dart';
import '../../data/cubit/cubit/character_cubit.dart';
import '../../data/cubit/cubit/character_state.dart';
import '../../data/models/character_model/character_model.dart';

class CharacterScreen extends StatefulWidget {
  const CharacterScreen({super.key});

  @override
  State<CharacterScreen> createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharacterScreen> {
  bool isSrearching = false;
  final searchController = TextEditingController();
  final List<CharacterModel> characters = []; // List<CharacterModel>
  List<CharacterModel> searchedForCharacters = []; // List<CharacterModel>
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
          characters.clear();
          characters.addAll(state.characters);
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
  


  Widget buildSearchField() {
    return TextField(
        style: const TextStyle(color: AppColors.myGrey, fontSize: 18),
        controller: searchController,
        decoration: const InputDecoration(
          hintText: 'Find a character ....',
          hintStyle: TextStyle(color: AppColors.myGrey),
          border: InputBorder.none,
        ),
        onChanged: (searchedCharacter) {
          addSearchedForItemToSearchedList(searchedCharacter);
        });
  }

void addSearchedForItemToSearchedList(String searchedCharacter) {
  setState(() {
    searchedForCharacters = characters
        .where((character) =>
            character.name.toLowerCase().startsWith(searchedCharacter.toLowerCase())) // ✅ استخدام contains بدلاً من startsWith
        .toList();
  });
  print(searchedForCharacters);
}

  Widget buildLoadedListWidgets(List<CharacterModel> characters) {
    return Container(
      width: double.infinity,
      color: AppColors.myGrey,
      child: buildCharactersList(characters),
    );
  }

  List<Widget> buildAppBarActions() {
    if (isSrearching) {
      return [
        IconButton(
          onPressed: () {
            setState(() {
              _clearSearch();
              Navigator.pop(context);
            });
          },
          icon: const Icon(Icons.close),
          color: AppColors.myGrey,
        ),
      ];
    } else {
      return [
        IconButton(
          onPressed: () {
            startSearching();
          },
          icon: const Icon(Icons.search),
          color: AppColors.myGrey,
        ),
      ];
    }
  }

  void startSearching() {
    ModalRoute.of(context)
        ?.addLocalHistoryEntry(LocalHistoryEntry(onRemove: () {
      stopSearching();
    }));
    setState(() {
      isSrearching = true;
    });
  }

  void stopSearching() {
    setState(() {
      isSrearching = false;
      _clearSearch();
    });
  }

  void _clearSearch() {
    setState(() {
      searchController.clear();
    });
  }

  Widget buildCharactersList(List<CharacterModel> characters) {
  final listToShow = searchController.text.isNotEmpty
      ? searchedForCharacters
      : characters;

  return GridView.builder(
    padding: EdgeInsets.zero,
    shrinkWrap: true,
    physics: const ClampingScrollPhysics(),
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisSpacing: 1,
      childAspectRatio: 3 / 2,
      mainAxisSpacing: 1,
      crossAxisCount: 2,
    ),
    itemCount: listToShow.length, // ✅ استخدام القائمة الصحيحة
    itemBuilder: (context, index) {
      return CharacterItemViewBody(
        character: listToShow[index],
      );
    },
  );
}

  Widget buildAppBarTitle() {
    return const Text(
      'Characters',
      style: TextStyle(color: AppColors.myGrey),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.myYellow,
        centerTitle: true,
        title: isSrearching ? buildSearchField() : buildAppBarTitle(),
        actions: buildAppBarActions(),
      ),
      body: buildBlocWidget(),
    );
  }
}
