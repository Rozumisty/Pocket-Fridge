import 'package:flutter/material.dart';
import 'package:pocket_fridge/styles/textsStyle.dart';
import 'package:pocket_fridge/pageitems/productslist.dart';
import 'package:pocket_fridge/pageitems/categorylist.dart';
import 'package:pocket_fridge/headerfooter/headerfooter.dart';
import 'package:pocket_fridge/pages/categorypage.dart';
import 'package:pocket_fridge/pages/addproduct.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final selectedIndex = 0;
  List<Category> categories = [];

  late SharedPreferences prefs;
  late String userLogin;

  @override
  void initState() {
    super.initState();
    initPreferences().then((_) {
      getUser();
    });
  }

  Future<void> initPreferences() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      userLogin = prefs.getString('userLogin') ?? '';
    });
  }

  void getUser() async {
    final uri = Uri(
      scheme: 'http',
      host: '26.136.102.158',
      port: 8080,
      path: '/getUserFridge',
      queryParameters: {
        'login': userLogin,
      },
    );

    try {
      var response = await http.get(uri);
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        List<Category> tempCategories = [];

        data.forEach((categoryName, productsJson) {
          List<Product> products = (productsJson as List)
              .map((productJson) => Product.fromJson(productJson))
              .toList();

          tempCategories.add(Category(name: categoryName, products: products));
        });

        setState(() {
          categories = tempCategories;
        });
      } else {
        print('GET request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

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
                Row(
                  children: [
                    const Text(
                      "Force to refresh", style: textStyleSmall2,
                    ),
                    IconButton(
                      onPressed: () {
                        getUser();
                      },
                      icon: const Icon(
                        Icons.refresh,
                        size: 24,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Expanded(
              child: HomeProductCategories(categories: categories),
            ),
          ],
        ),
      ),
      bottomNavigationBar: PocketFooter(selectedIndex: selectedIndex),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
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
  final List<Category> categories;

  const HomeProductCategories({Key? key, required this.categories})
      : super(key: key);

  @override
  State<HomeProductCategories> createState() => _HomeProductCategoriesState();
}

class _HomeProductCategoriesState extends State<HomeProductCategories> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.categories.length,
      itemBuilder: (context, index) {
        var category = widget.categories[index];
        return CategoryItem(
          categoryName: category.name,
          imagePath: "assets/images/categories/${category.name}.jpg",
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CategoryPage(
                  appbarback: Color.fromARGB(255, 200, 162, 200),
                  labeltext: category.name,
                  textstyle: Color.fromARGB(255, 200, 162, 200),
                  productItems: category.products
                      .map((product) => ProductItem(
                            imagePath:
                                'assets/images/products/${product.name}.jpg',
                            title: product.name,
                            expirationDate: product.expirationDate,
                            quantity: '${product.quantity}',
                            containerback: Color.fromARGB(255, 200, 162, 200),
                          ))
                      .toList(),
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class Product {
  final String name;
  final int quantity;
  final String expirationDate;

  Product(
      {required this.name,
      required this.quantity,
      required this.expirationDate});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      name: json['product'],
      quantity: json['quantity'],
      expirationDate: json['expirationDate'],
    );
  }
}

class Category {
  final String name;
  final List<Product> products;

  Category({required this.name, required this.products});
}
