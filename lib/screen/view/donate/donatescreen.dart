import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/screen/view/widgets/donate/widget_backbutton.dart';
import 'package:flutter_raih_peduli/screen/view/widgets/donate/widget_fundraisingcard.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../theme/theme.dart';
import '../../../../screen/view_model/view_model_donate.dart';
import 'package:provider/provider.dart';
import '../../../../model/donate_data.dart';

class DonateScreen extends StatefulWidget {
  const DonateScreen({Key? key}) : super(key: key);

  @override
  State<DonateScreen> createState() => _DonateScreenState();
}

class _DonateScreenState extends State<DonateScreen> {
  String searchText = '';

  @override
  Widget build(BuildContext context) {
    final donateViewModel = context.watch<DonateViewModel>();

    final List<FundraisingData> filteredFundraisingDataList =
        donateViewModel.getFundraisingDataList();

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'Donasi',
          style: TextStyle(
              color: AppTheme.primaryColor, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: const BackButtonWidget(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Container(
                      width: 295,
                      height: 34,
                      padding: const EdgeInsets.all(5),
                      decoration: ShapeDecoration(
                        color: AppTheme.ornamentColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                      ),
                      child: TextField(
                        style: const TextStyle(
                            backgroundColor: AppTheme.ornamentColor),
                        onChanged: (value) {
                          donateViewModel.setSearchText(value);
                        },
                        decoration: const InputDecoration(
                          hintText: 'Cari',
                          prefixIcon: Icon(Icons.search),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 10.0,
                            horizontal: 10.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 44,
                  height: 44,
                  padding: const EdgeInsets.all(5),
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    color: AppTheme.ornamentColor,
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      'assets/icons/jam_filter.svg',
                      width: 24,
                      height: 24,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10.0),
            Expanded(
              child: ListView.builder(
                itemCount: filteredFundraisingDataList.length,
                itemBuilder: (context, index) {
                  return FundraisingCard(
                    fundraisingData: filteredFundraisingDataList[index],
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Container(
        margin: const EdgeInsets.only(right: 10, bottom: 90),
        decoration: ShapeDecoration(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
          color: AppTheme.alterColor,
        ),
        child: FloatingActionButton(
          backgroundColor: AppTheme.alterColor,
          onPressed: () {},
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
