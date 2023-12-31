import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/screen/view/onboarding/widget_carousel_dot.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../../../model/model_onboarding.dart';
import '../../view_model/view_model_onboarding.dart';

class OnbordingLandscape extends StatefulWidget {
  const OnbordingLandscape({super.key});

  @override
  State<OnbordingLandscape> createState() => _OnbordingLandscapeState();
}

class _OnbordingLandscapeState extends State<OnbordingLandscape> {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<OnBoardingViewModel>(context, listen: false);
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: PageView.builder(
      controller: viewModel.controller,
      itemCount: contents.length,
      onPageChanged: (int index) {
        viewModel.updateIndex(index);
      },
      itemBuilder: (_, index) {
        double fontSizeTitle = screenWidth < 600 ? 23 : 30;
        double fontSizeDiscription = screenWidth < 600 ? 14 : 20;
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(08),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SvgPicture.asset(
                  contents[index].image,
                ),
                const SizedBox(height: 60),
                Text(
                  contents[index].title,
                  style: TextStyle(
                    fontSize: fontSizeTitle,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  contents[index].discription,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: fontSizeDiscription,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 40),
                Consumer<OnBoardingViewModel>(
                  builder: (context, contactModel, child) {
                    return SizedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          contents.length,
                          (index) => buildDot(index, context),
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 40),
                Consumer<OnBoardingViewModel>(
                  builder: (context, viewModel, child) {
                    return Padding(
                        padding: const EdgeInsets.all(20),
                        child: viewModel.isLastPage()
                            ? ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF484F88),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(13),
                                  ),
                                ),
                                onPressed: () {
                                  viewModel.skipPage(context);
                                },
                                child: SizedBox(
                                  width: screenWidth,
                                  child: const Center(
                                    child: Text(
                                      "Mulai",
                                      style: TextStyle(
                                        fontFamily: 'Helvetica',
                                        fontSize: 16,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Consumer<OnBoardingViewModel>(
                                    builder: (context, viewModel, child) {
                                      return viewModel.currentIndex != 0 &&
                                              viewModel.currentIndex != 3
                                          ? ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.white,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(13),
                                                  side: const BorderSide(
                                                      color: Color(0xff293066),
                                                      width: 1),
                                                ),
                                              ),
                                              child: const Text(
                                                "Lewati",
                                                style: TextStyle(
                                                  fontFamily: 'Helvetica',
                                                  fontSize: 16,
                                                  color: Color(0xff293066),
                                                ),
                                              ),
                                              onPressed: () {
                                                viewModel.skipPage(context);
                                              },
                                            )
                                          : ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    const Color(0xFF484F88),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(13),
                                                ),
                                              ),
                                              child: const Text("Selanjutnya"),
                                              onPressed: () {
                                                viewModel.nextPage(
                                                    viewModel.controller);
                                              },
                                            );
                                    },
                                  ),
                                ],
                              ));
                  },
                )
              ],
            ),
          ),
        );
      },
    ));
  }
}
