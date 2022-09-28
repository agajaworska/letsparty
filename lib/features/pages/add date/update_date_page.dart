import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:letsparty/data/remote_data_sources/items_remote_data_source.dart';
import 'package:letsparty/features/pages/date/cubit/date_cubit.dart';
import 'package:letsparty/domain/repositories/items_repository.dart';

class UpdatePage extends StatefulWidget {
  const UpdatePage(
    Key? key,
  ) : super(key: key);

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  String? _city;
  String? _adress;
  DateTime? _date;
  String? _time;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DateCubit(
        ItemsRepository(ItemsRemoteDataSource()),
      )..start(),
      child: BlocListener<DateCubit, DateState>(
        listener: (context, state) {
          if (state.errorMessage.isNotEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.errorMessage),
              backgroundColor: Colors.red,
            ));
          }
        },
        child: BlocBuilder<DateCubit, DateState>(
          builder: (context, state) {
            final itemModels = state.items;
            return Scaffold(
              backgroundColor: const Color.fromARGB(255, 212, 208, 245),
              appBar: AppBar(
                  backgroundColor: const Color.fromARGB(255, 212, 208, 245),
                  title: Text(
                    'E D Y T U J ',
                    style: GoogleFonts.bebasNeue(
                      fontSize: 35,
                      color: Colors.grey.shade900,
                    ),
                  ),
                  actions: [
                    for (final itemModel in itemModels)
                      Builder(builder: (context) {
                        if (_city != null ||
                            _adress != null ||
                            _date != null ||
                            _time != null) {
                          return IconButton(
                            onPressed: _city == null ||
                                    _adress == null ||
                                    _date == null ||
                                    _time == null
                                ? null
                                : () {
                                    Navigator.pop(context, _city!);
                                    context.read<DateCubit>().update(
                                        documentID: itemModel.id,
                                        city: _city.toString(),
                                        adress: _adress.toString(),
                                        date: _date!,
                                        time: _time!);
                                  },
                            icon: const Icon(Icons.check),
                          );
                        }
                        if (_city == null ||
                            _adress == null ||
                            _date == null ||
                            _time == null) {
                          return IconButton(
                            onPressed: _city == null ||
                                    _adress == null ||
                                    _date == null ||
                                    _time == null
                                ? null
                                : () {
                                    Navigator.pop(context, _city!);
                                    context.read<DateCubit>().update(
                                        documentID: itemModel.id,
                                        city: itemModel.city,
                                        adress: itemModel.adress,
                                        date: itemModel.date,
                                        time: itemModel.time);
                                  },
                            icon: const Icon(Icons.check),
                          );
                        }
                        throw const SizedBox.shrink();
                      })
                  ]),
              body: _UpdateDatePageBody(
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
                    _time = newValue!.format(context).toString();
                  });
                },
                selectedTimeFormatted: _time == null ? null : _time!.toString(),
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

class _UpdateDatePageBody extends StatelessWidget {
  const _UpdateDatePageBody({
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

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DateCubit(
        ItemsRepository(ItemsRemoteDataSource()),
      )..start(),
      child: BlocBuilder<DateCubit, DateState>(
        builder: (context, state) {
          final itemModels = state.items;
          return ListView(
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 20,
            ),
            children: [
              for (final itemModel in itemModels)
                TextFormField(
                  initialValue: itemModel.city,
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
                    hintText: 'Miasto',
                    labelStyle: TextStyle(color: Colors.grey.shade700),
                    label: Text(
                      'Miasto',
                      style: GoogleFonts.montserrat(),
                    ),
                  ),
                ),
              const SizedBox(height: 20),
              for (final itemModel in itemModels)
                TextFormField(
                  initialValue: itemModel.adress,
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
              for (final itemModel in itemModels)
                ElevatedButton(
                  onPressed: () async {
                    final selectedDate = await showDatePicker(
                      context: context,
                      initialDate: itemModel.date,
                      firstDate: itemModel.date,
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
                    selectedDateFormatted ??
                        DateFormat.yMMMMEEEEd().format(itemModel.date),
                    style: GoogleFonts.montserrat(),
                  ),
                ),
              const SizedBox(
                height: 20,
              ),
              for (final itemModel in itemModels)
                ElevatedButton(
                  onPressed: () async {
                    final selectedTime = await showTimePicker(
                        context: context, initialTime: TimeOfDay.now());
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
                    selectedTimeFormatted ?? itemModel.time.toString(),
                    style: GoogleFonts.montserrat(),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
