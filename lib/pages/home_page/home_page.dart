import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:letsparty/features/new_box.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(210, 232, 210, 240),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Text(
                'L E T \'S  P A R T Y ',
                style: GoogleFonts.bebasNeue(fontSize: 45),
              ),
              const SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    SizedBox(
                      height: 130,
                      width: 130,
                      child: NewBox(
                        child: Text('Lista gości'),
                      ),
                    ),
                    SizedBox(
                      height: 130,
                      width: 130,
                      child: NewBox(
                        child: Text('Gdzie i kiedy?'),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    SizedBox(
                      height: 130,
                      width: 130,
                      child: NewBox(
                        child: Text('Menu'),
                      ),
                    ),
                    SizedBox(
                      height: 130,
                      width: 130,
                      child: NewBox(
                        child: Text('Atrakcje'),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    SizedBox(
                      height: 130,
                      width: 130,
                      child: NewBox(
                        child: Text('Motyw imprezy'),
                      ),
                    ),
                    SizedBox(
                      height: 130,
                      width: 130,
                      child: NewBox(
                        child: Text('Finanse'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: (BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.person), label: 'Moje konto'),
          BottomNavigationBarItem(
              icon: Icon(Icons.home_filled), label: 'Strona główna'),
          BottomNavigationBarItem(icon: Icon(Icons.logout), label: 'Wyloguj'),
        ],
      )),
    );
  }
}
