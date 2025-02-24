import 'package:breaking_bad/core/constants/app_colors.dart';
import 'package:breaking_bad/data/cubit/cubit/character_cubit.dart';
import 'package:breaking_bad/data/models/character_model/character_model.dart';
import 'package:breaking_bad/presentation/widgets/character_item.dart';
import 'package:flutter/material.dart';
/*************  ✨ Codeium Command ⭐  *************/
/// Initializes the state of the `CharacterScreen` by calling the parent
/// class's `initState` method. Prepares the `CharacterCubit` to load

/******  4ed98028-6efa-439f-a0ab-03ad2165e03e  *******/ import 'package:flutter_bloc/flutter_bloc.dart';

class CharacterScreen extends StatefulWidget {
  const CharacterScreen({super.key});

  @override
  State<CharacterScreen> createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharacterScreen> {
  late List<CharacterModel> allChatacters;

  @override
  void initState() {
    super.initState();
// allChatacters = BlocProvider.of<CharacterCubit>(context).getAllCharacters();
  }

 Widget buildBlocWidget() {
    return BlocBuilder<CharacterCubit, CharacterState>(
      builder: (context, state) {
        if (state is CharactersLoaded) {
          allChatacters = state.characters;
          return buildLoadedListidgets();
        } else {
          return const  Center(child:  CircularProgressIndicator(
            color: AppColors.myYellow,
          ));
        }
      },
    );

  }
 Widget buildLoadedListidgets(){
    return SingleChildScrollView(
      child: Container(
        color: AppColors.myGrey,
        child:   Column(
          children: [
            buildCharatersList(),

          ],
        ),
      ),
    );
     
  }
   buildCharatersList(){
    return GridView.builder(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.zero,
      
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
       crossAxisSpacing: 1,
       childAspectRatio: 3/2,
       mainAxisSpacing: 1,
       crossAxisCount:2,
       
    ), itemBuilder: (context,index){
      return const  CharacterItem();
    }
      
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
