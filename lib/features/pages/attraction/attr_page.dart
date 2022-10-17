import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:letsparty/app/core/enums/enums.dart';
import 'package:letsparty/data/remote_data_sources/attraction_remote_data_source.dart';
import 'package:letsparty/features/pages/attraction/cubit/attraction_cubit.dart';
import 'package:letsparty/domain/repositories/attraction_repository.dart';
import 'package:letsparty/widgets/widgets.dart';

class AttractionPage extends StatelessWidget {
  AttractionPage({Key? key}) : super(key: key);

  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          AttractionCubit(AttractionRepository(AttractionRemoteDataSource()))
            ..start(),
      child: BlocBuilder<AttractionCubit, AttractionState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: const Color.fromARGB(255, 212, 208, 245),
            appBar: AppBar(
              backgroundColor: const Color.fromARGB(255, 212, 208, 245),
              title: Text(
                'A t t r a c t i o n s',
                style: GoogleFonts.bebasNeue(
                  fontSize: 35,
                  color: Colors.grey.shade900,
                ),
              ),
            ),
            body: BlocBuilder<AttractionCubit, AttractionState>(
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
                          child: DisplayBox(name: attractionModel.title),
                        ),
                      ],
                      Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  controller: controller,
                                  style: GoogleFonts.montserrat(),
                                  decoration: textFieldDecoration(
                                    text: 'Your attraction suggestion',
                                    icon: const Icon(
                                      Ionicons.gift_outline,
                                    ),
                                  ),
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  context
                                      .read<AttractionCubit>()
                                      .add(title: controller.text);
                                  controller.clear();
                                },
                                icon: const Icon(
                                  Icons.add,
                                  color: Color(0xFF332A6F),
                                ),
                              ),
                            ],
                          )),
                    ],
                  );
              }
            }),
          );
        },
      ),
    );
  }
}
