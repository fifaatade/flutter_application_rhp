import 'package:flutter/material.dart';
import 'package:flutter_application_rhp/models/ob_model.dart';
import 'package:flutter_application_rhp/views/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final PageController controller = PageController(initialPage: 0);
  int page = 0;

  List<ObModel> slides = [
    ObModel(
      title: "Communauté",
      image: "assets/images/ob1.png",
      description:
          "Bienvenue au sein de votre espace convivial!",
    ),
    ObModel(
      title: "Opportunités",
      image: "assets/images/ob2.gif",
      description:
          "Bénéficiez d'opportunités et de ressources pour atteindre vos objectifs.",
    ),
    ObModel(
      title: "Coaching",
      image: "assets/images/ob3.png",
      description:
          "Des séances de coaching personnelles avec des personnes bienveillantes ..! ",
    ),
  ];

  myButtons() {
    return Row(
      children: [
        TextButton(
          onPressed: () {
            controller.previousPage(
              duration: Duration(seconds: 1),
              curve: Curves.easeInExpo,
            );
          },
          child: Text("Préc."),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: slides
                .map(
                  (e) => Container(
                    width: 8,
                    height: 8,
                    margin: EdgeInsets.symmetric(horizontal: 2),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: page == slides.indexOf(e)
                          ? Colors.grey
                          : Colors.purple,
                    ),
                  ),
                )
                .toList(),
          ),
        ),
        page == slides.length - 1
            ? ElevatedButton(
                onPressed: () async {
                  final SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  await prefs.setBool("isFirstTime", false);
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Login(),
                    ),
                    (route) => false,
                  );
                },
                child: Text("Terminer"),
              )
            : TextButton(
                onPressed: () {
                  controller.nextPage(
                    duration: Duration(seconds: 1),
                    curve: Curves.fastOutSlowIn,
                  );
                },
                child: Text("Suiv."),
              ),
      ],
    );
  }

  Widget obTile(ObModel ob) => Column(
        children: [
          Expanded(
            child: Image.asset(ob.image, fit: BoxFit.contain),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              ob.title,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              ob.description,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: controller,
              children: slides.map((e) => obTile(e)).toList(),
              onPageChanged: (value) {
                setState(() => page = value);
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: myButtons(),
          )
        ],
      ),
    );
  }
}
