import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/model/bottomnavbar.dart';
import 'package:flutter_raih_peduli/screen/view/home/widget/custom_appbar_widget.dart';
import 'package:flutter_raih_peduli/screen/view/home/widget/feature_menu_widget.dart';
import 'package:flutter_raih_peduli/screen/view/home/widget/header_widget.dart';
import 'package:flutter_raih_peduli/screen/view/home/home_listview.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_homescreeen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  final homeScreenViewModel = HomeScreenViewModel();

  HomeScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: CustomAppBar().preferredSize,
        child: CustomAppBar(),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height:170, child: HeaderWidget()),
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: Text(
                'Fitur Menu',
                style: TextStyle(
                fontSize: 20, 
                fontWeight: FontWeight.bold, 
                fontFamily: 'Helvetica',
                ),
              ),
            ),
            const FeatureMenuList(),
            SizedBox(
              height: 980, // Sesuaikan dengan tinggi yang diinginkan
              child: ChangeNotifierProvider(
                create: (context) => HomeScreenViewModel(),
                child: HomeListViewBuilder(),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(20),
        height: size.width * .155,
        decoration: const BoxDecoration(
          color: Color(0xffF4F6FA),
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(8),
          ),
        ),
        child: Consumer<HomeScreenViewModel>(
          builder: (context, provider, child) {
            return ListView.builder(
              itemCount: 4,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: size.width * .024),
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  homeScreenViewModel.updateIndex(index);
                },
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 1500),
                      curve: Curves.fastLinearToSlowEaseIn,
                      margin: EdgeInsets.only(
                        bottom: index == homeScreenViewModel.currentIndex
                            ? 0
                            : size.width * .029,
                        right: size.width * .0422,
                        left: size.width * .0422,
                      ),
                      width: size.width * .128,
                      height: index == homeScreenViewModel.currentIndex
                          ? size.width * .014
                          : 0,
                      decoration: BoxDecoration(
                        color: const Color(0xff282f65),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    SvgPicture.asset(
                      contents[index].image,
                      height: size.width * .066,
                      colorFilter: ColorFilter.mode(
                        index == homeScreenViewModel.currentIndex
                            ? const Color(0xff293066)
                            : const Color(0xff293066).withOpacity(.4),
                        BlendMode.srcIn,
                      ),
                    ),
                    Text(
                      contents[index].title,
                      style: TextStyle(
                        fontFamily: 'Helevetica',
                        fontSize: 12,
                        color: index == homeScreenViewModel.currentIndex
                            ? const Color(0xff293066)
                            : const Color(0xff293066).withOpacity(.4),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
