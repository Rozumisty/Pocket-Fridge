import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pocket_fridge/styles/textsStyle.dart';
import 'package:pocket_fridge/headerfooter/headerfooter.dart';
import 'package:http/http.dart' as http;

void testPost(data) async {}

class AddProduct extends StatefulWidget {
  const AddProduct({Key? key}) : super(key: key);

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  TextEditingController productnamecont = TextEditingController();
  TextEditingController quantitycont = TextEditingController();
  TextEditingController expirydatecont = TextEditingController();

  String selectedCategory = 'Vegetables';
  List<String> categories = ['Vegetables', 'Dairy', 'Meat'];

  List<String> userData = [];

  Future<void> _selectDate(BuildContext context) async {
    DateTime now = DateTime.now();

    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: DateTime(now.year - 1),
      lastDate: DateTime(now.year + 1),
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
                  child: TextFormField(
                    controller: productnamecont,
                    style: textStyleInput,
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
                  child: DropdownButtonFormField<String>(
                    value: selectedCategory,
                    icon: const Icon(Icons.arrow_downward),
                    iconSize: 24,
                    iconEnabledColor: Colors.white,
                    elevation: 16,
                    style: textStyleInput,
                    dropdownColor: const Color.fromARGB(
                        255, 182, 141, 182), // Set the background color here
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        setState(() {
                          selectedCategory = newValue;
                        });
                      }
                    },
                    items: categories
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
              const SizedBox(
                height: 24,
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
                  List<String> userDataList = [
                    productnamecont.text,
                    selectedCategory,
                    quantitycont.text,
                    expirydatecont.text,
                  ];

                  userData.add(userDataList.join(", "));

                  print(userData); // замінити на post функцію

                  productnamecont.clear();
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
