import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:letsparty/features/pages/add%20spendings/add_spendings_page.dart';
import 'package:letsparty/features/pages/add%20spendings/cubit/add_spendings_cubit.dart';
import 'package:letsparty/features/pages/budget/cubit/budget_cubit.dart';

class BudgetPage extends StatelessWidget {
  BudgetPage({Key? key}) : super(key: key);

  final controller = TextEditingController();

  void clearText() {
    controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BudgetCubit()..start(),
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 212, 208, 245),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 212, 208, 245),
          title: Text(
            'F i n a n s e',
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
                builder: (context) => const AddSpendingsPage(),
                fullscreenDialog: true,
              ),
            );
          },
          child: const Icon(Icons.add),
        ),
        body: BlocBuilder<BudgetCubit, BudgetState>(
          builder: (context, state) {
            if (state.errorMessage.isNotEmpty) {
              return const Text('Wystąpił nieoczekiwany problem');
            }
            if (state.isLoading == true) {
              return const Text('Trwa ładowanie danych');
            }
            final budgetModels = state.documents;

            return ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 0.0),
                  child: Text(
                    'Informacje o wysokości składki oraz dane do przelewu:',
                    style: GoogleFonts.montserrat(
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                for (final budgetModel in budgetModels) ...[
                  Dismissible(
                    key: ValueKey(budgetModel.id),
                    onDismissed: (_) {
                      context
                          .read<BudgetCubit>()
                          .remove(documentID: budgetModel.id);
                    },
                    child: DataBox(
                      (budgetModel.data),
                    ),
                  ),
                ],
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextField(
                    controller: controller,
                    style: GoogleFonts.montserrat(),
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
                      hintText: 'Podaj kwotę i dane przelewu',
                      hintStyle: GoogleFonts.montserrat(),
                      prefixIcon: const Icon(
                        Icons.monetization_on_outlined,
                        color: Color.fromARGB(183, 119, 77, 175),
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          context
                              .read<BudgetCubit>()
                              .add(data: controller.text);
                          controller.clear();
                        },
                        icon: const Icon(
                          Icons.add,
                          color: Color.fromARGB(183, 119, 77, 175),
                        ),
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 0),
                  child: Divider(
                      thickness: 1.0, color: Color.fromARGB(76, 82, 67, 92)),
                ),
                const ListOfSpendings(),
              ],
            );
          },
        ),
      ),
    );
  }
}

class DataBox extends StatelessWidget {
  const DataBox(
    this.title, {
    Key? key,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.all(20),
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
          title,
          style: GoogleFonts.montserrat(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class ListOfSpendings extends StatelessWidget {
  const ListOfSpendings({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: BlocProvider(
          create: (context) => AddSpendingsCubit()..start(),
          child: BlocBuilder<AddSpendingsCubit, AddSpendingsState>(
            builder: (context, state) {
              if (state.errorMessage.isNotEmpty) {
                return const Text('Wystąpił nieoczekiwany problem');
              }
              if (state.isLoading) {
                return const Text('Trwa ładowanie danych');
              }
              final documents = state.documents;
              return Column(
                children: [
                  Center(
                    child: Text(
                      'Lista wydatków:',
                      style: GoogleFonts.montserrat(
                        fontSize: 20,
                        textStyle: const TextStyle(),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  for (final document in documents) ...[
                    Dismissible(
                      key: ValueKey(document.id),
                      onDismissed: (_) {
                        context
                            .read<AddSpendingsCubit>()
                            .remove(documentID: document.id);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              document['name'],
                              style: GoogleFonts.montserrat(
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              '${document['outgoing']}${' zł'}',
                              style: GoogleFonts.montserrat(fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
