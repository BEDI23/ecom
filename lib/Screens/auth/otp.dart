import 'package:ecom/Common/helpers/add1.dart';
import 'package:ecom/Common/helpers/add2.dart';
import 'package:ecom/Data/Providers/auth/otpProvider.dart';
import 'package:ecom/Utils/constants/colors.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OtpPage extends StatelessWidget {
  const OtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ChangeNotifierProvider(
          create: (_) => OtpProvider(),
          child: Consumer<OtpProvider>(
            builder: (context, otpProvider, child) {
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
                        top: MediaQuery.of(context).size.height * 0.07,
                        left: MediaQuery.of(context).size.width * 0.06,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);  // Retour en arrière
                          },
                          child: Icon(
                            Icons.arrow_back,
                            color: TColors.darkGrey,
                            size: MediaQuery.of(context).size.width * 0.07,
                          ),
                        ),
                      ),
                      Positioned(
                        top: MediaQuery.of(context).size.height * 0.20,
                        left: MediaQuery.of(context).size.width * 0.08,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Vérification OTP',
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
                              'Entrez le code reçu',
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
                        _buildOtpFields(context, otpProvider),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.05),
                        GestureDetector(
                          onTap: () {
                            otpProvider.verifyOtp(context);
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

  Widget _buildOtpFields(BuildContext context, OtpProvider otpProvider) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildOtpField(context, otpProvider.otpController1, otpProvider.otpFocusNode1, otpProvider.otpFocusNode2),
        _buildOtpField(context, otpProvider.otpController2, otpProvider.otpFocusNode2, otpProvider.otpFocusNode3),
        _buildOtpField(context, otpProvider.otpController3, otpProvider.otpFocusNode3, otpProvider.otpFocusNode4),
        _buildOtpField(context, otpProvider.otpController4, otpProvider.otpFocusNode4, null),
      ],
    );
  }

  Widget _buildOtpField(BuildContext context, TextEditingController controller,
      FocusNode currentFocus, FocusNode? nextFocus) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.15,
      height: MediaQuery.of(context).size.height * 0.08,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            offset: Offset(3, 3),
            blurRadius: 6,
            color: Colors.grey.shade400,
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 1,
        focusNode: currentFocus,
        onChanged: (value) {
          if (value.length == 1) {
            // Déplace le focus vers le champ suivant si disponible
            if (nextFocus != null) {
              FocusScope.of(context).requestFocus(nextFocus);
            } else {
              currentFocus.unfocus();
            }
          }
        },
        decoration: InputDecoration(
          border: InputBorder.none,
          counterText: "",
          hintText: '*',
          hintStyle: TextStyle(color: TColors.darkGrey),
        ),
      ),
    );
  }
}
