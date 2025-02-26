import 'data/cubit/cubit/character_cubit.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/Router/app_router.dart';
import 'data/repos/character_repo.dart';
import 'data/web_services/character_web_services.dart';

void main() {
  final characterRepo = CharacterRepo(
characterWebServices: CharacterWebServices(dio: Dio()), 
  );// إنشاء Web Services
  

  runApp(BreakingBad(appRouter: AppRouter(), characterRepo: characterRepo));
}

class BreakingBad extends StatelessWidget {
  final AppRouter appRouter;
  final CharacterRepo characterRepo;

  const BreakingBad({super.key, required this.appRouter, required this.characterRepo});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
create: (context) => CharacterCubit(characterRepo: characterRepo),

child: MaterialApp(
        onGenerateRoute: appRouter.generateRoute,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
