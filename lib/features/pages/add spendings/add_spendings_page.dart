import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:letsparty/data/remote_data_sources/remote_data_source.dart';
import 'package:letsparty/features/pages/add%20spendings/cubit/add_spendings_cubit.dart';
import 'package:letsparty/repositories/repository.dart';

class AddSpendingsPage extends StatefulWidget {
  const AddSpendingsPage({Key? key}) : super(key: key);

  @override
  State<AddSpendingsPage> createState() => _AddSpendingsPageState();
}

class _AddSpendingsPageState extends State<AddSpendingsPage> {
  String? _name;
  String? _price;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddSpendingsCubit(Repository(RemoteDataSource())),
      child: BlocListener<AddSpendingsCubit, AddSpendingsState>(
        listener: (context, state) {
          Navigator.of(context).pop();
        },
        child: BlocBuilder<AddSpendingsCubit, AddSpendingsState>(
          builder: (context, state) {
            return Scaffold(
              backgroundColor: const Color.fromARGB(255, 212, 208, 245),
              appBar: AppBar(
                backgroundColor: const Color.fromARGB(255, 212, 208, 245),
                title: Text(
                  'S p e  n d i n g s',
                  style: GoogleFonts.bebasNeue(
                    fontSize: 35,
                    color: Colors.grey.shade900,
                  ),
                ),
                actions: [
                  IconButton(
                    onPressed: () {
                      context.read<AddSpendingsCubit>().add(
                            name: _name!,
                            price: _price!,
                          );
                    },
                    icon: const Icon(Icons.check),
                  )
                ],
              ),
              body: _AddDatePageBody(
                onNameChanged: (newValue) {
                  setState(() {
                    _name = newValue;
                  });
                },
                onPriceChanged: (newValue) {
                  setState(() {
                    _price = newValue;
                  });
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

class _AddDatePageBody extends StatelessWidget {
  const _AddDatePageBody({
    Key? key,
    required this.onNameChanged,
    required this.onPriceChanged,
  }) : super(key: key);

  final Function(String) onNameChanged;
  final Function(String) onPriceChanged;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 20,
      ),
      children: [
        TextField(
          onChanged: onNameChanged,
          decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
              borderSide: BorderSide(
                width: 2,
                color: Color.fromARGB(183, 119, 77, 175),
              ),
            ),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
              borderSide: BorderSide(
                width: 2,
                color: Color.fromARGB(183, 119, 77, 175),
              ),
            ),
            hintText: 'Expense name',
            hintStyle: GoogleFonts.montserrat(),
            labelStyle: TextStyle(color: Colors.grey.shade700),
            label: Text(
              'Expense name',
              style: GoogleFonts.montserrat(),
            ),
          ),
        ),
        const SizedBox(height: 20),
        TextField(
          keyboardType: const TextInputType.numberWithOptions(),
          onChanged: onPriceChanged,
          decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
              borderSide: BorderSide(
                width: 2,
                color: Color.fromARGB(183, 119, 77, 175),
              ),
            ),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
              borderSide: BorderSide(
                width: 2,
                color: Color.fromARGB(183, 119, 77, 175),
              ),
            ),
            hintText: 'Cost',
            hintStyle: GoogleFonts.montserrat(),
            labelStyle: TextStyle(color: Colors.grey.shade700),
            label: Text(
              'Cost',
              style: GoogleFonts.montserrat(),
            ),
          ),
        ),
      ],
    );
  }
}
