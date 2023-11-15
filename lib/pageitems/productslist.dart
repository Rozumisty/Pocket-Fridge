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
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 200, 162, 200),
          borderRadius: BorderRadius.circular(8.0),
        ),
        padding: const EdgeInsets.all(16.0),
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
                      'assets/images/baby-carrots.jpg'), 
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
                    'Carrot',
                    style: textStyleStorageItemLabel,
                  ),
                  Container(margin: const EdgeInsets.only(top: 12)),
                  const Text(
                    'Expiration date: 01.01.2024',
                    style: textStyleSmall,
                  ),
                  Container(margin: const EdgeInsets.only(top: 8)),
                  const Text(
                    'Quantity: 10 pieces',
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
