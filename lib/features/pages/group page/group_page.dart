import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:letsparty/features/pages/create%20group/create_group.dart';
import 'package:letsparty/features/pages/join%20group/join_group.dart';
import 'package:letsparty/widgets/widgets.dart';

class GroupPage extends StatelessWidget {
  const GroupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: 200,
              width: 200,
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => JoinGroup()));
                },
                child: NewBox(
                  boxDecoration:
                      inactiveBoxDecoration(iconPath: 'images/join.png'),
                  child: Text(
                    'Join the group',
                    style: GoogleFonts.bebasNeue(
                      fontSize: 32,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 200,
              width: 200,
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => CreateGroup()));
                },
                child: NewBox(
                  boxDecoration:
                      inactiveBoxDecoration(iconPath: 'images/group.png'),
                  child: Text(
                    'Create a group',
                    style: GoogleFonts.bebasNeue(
                      fontSize: 32,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
