import 'package:flutter/material.dart';
import 'package:pocket_fridge/styles/textsStyle.dart';

class RecipeItem extends StatefulWidget {
  final String imagePath;
  final String recipeName;
  final VoidCallback onTap;
  final ColorFilter backcolor;
  final String? recipeText;

  const RecipeItem({
    Key? key,
    required this.imagePath,
    required this.recipeName,
    required this.onTap,
    required this.backcolor,
    this.recipeText,
  }) : super(key: key);

  @override
  State<RecipeItem> createState() => _RecipeItemState();
}

class _RecipeItemState extends State<RecipeItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        height: 400.0,
        margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          image: DecorationImage(
            image: AssetImage(widget.imagePath),
            fit: BoxFit.cover,
            colorFilter: widget.backcolor,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.recipeName,
              style: textStyleH1registration,
            ),
            if (widget.recipeText != null)
              Text(
                widget.recipeText!,
                style: textStyleSign,
              ),
          ],
        ),
      ),
    );
  }
}
