import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:letsparty/data/remote_data_sources/theme_photos_remote_data_source.dart';

import 'package:letsparty/features/pages/detailsTheme/cubit/details_theme_cubit.dart';
import 'package:letsparty/features/pages/theme/cubit/theme_cubit.dart';
import 'package:letsparty/domain/repositories/theme_photos_repository.dart';
import 'package:letsparty/widgets/widgets.dart';

class ThemePage extends StatelessWidget {
  ThemePage({Key? key}) : super(key: key);

  final controller = TextEditingController();
  void clearText() {
    controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ThemeCubit(ThemePhotosRepository(ThemePhotosRemoteDataSource()))
            ..start(),
      child: BlocBuilder<ThemeCubit, ThemeState>(builder: (context, state) {
        return Scaffold(
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
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: controller,
                      style: GoogleFonts.montserrat(color: Colors.white),
                      decoration: textFieldDecoration(
                        text: 'Add photo url',
                        icon: const Icon(
                          Ionicons.image_outline,
                          color: Colors.white,
                        ),
                      ).copyWith(
                        hintText: 'Add photo url ...jpg',
                        hintStyle: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      context.read<ThemeCubit>().add(imageUrl: controller.text);
                      clearText();
                    },
                    icon: const Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          body: Builder(
            builder: (context) {
              if (state.errorMessage.isNotEmpty) {
                return const Center(child: Text('Oops, we have a problem :('));
              }
              if (state.isLoading) {
                return const Center(child: Text('Loading...'));
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
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => DetailsThemePage(
                                  id: themeModel.id,
                                  imageUrl: themeModel.imageUrl,
                                ),
                              ),
                            );
                          }),
                          child: ThemeImageWidget(themeModel: themeModel),
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
      create: (context) => DetailsThemeCubit(
          ThemePhotosRepository(ThemePhotosRemoteDataSource()))
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
            appBar: AppBar(
              backgroundColor: const Color.fromARGB(255, 212, 208, 245),
            ),
            body: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.contain,
                  image: NetworkImage(themeModel.imageUrl),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
