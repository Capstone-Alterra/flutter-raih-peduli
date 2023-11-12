import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/screen/view/home/custom_appbar_widget.dart';
import 'package:flutter_raih_peduli/screen/view/home/feature_menu_widget.dart';
import 'package:flutter_raih_peduli/screen/view/home/header_widget.dart';
import 'package:flutter_raih_peduli/screen/view/home/home_listview.dart';
import 'package:flutter_raih_peduli/screen/view/home/navbar_widget.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_homescreeen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: CustomAppBar().preferredSize,
        child: CustomAppBar(),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderWidget(),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Feature Menu',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            FeatureMenuList(),
            SizedBox(
              height: MediaQuery.of(context).size.height - kToolbarHeight - 56, // Sesuaikan dengan tinggi yang diinginkan
              child: ChangeNotifierProvider(
                create: (context) => HomeScreenViewModel(),
                child: HomeListViewBuilder(),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBarWidget(
        currentIndex: 0,
        onItemTapped: (index) {
          // Handle ketika item di BottomNavigationBarWidget ditekan
        },
      ),
    );
  }
}
