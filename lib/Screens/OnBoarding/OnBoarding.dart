import 'package:ecom/Data/Providers/NavigationProvider.dart';
import 'package:ecom/Screens/Auth/Login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ecom/Screens/OnBoarding/Components/OnBoardingContents.dart';
import 'package:ecom/Utils/constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  PageController? _controller;
  int currentIndex = 0;
  double percentage = 0.33;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Récupère le provider
    final navigationProvider = Provider.of<NavigationProvider>(context, listen: false);

    return Scaffold(
      backgroundColor: contentsList[currentIndex].backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 5,
              child: PageView.builder(
                controller: _controller,
                itemCount: contentsList.length,
                onPageChanged: (int index) {
                  setState(() {
                    currentIndex = index;
                    percentage = (index + 1) / contentsList.length;
                  });
                },
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              contentsList[index].title,
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 28.0,
                                color: Colors.black87,
                              ),
                            ),
                            const SizedBox(height: 15),
                            Text(
                              contentsList[index].description,
                              style: GoogleFonts.montserrat(
                                fontSize: 16.0,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 30),
                      Image.asset(
                        contentsList[index].image,
                        height: MediaQuery.of(context).size.height * 0.47,
                      ),
                    ],
                  );
                },
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          children: List.generate(
                            contentsList.length,
                                (index) => buildDot(index, context, currentIndex),
                          ),
                        ),
                        const SizedBox(height: 5),
                        CupertinoButton(
                          onPressed: () {
                            navigationProvider.navigateWithFade(context, const Login());
                          },
                          child: Text(
                            "Skip",
                            style: GoogleFonts.poppins(
                              color: Colors.black87,
                              letterSpacing: 2,
                            ),
                          ),
                        ),
                      ],
                    ),
                    CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        if (currentIndex == contentsList.length - 1) {
                          // Utilise le provider pour naviguer à la dernière page
                          navigationProvider.navigateWithFade(context, const Login());
                        } else {
                          // Sinon, passe à la page suivante
                          _controller!.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut,
                          );
                        }
                      },
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          SizedBox(
                            height: 55,
                            width: 55,
                            child: CircularProgressIndicator(
                              value: percentage,
                              backgroundColor: Colors.grey,
                              valueColor: const AlwaysStoppedAnimation<Color>(TColors.bleu),
                            ),
                          ),
                          CircleAvatar(
                            backgroundColor: TColors.red,
                            child: Icon(
                              Icons.arrow_forward_ios_outlined,
                              color: contentsList[currentIndex].backgroundColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

AnimatedContainer buildDot(int index, BuildContext context, int currentIndex) {
  return AnimatedContainer(
    duration: const Duration(milliseconds: 500),
    curve: Curves.easeInOut,
    height: 8,
    width: currentIndex == index ? 30 : 8,
    margin: const EdgeInsets.only(right: 10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: currentIndex == index ? TColors.bleu : Colors.grey,
    ),
  );
}
