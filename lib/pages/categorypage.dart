import 'package:flutter/material.dart';
import 'package:pocket_fridge/headerfooter/headerfooter.dart';
import 'package:pocket_fridge/pageitems/productslist.dart';
import 'package:pocket_fridge/styles/textsStyle.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  final selectedIndex = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PocketHeader(
        backgroundColor: Color.fromARGB(170, 0, 128, 0),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                const SizedBox(
                  width: 12,
                  height: 80,
                ),
                const Text(
                  "{Category Name}",
                  style: TextStyle(
                    color: Color.fromARGB(170, 0, 128, 0),
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.w500,
                    fontSize: 32,
                  ),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.tune,
                    size: 24,
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView(
                children: const [
                  ProductItem(),
                  ProductItem(),
                  ProductItem(),
                  ProductItem(),
                  ProductItem(),
                  ProductItem(),
                  ProductItem(),
                  ProductItem(),
                  ProductItem(),
                  ProductItem()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
