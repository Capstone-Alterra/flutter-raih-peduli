import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_navigation.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../../../model/bottomnavbar.dart';

class BottomNavgationBar extends StatefulWidget {
  const BottomNavgationBar({super.key});

  @override
  State<BottomNavgationBar> createState() => _BottomNavgationBarState();
}

class _BottomNavgationBarState extends State<BottomNavgationBar> {
  late final NavigationProvider navigationProvider;
  @override
  void initState() {
    super.initState();
    navigationProvider =
        Provider.of<NavigationProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Consumer<NavigationProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          body: provider.navigationbar[provider.pageIndex],
          bottomNavigationBar: Container(
            margin: const EdgeInsets.all(20),
            height: size.width * .155,
            decoration: const BoxDecoration(
              color: Color(0xffF4F6FA),
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(8),
              ),
            ),
            child: ListView.builder(
              itemCount: 4,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: size.width * .024),
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  navigationProvider.updateIndex(index);
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
                        bottom: index == navigationProvider.pageIndex
                            ? 0
                            : size.width * .029,
                        right: size.width * .0422,
                        left: size.width * .0422,
                      ),
                      width: size.width * .128,
                      height: index == navigationProvider.pageIndex
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
                        index == navigationProvider.pageIndex
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
                        color: index == navigationProvider.pageIndex
                            ? const Color(0xff293066)
                            : const Color(0xff293066).withOpacity(.4),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
