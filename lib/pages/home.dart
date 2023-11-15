import 'package:flutter/material.dart';
import 'package:pocket_fridge/styles/textsStyle.dart';
import 'package:pocket_fridge/pageitems/productslist.dart';
import 'package:pocket_fridge/pageitems/categorylist.dart';
import 'package:pocket_fridge/headerfooter/headerfooter.dart';
import 'package:pocket_fridge/pages/categorypage.dart';

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
      appBar: const PocketHeader(
        backgroundColor: Color.fromARGB(255, 200, 162, 200),
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
            const Expanded(
              child: HomeProductCategories(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: PocketFooter(selectedIndex: selectedIndex),
    );
  }
}

class HomeProductCategories extends StatefulWidget {
  const HomeProductCategories({Key? key}) : super(key: key);

  @override
  State<HomeProductCategories> createState() => _HomeProductCategoriesState();
}

class _HomeProductCategoriesState extends State<HomeProductCategories> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => SizedBox(width: 8.0),
      itemCount: 13, // Вказати фіксовану кількість елементів
      itemBuilder: (BuildContext context, int index) {
        return CategoryItem(
          categoryName: "{Category Name}",
          imagePath: 'assets/images/vegetable-cat.jpg',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CategoryPage()),
            );
          },
        );
      },
    );
  }
}


// Для бекенду 

// class HomeProductCategories extends StatefulWidget {
//   final List<Category> categories;

//   const HomeProductCategories({Key? key, required this.categories}) : super(key: key);

//   @override
//   State<HomeProductCategories> createState() => _HomeProductCategoriesState();
// }

// class _HomeProductCategoriesState extends State<HomeProductCategories> {
//   @override
//   Widget build(BuildContext context) {
//     return ListView.separated(
//       separatorBuilder: (context, index) => SizedBox(width: 8.0),
//       itemCount: widget.categories.length,
//       itemBuilder: (BuildContext context, int index) {
//         final category = widget.categories[index];
//         return CategoryItem(
//           categoryName: category.categoryName,
//           imagePath: category.imagePath,
//           onTap: () {
//             print('Категорія "${category.categoryName}" натискана!');
//           },
//         );
//       },
//     );
//   }
// }