import 'package:flutter/material.dart';
import 'package:pocket_fridge/headerfooter/headerfooter.dart';

class RecipePage extends StatefulWidget {
  const RecipePage({Key? key}) : super(key: key);

  @override
  State<RecipePage> createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {
  final selectedIndex = 2;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: const PocketHeader(),
      bottomNavigationBar: PocketFooter(selectedIndex: selectedIndex),
    );
  }
}
