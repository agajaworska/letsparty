import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:letsparty/data/remote_data_sources/weather_remote_data_sources.dart';
import 'package:letsparty/features/enums/enums.dart';
import 'package:letsparty/features/pages/add%20date/add_date_page.dart';
import 'package:letsparty/features/pages/add%20date/update_date_page.dart';
import 'package:letsparty/features/pages/date/cubit/date_cubit.dart';
import 'package:letsparty/features/pages/weather/cubit/weather_cubit.dart';
import 'package:letsparty/models/item_model.dart';
import 'package:letsparty/models/weather_model.dart';
import 'package:letsparty/repositories/repository.dart';
import 'package:letsparty/repositories/weather_repository.dart';

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
      create: (context) => DateCubit(
        Repository(),
      )..start(),
      child: BlocBuilder<DateCubit, DateState>(
        builder: (context, state) {
          final itemModels = state.items;

          return ListView(children: [
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Icon(
                    Icons.location_city_outlined,
                  ),
                ),
                for (final itemModel in itemModels)
                  _CityBox(itemModel: itemModel),
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
              children: [
                const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Icon(
                    Icons.calendar_month_outlined,
                  ),
                ),
                BlocProvider(
                  create: (context) => WeatherCubit(
                      WeatherRepository(WeatherRemoteDataSource())),
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
                  }, builder: (context, state) {
                    final weatherModel = state.model;
                    if (state.status == Status.loading) {
                      return const Text('Loading');
                    }
                    return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (weatherModel != null)
                            _WeatherBox(
                              weatherModel: weatherModel,
                            )
                        ]);
                  }),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => UpdatePage(key),
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
          itemModel.city,
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

class _WeatherBox extends StatelessWidget {
  const _WeatherBox({
    Key? key,
    required this.weatherModel,
  }) : super(key: key);

  final WeatherModel weatherModel;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(children: [
        Text(
          weatherModel.city,
          style: GoogleFonts.montserrat(
            fontSize: 18,
          ),
        ),
        Text(
          weatherModel.temperature.toString(),
          style: GoogleFonts.montserrat(
            fontSize: 18,
          ),
        ),
      ]),
    );
  }
}
