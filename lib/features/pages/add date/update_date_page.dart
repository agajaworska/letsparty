import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:ionicons/ionicons.dart';
import 'package:letsparty/data/remote_data_sources/items_remote_data_source.dart';
import 'package:letsparty/features/pages/date/cubit/date_cubit.dart';
import 'package:letsparty/domain/repositories/items_repository.dart';
import 'package:letsparty/widgets/widgets.dart';

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
              backgroundColor: const Color.fromARGB(255, 144, 222, 212),
              appBar: AppBar(
                  backgroundColor: const Color.fromARGB(255, 144, 222, 212),
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
                  style: GoogleFonts.montserrat(),
                  initialValue: itemModel.city,
                  onChanged: onCityChanged,
                  decoration: textFieldDecoration(
                    text: itemModel.city,
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
              for (final itemModel in itemModels)
                TextFormField(
                  style: GoogleFonts.montserrat(),
                  initialValue: itemModel.adress,
                  onChanged: onAdressChanged,
                  decoration: textFieldDecoration(
                    text: itemModel.adress,
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
                  style: elevatedButtonStyle(),
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
                  style: elevatedButtonStyle(),
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
