import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/cubit/cubit/character_cubit.dart';
import '../../data/repos/character_repo.dart';
import '../../data/web_services/character_web_services.dart';
import '../../presentation/screens/character_details_screen.dart';
import '../../presentation/screens/character_screen.dart';
import '../constants/app_strings.dart';

class AppRouter {
  late CharacterRepo characterRepo;
  late CharacterCubit characterCubit;

  AppRouter() {
    Dio dio = Dio(BaseOptions(
      baseUrl: 'https://www.breakingbadapi.com/api/', // ✅ التأكد من تمرير BaseOptions
      receiveDataWhenStatusError: true,
    ));

    characterRepo = CharacterRepo(characterWebServices: CharacterWebServices(dio: dio));
    characterCubit = CharacterCubit(characterRepo: characterRepo);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppStrings.charactersScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => characterCubit..getAllCharacters(),
            child: const CharacterScreen(),
          ),
        );
   case AppStrings.characterDetailsScreen:
        return MaterialPageRoute(
          builder: (_) => const CharacterDetailsScreen(),
        );
      default:
        return null;
    }
  }
}
