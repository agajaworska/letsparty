import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:letsparty/data/remote_data_sources/spendings_remote_data_source.dart';
import 'package:letsparty/features/pages/add%20spendings/cubit/add_spendings_cubit.dart';
import 'package:letsparty/domain/repositories/spendings_repository.dart';
import 'package:letsparty/widgets/widgets.dart';

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
      create: (context) =>
          AddSpendingsCubit(SpendingsRepository(SpendingsRemoteDataSource())),
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
                  'S p e n d i n g s',
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
          decoration: textFieldDecoration(
            text: 'Expense name',
            icon: const Icon(Ionicons.text_outline),
          ),
        ),
        const SizedBox(height: 20),
        TextField(
            keyboardType: const TextInputType.numberWithOptions(),
            onChanged: onPriceChanged,
            decoration: textFieldDecoration(
              text: 'Cost',
              icon: const Icon(Ionicons.cash_outline),
            )),
      ],
    );
  }
}
