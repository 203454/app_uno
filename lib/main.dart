import 'package:app_uno/features/posts/presentation/blocs/book_bloc.dart';
import 'package:app_uno/pages/HomeLogin.dart';
import 'package:app_uno/usecase_config.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:app_uno/pages/HomeAlternative.dart';
import 'package:app_uno/pages/.ignore/home_practica.dart';
import 'package:app_uno/pages/notifications.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

UsecaseConfig usecaseConfig = UsecaseConfig();

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BooksBloc>(
            create: (BuildContext context) => BooksBloc(
                  getBooksUsecase: usecaseConfig.getBookUsecase!,
                  deleteBookUseCase: usecaseConfig.deleteBookUseCase!,
                  updateBookUseCase: usecaseConfig.updateBookUseCase!,
                  addBookUseCase: usecaseConfig.addBookUseCase!,
                )),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomeAlternative(),
      ),
    );
  }
}
