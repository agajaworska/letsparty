import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:letsparty/features/cubit/root_cubit.dart';

class LoginPage extends StatelessWidget {
  LoginPage({
    Key? key,
  }) : super(key: key);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RootCubit()..start(),
      child: BlocBuilder<RootCubit, RootState>(
        builder: (context, state) {
          return Scaffold(
              backgroundColor: const Color.fromARGB(255, 212, 208, 245),
              body: Center(
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'L E T \'S  P A R T Y',
                          style: GoogleFonts.bebasNeue(
                              fontSize: 52,
                              color: const Color.fromARGB(255, 50, 5, 58),
                              textStyle: const TextStyle(
                                shadows: <Shadow>[
                                  Shadow(
                                    offset: Offset(5.0, -5.0),
                                    blurRadius: 3.0,
                                    color: Color.fromARGB(255, 222, 161, 253),
                                  ),
                                ],
                              )),
                        ),
                        const SizedBox(height: 100),
                        TextField(
                          controller: emailController,
                          decoration: const InputDecoration(
                            hintText: 'E-mail',
                          ),
                        ),
                        TextField(
                          controller: passwordController,
                          obscureText: true,
                          decoration: const InputDecoration(
                            hintText: 'Hasło',
                          ),
                        ),
                        const SizedBox(height: 25),
                        Text(state.errorMessage),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () async {
                            if (state.isCreatingAccount) {
                              try {
                                context.read<RootCubit>().register(
                                      email: emailController.text,
                                      password: passwordController.text,
                                    );
                              } catch (error) {
                                state.errorMessage.toString();
                              }
                            } else {
                              try {
                                context.read<RootCubit>().signIn(
                                      email: emailController.text,
                                      password: passwordController.text,
                                    );
                              } catch (error) {
                                state.errorMessage.toString();
                              }
                            }
                          },
                          child: Text(
                            state.isCreatingAccount
                                ? 'Zarejestruj się'
                                : 'Zaloguj się',
                          ),
                        ),
                        const SizedBox(height: 20),
                        if (state.isCreatingAccount == false) ...[
                          TextButton(
                            onPressed: () {
                              context
                                  .read<RootCubit>()
                                  .createAccountButtonPressed();
                            },
                            child: const Text('Utwórz konto'),
                          ),
                        ],
                        if (state.isCreatingAccount) ...[
                          TextButton(
                            onPressed: () {
                              context.read<RootCubit>().signInButtonPressed();
                            },
                            child: const Text('Masz już konto?'),
                          ),
                        ],
                      ]),
                ),
              ));
        },
      ),
    );
  }
}
