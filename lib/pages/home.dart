import 'package:flutter/material.dart';
import 'package:pocket_fridge/styles/textsStyle.dart';
import 'package:pocket_fridge/pageitems/productslist.dart';

import 'package:pocket_fridge/headerfooter/headerfooter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PocketHeader(),
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
                  "Storage",
                  style: textStyleStorage,
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
      bottomNavigationBar: PocketFooter(selectedIndex: selectedIndex),
    );
  }
}
