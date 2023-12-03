import 'package:flutter/material.dart';
import 'package:pocket_fridge/headerfooter/headerfooter.dart';
import 'package:pocket_fridge/pageitems/productslist.dart';

class CategoryPage extends StatefulWidget {

  final Color appbarback;
  final String labeltext;
  final Color textstyle;
  final List<ProductItem> productItems;

  const CategoryPage({Key? key, required this.appbarback, required this.labeltext, required this.textstyle, required this.productItems}) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  final selectedIndex = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PocketHeader(
        backgroundColor: widget.appbarback,
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
                 Text(
                  widget.labeltext,
                  style: TextStyle(
                    color: widget.textstyle,
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
                children: 
                  widget.productItems,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
