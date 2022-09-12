import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:letsparty/data/remote_data_sources/weather_remote_data_sources.dart';
import 'package:letsparty/features/enums/enums.dart';
import 'package:letsparty/features/pages/add%20date/add_date_page.dart';
import 'package:letsparty/features/pages/add%20date/update_date_page.dart';
import 'package:letsparty/features/pages/date/cubit/date_cubit.dart';
import 'package:letsparty/features/pages/weather/cubit/weather_cubit.dart';

import 'package:letsparty/models/date_model.dart';
import 'package:letsparty/models/weather_model.dart';
import 'package:letsparty/repositories/repository.dart';
import 'package:letsparty/repositories/weather_repository.dart';

class DatePage extends StatefulWidget {
  const DatePage({
    Key? key,
  }) : super(key: key);

  @override
  State<DatePage> createState() => _DatePageState();
}

class _DatePageState extends State<DatePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherCubit(
        WeatherRepository(WeatherRemoteDataSource()),
      ),
      child: BlocConsumer<WeatherCubit, WeatherState>(
        listener: (context, state) {
          if (state.status == Status.error) {
            final errorMessage = state.errorMessage ?? 'Unkown error';
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(errorMessage),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          final weatherModel = state.model;
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
            body: Center(
              child: Builder(builder: (context) {
                if (state.status == Status.loading) {
                  return const Text('Loading');
                }
                return ListView(
                  children: [
                    const _DatePageBody(),
                    Center(
                      child: weatherModel == null
                          ? Text(
                              'Obecna pogoda dla miasta:',
                              style: GoogleFonts.montserrat(fontSize: 18),
                              textAlign: TextAlign.center,
                            )
                          : Text(
                              'Obecna pogoda dla miasta ${weatherModel.city}:',
                              style: GoogleFonts.montserrat(fontSize: 18),
                              textAlign: TextAlign.center,
                            ),
                    ),
                    const SizedBox(height: 10),
                    if (weatherModel != null)
                      _DisplayWeatherWidget(
                        weatherModel: weatherModel,
                      ),
                  ],
                );
              }),
            ),
          );
        },
      ),
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
      create: (context) => DateCubit(
        Repository(),
      )..start(),
      child: BlocBuilder<DateCubit, DateState>(
        builder: (context, state) {
          final dateModels = state.items;

          return Column(children: [
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Icon(
                    Icons.location_city_outlined,
                  ),
                ),
                for (final dateModel in dateModels)
                  _CityBox(dateModel: dateModel),
              ],
            ),
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Icon(
                    Icons.home_outlined,
                  ),
                ),
                for (final dateModel in dateModels)
                  _AdressBox(dateModel: dateModel),
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
                for (final dateModel in dateModels)
                  _DateBox(dateModel: dateModel),
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
                for (final dateModel in dateModels)
                  _HourBox(dateModel: dateModel),
              ],
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              IconButton(
                onPressed: () async {
                  final city = await Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const AddDatePage(),
                      fullscreenDialog: true,
                    ),
                  );
                  return BlocProvider.of<WeatherCubit>(context).getWeatherModel(
                    city: city.toString(),
                  );
                },
                icon: const Icon(
                  Icons.add_outlined,
                ),
              ),
              IconButton(
                onPressed: () async {
                  final city = await Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => UpdatePage(key),
                      fullscreenDialog: true,
                    ),
                  );
                  return BlocProvider.of<WeatherCubit>(context).getWeatherModel(
                    city: city.toString(),
                  );
                },
                icon: const Icon(Icons.edit_outlined),
              ),
              for (final dateModel in dateModels)
                IconButton(
                  onPressed: () {
                    context.read<DateCubit>().remove(documentID: dateModel.id);
                  },
                  icon: const Icon(Icons.delete_outlined),
                ),
            ]),
            const Padding(
              padding: EdgeInsets.fromLTRB(12.0, 0, 12.0, 0.0),
              child: Divider(
                  thickness: 1.0, color: Color.fromARGB(76, 82, 67, 92)),
            ),
          ]);
        },
      ),
    );
  }
}

class _CityBox extends StatelessWidget {
  const _CityBox({
    Key? key,
    required this.dateModel,
  }) : super(key: key);

  final DateModel dateModel;

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
          dateModel.city,
          style: GoogleFonts.montserrat(
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}

class _AdressBox extends StatelessWidget {
  const _AdressBox({
    Key? key,
    required this.dateModel,
  }) : super(key: key);

  final DateModel dateModel;

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
          dateModel.adress,
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
    required this.dateModel,
  }) : super(key: key);

  final DateModel dateModel;

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
          dateModel.relaseDateFormatted(),
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
    required this.dateModel,
  }) : super(key: key);

  final DateModel dateModel;

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
          dateModel.time.toString(),
          style: GoogleFonts.montserrat(
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}

class _DisplayWeatherWidget extends StatelessWidget {
  const _DisplayWeatherWidget({
    Key? key,
    required this.weatherModel,
  }) : super(key: key);

  final WeatherModel weatherModel;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(
        weatherModel.condition,
        style:
            GoogleFonts.montserrat(fontSize: 18, fontWeight: FontWeight.w600),
      ),
      const SizedBox(height: 8),
      Center(
        child: Text(
          '${weatherModel.temperature} st. C',
          style:
              GoogleFonts.montserrat(fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ),
      const SizedBox(height: 10),
    ]);
  }
}

// class _SearchWidget extends StatelessWidget {
//   _SearchWidget({
//     Key? key,
//   }) : super(key: key);

//   final _controller = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20.0),
//       child: Row(
//         children: [
//           Expanded(
//             child: TextField(
//               controller: _controller,
//               style: GoogleFonts.montserrat(),
//               decoration: InputDecoration(
//                 enabledBorder: const OutlineInputBorder(
//                   borderRadius: BorderRadius.all(Radius.circular(15.0)),
//                   borderSide: BorderSide(
//                     width: 2,
//                     color: Color.fromARGB(183, 119, 77, 175),
//                   ),
//                 ),
//                 focusedBorder: const OutlineInputBorder(
//                   borderRadius: BorderRadius.all(Radius.circular(15.0)),
//                   borderSide: BorderSide(
//                     width: 2,
//                     color: Color.fromARGB(183, 119, 77, 175),
//                   ),
//                 ),
//                 hintText: 'Miasto, np. Warsaw',
//                 hintStyle: GoogleFonts.montserrat(),
//                 prefixIcon: const Icon(
//                   Icons.wb_sunny_outlined,
//                   color: Color.fromARGB(183, 119, 77, 175),
//                 ),
//                 suffixIcon: IconButton(
//                   onPressed: () {
//                     context
//                         .read<WeatherCubit>()
//                         .getWeatherModel(_controller.text);
//                   },
//                   icon: const Icon(
//                     Icons.search_outlined,
//                     color: Color.fromARGB(183, 119, 77, 175),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
