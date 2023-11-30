import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pocket_fridge/styles/textsStyle.dart';



void testPost(data) async {
    final url = 'http://26.136.102.158:8080/addUser?firstName=' + data['firstName'] +  '&lastName=' + data['lastName'] + '&login=' + data['Login'] + '&password=' + data['Password']  +'&email=' + data['Email']; 
    print('URL: $url');


    var response = await http.post(Uri.parse(url),
    headers: {
      "Accept": "application/json",
      "Content-Type": "application/x-www-form-urlencoded"
        },
        body: data
    );

    if (response.statusCode == 200) {
    print('POST request successful');
    print('Response data: ${response.body}');
  } else {
    print('POST request failed with status: ${response.statusCode}');
  }
}


void postData(data) async {

final uri = Uri(
  scheme: 'http', // or 'https' if it's an HTTPS endpoint
  host: '26.136.102.158',
  port: 8080,
  path: '/addUser',
  queryParameters: {
    'firstName': data['firstName'],
    'lastName': data['lastName'],
    'login': data['Login'],
    'password': data['Password'],
    'email': data['Email'],
  },
);

print('URL: $uri');

  // Виконання POST-запиту
  var response = await http.post(
    uri
  );

  // Обробка відповіді
  if (response.statusCode == 200) {
    print('POST request successful');
    print('Response data: ${response.body}');
  } else {
    print('POST request failed with status: ${response.statusCode}');
  }
}

// void getUser(int id) async {
//   final uri = Uri(
//     scheme: 'http', // or 'https' if it's an HTTPS endpoint
//     host: '26.136.102.158',
//     port: 8080,
//     path: '/user',
//     queryParameters: {
//       'id': id.toString(), // Перетворення цілого числа в рядок
//     },
//   );

//   var response = await http.get(uri);

//   // Обробка відповіді
//   if (response.statusCode == 200) {
//     print('GET request successful');
//     print('Response data: ${response.body}');
//   } else {
//     print('GET request failed with status: ${response.statusCode}');
//   }
// }



class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);
  

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {

final Color loginbackground = const Color.fromARGB(255, 200, 162, 200);

TextEditingController firstnamecont = TextEditingController();
TextEditingController lastnamecont = TextEditingController();
TextEditingController logincont = TextEditingController();
TextEditingController passwordcont = TextEditingController();
TextEditingController emailcont = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: loginbackground,
      body:  SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text("Registration",style: textStyleH1,),
                const SizedBox(height: 36,),
                 Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 182, 141, 182),
                      border: Border.all(
                        color: const Color.fromARGB(255, 255, 255, 255),
                      ),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: TextFormField( // First Name FIELD
                      controller: firstnamecont,
                      style: textStyleInput,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(16.0),
                        border: InputBorder.none,
                        hintStyle: textStyleInput,
                        labelText: "Input your First Name",
                        labelStyle: textStyleInput,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                 Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 182, 141, 182),
                      border: Border.all(
                        color: const Color.fromARGB(255, 255, 255, 255),
                      ),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: TextFormField( // Last Name FIELD
                      controller: lastnamecont,
                      style: textStyleInput,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(16.0),
                        border: InputBorder.none,
                        hintStyle: textStyleInput,
                        labelText: "Input your Last Name",
                        labelStyle: textStyleInput,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 182, 141, 182),
                      border: Border.all(
                        color: const Color.fromARGB(255, 255, 255, 255),
                      ),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: TextFormField(
                      controller: logincont, // LOGIN FIELD
                      style: textStyleInput,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(16.0),
                        border: InputBorder.none,
                        hintStyle: textStyleInput,
                        labelText: "Input your Login",
                        labelStyle: textStyleInput,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 182, 141, 182),
                      border: Border.all(
                        color: const Color.fromARGB(255, 255, 255, 255),
                      ),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: TextFormField(
                      controller: passwordcont, // Password FIELD
                      style: textStyleInput,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(16.0),
                        border: InputBorder.none,
                        hintStyle: textStyleInput,
                        labelText: "Input your Password",
                        labelStyle: textStyleInput,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 182, 141, 182),
                      border: Border.all(
                        color: const Color.fromARGB(255, 255, 255, 255),
                      ),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: TextFormField(
                      controller: emailcont, // E-mail FIELD
                      style: textStyleInput,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(16.0),
                        border: InputBorder.none,
                        hintStyle: textStyleInput,
                        labelText: "Input your E-mail",
                        labelStyle: textStyleInput,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                TextButton(
                onPressed: () {
                  String firstName = firstnamecont.text;
                  String lastName = lastnamecont.text;
                  String login = logincont.text;
                  String password = passwordcont.text;
                  String email = emailcont.text;
                  var data = {"firstName":firstName,"lastName":lastName,"Login":login,"Password":password,"Email":email};
                //   postData(data);
                  testPost(data);
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
                child: const Text('Sign In', style: textStyleSign),
              ),
              ],
            ),
          ),
        ),
      ),
      );
  }
}