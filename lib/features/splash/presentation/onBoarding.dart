import 'package:finance_app/core/App_Colors.dart';
import 'package:finance_app/core/App_Strings.dart';
import 'package:finance_app/core/Database/catch_helper.dart';
import 'package:finance_app/core/servieces/services_locator.dart';
import 'package:finance_app/features/home/home_screen.dart';
import 'package:finance_app/features/splash/data/onBoarding_model.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  static const String routeName = 'onBoardingScreen';

  OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController controller = PageController();

  int currentIndex = 0;
  bool isLastPage = false;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xffF3F7FA),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: PageView.builder(
                  onPageChanged: (value) {
                    setState(() {
                      currentIndex = value;
                    });
                    if (value + 1 == OnBoardingModel.onBoardingScreens.length) {
                      setState(() {
                        isLastPage = true;
                      });
                    } else {
                      setState(() {
                        isLastPage = false;
                      });
                    }
                  },
                  controller: controller,
                  itemCount: OnBoardingModel.onBoardingScreens.length,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            controller.jumpToPage(2);
                          },
                          child: Text(
                            OnBoardingModel.onBoardingScreens[index].skip,
                            style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 20,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        Center(
                            child: Image.asset(
                          OnBoardingModel.onBoardingScreens[index].imagePath,
                          height: height * .4,
                          width: width,
                        )),
                        const SizedBox(
                          height: 40,
                        ),
                        Center(
                          child: SmoothPageIndicator(
                            controller: controller,
                            count: 3,
                            effect: ExpandingDotsEffect(
                              activeDotColor: AppColors.lightRed,
                              dotHeight: 8,
                              dotColor: Colors.grey,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Center(
                            child: Text(
                          OnBoardingModel.onBoardingScreens[index].title,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontSize: 27),
                        )),
                        const SizedBox(
                          height: 20,
                        ),
                        Center(
                            child: Text(
                          OnBoardingModel.onBoardingScreens[index].subTitle,
                          style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.w400,
                              fontSize: 14),
                          textAlign: TextAlign.center,
                        )),
                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                controller.previousPage(
                                    duration:
                                        const Duration(milliseconds: 1000),
                                    curve: Curves.fastEaseInToSlowEaseOut);
                              },
                              child: Text(
                                '${currentIndex + 1} / 3 ',
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: ElevatedButton(
                                  onPressed: () async {
                                    await getIt <CacheHelper>()
                                        .setData(
                                            key: AppStrings.onBoardingVisit,
                                            value: true)
                                        .then((value) {
                                          print('visited');
                                      isLastPage
                                          ? Navigator.of(context)
                                              .pushReplacementNamed(
                                                  HomeScreen.routeName)
                                          : controller.nextPage(
                                              duration:
                                                  Duration(milliseconds: 500),
                                              curve: Curves.easeInOut);
                                    }).catchError((e){
                                      print(e.toString());
                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.lightRed,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Text(
                                      OnBoardingModel
                                          .onBoardingScreens[index].nextBottom,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 20),
                                    ),
                                  )),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
