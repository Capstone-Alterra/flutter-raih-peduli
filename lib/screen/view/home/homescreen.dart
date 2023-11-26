import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/screen/view/home/home_listview.dart';
import 'package:flutter_raih_peduli/screen/view/widgets/homescreen/custom_appbar_widget.dart';
import 'package:flutter_raih_peduli/screen/view/widgets/homescreen/feature_menu_widget.dart';
import 'package:flutter_raih_peduli/screen/view/widgets/homescreen/header_widget.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_homescreeen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  final homeScreenViewModel = HomeScreenViewModel();

  HomeScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const CustomAppBar().preferredSize,
        child: const CustomAppBar(),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height:170, child: HeaderWidget()),
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
                child: const HomeListViewBuilder(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
