import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:letsparty/features/pages/add%20spendings/add_spendings_page.dart';

class BudgetPage extends StatelessWidget {
  BudgetPage({Key? key}) : super(key: key);

  final controller = TextEditingController();

  void clearText() {
    controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: StreamBuilder<QuerySnapshot<Object?>>(
        stream: FirebaseFirestore.instance.collection('finance').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text('Wystąpił nieoczekiwany problem');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text('Trwa ładowanie danych');
          }
          final documents = snapshot.data!.docs;

          return Column(children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                'Dane do przelewu:',
                style: GoogleFonts.montserrat(
                  fontSize: 20,
                ),
              ),
            ),
            for (final document in documents) ...[
              Dismissible(
                key: ValueKey(document.id),
                onDismissed: (_) {
                  FirebaseFirestore.instance
                      .collection('finance')
                      .doc(document.id)
                      .delete();
                },
                child: DataBox(
                  title: document['data'],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextField(
                  controller: controller,
                  style: GoogleFonts.montserrat(),
                  decoration: InputDecoration(
                    hintText: 'Wpisz dane do przelewu',
                    hintStyle: GoogleFonts.montserrat(),
                    prefixIcon: const Icon(
                      Icons.monetization_on_outlined,
                      color: Color.fromARGB(205, 107, 26, 213),
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        FirebaseFirestore.instance
                            .collection('finance')
                            .add({'data': controller.text});
                        clearText();
                      },
                      icon: const Icon(
                        Icons.add,
                        color: Color.fromARGB(205, 107, 26, 213),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8.0),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: StreamBuilder<QuerySnapshot<Object?>>(
                      stream: FirebaseFirestore.instance
                          .collection('spendings')
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return const Text('Wystąpił nieoczekiwany problem');
                        }
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Text('Trwa ładowanie danych');
                        }
                        final documents = snapshot.data!.docs;
                        return ListView(
                          children: [
                            Center(
                              child: Text(
                                'Lista wydatków:',
                                style: GoogleFonts.montserrat(fontSize: 20),
                              ),
                            ),
                            const SizedBox(height: 20),
                            for (final document in documents) ...[
                              Dismissible(
                                key: ValueKey(document.id),
                                onDismissed: (_) {
                                  FirebaseFirestore.instance
                                      .collection('spendings')
                                      .doc(document.id)
                                      .delete();
                                },
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      document['name'],
                                      style:
                                          GoogleFonts.montserrat(fontSize: 18),
                                    ),
                                    Text(
                                      document['outgoing'].toString() +
                                          '${' zł'}',
                                      style:
                                          GoogleFonts.montserrat(fontSize: 18),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ],
                        );
                      }),
                ),
              )
            ]
          ]);
        },
      ),
    );
  }
}

class DataBox extends StatelessWidget {
  const DataBox({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 76,
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
            offset: const Offset(-5, -5),
            blurRadius: 6.0,
            color: const Color.fromARGB(255, 232, 222, 240),
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
    );
  }
}
