import 'package:flutter/material.dart';
import 'package:pocket_fridge/styles/textsStyle.dart';
import 'package:pocket_fridge/pageitems/productslist.dart';
import 'package:pocket_fridge/pageitems/categorylist.dart';
import 'package:pocket_fridge/headerfooter/headerfooter.dart';
import 'package:pocket_fridge/pages/categorypage.dart';
import 'package:pocket_fridge/pages/addproduct.dart';


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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Додайте тут код для обробки натискання на кнопку
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddProduct(),
            ),
          );
        },
        backgroundColor: const Color.fromARGB(225, 144, 122, 255),
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
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
    return ListView(
      children: [
        CategoryItem(
          categoryName: "VEGETABLES",
          imagePath: "assets/images/vegetable-cat.jpg",
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CategoryPage(
                  appbarback: Color.fromARGB(255, 99, 189, 15),
                  labeltext: "VEGETABLES",
                  textstyle: Color.fromARGB(255, 99, 189, 15),
                  productItems: [
                    ProductItem(
                      imagePath: 'assets/images/baby-carrots.jpg',
                      title: 'Carrot',
                      expirationDate: '01.01.2024',
                      quantity: '10 pieces',
                      containerback: Color.fromARGB(255, 99, 189, 15),
                    ),
                    ProductItem(
                      imagePath: 'assets/images/onion.jpg',
                      title: 'Onion',
                      expirationDate: '05.03.2024',
                      quantity: '7 pieces',
                      containerback: Color.fromARGB(255, 99, 189, 15),
                    ),
                    ProductItem(
                      imagePath: 'assets/images/potato.jpg',
                      title: 'Potato',
                      expirationDate: '03.05.2024',
                      quantity: '22 pieces',
                      containerback: Color.fromARGB(255, 99, 189, 15),
                    ),
                    ProductItem(
                      imagePath: 'assets/images/red-pepper.jpg',
                      title: 'Red Pepper',
                      expirationDate: '24.12.2023',
                      quantity: '2 pieces',
                      containerback: Color.fromARGB(255, 99, 189, 15),
                    ),
                    ProductItem(
                      imagePath: 'assets/images/tomatoes.jpg',
                      title: 'Tomato',
                      expirationDate: '28.12.2023',
                      quantity: '10 pieces',
                      containerback: Color.fromARGB(255, 99, 189, 15),
                    ),
                    ProductItem(
                      imagePath: 'assets/images/cucumber.jpg',
                      title: 'Cucumber',
                      expirationDate: '21.12.2023',
                      quantity: '6 pieces',
                      containerback: Color.fromARGB(255, 99, 189, 15),
                    )
                  ],
                ),
              ),
            );
          },
        ),
        CategoryItem(
          categoryName: "DAIRY",
          imagePath: "assets/images/milk-products-on-wooden-table.jpg",
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CategoryPage(
                  appbarback: Color.fromARGB(255, 166, 167, 166),
                  labeltext: "DAIRY",
                  textstyle: Color.fromARGB(255, 166, 167, 166),
                  productItems: [
                    ProductItem(
                      imagePath: 'assets/images/milk.png',
                      title: 'Milk',
                      expirationDate: '12.12.2023',
                      quantity: '2 ltr',
                      containerback: Color.fromARGB(255, 166, 167, 166),
                    ),
                    ProductItem(
                      imagePath: 'assets/images/sourcream.jpg',
                      title: 'Sour Cream',
                      expirationDate: '09.01.2024',
                      quantity: '300 gr',
                      containerback: Color.fromARGB(255, 166, 167, 166),
                    ),
                    ProductItem(
                      imagePath: 'assets/images/delicious-piece-cheese.jpg',
                      title: 'Cheese',
                      expirationDate: '08.01.2024',
                      quantity: '3 pieces',
                      containerback: Color.fromARGB(255, 166, 167, 166),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        CategoryItem(
          categoryName: "FISH",
          imagePath: "assets/images/fish.jpg",
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CategoryPage(
                  appbarback: Color.fromARGB(255, 29, 160, 149),
                  labeltext: "FISH",
                  textstyle: Color.fromARGB(255, 29, 160, 149),
                  productItems: [
                    ProductItem(
                      imagePath: 'assets/images/raw-salmon-meat.jpg',
                      title: 'Salmon',
                      expirationDate: '17.12.2023',
                      quantity: '3 pieces',
                      containerback: Color.fromARGB(255, 29, 160, 149),
                    ),
                    ProductItem(
                      imagePath: 'assets/images/herring.png',
                      title: 'Herring',
                      expirationDate: '19.12.2023',
                      quantity: '2 pieces',
                      containerback: Color.fromARGB(255, 29, 160, 149),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        CategoryItem(
          categoryName: "GROCERY",
          imagePath:
              "assets/images/flat-lay-of-bunch-of-fresh-provisions-for-donation.jpg",
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CategoryPage(
                  appbarback: Color.fromARGB(255, 160, 125, 29),
                  labeltext: "GROCERY",
                  textstyle: Color.fromARGB(255, 160, 125, 29),
                  productItems: [
                    ProductItem(
                      imagePath: 'assets/images/background-full-couscous.jpg',
                      title: 'Milet',
                      expirationDate: '07.02.2025',
                      quantity: '1.5 kg',
                      containerback: Color.fromARGB(255, 160, 125, 29),
                    ),
                    ProductItem(
                      imagePath: 'assets/images/pasta.jpg',
                      title: 'Pasta',
                      expirationDate: '01.01.2026',
                      quantity: '600 gr',
                      containerback: Color.fromARGB(255, 160, 125, 29),
                    ),
                    ProductItem(
                      imagePath: 'assets/images/buckwheat.jpg',
                      title: 'Buckwheat',
                      expirationDate: '01.02.2025',
                      quantity: '2 kg',
                      containerback: Color.fromARGB(255, 160, 125, 29),
                    ),
                    ProductItem(
                      imagePath: 'assets/images/close-up-pistachio-texture.jpg',
                      title: 'Pistachio',
                      expirationDate: '12.08.2026',
                      quantity: '800 gr',
                      containerback: Color.fromARGB(255, 160, 125, 29),
                    ),
                    ProductItem(
                      imagePath:
                          'assets/images/closeup-white-rice-textured.jpg',
                      title: 'White Rice',
                      expirationDate: '15.02.2025',
                      quantity: '1.2 kg',
                      containerback: Color.fromARGB(255, 160, 125, 29),
                    ),
                    ProductItem(
                      imagePath: 'assets/images/olive-oil-bowl.jpg',
                      title: 'Olive Oil',
                      expirationDate: '13.09.2026',
                      quantity: '1 ltr',
                      containerback: Color.fromARGB(255, 160, 125, 29),
                    ),
                    ProductItem(
                      imagePath: 'assets/images/sunflower-seed.jpg',
                      title: 'Sunflower Seed',
                      expirationDate: '19.11.2025',
                      quantity: '400 gr',
                      containerback: Color.fromARGB(255, 160, 125, 29),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        CategoryItem(
          categoryName: "FRUITS",
          imagePath: "assets/images/fruit.jpg",
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CategoryPage(
                  appbarback: Color.fromARGB(255, 160, 29, 83),
                  labeltext: "FRUITS",
                  textstyle: Color.fromARGB(255, 160, 29, 83),
                  productItems: [
                    ProductItem(
                      imagePath: 'assets/images/apple.jpg',
                      title: 'Apple',
                      expirationDate: '07.02.2024',
                      quantity: '12 pieces',
                      containerback: Color.fromARGB(255, 160, 29, 83),
                    ),
                    ProductItem(
                      imagePath: 'assets/images/kiwi.jpg',
                      title: 'Kiwi',
                      expirationDate: '16.01.2024',
                      quantity: '5 pieces',
                      containerback: Color.fromARGB(255, 160, 29, 83),
                    ),
                    ProductItem(
                      imagePath: 'assets/images/grape.jpg',
                      title: 'Grape',
                      expirationDate: '27.12.2023',
                      quantity: '700 gr',
                      containerback: Color.fromARGB(255, 160, 29, 83),
                    ),
                    ProductItem(
                      imagePath: 'assets/images/orange.jpg',
                      title: 'Orange',
                      expirationDate: '19.01.2024',
                      quantity: '8 pieces',
                      containerback: Color.fromARGB(255, 160, 29, 83),
                    ),
                    ProductItem(
                      imagePath: 'assets/images/strawberry.jpg',
                      title: 'Strawberry',
                      expirationDate: '08.01.2024',
                      quantity: '900 gr',
                      containerback: Color.fromARGB(255, 160, 29, 83),
                    ),
                    ProductItem(
                      imagePath: 'assets/images/banana.jpg',
                      title: 'Banana',
                      expirationDate: '20.12.2023',
                      quantity: '5 pieces',
                      containerback: Color.fromARGB(255, 160, 29, 83),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        CategoryItem(
          categoryName: "MEAT",
          imagePath: "assets/images/meat.jpg",
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CategoryPage(
                  appbarback: Color.fromARGB(255, 160, 29, 29),
                  labeltext: "MEAT",
                  textstyle: Color.fromARGB(255, 160, 29, 29),
                  productItems: [
                    ProductItem(
                      imagePath: 'assets/images/chicken-breast.jpg',
                      title: 'Chicken Breast',
                      expirationDate: '07.12.2023',
                      quantity: '400 gr',
                      containerback: Color.fromARGB(255, 160, 29, 29),
                    ),
                    ProductItem(
                      imagePath: 'assets/images/chicken-wings.jpg',
                      title: 'Chicken Breast',
                      expirationDate: '11.12.2023',
                      quantity: '12 pieces',
                      containerback: Color.fromARGB(255, 160, 29, 29),
                    ),
                    ProductItem(
                      imagePath: 'assets/images/ham.jpg',
                      title: 'Chicken Breast',
                      expirationDate: '18.12.2023',
                      quantity: '600 gr',
                      containerback: Color.fromARGB(255, 160, 29, 29),
                    ),
                    ProductItem(
                      imagePath: 'assets/images/pork-chop.jpg',
                      title: 'Chicken Breast',
                      expirationDate: '16.12.2023',
                      quantity: '300 gr',
                      containerback: Color.fromARGB(255, 160, 29, 29),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
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
