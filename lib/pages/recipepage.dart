import 'package:flutter/material.dart';
import 'package:pocket_fridge/headerfooter/headerfooter.dart';

class RecipePage extends StatelessWidget {
  final String categoryName;
  final String imagePath;
  final String desciption;

  const RecipePage({
    Key? key,
    required this.categoryName,
    required this.imagePath, 
    required this.desciption,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PocketHeader(
        backgroundColor: Color.fromARGB(255, 200, 162, 200),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 300.0,
                height: 350.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.fitHeight,
                    image: AssetImage(imagePath),
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
               Text(
                categoryName,
                style: const TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Montserrat"
                ),
              ),
              const SizedBox(height: 10.0),
        
               Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  desciption,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontFamily: "Montserrat"
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
