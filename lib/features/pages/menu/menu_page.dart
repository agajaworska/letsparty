import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:letsparty/features/pages/menu/cubit/menu_cubit.dart';

class MenuPage extends StatelessWidget {
  MenuPage(
    Key? key,
  ) : super(key: key);

  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MenuCubit()..start(),
      child: BlocBuilder<MenuCubit, MenuState>(
        builder: (context, state) {
          return Scaffold(
              backgroundColor: const Color.fromARGB(255, 212, 208, 245),
              appBar: AppBar(
                backgroundColor: const Color.fromARGB(255, 212, 208, 245),
                title: Text(
                  'M e n u',
                  style: GoogleFonts.bebasNeue(
                    fontSize: 35,
                    color: Colors.grey.shade900,
                  ),
                ),
              ),
              floatingActionButton: FloatingActionButton(
                backgroundColor: const Color.fromARGB(255, 107, 26, 213),
                onPressed: () {
                  context.read<MenuCubit>().add(title: controller.text);
                  controller.clear();
                },
                child: const Icon(
                  Icons.add_outlined,
                  color: Color.fromARGB(255, 212, 208, 245),
                ),
              ),
              body:
                  BlocBuilder<MenuCubit, MenuState>(builder: (context, state) {
                if (state.errorMessage.isNotEmpty) {
                  return const Text('Wystąpił nieoczekiwany problem');
                }
                if (state.isLoading) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.purple,
                    ),
                  );
                }

                final documents = state.documents;
                return ListView(
                  children: [
                    for (final document in documents) ...[
                      Dismissible(
                        key: ValueKey(document.id),
                        onDismissed: (_) {
                          context
                              .read<MenuCubit>()
                              .remove(documentID: document.id);
                        },
                        child: MenuWidget(document['title']),
                      ),
                    ],
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: TextField(
                        controller: controller,
                        style: GoogleFonts.montserrat(),
                        decoration: InputDecoration(
                          hintText: 'Podaj propozycję dania',
                          hintStyle: GoogleFonts.montserrat(),
                          prefixIcon: const Icon(
                            Icons.restaurant_menu_outlined,
                            color: Color.fromARGB(183, 119, 77, 175),
                          ),
                        ),
                      ),
                    )
                  ],
                );
              }));
        },
      ),
    );
  }
}

class MenuWidget extends StatelessWidget {
  const MenuWidget(
    this.title, {
    Key? key,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.all(15),
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
            offset: const Offset(-5, -5),
            blurRadius: 6.0,
            color: const Color.fromARGB(255, 232, 222, 240),
          ),
        ],
      ),
      child: Text(
        title,
        style: GoogleFonts.montserrat(
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}