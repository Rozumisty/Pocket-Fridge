import 'package:flutter/material.dart';
import 'package:pocket_fridge/styles/textsStyle.dart';

class ProductItem extends StatefulWidget {
  const ProductItem({Key? key}) : super(key: key);

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4,top: 6, left: 8, right: 8),
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(170, 0, 128, 0),
          borderRadius: BorderRadius.circular(8.0),
        ),
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 100.0,
              height: 100.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                image: const DecorationImage(
                  image: AssetImage(
                      'assets/images/baby-carrots.jpg'),  // image
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Carrot', // title
                    style: textStyleStorageItemLabel,
                  ),
                  Container(margin: const EdgeInsets.only(top: 12)),
                  const Text(
                    'Expiration date: 01.01.2024', // expire
                    style: textStyleSmall,
                  ),
                  Container(margin: const EdgeInsets.only(top: 8)),
                  const Text(
                    'Quantity: 10 pieces', // quantity
                    style: textStyleSmall,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
