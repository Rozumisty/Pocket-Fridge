import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pocket_fridge/styles/textsStyle.dart';
import 'package:pocket_fridge/headerfooter/headerfooter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';



class AddProduct extends StatefulWidget {
  const AddProduct({Key? key}) : super(key: key);

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {

  late SharedPreferences prefs;
  late String userLogin;

  TextEditingController quantitycont = TextEditingController();
  TextEditingController expirydatecont = TextEditingController();
  TextEditingController selectedProductController = TextEditingController();
  

  String selectedCategory = 'Vegetables';
  String selectedProduct = 'Potatoes';

  Map<String, List<String>> backendData = {};

  @override
  void initState() {
    super.initState();
    fetchDataFromBackend();
    initPreferences();
  }

    Future<void> initPreferences() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      userLogin = prefs.getString('userLogin') ?? '';
    });
  }

  void productPost(BuildContext context, ScaffoldMessengerState scaffoldMessenger,
    data) async {
  final url = 'http://26.136.102.158:8080/addProduct?login=' +
      userLogin +
      '&productName=' +
      data['product'] +
      '&quantity=' +
      data['quantity'] +
      '&expirationDate=' +
      data['expiration'];
  print('URL: $url');

  try {
    var response = await http.post(Uri.parse(url),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/x-www-form-urlencoded"
        },
        body: data);

    if (response.statusCode == 200) {
      print('POST request successful');
      print('Response data: ${response.body}');
      scaffoldMessenger.showSnackBar(
        SnackBar(
          content: Container(
            padding: const EdgeInsets.all(16),
            height: 90,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 200, 162, 200),
              borderRadius: BorderRadius.all(
                Radius.circular(12),
              ),
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Great!",
                  style: textStyleSign,
                ),
                Text(
                  "Your products have been successfully added",
                  style: textStyleSmall,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),
          ),
          behavior: SnackBarBehavior.floating,
          duration: const Duration(seconds: 5),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      );
    } else {
      print('POST request failed with status: ${response.statusCode}');
      scaffoldMessenger.showSnackBar(
        SnackBar(
          content: Container(
            padding: const EdgeInsets.all(16),
            height: 90,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 200, 162, 200),
              borderRadius: BorderRadius.all(
                Radius.circular(12),
              ),
            ),
            child:  const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Oops...",
                  style: textStyleSign,
                ),
                Text(
                  "Something went wrong, please check your input for accuracy",
                  style: textStyleSmall,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),
          ),
          behavior: SnackBarBehavior.floating,
          duration: const Duration(seconds: 5),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      );
    }
  } catch (error) {
    print('Error: $error');
    scaffoldMessenger.showSnackBar(
        SnackBar(
          content: Container(
            padding: const EdgeInsets.all(16),
            height: 90,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 200, 162, 200),
              borderRadius: BorderRadius.all(
                Radius.circular(12),
              ),
            ),
            child:  Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Oops...",
                  style: textStyleSign,
                ),
                Text(
                  "An error occurred, try again later: $error'",
                  style: textStyleSmall,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),
          ),
          behavior: SnackBarBehavior.floating,
          duration: const Duration(seconds: 5),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      );
  }
}


  Future<void> fetchDataFromBackend() async {
    final response = await http.get(Uri.parse('http://26.136.102.158:8080/getProducts'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      data.forEach((key, value) {
        backendData[key] = List<String>.from(value);
      });

      setState(() {
        selectedCategory = backendData.keys.first;
        selectedProduct = backendData[selectedCategory]!.first;
      });
    } else {
      print('Failed to load data from backend');
    }
  }



  List<String> getProductList(String category) {
  return backendData[category] ?? [];
}

  List<String> userData = [];

Future<void> _selectDate(BuildContext context) async {
  DateTime now = DateTime.now();
  DateTime tomorrow = now.add(Duration(days: 1));

  DateTime? pickedDate = await showDatePicker(
    context: context,
    initialDate: tomorrow,
    firstDate: tomorrow,
    lastDate: DateTime(now.year + 1, 12, 31), // Оновлено цей рядок
    builder: (BuildContext context, Widget? child) {
      return Theme(
        data: ThemeData.light().copyWith(
          colorScheme: const ColorScheme.light(
            primary: Color.fromARGB(255, 200, 162, 200),
            onPrimary: Colors.white,
            surface: Color.fromARGB(255, 200, 162, 200),
            onSurface: Color.fromARGB(205, 144, 122, 255),
          ),
          buttonTheme: const ButtonThemeData(
            textTheme: ButtonTextTheme.primary,
          ),
        ),
        child: child!,
      );
    },
  );

  if (pickedDate != null) {
    setState(() {
      expirydatecont.text = pickedDate.toLocal().toString().split(' ')[0];
    });
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 48,
              ),
              const Text(
                "Add your product",
                style: textStyleStorage,
              ),
              const SizedBox(
                height: 48,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 182, 141, 182),
                    border: Border.all(
                      color: const Color.fromARGB(255, 255, 255, 255),
                    ),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: DropdownButtonFormField<String>(
                    value: selectedCategory,
                    icon: const Icon(Icons.arrow_downward),
                    iconSize: 24,
                    iconEnabledColor: Colors.white,
                    elevation: 16,
                    style: textStyleInput,
                    dropdownColor: const Color.fromARGB(255, 182, 141, 182),
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        setState(() {
                          selectedCategory = newValue;
                          selectedProduct =
                              backendData[selectedCategory]!.first;
                        });
                      }
                    },
                    items: backendData.keys
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(16.0),
                      border: InputBorder.none,
                      hintStyle: textStyleInput,
                      labelText: "Select a category",
                      labelStyle: textStyleInput,
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 182, 141, 182),
                    border: Border.all(
                      color: const Color.fromARGB(255, 255, 255, 255),
                    ),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: DropdownButtonFormField<String>(
                    value: selectedProduct,
                    icon: const Icon(Icons.arrow_downward),
                    iconSize: 24,
                    iconEnabledColor: Colors.white,
                    elevation: 16,
                    style: textStyleInput,
                    dropdownColor: const Color.fromARGB(255, 182, 141, 182),
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        setState(() {
                          selectedProductController.text = newValue;
                        });
                      }
                    },
                    items: getProductList(selectedCategory)
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(16.0),
                      border: InputBorder.none,
                      hintStyle: textStyleInput,
                      labelText: "Name of the product",
                      labelStyle: textStyleInput,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 182, 141, 182),
                    border: Border.all(
                      color: const Color.fromARGB(255, 255, 255, 255),
                    ),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    controller: quantitycont,
                    style: textStyleInput,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(16.0),
                      border: InputBorder.none,
                      hintStyle: textStyleInput,
                      labelText: "Quantity of the product",
                      labelStyle: textStyleInput,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 182, 141, 182),
                    border: Border.all(
                      color: const Color.fromARGB(255, 255, 255, 255),
                    ),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: InkWell(
                    onTap: () {
                      _selectDate(context);
                    },
                    child: IgnorePointer(
                      child: TextFormField(
                        controller: expirydatecont,
                        style: textStyleInput,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(16.0),
                          border: InputBorder.none,
                          hintStyle: textStyleInput,
                          labelText: "Expiry Date",
                          labelStyle: textStyleInput,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 36,
              ),
              TextButton(
                onPressed: () {
                    String prodctName = selectedProductController.text;
                    String quantityNum = quantitycont.text;
                    String expirationDate = expirydatecont.text;
                    var data = {
                      "product": prodctName,
                      "quantity": quantityNum,
                      "expiration": expirationDate,
                    };
                    ScaffoldMessenger.of(context)
                        .removeCurrentSnackBar();
                    productPost(context, ScaffoldMessenger.of(context), data);
                  quantitycont.clear();
                  expirydatecont.clear();
                  setState(() {});
                },
                style: TextButton.styleFrom(
                  backgroundColor: const Color.fromARGB(205, 144, 122, 255),
                  minimumSize:
                      Size(MediaQuery.of(context).size.width * 0.65, 40),
                  padding: const EdgeInsets.all(12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text('Add product', style: textStyleSign),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
