import 'package:flutter/material.dart';
import 'package:tenang_test/theme.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Welcome1();
  }
}

class Welcome1 extends StatelessWidget {
  const Welcome1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.loose,
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.center,
                  colors: [
                    kGradientColor2.withOpacity(1),
                    kGradientColor1.withOpacity(0.6),
                  ]),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 2,
                decoration: BoxDecoration(
                    color: kWhiteColor,
                    borderRadius: const BorderRadius.vertical(
                      bottom: Radius.circular(50),
                    )),
                child: Column(
                  children: [
                    SizedBox(
                      height:
                          ((MediaQuery.of(context).size.height / 2) - 118) / 2,
                    ),
                    Text(
                      "Welcome to Alesha",
                      style: titleTextStyle.copyWith(fontSize: 30),
                    ),
                    const SizedBox(
                      height: 22,
                    ),
                    Text(
                      "Reference site about Lorem\nIpsum, giving information origins\nas well as a random",
                      style: body1TextStyle.copyWith(),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
              Spacer(),
              Container(
                margin: const EdgeInsets.only(left: 22, bottom: 30),
                width: 444,
                height: 300,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/medical_research.png"))),
              )
            ],
          ),
          Positioned(
            right: -MediaQuery.of(context).size.width * 0.75 * 0.32,
            bottom: -MediaQuery.of(context).size.width * 0.75 * 0.15,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.75,
              height: MediaQuery.of(context).size.width * 0.75,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: kWhiteColor.withOpacity(0.07)),
            ),
          ),
          Positioned(
            left: -MediaQuery.of(context).size.width * 0.75 * 0.05,
            bottom: -MediaQuery.of(context).size.width * 0.75 * 0.4,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.75,
              height: MediaQuery.of(context).size.width * 0.75,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: kWhiteColor.withOpacity(0.07)),
            ),
          ),
        ],
      ),
    );
  }
}

class Welcome2 extends StatelessWidget {
  const Welcome2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.loose,
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.center,
                  colors: [
                    kGradientColor2.withOpacity(1),
                    kGradientColor1.withOpacity(0.6),
                  ]),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 2,
                decoration: BoxDecoration(
                    color: kWhiteColor,
                    borderRadius: const BorderRadius.vertical(
                      bottom: Radius.circular(50),
                    )),
                child: Column(
                  children: [
                    SizedBox(
                      height:
                          ((MediaQuery.of(context).size.height / 2) - 118) / 2,
                    ),
                    Text(
                      "Find Best Doctors",
                      style: titleTextStyle.copyWith(fontSize: 30),
                    ),
                    const SizedBox(
                      height: 22,
                    ),
                    Text(
                      "Reference site about Lorem\nIpsum, giving information origins\nas well as a random",
                      style: body1TextStyle.copyWith(),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
              Spacer(),
              Container(
                margin: const EdgeInsets.only(left: 30, bottom: 26),
                width: 444,
                height: 300,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/medicine.png"))),
              )
            ],
          ),
          Positioned(
            right: -MediaQuery.of(context).size.width * 0.75 * 0.32,
            bottom: -MediaQuery.of(context).size.width * 0.75 * 0.15,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.75,
              height: MediaQuery.of(context).size.width * 0.75,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: kWhiteColor.withOpacity(0.07)),
            ),
          ),
          Positioned(
            left: -MediaQuery.of(context).size.width * 0.75 * 0.05,
            bottom: -MediaQuery.of(context).size.width * 0.75 * 0.4,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.75,
              height: MediaQuery.of(context).size.width * 0.75,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: kWhiteColor.withOpacity(0.07)),
            ),
          ),
        ],
      ),
    );
  }
}

class Welcome3 extends StatelessWidget {
  const Welcome3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.loose,
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.center,
                  colors: [
                    kGradientColor2.withOpacity(1),
                    kGradientColor1.withOpacity(0.6),
                  ]),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 2,
                decoration: BoxDecoration(
                    color: kWhiteColor,
                    borderRadius: const BorderRadius.vertical(
                      bottom: Radius.circular(50),
                    )),
                child: Column(
                  children: [
                    SizedBox(
                      height:
                          ((MediaQuery.of(context).size.height / 2) - 118) / 2,
                    ),
                    Text(
                      "Find Best Doctors",
                      style: titleTextStyle.copyWith(fontSize: 30),
                    ),
                    const SizedBox(
                      height: 22,
                    ),
                    Text(
                      "Reference site about Lorem\nIpsum, giving information origins\nas well as a random",
                      style: body1TextStyle.copyWith(),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
              Spacer(),
              Container(
                margin: const EdgeInsets.only(left: 30, bottom: 31),
                width: 248,
                height: 272,
                decoration: const BoxDecoration(
                    image:
                        DecorationImage(image: AssetImage("assets/yoga.png"))),
              )
            ],
          ),
          Positioned(
            right: -MediaQuery.of(context).size.width * 0.75 * 0.32,
            bottom: -MediaQuery.of(context).size.width * 0.75 * 0.15,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.75,
              height: MediaQuery.of(context).size.width * 0.75,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: kWhiteColor.withOpacity(0.07)),
            ),
          ),
          Positioned(
            left: -MediaQuery.of(context).size.width * 0.75 * 0.05,
            bottom: -MediaQuery.of(context).size.width * 0.75 * 0.4,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.75,
              height: MediaQuery.of(context).size.width * 0.75,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: kWhiteColor.withOpacity(0.07)),
            ),
          ),
        ],
      ),
    );
  }
}
