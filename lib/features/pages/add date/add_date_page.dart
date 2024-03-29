import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:ionicons/ionicons.dart';
import 'package:letsparty/data/remote_data_sources/items_remote_data_source.dart';
import 'package:letsparty/features/pages/add%20date/cubit/add_date_cubit.dart';
import 'package:letsparty/domain/repositories/items_repository.dart';
import 'package:letsparty/widgets/widgets.dart';

class AddDatePage extends StatefulWidget {
  const AddDatePage({
    Key? key,
    this.selectedDateFormatted,
    this.selectedTimeFormatted,
  }) : super(key: key);

  final String? selectedDateFormatted;
  final String? selectedTimeFormatted;

  @override
  State<AddDatePage> createState() => _AddDatePageState();
}

class _AddDatePageState extends State<AddDatePage> {
  String? _adress;
  DateTime? _date;
  TimeOfDay? _time;
  String? _city;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) =>
            AddDateCubit(ItemsRepository(ItemsRemoteDataSource())),
        child: BlocConsumer<AddDateCubit, AddDateState>(
          listener: (context, state) {
            if (state.errorMessage.isNotEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(state.errorMessage),
                backgroundColor: Colors.red,
              ));
            }
          },
          builder: (context, state) {
            return Scaffold(
              backgroundColor: const Color.fromARGB(255, 144, 222, 212),
              appBar: AppBar(
                backgroundColor: const Color.fromARGB(255, 144, 222, 212),
                title: Text(
                  'A d d  i n f o ',
                  style: GoogleFonts.bebasNeue(
                    fontSize: 35,
                    color: Colors.grey.shade900,
                  ),
                ),
                actions: [
                  IconButton(
                    onPressed: _city == null ||
                            _adress == null ||
                            _date == null ||
                            _time == null
                        ? null
                        : () {
                            Navigator.pop(context, _city!);

                            context.read<AddDateCubit>().add(
                                  _city!,
                                  _adress!,
                                  _date!,
                                  _time!.format(context),
                                );
                          },
                    icon: const Icon(
                      Icons.check,
                      size: 32,
                      color: Colors.black87,
                      shadows: [
                        Shadow(
                            color: Color.fromARGB(255, 249, 193, 195),
                            offset: Offset(2.0, 2.0),
                            blurRadius: 1.0)
                      ],
                    ),
                  ),
                ],
              ),
              body: _AddDatePageBody(
                onCityChanged: (newValue) {
                  setState(() {
                    _city = newValue;
                  });
                },
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
        ));
  }
}

class _AddDatePageBody extends StatelessWidget {
  _AddDatePageBody({
    Key? key,
    required this.onCityChanged,
    required this.onAdressChanged,
    required this.onDateChanged,
    required this.onTimeChanged,
    this.selectedDateFormatted,
    this.selectedTimeFormatted,
  }) : super(key: key);
  final Function(String) onCityChanged;
  final Function(String) onAdressChanged;
  final Function(DateTime?) onDateChanged;
  final Function(TimeOfDay?) onTimeChanged;
  final String? selectedDateFormatted;
  final String? selectedTimeFormatted;
  final cityController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 20,
      ),
      children: [
        TextField(
          onChanged: onCityChanged,
          style: GoogleFonts.montserrat(),
          decoration: textFieldDecoration(
            text: 'City',
            icon: const Icon(
              Ionicons.business_outline,
              size: 32,
              color: Colors.black87,
              shadows: [
                Shadow(
                    color: Color.fromARGB(255, 249, 193, 195),
                    offset: Offset(2.0, 2.0),
                    blurRadius: 1.0)
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
        TextField(
            onChanged: onAdressChanged,
            style: GoogleFonts.montserrat(),
            decoration: textFieldDecoration(
              text: 'Adress',
              icon: const Icon(
                Ionicons.pin_outline,
                size: 32,
                color: Colors.black87,
                shadows: [
                  Shadow(
                      color: Color.fromARGB(255, 249, 193, 195),
                      offset: Offset(2.0, 2.0),
                      blurRadius: 1.0)
                ],
              ),
            )),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () async {
            final selectedDate = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime.now(),
              lastDate: DateTime(2036),
            );
            onDateChanged(selectedDate);
          },
          style: elevatedButtonStyle(),
          child: Text(
            selectedDateFormatted ?? 'Pick a date',
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
          style: elevatedButtonStyle(),
          child: Text(
            selectedTimeFormatted ?? 'Choose an hour',
            style: GoogleFonts.montserrat(),
          ),
        ),
      ],
    );
  }
}
