import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_donate.dart';
import 'package:provider/provider.dart';
import '../../../model/model_donate.dart';

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

    return MaterialApp(
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(56.0),
          child: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            title: const Text(
              'Donasi',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
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
        ),
        body: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.all(8.0),
              sliver: SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: TextField(
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
                                  vertical: 10.0, horizontal: 10.0),
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.sort),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16.0),
                    _buildDonationList(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDonationList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: contents.length,
      itemBuilder: (context, index) {
        final remainingDays = int.parse(contents[index].remainingDays);
        const totalDays = 100;
        final progressValue = (totalDays - remainingDays) / totalDays;

        return Container(
          margin: const EdgeInsetsDirectional.fromSTEB(5, 0, 10, 15),
          width: 350,
          height: 120,
          decoration: ShapeDecoration(
            color: const Color(0xFFD1D1D1),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.all(8.0),
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                contents[index].image,
                width: 140,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  contents[index].title,
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 8.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(contents[index].time,
                        style: const TextStyle(fontSize: 12)),
                    const SizedBox(height: 4.0),
                    LinearProgressIndicator(
                      value: progressValue,
                      color: Colors.blue,
                    ),
                    const SizedBox(height: 8.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Target\n${contents[index].donated}',
                            style: const TextStyle(fontSize: 10)),
                        Text(
                          'Sisa hari\n${contents[index].remainingDays}',
                          style: const TextStyle(fontSize: 10),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
            onTap: () {},
          ),
        );
      },
    );
  }
}
