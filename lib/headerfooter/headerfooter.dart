import 'package:flutter/material.dart';
import 'package:pocket_fridge/styles/textsStyle.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:pocket_fridge/pages/home.dart';
import 'package:pocket_fridge/pages/recipes.dart';
import 'package:pocket_fridge/pages/camerapage.dart';
import 'package:pocket_fridge/pages/profilepage.dart';

class PocketHeader extends StatelessWidget implements PreferredSizeWidget {
  final Color backgroundColor;

  const PocketHeader({Key? key, required this.backgroundColor}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text("Pocket Fridge"),
      titleTextStyle: textStyleSign,
      backgroundColor: backgroundColor,
      actions: <Widget>[
        IconButton(
          onPressed: () {
             Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ProfilePage(),),);
          },
          icon: const Icon(
            Icons.account_circle_sharp,
            size: 36,
          ),
        )
      ],
    );
  }
}


class PocketFooter extends StatefulWidget {
  final int selectedIndex;

  const PocketFooter({Key? key, required this.selectedIndex}) : super(key: key);

  @override
  State<PocketFooter> createState() => _PocketFooterState();
}

class _PocketFooterState extends State<PocketFooter> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
        child: GNav(
          onTabChange: (index) {
            if (index != widget.selectedIndex) {
              setState(() {
              });
              switch (index) {
                case 0:
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                  break;
                case 1:
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => CameraPage()),
                  );
                  break;
                case 2:
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const RecipesPage()),
                  );
                  break;
                default:
              }
            }
          },
          selectedIndex: widget.selectedIndex,
          backgroundColor: Colors.white,
          gap: 12,
          tabBackgroundColor: const Color.fromARGB(255, 200, 162, 200),
          activeColor: Colors.white,
          padding: const EdgeInsets.all(16),
          tabs: const [
            GButton(
              icon: Icons.home_outlined,
              text: "Storage",
            ),
            GButton(
              icon: Icons.linked_camera_outlined,
              text: "Scan",
            ),
            GButton(
              icon: Icons.food_bank_outlined,
              text: "Recipes",
            ),
          ],
        ),
      ),
    );
  }
}

