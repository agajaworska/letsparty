import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:letsparty/app/core/enums/enums.dart';
import 'package:letsparty/data/remote_data_sources/menu_remote_data_source.dart';
import 'package:letsparty/features/pages/menu/cubit/menu_cubit.dart';
import 'package:letsparty/domain/repositories/menu_repository.dart';
import 'package:letsparty/widgets/widgets.dart';

class MenuPage extends StatelessWidget {
  MenuPage(
    Key? key,
  ) : super(key: key);

  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          MenuCubit(MenuRepository(MenuRemoteDataSource()))..start(),
      child: BlocBuilder<MenuCubit, MenuState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: const Color.fromARGB(255, 144, 222, 212),
            appBar: AppBar(
              backgroundColor: const Color.fromARGB(255, 144, 222, 212),
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
                    return const Center(
                        child: Text('Oops, we have a problem :('));

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
                            child: DisplayBox(name: menuModel.title),
                          ),
                        ],
                        Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  controller: controller,
                                  style: GoogleFonts.montserrat(),
                                  decoration: textFieldDecoration(
                                    text: 'Dish and drink suggestion',
                                    icon: const Icon(
                                      Ionicons.fast_food_outline,
                                      size: 32,
                                      color: Colors.black87,
                                      shadows: [
                                        Shadow(
                                            color: Color.fromARGB(
                                                255, 249, 193, 195),
                                            offset: Offset(2.0, 2.0),
                                            blurRadius: 1.0)
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  context
                                      .read<MenuCubit>()
                                      .add(title: controller.text);
                                  controller.clear();
                                },
                                icon: const Icon(
                                  Icons.add,
                                  color: Colors.black87,
                                  size: 32,
                                  shadows: [
                                    Shadow(
                                        color:
                                            Color.fromARGB(255, 249, 193, 195),
                                        offset: Offset(2.0, 2.0),
                                        blurRadius: 1.0)
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
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
