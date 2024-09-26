import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utls/app_get_bloc.dart';
import '../../manager/firebase_bloc/firebase_bloc.dart';
import '../widgets/add/add_view_body.dart';

class AddView extends StatelessWidget {
  const AddView({super.key});

  @override
  Widget build(BuildContext context) {
    double keyboardHeight = MediaQuery.of(context).viewInsets.top;
    return BlocProvider(
      create: (context) => AppGetBloc.getIt.get<FirebaseBloc>(),
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: const Text(
            'Add Employee',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.blueGrey.withOpacity(.7),
        ),
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(
                bottom: keyboardHeight,
              ),
              child: const AddViewBody(),
            ),
          ),
        ),
      ),
    );
  }
}
