import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fashionshop/otp_screen.dart';
import 'package:fashionshop/recovery_screen.dart';

class ForgotScreen extends StatefulWidget {
  const ForgotScreen({Key? key}) : super(key: key);

  @override
  State<ForgotScreen> createState() => _ForgotScreenState();
}

class _ForgotScreenState extends State<ForgotScreen> {
  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool clrButton = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Forget Password",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Please enter your email address. You will receive a link to create or set a new password via email",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                SizedBox(height: 30),
                TextFormField(
                  controller: emailController,
                  onChanged: (val) {
                    setState(() {
                      clrButton = val.isNotEmpty;
                    });
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Email",
                    suffix: InkWell(
                      onTap: () {
                        setState(() {
                          emailController.clear();
                          clrButton = false;
                        });
                      },
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          CupertinoIcons.multiply,
                          color: Color(0xFFDB3022),
                        ),
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email tidak boleh kosong';
                    }
                    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                      return 'Masukkan email yang valid';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 60),
                ElevatedButton(
                  onPressed: clrButton
                      ? () {
                          if (_formKey.currentState?.validate() ?? false) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RecoveryScreen(),
                              ),
                            );
                          }
                        }
                      : null,
                  child: Text(
                    "Send Code",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size.fromHeight(55),
                    backgroundColor: Color(0xFFEf6969),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 30),
                    Center(
                      child: Text("OR"),
                    ),
                    Center(
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => OTPScreen(),
                            ),
                          );
                        },
                        child: Text(
                          "Verify Using Number",
                          style: TextStyle(
                            color: Color(0xFFEf6969),
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}