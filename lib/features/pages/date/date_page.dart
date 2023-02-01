import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:letsparty/app/core/enums/enums.dart';
import 'package:letsparty/app/core/injection_container.dart';
import 'package:letsparty/data/remote_data_sources/items_remote_data_source.dart';
import 'package:letsparty/domain/models/weather_model.dart';
import 'package:letsparty/domain/repositories/items_repository.dart';
import 'package:letsparty/features/pages/add%20date/add_date_page.dart';
import 'package:letsparty/features/pages/add%20date/update_date_page.dart';
import 'package:letsparty/features/pages/date/cubit/date_cubit.dart';
import 'package:letsparty/features/pages/weather/cubit/weather_cubit.dart';
import 'package:letsparty/widgets/widgets.dart';

class DatePage extends StatefulWidget {
  const DatePage({
    Key? key,
  }) : super(key: key);

  @override
  State<DatePage> createState() => _DatePageState();
}

class _DatePageState extends State<DatePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<WeatherCubit>(
      create: (context) => getIt(),
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
            backgroundColor: const Color.fromARGB(255, 144, 222, 212),
            appBar: AppBar(
              backgroundColor: const Color.fromARGB(255, 144, 222, 212),
              title: Text(
                'W h e r e  &  w h e n',
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
                if (state.status == Status.error) {
                  return const Center(
                      child: Text('Oops, we have a problem :('));
                }
                return ListView(
                  children: [
                    const _DatePageBody(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: weatherModel == null
                            ? Text(
                                'The current weather in the city ...',
                                style: GoogleFonts.montserrat(fontSize: 18),
                                textAlign: TextAlign.center,
                              )
                            : Text(
                                'The current weather in the city of ${weatherModel.location.name}',
                                style: GoogleFonts.montserrat(fontSize: 18),
                                textAlign: TextAlign.center,
                              ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    weatherModel != null
                        ? _DisplayWeatherWidget(
                            weatherModel: weatherModel,
                          )
                        : const RefreshWeather(),
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

class RefreshWeather extends StatelessWidget {
  const RefreshWeather({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          DateCubit(ItemsRepository(ItemsRemoteDataSource()))..start(),
      child: BlocBuilder<DateCubit, DateState>(
        builder: (context, state) {
          final dateModels = state.items;
          for (final dateModel in dateModels) {
            return Column(
              children: [
                IconButton(
                  tooltip: 'Tap to refresh the weather!',
                  onPressed: () async {
                    await BlocProvider.of<WeatherCubit>(context)
                        .getWeather(city: dateModel.city);
                  },
                  icon: const Icon(
                    Icons.refresh_outlined,
                    size: 28,
                  ),
                ),
                Text(
                  'Tap to refresh the weather',
                  style: GoogleFonts.montserrat(fontSize: 12),
                )
              ],
            );
          }
          return const SizedBox.shrink();
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
        ItemsRepository(ItemsRemoteDataSource()),
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
                for (final dateModel in dateModels)
                  Expanded(
                      child: DisplayBox(
                          dateModel: dateModel, name: dateModel.city)),
              ],
            ),
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Icon(
                    Icons.home_outlined,
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
                for (final dateModel in dateModels)
                  Expanded(
                      child: DisplayBox(
                          dateModel: dateModel, name: dateModel.adress)),
              ],
            ),
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Icon(
                    Icons.calendar_month_outlined,
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
                for (final dateModel in dateModels)
                  Expanded(
                    child: DisplayBox(
                      dateModel: dateModel,
                      name: dateModel.relaseDateFormatted(),
                    ),
                  ),
              ],
            ),
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Icon(
                    Icons.watch_later_outlined,
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
                for (final dateModel in dateModels)
                  Expanded(
                      child: DisplayBox(
                          dateModel: dateModel, name: dateModel.time)),
              ],
            ),
            const SizedBox(height: 12),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              IconButton(
                onPressed: () async {
                  final city = await Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => UpdatePage(key),
                      fullscreenDialog: true,
                    ),
                  );
                  if (city == null) return null;
                  if (city != null) {
                    return BlocProvider.of<WeatherCubit>(context).getWeather(
                      city: city.toString(),
                    );
                  }
                },
                icon: const Icon(
                  Icons.edit_outlined,
                  size: 32,
                ),
              ),
              for (final dateModel in dateModels)
                IconButton(
                  onPressed: () {
                    context.read<DateCubit>().remove(documentID: dateModel.id);
                  },
                  icon: const Icon(
                    Icons.delete_outlined,
                    size: 32,
                  ),
                ),
              IconButton(
                onPressed: () async {
                  final city = await Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const AddDatePage(),
                      fullscreenDialog: true,
                    ),
                  );
                  if (city == null) return null;
                  if (city != null)
                    return BlocProvider.of<WeatherCubit>(context).getWeather(
                      city: city.toString(),
                    );
                },
                icon: const Icon(
                  Icons.add_outlined,
                  size: 32,
                ),
              ),
            ]),
            const Padding(
              padding: EdgeInsets.fromLTRB(12.0, 0, 12.0, 0.0),
              child: Divider(
                  thickness: 1.0, color: Color.fromARGB(76, 82, 67, 92)),
            ),
            const SizedBox(height: 12),
          ]);
        },
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
        weatherModel.current.condition.text,
        style:
            GoogleFonts.montserrat(fontSize: 18, fontWeight: FontWeight.w600),
      ),
      const SizedBox(height: 8),
      Center(
        child: Text(
          '${weatherModel.current.temperature} st. C',
          style:
              GoogleFonts.montserrat(fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ),
      const SizedBox(height: 10),
    ]);
  }
}
