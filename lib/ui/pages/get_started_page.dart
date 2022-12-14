import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:tenang_test/theme.dart';
import 'package:tenang_test/ui/widget/custom_button.dart';

class GetStartedPage extends StatefulWidget {
  const GetStartedPage({super.key});

  @override
  State<GetStartedPage> createState() => _GetStartedPageState();
}

class _GetStartedPageState extends State<GetStartedPage> {
  List<Widget> items = [const Welcome1(), const Welcome2(), const Welcome3()];
  int _current = 0;
  final CarouselController _controller = CarouselController();

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        CarouselSlider.builder(
          itemBuilder: (context, index, realindex) => items[index],
          itemCount: items.length,
          carouselController: _controller,
          options: CarouselOptions(
            autoPlay: false,
            enableInfiniteScroll: false,
            height: height,
            enlargeCenterPage: false,
            viewportFraction: 1.0,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            },
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: items.map((e) {
                int index = items.indexOf(e);
                return Container(
                  width: 10.0,
                  height: 10.0,
                  margin: EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: MediaQuery.of(context).size.width * 0.02),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _current == index
                        ? carouselColor.withOpacity(0.3)
                        : kWhiteColor,
                  ),
                );
              }).toList()),
        ),
      ],
    );
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
              const Spacer(),
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
              const Spacer(),
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
                    ),
                    CustomButton(
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(
                            context, '/sign-in', (route) => false);
                      },
                      title: "Continue",
                      margin: EdgeInsets.only(
                          top:
                              ((MediaQuery.of(context).size.height / 2) - 118) /
                                  2 *
                                  0.4),
                      width: MediaQuery.of(context).size.width - (2 * 30),
                    )
                  ],
                ),
              ),
              const Spacer(),
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
