import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:letsparty/data/remote_data_sources/remote_data_source.dart';
import 'package:letsparty/data/remote_data_sources/weather_remote_data_sources.dart';
import 'package:letsparty/features/pages/add%20date/cubit/add_date_cubit.dart';
import 'package:letsparty/features/pages/weather/cubit/weather_cubit.dart';
import 'package:letsparty/repositories/repository.dart';
import 'package:letsparty/repositories/weather_repository.dart';

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
      create: (context) => AddDateCubit(Repository(RemoteDataSource())),
      child:
          BlocListener<AddDateCubit, AddDateState>(listener: (context, state) {
        if (state.errorMessage.isNotEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.errorMessage),
            backgroundColor: Colors.red,
          ));
        }
      }, child: BlocBuilder<AddDateCubit, AddDateState>(
        builder: (context, state) {
          return BlocProvider(
            create: (context) =>
                WeatherCubit(WeatherRepository(WeatherRemoteDataSource())),
            child: BlocBuilder<WeatherCubit, WeatherState>(
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
                        icon: const Icon(Icons.check),
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
            ),
          );
        },
      )),
    );
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
            hintText: 'City',
            labelStyle: TextStyle(color: Colors.grey.shade700),
            label: Text(
              'City',
              style: GoogleFonts.montserrat(),
            ),
          ),
        ),
        const SizedBox(height: 20),
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
              lastDate: DateTime(2036),
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
