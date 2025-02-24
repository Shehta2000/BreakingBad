// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:breaking_bad/data/cubit/cubit/character_cubit.dart';
import 'package:breaking_bad/data/repos/character_repo.dart';
import 'package:breaking_bad/data/web_services/character_web_services.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../presentation/screens/character_details_screen.dart';
import '../../presentation/screens/character_screen.dart';
import '../constants/app_strings.dart';

class AppRouter {
  late CharacterRepo characterRepo;
  late CharacterCubit characterCubit;

  AppRouter() {
    characterRepo = CharacterRepo(CharacterWebServices(
       Dio(),
    ));
    characterCubit = CharacterCubit(characterRepo);
  }
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppStrings.charactersScreen:
        return MaterialPageRoute(
            builder: (_) => const CharacterScreen());
      case AppStrings.characterDetailsScreen:
        return MaterialPageRoute(
            builder: (_) => const CharacterDetailsScreen());

      default:
    }
    
  }
}
