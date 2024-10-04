import 'package:ecom/Data/Providers/auth/loginProvider.dart';
import 'package:ecom/Utils/constants/colors.dart';
import 'package:ecom/Utils/helpers/add1.dart';
import 'package:ecom/Utils/helpers/add2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ChangeNotifierProvider(
          create: (_) => LoginProvider(),
          child: Consumer<LoginProvider>(
            builder: (context, loginProvider, child) {
              return Column(
                children: [
                  Stack(
                    children: [
                      // Peinture de fond
                      CustomPaint(
                        size: Size(MediaQuery.of(context).size.width,
                            MediaQuery.of(context).size.height * 0.3),
                        painter: RPSCustomPainter1(),
                      ),
                      Positioned(
                        top: MediaQuery.of(context).size.height * 0.02,
                        right: -5,
                        child: CustomPaint(
                          size: Size(MediaQuery.of(context).size.width,
                              MediaQuery.of(context).size.height * 0.3),
                          painter: RPSCustomPainter2(),
                        ),
                      ),
                      Positioned(
                        top: MediaQuery.of(context).size.height * 0.20,
                        left: MediaQuery.of(context).size.width * 0.08,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Connexion',
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w800,
                                fontSize:
                                MediaQuery.of(context).size.width * 0.07,
                              ),
                            ),
                            SizedBox(
                                height:
                                MediaQuery.of(context).size.height * 0.01),
                            Text(
                              'Connectez-vous pour continuer',
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w300,
                                fontSize:
                                MediaQuery.of(context).size.width * 0.04,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.07),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.05),
                        _buildTextField(
                          controller: loginProvider.emailController,
                          hintText: 'Email',
                          icon: Icons.email_outlined,
                          validationMessage: 'Entrer votre email',
                          context: context,
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.031),
                        _buildTextField(
                          controller: loginProvider.passwordController,
                          hintText: 'Mot de passe',
                          icon: Icons.lock_outline_rounded,
                          validationMessage: 'Entrer votre mot de passe',
                          isPassword: true,
                          context: context,
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.05),
                        GestureDetector(
                          onTap: () {
                            loginProvider.login(context);
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.07,
                            width: MediaQuery.of(context).size.width * 0.4,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  MediaQuery.of(context).size.width * 0.1),
                              gradient: const LinearGradient(
                                colors: [
                                  Color(0xFF526799),
                                  Color(0xFFf37b67),
                                ],
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Continuer',
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    fontSize:
                                    MediaQuery.of(context).size.width *
                                        0.04,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                    width:
                                    MediaQuery.of(context).size.width * 0.02),
                                Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                  size: MediaQuery.of(context).size.width * 0.06,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Vous n'avez pas de compte ?",
                              style: GoogleFonts.poppins(
                                fontSize:
                                MediaQuery.of(context).size.width * 0.030,
                                fontWeight: FontWeight.w300,
                                color: Colors.black,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, '/register');
                              },
                              child: Text(
                                " Enregistrez-vous",
                                style: GoogleFonts.poppins(
                                  fontSize:
                                  MediaQuery.of(context).size.width * 0.033,
                                  fontWeight: FontWeight.w300,
                                  color: TColors.red,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required BuildContext context,
    required TextEditingController controller,
    required String hintText,
    required IconData icon,
    required String validationMessage,
    bool isPassword = false,
  }) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.059,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(3, 3),
            blurRadius: 6,
            color: Colors.grey.shade400,
          ),
        ],
      ),
      child: TextFormField(
        controller: controller,
        obscureText: isPassword,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return validationMessage;
          }
          return null;
        },
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding:
          EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.01),
          prefixIcon: Icon(icon, color: TColors.darkGrey),
          hintText: hintText,
          hintStyle: TextStyle(color: TColors.darkGrey),
        ),
      ),
    );
  }
}
