import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterfire_ui/auth.dart';
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
              child: Expanded(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'L E T\' S',
                        style: GoogleFonts.bebasNeue(
                            fontSize: 80,
                            color: Color.fromARGB(240, 50, 5, 58),
                            textStyle: const TextStyle(
                              shadows: <Shadow>[
                                Shadow(
                                  offset: Offset(7.0, 5.0),
                                  blurRadius: 8.0,
                                  color: Color.fromARGB(255, 104, 3, 151),
                                ),
                                Shadow(
                                  offset: Offset(3.0, 4.0),
                                  blurRadius: 4.0,
                                  color: Color.fromARGB(255, 225, 186, 244),
                                ),
                              ],
                            )),
                      ),
                      Text(
                        'P A R T Y !',
                        style: GoogleFonts.bebasNeue(
                            fontSize: 80,
                            color: Color.fromARGB(240, 50, 5, 58),
                            textStyle: const TextStyle(
                              shadows: <Shadow>[
                                Shadow(
                                  offset: Offset(7.0, 5.0),
                                  blurRadius: 8.0,
                                  color: Color.fromARGB(255, 104, 3, 151),
                                ),
                                Shadow(
                                  offset: Offset(3.0, 4.0),
                                  blurRadius: 4.0,
                                  color: Color.fromARGB(255, 225, 186, 244),
                                ),
                              ],
                            )),
                      ),
                      const SizedBox(height: 15),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                        child: TextField(
                          controller: emailController,
                          decoration: InputDecoration(
                            enabledBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.0)),
                              borderSide: BorderSide(
                                width: 2,
                                color: Color.fromARGB(183, 119, 77, 175),
                              ),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.0)),
                              borderSide: BorderSide(
                                width: 2,
                                color: Color.fromARGB(183, 119, 77, 175),
                              ),
                            ),
                            border: const OutlineInputBorder(),
                            hintText: 'Email',
                            hintStyle: GoogleFonts.montserrat(),
                            labelStyle: TextStyle(color: Colors.grey.shade700),
                            label: Text(
                              'Email',
                              style: GoogleFonts.montserrat(),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(25, 10, 25, 0),
                        child: TextField(
                          controller: passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            enabledBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.0)),
                              borderSide: BorderSide(
                                width: 2,
                                color: Color.fromARGB(183, 119, 77, 175),
                              ),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.0)),
                              borderSide: BorderSide(
                                width: 2,
                                color: Color.fromARGB(183, 119, 77, 175),
                              ),
                            ),
                            border: const OutlineInputBorder(),
                            hintText: 'Hasło',
                            hintStyle: GoogleFonts.montserrat(),
                            labelStyle: TextStyle(color: Colors.grey.shade700),
                            label: Text(
                              'Hasło',
                              style: GoogleFonts.montserrat(),
                            ),
                          ),
                        ),
                      ),
                      Text(state.errorMessage),
                      const SizedBox(height: 15),
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
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          primary: const Color.fromARGB(252, 122, 51, 214),
                          shadowColor: Colors.grey,
                          elevation: 6.0,
                          textStyle: GoogleFonts.montserrat(),
                        ),
                        child: Text(
                          state.isCreatingAccount
                              ? 'Zarejestruj się'
                              : 'Zaloguj się',
                        ),
                      ),
                      const SizedBox(height: 15),
                      if (state.isCreatingAccount == false) ...[
                        TextButton(
                          onPressed: () {
                            context
                                .read<RootCubit>()
                                .createAccountButtonPressed();
                          },
                          child: Text('Utwórz konto',
                              style: GoogleFonts.montserrat(
                                color: const Color.fromARGB(252, 122, 51, 214),
                              )),
                        ),
                      ],
                      if (state.isCreatingAccount) ...[
                        TextButton(
                          onPressed: () {
                            context.read<RootCubit>().signInButtonPressed();
                          },
                          child: Text('Masz już konto?',
                              style: GoogleFonts.montserrat(
                                color: const Color.fromARGB(252, 122, 51, 214),
                              )),
                        ),
                      ],
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => PasswordAlertDialog(),
                              fullscreenDialog: true,
                            ),
                          );
                        },
                        child: Text('Zapomniałeś hasła?',
                            style: GoogleFonts.montserrat(
                              color: const Color.fromARGB(252, 122, 51, 214),
                            )),
                      ),
                    ]),
              ),
            ),
          );
        },
      ),
    );
  }
}

class PasswordAlertDialog extends StatelessWidget {
  PasswordAlertDialog({
    Key? key,
  }) : super(key: key);

  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RootCubit()..start(),
      child: BlocBuilder<RootCubit, RootState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: const Color.fromARGB(255, 212, 208, 245),
            appBar: AppBar(
              backgroundColor: const Color.fromARGB(255, 212, 208, 245),
            ),
            body: const Center(
                child: AlertDialog(
              actions: [
                ForgotPasswordView(),
              ],
            )
                // child: AlertDialog(
                //   content: Text(
                //     'Na podany niżej email wyślemy wiadomość z linkiem do zresetowania hasła.',
                //     style: GoogleFonts.montserrat(
                //       color: Colors.grey.shade700,
                //     ),
                //   ),
                //   backgroundColor: Color.fromARGB(255, 223, 220, 247),
                //   title: Center(
                //     child: Text(
                //       'Podaj email',
                //       style: GoogleFonts.montserrat(
                //         color: Colors.grey.shade900,
                //       ),
                //     ),
                //   ),
                // actions: [
                //   Padding(
                //     padding: const EdgeInsets.all(8.0),
                //     child: TextField(
                //       controller: controller,
                //     ),
                //   ),
                //   const SizedBox(height: 15),

                //   const SizedBox(height: 15),
                //   ElevatedButton(
                //     onPressed: () {
                //       context
                //           .read<RootCubit>()
                //           .passwordReset(email: controller.text);

                //       Navigator.of(context).pop;
                //     },
                //     style: ElevatedButton.styleFrom(
                //       shape: RoundedRectangleBorder(
                //         borderRadius: BorderRadius.circular(15.0),
                //       ),
                //       primary: const Color.fromARGB(252, 122, 51, 214),
                //       shadowColor: Colors.grey,
                //       elevation: 6.0,
                //       textStyle: GoogleFonts.montserrat(),
                //     ),
                //     child: const Text(
                //       'Resetuj hasło',
                //     ),
                //   ),
                ),
          );
        },
      ),
    );
  }
}
