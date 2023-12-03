import 'package:flutter/material.dart';
import 'package:pocket_fridge/styles/textsStyle.dart';

class ProductItem extends StatefulWidget {
  final String imagePath;
  final String title;
  final String expirationDate;
  final String quantity;
  final Color containerback;

  const ProductItem({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.expirationDate,
    required this.quantity,
    required this.containerback
  }) : super(key: key);

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4, top: 6, left: 8, right: 8),
      child: Container(
        decoration: BoxDecoration(
          color: widget.containerback,
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
                image: DecorationImage(
                  image: AssetImage(widget.imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: textStyleStorageItemLabel,
                  ),
                  Container(margin: const EdgeInsets.only(top: 12)),
                  Text(
                    'Expiration date: ${widget.expirationDate}',
                    style: textStyleSmall,
                  ),
                  Container(margin: const EdgeInsets.only(top: 8)),
                  Text(
                    'Quantity: ${widget.quantity}',
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
