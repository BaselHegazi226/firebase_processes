import 'package:copy_firebase_process/core/helper/simple_bloc_observer.dart';
import 'package:copy_firebase_process/core/utls/app_get_bloc.dart';
import 'package:copy_firebase_process/core/utls/app_router.dart';
import 'package:copy_firebase_process/features/presentation/manager/firebase_bloc/firebase_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'core/utls/firebase_options.dart';

void main() async {
  AppGetBloc.setUp();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = SimpleBlocObserver();
  runApp(
    BlocProvider(
      create: (context) => AppGetBloc.getIt.get<FirebaseBloc>(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
    );
  }
}
