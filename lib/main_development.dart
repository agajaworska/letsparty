import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:letsparty/app/core/config.dart';

import 'package:letsparty/app/core/injection_container.dart';
import 'package:letsparty/features/pages/group%20page/group_page.dart';
import 'package:letsparty/features/pages/home/home_page.dart';
import 'package:letsparty/features/pages/login/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:letsparty/features/cubit/root_cubit.dart';

import 'firebase_options.dart';

void main() async {
  Config.appFlavor = Flavor.development;
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
          primaryColor: const Color.fromARGB(255, 144, 222, 212),
          scaffoldBackgroundColor: const Color.fromARGB(255, 144, 222, 212),
          fontFamily: 'Montsserat',
          bottomSheetTheme: const BottomSheetThemeData(
            backgroundColor: Color.fromARGB(255, 249, 143, 103),
          ),
          colorScheme: ColorScheme.fromSwatch().copyWith(
            secondary: const Color.fromARGB(255, 249, 143, 103),
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

          if (user == null) return LoginPage();

          return const HomePage();
        },
      ),
    );
  }
}
