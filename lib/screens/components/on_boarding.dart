import 'package:flutter/material.dart';
import 'package:my_first_app/screens/components/content_boarding.dart';
import 'package:my_first_app/screens/splash_view.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  int currentPage = 0;
  final PageController _pageController = PageController();
  List<Map<String, String>> listBoarding = [
    {
      "title": "ESPARCIMIENTO",
      "subtitle":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus faucibus.",
      "image": "assets/images/B1.png"
    },
    {
      "title": "ADOPCIÓN",
      "subtitle":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus faucibus.",
      "image": "assets/images/B2.png"
    },
    {
      "title": "HOSPITALIDAD",
      "subtitle":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus faucibus.",
      "image": "assets/images/B3.png"
    },
    {
      "title": "VETERINARIA",
      "subtitle":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus faucibus.",
      "image": "assets/images/B4.png"
    },
    {
      "title": "TIENDA",
      "subtitle":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus faucibus.",
      "image": "assets/images/B5.png"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(flex: 2, child: itemsData()),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: pagination()),
          Expanded(flex: 1, child: button()),
        ],
      ),
    );
  }

  Padding button() {
    return Padding(
      padding: const EdgeInsets.only(left: 35, right: 35),
      child: Center(
        child: SizedBox(
          width: double.infinity,
          height: 50,
          child: OutlinedButton(
            onPressed: () {
              currentPage < listBoarding.length - 1
                  ? _pageController.nextPage(
                      duration: kThemeAnimationDuration,
                      curve: Curves.ease,
                    )
                  : {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SplashView(),
                          ))
                    };
            },
            style: OutlinedButton.styleFrom(
              backgroundColor: currentPage == listBoarding.length - 1
                  ? Colors.green
                  : Colors.white,
              shape: (RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              )),
              side: BorderSide(
                width: 2,
                color: currentPage == listBoarding.length - 1
                    ? Colors.green
                    : Colors.grey,
              ),
            ),
            child: Text(
              currentPage == listBoarding.length - 1
                  ? "Continuar"
                  : "Siguiente",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: currentPage == listBoarding.length - 1
                    ? Colors.white
                    : Colors.grey,
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> pagination() {
    return List.generate(
        listBoarding.length,
        (index) => AnimatedContainer(
              duration: kThemeAnimationDuration,
              height: 5,
              width: currentPage == index ? 35 : 20,
              margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: currentPage == index
                    ? const Color(0xfffc085f)
                    : const Color(0xffdcdcdc),
              ),
            ));
  }

  Align itemsData() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        constraints: const BoxConstraints(maxHeight: 350),
        child: PageView.builder(
          controller: _pageController,
          itemCount: listBoarding.length,
          onPageChanged: (value) {
            setState(() {
              currentPage = value;
            });
          },
          itemBuilder: (context, index) => ContentBoarding(
            title: listBoarding[index]["title"],
            subtitle: listBoarding[index]["subtitle"],
            image: listBoarding[index]["image"],
          ),
        ),
      ),
    );
  }
}
