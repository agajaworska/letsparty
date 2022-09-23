import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:letsparty/data/remote_data_sources/remote_data_source.dart';
import 'package:letsparty/features/pages/detailsTheme/cubit/details_theme_cubit.dart';
import 'package:letsparty/features/pages/theme/cubit/theme_cubit.dart';
import 'package:letsparty/repositories/repository.dart';

class ThemePage extends StatelessWidget {
  ThemePage({Key? key}) : super(key: key);

  final controller = TextEditingController();
  void clearText() {
    controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeCubit(Repository(RemoteDataSource()))..start(),
      child: BlocBuilder<ThemeCubit, ThemeState>(builder: (context, state) {
        return Scaffold(
          backgroundColor: const Color.fromARGB(255, 212, 208, 245),
          appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 212, 208, 245),
            title: Text(
              'P A R T Y  T H E M E',
              style: GoogleFonts.bebasNeue(
                fontSize: 35,
                color: Colors.grey.shade900,
              ),
            ),
          ),
          bottomSheet: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              heightFactor: 0.5,
              child: TextField(
                controller: controller,
                style: GoogleFonts.montserrat(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Add photo url http://....',
                  hintStyle: GoogleFonts.montserrat(color: Colors.white),
                  prefixIcon: const Icon(
                    Icons.image_outlined,
                    color: Colors.white,
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      context.read<ThemeCubit>().add(imageUrl: controller.text);
                      clearText();
                    },
                    icon: const Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
          body: Builder(
            builder: (context) {
              if (state.errorMessage.isNotEmpty) {
                return const Text('Wystąpił nieoczekiwany problem');
              }
              if (state.isLoading) {
                return const Text('Trwa ładowanie danych');
              }

              final themeModels = state.documents;

              return GridView.count(
                crossAxisCount: 2,
                children: [
                  for (final themeModel in themeModels) ...[
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Dismissible(
                        key: ValueKey(themeModel.id),
                        onDismissed: (_) {
                          context
                              .read<ThemeCubit>()
                              .remove(documentID: themeModel.id);
                        },
                        child: InkWell(
                          onTap: (() {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (_) => DetailsThemePage(
                                      id: themeModel.id,
                                      imageUrl: themeModel.imageUrl,
                                    )));
                          }),
                          child: Container(
                            height: 150,
                            width: 150,
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
                              image: DecorationImage(
                                image: NetworkImage(
                                  themeModel.imageUrl,
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ],
              );
            },
          ),
        );
      }),
    );
  }
}

class DetailsThemePage extends StatelessWidget {
  const DetailsThemePage({required this.id, required this.imageUrl, Key? key})
      : super(key: key);

  final String id;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DetailsThemeCubit(Repository(RemoteDataSource()))
        ..getPhotoWithId(id, imageUrl),
      child: BlocBuilder<DetailsThemeCubit, DetailsThemeState>(
        builder: (context, state) {
          final themeModel = state.themeModel;
          if (themeModel == null) {
            return Scaffold(
              backgroundColor: const Color.fromARGB(255, 212, 208, 245),
              appBar: AppBar(),
              body: const Center(
                child: CircularProgressIndicator(),
              ),
            );
          }

          return Scaffold(
              backgroundColor: const Color.fromARGB(255, 212, 208, 245),
              appBar: AppBar(),
              body: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.contain,
                        image: NetworkImage(themeModel.imageUrl))),
              ));
        },
      ),
    );
  }
}
