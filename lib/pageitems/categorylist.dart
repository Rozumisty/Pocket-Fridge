import 'package:flutter/material.dart';
import 'package:pocket_fridge/styles/textsStyle.dart';


class CategoryItem extends StatelessWidget {
  final String categoryName;
  final String imagePath;
  final VoidCallback onTap;

  const CategoryItem({
    Key? key,
    required this.categoryName,
    required this.imagePath,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 150.0,
        height: 150.0,
        margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              const Color.fromARGB(255, 0, 0, 0).withOpacity(0.29),
              BlendMode.darken,
            ),
          ),
        ),
        child: Center(
          child: Text(
            categoryName,
            style: textStyleSign
          ),
        ),
      ),
    );
  }
}


// Для бекенду

// class CategoryItem extends StatelessWidget {
//   final String categoryName;
//   final String imagePath;
//   final VoidCallback onTap;

//   const CategoryItem({
//     Key? key,
//     required this.categoryName,
//     required this.imagePath,
//     required this.onTap,
//   }) : super(key: key);

//   factory CategoryItem.fromBackendData(BackendCategoryData data) {
//     return CategoryItem(
//       categoryName: data.categoryName,
//       imagePath: data.imagePath,
//       onTap: () {
//         // Обробка натискання для кожного об'єкта
//         print('Категорія "${data.categoryName}" натискана!');
//       },
//     );
//   }

//   BoxDecoration _buildDecoration() {
//     return BoxDecoration(
//       borderRadius: BorderRadius.circular(10.0),
//       image: DecorationImage(
//         image: AssetImage(imagePath),
//         fit: BoxFit.cover,
//         colorFilter: ColorFilter.mode(
//           Colors.black.withOpacity(0.5),
//           BlendMode.darken,
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         width: 150.0,
//         height: 150.0,
//         margin: const EdgeInsets.all(8.0),
//         decoration: _buildDecoration(),
//         child: Center(
//           child: Text(
//             categoryName,
//             style: const TextStyle(
//               color: Colors.white,
//               fontSize: 20.0,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class BackendCategoryData {
//   final String categoryName;
//   final String imagePath;

//   BackendCategoryData({required this.categoryName, required this.imagePath});
// }
