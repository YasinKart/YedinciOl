

import 'package:bitirmeprojesi/forgot_pw_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget{
  final VoidCallback showRegisterPage;
  const LoginPage ({Key? key, required this.showRegisterPage}): super (key: key);

  @override
  State<LoginPage>createState()=>_LoginPageState();
}
class _LoginPageState extends State<LoginPage>{

  //CONTROLLER
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
    );
}

@override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment:  MainAxisAlignment.center,
              children: [
                SizedBox(height: 25),
                Icon(
                    Icons.sports_soccer,
                          size: 100,
                ),
                //HOŞGELDİNİZ YAZISI
              Text(
                "Yedinci OL!",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                ),
                ),
               SizedBox(height: 10),
                Text(
                "Uygulamamıza Hoşgeldiniz",
                 style: TextStyle(
                   fontSize: 30,
                     ),
                ),
                SizedBox(height: 40),
                //E-MAİL GİRİŞİ
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(12),
                      ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      hintText: "E-Mailiniz",
                      fillColor: Colors.grey[200],
                      filled: true,
                    ),
                  ),
              ),
                SizedBox(height: 20),
                //ŞİFRE GİRİŞİ
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    obscureText: true,
                    controller: _passwordController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintText: "Şifreniz",
                      fillColor: Colors.grey[200],
                      filled: true,
                    ),
                  ),
                ),

                SizedBox(height: 5),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                          context,
                          MaterialPageRoute(
                          builder: (context) {
                            return ForgotPasswordPage ();
                              },
                            ),
                          );
                        },
                        child: Text(
                          "Şifrenizi mi Unuttunuz?",
                            style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                           ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 20),
                //GİRİŞ BUTONU
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: GestureDetector(
                      onTap: signIn,
                      child: Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Text(
                          "Giriş Yapınız",
                              style: TextStyle(
                              color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                          ),
                        ),
                      ),
                    )
                ),
                SizedBox(height: 15),
                //ÜYE OLMA BUTONU
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Üye Değil misiniz?",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                )
                    ),
            
                    GestureDetector(
                      onTap: widget.showRegisterPage,
                      child: Text(
                        " Hemen Üye Olun!",
                          style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                          ),
                      ),
                    ),
                  ],
                ),
              ],),
          ) ,
    ),
    ),
    );
  }
}