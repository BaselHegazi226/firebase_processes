import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleBlocObserver implements BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    debugPrint('on changed: ${bloc.toString()}');
  }

  @override
  void onClose(BlocBase bloc) {
    debugPrint('close: ${bloc.toString()}');
  }

  @override
  void onCreate(BlocBase bloc) {
    debugPrint('create: ${bloc.toString()}');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    // TODO: implement onError
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    debugPrint('event: $event');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    debugPrint(bloc.toString());
  }
}
