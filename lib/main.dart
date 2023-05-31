import 'package:app_uno/features/posts/presentation/blocs/book_bloc.dart';
import 'package:app_uno/services/local_storage.dart';
import 'package:app_uno/usecase_config.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:app_uno/features/posts/presentation/pages/HomeAlternative.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

UsecaseConfig usecaseConfig = UsecaseConfig();
bool internetConnection = false;

void main() async {
  Connectivity connectivity = Connectivity();
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorage.configurePrefs();
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
                getBooksUsecase: usecaseConfig.getBooksUsecase!,
                deleteBookUseCase: usecaseConfig.deleteBookUseCase!,
                updateBookUseCase: usecaseConfig.updateBookUseCase!,
                addBookUseCase: usecaseConfig.addBookUseCase!)),
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
