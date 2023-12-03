import 'package:flutter/material.dart';
import 'package:pocket_fridge/headerfooter/headerfooter.dart';
import 'package:pocket_fridge/pageitems/recepieslist.dart';
import 'package:pocket_fridge/styles/textsStyle.dart';
import 'package:pocket_fridge/pages/recipepage.dart';

class RecipesPage extends StatefulWidget {
  const RecipesPage({Key? key}) : super(key: key);

  @override
  State<RecipesPage> createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipesPage> {
  final selectedIndex = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PocketHeader(
        backgroundColor: Color.fromARGB(255, 200, 162, 200),
      ),
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
                  "Recipes",
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
              child: RecipeBlock(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: PocketFooter(selectedIndex: selectedIndex),
    );
  }
}

class RecipeBlock extends StatefulWidget {
  const RecipeBlock({Key? key}) : super(key: key);

  @override
  State<RecipeBlock> createState() => _RecipeBlockState();
}

class _RecipeBlockState extends State<RecipeBlock> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        RecipeItem(
          imagePath: "assets/images/chicken-breast-recipe.jpg",
          recipeName: "Fried Chicken Breast",
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const RecipePage(
                    categoryName: "Fried Chicken Breast",
                    imagePath: "assets/images/chicken-breast-recipe.jpg",
                    desciption: """Ingredients:

2 boneless, skinless chicken breasts
Salt and black pepper to taste
2 tablespoons olive oil
1 teaspoon paprika
1/2 teaspoon onion powder
Tomatoes for garnish (optional)
Instructions:

1. Season both sides of the chicken breasts with salt and black pepper.

2. In a large skillet, heat olive oil over medium-high heat.

3. Add the chicken breasts to the skillet and sear for about 6-7 minutes on each side, or until the internal temperature reaches 165°F (74°C) and the chicken is golden brown.

4. In the last minute of cooking, add minced garlic to the pan and sauté until fragrant.

5. Sprinkle dried thyme, paprika, onion powder, and garlic powder over the chicken, flipping the breasts to ensure even coating. Cook for an additional minute.

6. Remove the chicken from the skillet and let it rest for a few minutes before slicing.

7. Garnish with fresh parsley and serve with lemon wedges on the side.

This pan-seared chicken breast is versatile and can be served with various side dishes like roasted vegetables, rice, or a fresh salad. 

Enjoy your meal!

"""),
              ),
            );
          },
          backcolor: ColorFilter.mode(
            const Color.fromARGB(255, 0, 0, 0).withOpacity(0.07),
            BlendMode.darken,
          ),
        ),
        RecipeItem(
          imagePath: "assets/images/pastarecipe.jpg",
          recipeName: "Pasta with cheese",
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const RecipePage(categoryName: "Pasta with cheese",imagePath: "assets/images/pastarecipe.jpg", desciption: """Ingredients:

400g spaghetti
1 cup grated Parmesan cheese
1 teaspoon salt
1/2 teaspoon black pepper
Tomatoes for garnish
Instructions:

1. Cook the spaghetti in salted water until al dente, following the instructions on the package. Meanwhile, heat the butter in a large skillet over medium heat.

2. Add the chopped garlic to the melted butter and sauté for 1-2 minutes until the garlic becomes aromatic.

3. Pour in the heavy cream and continue to cook over medium heat, adjusting the temperature to avoid boiling.

4. Gradually add the grated Parmesan and mixed cheese, stirring until the cheese is completely melted, and the sauce has a smooth texture.

5. Season with salt and pepper to taste, continuing to stir.

6. Once the spaghetti is cooked, drain it and add it to the sauce, tossing until the pasta is well coated.

7. Serve the Alfredo pasta hot, garnished with chopped parsley.

Enjoy your meal!

"""),
              ),
            );
          },
          backcolor: ColorFilter.mode(
            const Color.fromARGB(255, 0, 0, 0).withOpacity(0.07),
            BlendMode.darken,
          ),
        ),
        RecipeItem(
          imagePath: "assets/images/borsch.jpg",
          recipeName: "Borsch",
          onTap: () {},
          backcolor: ColorFilter.mode(
            const Color.fromARGB(255, 0, 0, 0).withOpacity(0.75),
            BlendMode.darken,
          ),
          recipeText: """

There are missing products such as:
- beet
- cabbage
""",
        ),
      ],
    );
  }
}
