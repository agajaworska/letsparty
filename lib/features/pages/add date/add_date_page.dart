import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:letsparty/features/pages/add%20date/cubit/add_date_cubit.dart';

class AddDatePage extends StatefulWidget {
  const AddDatePage({Key? key}) : super(key: key);

  @override
  State<AddDatePage> createState() => _AddDatePageState();
}

class _AddDatePageState extends State<AddDatePage> {
  String? _adress;
  DateTime? _date;
  TimeOfDay? _time;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddDateCubit(),
      child: BlocListener<AddDateCubit, AddDateState>(
        listener: (context, state) {
          if (state.saved) {
            Navigator.of(context).pop();
          }
          if (state.errorMessage.isNotEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.errorMessage),
              backgroundColor: Colors.red,
            ));
          }
        },
        child: BlocBuilder<AddDateCubit, AddDateState>(
          builder: (context, state) {
            return Scaffold(
              backgroundColor: const Color.fromARGB(255, 212, 208, 245),
              appBar: AppBar(
                backgroundColor: const Color.fromARGB(255, 212, 208, 245),
                title: Text(
                  'D o d a j  i n f o ',
                  style: GoogleFonts.bebasNeue(
                    fontSize: 35,
                    color: Colors.grey.shade900,
                  ),
                ),
                actions: [
                  IconButton(
                    onPressed: () {
                      context.read<AddDateCubit>().add(
                            _adress!,
                            _date!,
                            _time!.format(context).toString(),
                          );
                    },
                    icon: const Icon(Icons.check),
                  )
                ],
              ),
              body: _AddDatePageBody(
                onAdressChanged: (newValue) {
                  setState(() {
                    _adress = newValue;
                  });
                },
                onDateChanged: (newValue) {
                  setState(() {
                    _date = newValue;
                  });
                },
                onTimeChanged: (newValue) {
                  setState(() {
                    _time = newValue;
                  });
                },
                selectedTimeFormatted:
                    _time == null ? null : _time!.format(context),
                selectedDateFormatted: _date == null
                    ? null
                    : DateFormat.yMMMMEEEEd().format(_date!),
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
    required this.onAdressChanged,
    required this.onDateChanged,
    required this.onTimeChanged,
    this.selectedDateFormatted,
    this.selectedTimeFormatted,
  }) : super(key: key);

  final Function(String) onAdressChanged;
  final Function(DateTime?) onDateChanged;
  final Function(TimeOfDay?) onTimeChanged;
  final String? selectedDateFormatted;
  final String? selectedTimeFormatted;
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 20,
      ),
      children: [
        TextField(
          onChanged: onAdressChanged,
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
            border: const OutlineInputBorder(),
            hintText: 'Adres',
            labelStyle: TextStyle(color: Colors.grey.shade700),
            label: Text(
              'Adres',
              style: GoogleFonts.montserrat(),
            ),
          ),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () async {
            final selectedDate = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime.now(),
              lastDate: DateTime.now().add(
                const Duration(days: 365 * 10),
              ),
            );
            onDateChanged(selectedDate);
          },
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            primary: const Color.fromARGB(205, 107, 26, 213),
            shadowColor: Colors.grey,
            elevation: 6.0,
            textStyle: GoogleFonts.montserrat(),
          ),
          child: Text(
            selectedDateFormatted ?? 'Wybierz datę',
            style: GoogleFonts.montserrat(),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        ElevatedButton(
          onPressed: () async {
            final selectedTime = await showTimePicker(
              context: context,
              initialTime: TimeOfDay.now(),
            );
            onTimeChanged(selectedTime);
          },
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            primary: const Color.fromARGB(205, 107, 26, 213),
            shadowColor: Colors.grey,
            elevation: 6.0,
            textStyle: GoogleFonts.montserrat(),
          ),
          child: Text(
            selectedTimeFormatted ?? 'Wybierz godzinę',
            style: GoogleFonts.montserrat(),
          ),
        ),
      ],
    );
  }
}
