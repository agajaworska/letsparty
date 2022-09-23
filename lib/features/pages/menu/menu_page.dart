import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:letsparty/app/core/enums/enums.dart';
import 'package:letsparty/data/remote_data_sources/remote_data_source.dart';
import 'package:letsparty/features/pages/menu/cubit/menu_cubit.dart';
import 'package:letsparty/repositories/repository.dart';

class MenuPage extends StatelessWidget {
  MenuPage(
    Key? key,
  ) : super(key: key);

  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MenuCubit(Repository(RemoteDataSource()))..start(),
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
            body: BlocBuilder<MenuCubit, MenuState>(
              builder: (context, state) {
                switch (state.status) {
                  case Status.initial:
                    return const Center(
                      child: Text('Wait a second...'),
                    );
                  case Status.error:
                    return const Text('Oops, we have a problem :(');

                  case Status.loading:
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Colors.purple,
                      ),
                    );

                  case Status.success:
                    final menuModels = state.documents;
                    return ListView(
                      children: [
                        for (final menuModel in menuModels) ...[
                          Dismissible(
                            key: ValueKey(menuModel.id),
                            onDismissed: (_) {
                              context
                                  .read<MenuCubit>()
                                  .remove(documentID: menuModel.id);
                            },
                            child: MenuWidget(menuModel.title),
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
                              hintText: 'Your dish suggestion',
                              hintStyle: GoogleFonts.montserrat(),
                              prefixIcon: const Icon(
                                Ionicons.fast_food_outline,
                                color: Color.fromARGB(183, 119, 77, 175),
                              ),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  context
                                      .read<MenuCubit>()
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
                }
              },
            ),
          );
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
            offset: Offset(-5, -5),
            blurRadius: 6.0,
            color: Color.fromARGB(255, 232, 222, 240),
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
