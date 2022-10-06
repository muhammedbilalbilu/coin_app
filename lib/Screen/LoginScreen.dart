import 'package:coin_app/Screen/MIBILESCRREN.dart';
import 'package:coin_app/Screen/Signup.dart';
import 'package:coin_app/responsive/Auth.dart';
import 'package:coin_app/widgets/colors.dart';
import 'package:coin_app/widgets/showSnakBar.dart';
import 'package:coin_app/widgets/textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController nameEmail = TextEditingController();
  TextEditingController namepassword = TextEditingController();
  bool iSloding = false;

  void Login() async {
    setState(() {
      iSloding = true;
    });
    String res = await AuthMathodes()
        .login(email: nameEmail.text, Password: namepassword.text);

    if (res == 'success') {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => MobileScreen()),
      );
    } else {
      setState(() {
        iSloding = false;
      });
      showSnackBar(context, res);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mobileBackgroundColor,
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: Container(),
              flex: 2,
            ),
            TextFieldInput(
                textEditingController: nameEmail,
                hintText: 'Enter your Email',
                textInputType: TextInputType.emailAddress),
            SizedBox(
              height: 10,
            ),
            TextFieldInput(
              textEditingController: namepassword,
              hintText: 'Enter your Password',
              textInputType: TextInputType.emailAddress,
              isPass: true,
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: Login,
              child: Container(
                child: Text('Login'),
                width: double.infinity,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: const ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                  ),
                  color: blueColor,
                ),
              ),
            ),
            SizedBox(
              height: 150,
            ),
            Row(
              children: [
                Container(
                  child: Text('Do You want Account ?',
                      style: TextStyle(color: Colors.white)),
                ),
                InkWell(
                  child: Text(
                    'create',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => HomeScreen())),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
