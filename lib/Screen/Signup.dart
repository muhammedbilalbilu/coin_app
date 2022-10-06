import 'package:coin_app/Screen/LoginScreen.dart';
import 'package:coin_app/Screen/MIBILESCRREN.dart';
import 'package:coin_app/responsive/Auth.dart';
import 'package:coin_app/widgets/colors.dart';
import 'package:coin_app/widgets/showSnakBar.dart';
import 'package:coin_app/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController nameEmail = TextEditingController();
  TextEditingController namepassword = TextEditingController();
  TextEditingController namebio = TextEditingController();
  bool iSloding = false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    nameController.dispose();
    nameEmail.dispose();
    namepassword.dispose();
    namebio.dispose();
  }

  void Sign() async {
    setState(() {
      iSloding = true;
    });
    String res = await AuthMathodes().Signup(
        name: nameController.text,
        email: nameEmail.text,
        password: namepassword.text,
        bio: namebio.text);

    if (res == 'success') {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => MobileScreen()));
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
                textEditingController: nameController,
                hintText: 'Enter your name',
                textInputType: TextInputType.emailAddress),
            SizedBox(
              height: 10,
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
            TextFieldInput(
              textEditingController: namebio,
              hintText: 'Enter your bio',
              textInputType: TextInputType.emailAddress,
            ),
            SizedBox(
              height: 50,
            ),
            InkWell(
              onTap: Sign,
              child: Container(
                child: !iSloding
                    ? Text('Sign')
                    : Center(
                        child: CircularProgressIndicator(),
                      ),
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
                  child: Text('Do You have Account ?',
                      style: TextStyle(color: Colors.white)),
                ),
                InkWell(
                  child: Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => LoginScreen())),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
