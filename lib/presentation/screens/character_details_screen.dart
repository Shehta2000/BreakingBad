import 'package:breaking_bad/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

import '../../data/models/character_model/character_model.dart';

class CharacterDetailsScreen extends StatelessWidget {
  final CharacterModel character;

  const CharacterDetailsScreen({super.key, required this.character});

  Widget sliverAppBar() => SliverAppBar(
        leading: const BackButton(
          color: Colors.black,
        ),
        expandedHeight: 500,
        centerTitle: true,
        pinned: true,
        stretch: true,
        backgroundColor: AppColors.myGrey,
        flexibleSpace: FlexibleSpaceBar(
          title: Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              color: Colors.black54,
              child: Text(
                  character.name,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          background: Hero(
            tag: character.id,
            child: Image.network(
              character.image,
              fit: BoxFit.cover,
            ),
          ),
        ),
      );
  Widget charaterInfo(
          {required final String title, required final String value}) =>
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          RichText(
            overflow: TextOverflow.ellipsis,
            softWrap: true,
            maxLines: 1,
            text: TextSpan(
              children: [
                TextSpan(
                  text: title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                TextSpan(
                  text: value,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          )
        ],
      );

  Widget buildDivider({required final double endIndent}) {
    return Divider(
      thickness: 2,
      height: 30,
      endIndent: endIndent,
      color: AppColors.myYellow,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.myGrey,
      body: CustomScrollView(
        slivers: [
          sliverAppBar(),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  margin: const EdgeInsets.fromLTRB(14, 14, 14, 0),
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                      charaterInfo(
                        title: 'Actor Name : ',
                        value: character.name,
                      ),
                      //
                      buildDivider(endIndent: 270),
                      const SizedBox(
                        height: 10,
                      ),

                      charaterInfo(
                        title: 'status : ',
                        value: character.status,
                      ),

                      buildDivider(endIndent: 310),
                      const SizedBox(
                        height: 10,
                      ),

                      charaterInfo(
                        title: 'gender : ',
                        value: character.gender,
                      ),

                      buildDivider(endIndent: 310),
                      const SizedBox(
                        height: 10,
                      ),

                      charaterInfo(
                        title: 'species : ',
                        value: character.species,
                      ),

                      buildDivider(endIndent: 300),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 500,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
