import 'package:college_app/Screens/admin/AdminHome.dart';
import 'package:college_app/constants/colors.dart';
import 'package:college_app/widgets/AppText.dart';
import 'package:college_app/widgets/CustomButton.dart';
import 'package:flutter/material.dart';

class AdminLogin extends StatefulWidget {
  const AdminLogin({Key? key}) : super(key: key);

  @override
  _AdminLoginState createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: customWhite,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            height: 340,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: Colors.blue.shade50,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const AppText(
                    text: "Login",
                    size: 20,
                    fontWeight: FontWeight.w500,
                    color: maincolor,
                  ),
                  TextFormField(
                    controller: username,
                    decoration: const InputDecoration(
                      hintText: "Email",
                      prefixIcon: Icon(Icons.people_alt, color: Colors.grey),
                    ),
                  ),
                  TextFormField(
                    controller: password,
                    obscureText: true,
                    decoration: const InputDecoration(
                      hintText: "Password",
                      prefixIcon: Icon(Icons.lock, color: Colors.grey),
                    ),
                  ),
                  const SizedBox(height: 10),
                  CustomButton(
                    btnname: "Login",
                    click: () {
                      // Check if the credentials match 'admin' and 'admin'
                      if (username.text == 'admin@gmail.com' &&
                          password.text == 'Admin@123') {
                        // Navigate to Admin Home page if credentials match
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AdminHome(),
                          ),
                        );
                      } else {
                        // Show an error dialog or message for incorrect credentials
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Invalid Credentials'),
                              content: const Text(
                                  'Please enter correct username and password.'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('OK'),
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
