import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/app_strings.dart';
import '../../data/models/character_model/character_model.dart';

class CharacterItemViewBody extends StatelessWidget {
  const CharacterItemViewBody({
    super.key,
    required this.character,
  });

  final CharacterModel character;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: AppColors.myWhite,
        borderRadius: BorderRadius.circular(6),
      ),
      child: InkWell(
        onTap: () {
          () => Navigator.pushNamed(context, AppStrings.characterDetailsScreen,
            arguments: character);
        },
        child: GridTile(
          footer: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            color: Colors.black54,
            alignment: Alignment.bottomCenter,
            child: Text(
              character.name,
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.myWhite,
                fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              textAlign: TextAlign.center
            ),
          ),
          child: Hero(
            tag: character.name, // استخدام name أو id بدلاً من call()
            child: Container(
              width: double.infinity,
              color: AppColors.myGrey,
              child: character.image.isNotEmpty
                  ? FadeInImage.assetNetwork(
                      width: double.infinity,
                      height: double.infinity,
                      placeholder: 'assets/images/loading.gif',
                      image: character.image,
                      fit: BoxFit.cover,
                      // imageErrorBuilder: (context, error, stackTrace) {
                      //   return Image.asset('assets/images/placeholder.jpg');
                      // },
                    )
                  : Image.asset('assets/images/placeholder.jpg'),
            ),
          ),
        ),
      ),
    );
  }
}
