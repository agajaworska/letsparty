import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:letsparty/data/remote_data_sources/remote_data_source.dart';
import 'package:letsparty/features/pages/add%20spendings/add_spendings_page.dart';
import 'package:letsparty/features/pages/add%20spendings/cubit/add_spendings_cubit.dart';
import 'package:letsparty/features/pages/budget/cubit/budget_cubit.dart';
import 'package:letsparty/domain/repositories/repository.dart';

class BudgetPage extends StatelessWidget {
  BudgetPage({Key? key}) : super(key: key);

  final controller = TextEditingController();

  void clearText() {
    controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BudgetCubit(Repository(RemoteDataSource()))..start(),
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 212, 208, 245),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 212, 208, 245),
          title: Text(
            'B u d g e t',
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
              return const Center(child: Text('Oops, we have a problem :('));
            }
            if (state.isLoading == true) {
              return const Center(child: Text('Loading ...'));
            }
            final budgetModels = state.documents;

            return ListView(children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 0.0),
                child: Text(
                  'Bank transfer details:',
                  style: GoogleFonts.montserrat(
                    fontSize: 20,
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
                    hintText: 'Total cost and bank details transfer',
                    hintStyle: GoogleFonts.montserrat(),
                    prefixIcon: const Icon(
                      Icons.monetization_on_outlined,
                      color: Color.fromARGB(183, 119, 77, 175),
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        context.read<BudgetCubit>().add(data: controller.text);
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
            ]);
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
    return Container(
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
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: BlocProvider(
        create: (context) =>
            AddSpendingsCubit(Repository(RemoteDataSource()))..start(),
        child: BlocBuilder<AddSpendingsCubit, AddSpendingsState>(
          builder: (context, state) {
            if (state.errorMessage.isNotEmpty) {
              return const Center(child: Text('Oops, we have a problem :('));
            }
            if (state.isLoading) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.purple,
                ),
              );
            }
            final addSpendingsModels = state.documents;
            return Column(
              children: [
                Center(
                  child: Text(
                    'List of spendings:',
                    style: GoogleFonts.montserrat(
                      fontSize: 20,
                      textStyle: const TextStyle(),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                for (final addSpendingsModel in addSpendingsModels) ...[
                  Dismissible(
                    key: ValueKey(addSpendingsModel.id),
                    onDismissed: (_) {
                      context
                          .read<AddSpendingsCubit>()
                          .remove(documentID: addSpendingsModel.id);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            addSpendingsModel.name,
                            style: GoogleFonts.montserrat(
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            addSpendingsModel.price.toString(),
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
    );
  }
}
