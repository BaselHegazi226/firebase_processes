import 'package:copy_firebase_process/features/presentation/views/views/home_view.dart';
import 'package:go_router/go_router.dart';

import '../../features/presentation/views/views/edit_view.dart';

abstract class AppRouter {
  static final router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeView(),
    ),
    GoRoute(
      path: HomeView.id,
      builder: (context, state) => const HomeView(),
    ),
    GoRoute(
      path: EditView.id,
      builder: (context, state) => const EditView(),
    ),
  ]);
}
