import 'package:ecom/Data/Providers/auth/mailSendProvider.dart';
import 'package:ecom/Utils/constants/colors.dart';
import 'package:ecom/Utils/helpers/add1.dart';
import 'package:ecom/Utils/helpers/add2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MailSend extends StatelessWidget {
  const MailSend({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ChangeNotifierProvider(
          create: (_) => mailSender(),
          child: Consumer<mailSender>(
            builder: (context, mailSender, child) {
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
                              'Verification',
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
                              'Entrer votre email',
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
                          controller: mailSender.mailsenderController,
                          hintText: 'Email',
                          icon: Icons.email_outlined,
                          validationMessage: 'Entrer votre email',
                          context: context,
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.05),
                        GestureDetector(
                          onTap: () {
                            mailSender.sendMailer(context);
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
