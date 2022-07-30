import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:letsparty/features/pages/add%20date/add_date_page.dart';
import 'package:letsparty/features/pages/date/cubit/date_cubit.dart';
import 'package:letsparty/models/item_models.dart';

class DatePage extends StatelessWidget {
  const DatePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 212, 208, 245),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 212, 208, 245),
        title: Text(
          'G d z i e  i  k i e d y',
          style: GoogleFonts.bebasNeue(
            fontSize: 35,
            color: Colors.grey.shade900,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 107, 26, 213),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const AddDatePage(),
              fullscreenDialog: true,
            ),
          );
        },
        child: const Icon(
          Icons.add_outlined,
          color: Color.fromARGB(255, 212, 208, 245),
        ),
      ),
      body: const _DatePageBody(),
    );
  }
}

class _DatePageBody extends StatelessWidget {
  const _DatePageBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DateCubit()..start(),
      child: BlocBuilder<DateCubit, DateState>(
        builder: (context, state) {
          final itemModels = state.items;

          return Column(
            children: [
              for (final itemModel in itemModels)
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        "Adres:",
                        style: GoogleFonts.montserrat(
                            fontSize: 22, fontWeight: FontWeight.w600),
                      ),
                    ),
                    Container(
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
                      child: Dismissible(
                        key: ValueKey(itemModel.id),
                        onDismissed: (_) {
                          context
                              .read<DateCubit>()
                              .remove(documentID: itemModel.id);
                        },
                        child: Text(
                          itemModel.adress,
                          style: GoogleFonts.montserrat(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              for (final itemModel in itemModels)
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        "Data:",
                        style: GoogleFonts.montserrat(
                            fontSize: 22, fontWeight: FontWeight.w600),
                      ),
                    ),
                    Container(
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
                        itemModel.date.toString(),
                        style: GoogleFonts.montserrat(
                          fontSize: 18,
                        ),
                      ),
                    )
                  ],
                ),
            ],
          );
        },
      ),
    );
  }
}
