import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:letsparty/app/core/injection_container.dart';
import 'package:letsparty/features/pages/login/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:letsparty/features/cubit/root_cubit.dart';
import 'package:letsparty/features/pages/home/home_page.dart';
import 'firebase_options.dart';

void main() async {
  configureDependencies();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const RootPage(),
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          fontFamily: 'Montsserat',
          bottomSheetTheme: const BottomSheetThemeData(
            backgroundColor: Color.fromARGB(255, 158, 99, 235),
          ),
        ));
  }
}

class RootPage extends StatelessWidget {
  const RootPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RootCubit()..start(),
      child: BlocBuilder<RootCubit, RootState>(
        builder: (context, state) {
          final user = state.user;
          {
            if (user == null) return LoginPage();
          }
          return const HomePage();
        },
      ),
    );
  }
}
