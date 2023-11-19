import 'package:flutter/material.dart';
import '../../../theme/theme.dart';
import '../../view_model/view_model_donate.dart';
import 'package:provider/provider.dart';
import '../../../model/model_donate.dart';
import 'widget/widget_fundraisingcard.dart';

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
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    style: const TextStyle(
                        backgroundColor: AppTheme.ornamentColor),
                    onChanged: (value) {
                      donateViewModel.setSearchText(value);
                    },
                    decoration: InputDecoration(
                      hintText: 'Cari donasi...',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 10.0,
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.filter_alt_outlined),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
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
    );
  }
}
