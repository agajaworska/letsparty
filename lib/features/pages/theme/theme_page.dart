import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:letsparty/features/pages/theme/cubit/theme_cubit.dart';
import 'package:letsparty/repositories/repository.dart';

class ThemePage extends StatelessWidget {
  ThemePage({Key? key}) : super(key: key);

  final controller = TextEditingController();
  void clearText() {
    controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeCubit(Repository())..start(),
      child: BlocBuilder<ThemeCubit, ThemeState>(builder: (context, state) {
        return Scaffold(
          backgroundColor: const Color.fromARGB(255, 212, 208, 245),
          appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 212, 208, 245),
            title: Text(
              'M o t y w  i m p r e z y',
              style: GoogleFonts.bebasNeue(
                fontSize: 35,
                color: Colors.grey.shade900,
              ),
            ),
          ),
          bottomSheet: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              heightFactor: 0.5,
              child: TextField(
                controller: controller,
                style: GoogleFonts.montserrat(),
                decoration: InputDecoration(
                  hintText: 'Dodaj link do zdjęcia',
                  hintStyle: GoogleFonts.montserrat(),
                  prefixIcon: const Icon(
                    Icons.image_outlined,
                    color: Color.fromARGB(205, 107, 26, 213),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      context.read<ThemeCubit>().add(imageUrl: controller.text);
                      clearText();
                    },
                    icon: const Icon(
                      Icons.add,
                      color: Color.fromARGB(205, 107, 26, 213),
                    ),
                  ),
                ),
              ),
            ),
          ),
          body: Builder(
            builder: (context) {
              if (state.errorMessage.isNotEmpty) {
                return const Text('Wystąpił nieoczekiwany problem');
              }
              if (state.isLoading) {
                return const Text('Trwa ładowanie danych');
              }

              final themeModels = state.documents;

              return GridView.count(
                crossAxisCount: 2,
                children: [
                  for (final themeModel in themeModels) ...[
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Dismissible(
                        key: ValueKey(themeModel.id),
                        onDismissed: (_) {
                          context
                              .read<ThemeCubit>()
                              .remove(documentID: themeModel.id);
                        },
                        child: Container(
                          height: 150,
                          width: 150,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 240, 234, 255),
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                offset: const Offset(5, 5),
                                blurRadius: 6.0,
                                color: Colors.grey.shade600,
                              ),
                              const BoxShadow(
                                offset: Offset(-5, -5),
                                blurRadius: 6.0,
                                color: Color.fromARGB(255, 232, 222, 240),
                              ),
                            ],
                            image: DecorationImage(
                              image: NetworkImage(
                                themeModel.imageUrl,
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ],
              );
            },
          ),
        );
      }),
    );
  }
}
