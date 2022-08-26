import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:letsparty/features/pages/attraction/cubit/attraction_cubit.dart';
import 'package:letsparty/repositories/repository.dart';

class AttractionPage extends StatelessWidget {
  AttractionPage({Key? key}) : super(key: key);

  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AttractionCubit(Repository())..start(),
      child: BlocBuilder<AttractionCubit, AttractionState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: const Color.fromARGB(255, 212, 208, 245),
            appBar: AppBar(
              backgroundColor: const Color.fromARGB(255, 212, 208, 245),
              title: Text(
                'A t r a k c j e',
                style: GoogleFonts.bebasNeue(
                  fontSize: 35,
                  color: Colors.grey.shade900,
                ),
              ),
            ),
            body: BlocBuilder<AttractionCubit, AttractionState>(
              builder: (context, state) {
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
                final attractionModels = state.documents;
                return ListView(
                  children: [
                    for (final attractionModel in attractionModels) ...[
                      Dismissible(
                        key: ValueKey(attractionModel.id),
                        onDismissed: (_) {
                          context
                              .read<AttractionCubit>()
                              .remove(documentID: attractionModel.id);
                        },
                        child: AttractionWidget(attractionModel.title),
                      ),
                    ],
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: TextField(
                        controller: controller,
                        style: GoogleFonts.montserrat(),
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
                          hintText: 'Podaj propozycję atrakcji',
                          hintStyle: GoogleFonts.montserrat(),
                          prefixIcon: const Icon(
                            Icons.star_border_outlined,
                            color: Color.fromARGB(183, 119, 77, 175),
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              context
                                  .read<AttractionCubit>()
                                  .add(title: controller.text);
                              controller.clear();
                            },
                            icon: const Icon(
                              Icons.add,
                              color: Color.fromARGB(183, 119, 77, 175),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class AttractionWidget extends StatelessWidget {
  const AttractionWidget(
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
        ),
      ),
    );
  }
}
