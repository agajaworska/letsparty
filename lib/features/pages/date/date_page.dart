import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:letsparty/features/pages/add%20date/add_date_page.dart';
import 'package:letsparty/features/pages/add%20date/update_date_page.dart';
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
      body: _DatePageBody(),
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
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Icon(
                      Icons.home_outlined,
                    ),
                  ),
                  for (final itemModel in itemModels)
                    _AdressBox(itemModel: itemModel),
                ],
              ),
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Icon(
                      Icons.calendar_month_outlined,
                    ),
                  ),
                  for (final itemModel in itemModels)
                    _DateBox(itemModel: itemModel),
                ],
              ),
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Icon(
                      Icons.watch_later_outlined,
                    ),
                  ),
                  for (final itemModel in itemModels)
                    _HourBox(itemModel: itemModel),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => const UpdatePage(),
                        ),
                      );
                    },
                    icon: const Icon(Icons.edit_outlined),
                  ),
                  for (final itemModel in itemModels)
                    IconButton(
                      onPressed: () {
                        context
                            .read<DateCubit>()
                            .remove(documentID: itemModel.id);
                      },
                      icon: const Icon(Icons.delete_outlined),
                    ),
                ],
              )
            ],
          );
        },
      ),
    );
  }
}

class _AdressBox extends StatelessWidget {
  const _AdressBox({
    Key? key,
    required this.itemModel,
  }) : super(key: key);

  final ItemModel itemModel;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
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
          itemModel.adress,
          style: GoogleFonts.montserrat(
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}

class _DateBox extends StatelessWidget {
  const _DateBox({
    Key? key,
    required this.itemModel,
  }) : super(key: key);

  final ItemModel itemModel;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
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
          itemModel.relaseDateFormatted(),
          style: GoogleFonts.montserrat(
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}

class _HourBox extends StatelessWidget {
  const _HourBox({
    Key? key,
    required this.itemModel,
  }) : super(key: key);

  final ItemModel itemModel;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
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
          itemModel.time.toString(),
          style: GoogleFonts.montserrat(
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
