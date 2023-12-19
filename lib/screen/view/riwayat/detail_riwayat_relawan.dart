import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/model/model_historyapplyvolunteer.dart';
import 'package:flutter_raih_peduli/screen/view/navigation/navigation.dart';
import 'package:flutter_raih_peduli/screen/view/widgets/history/detail_riwayat.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_historyapplyvolunteer.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_navigation.dart';
import 'package:flutter_raih_peduli/theme.dart';
import 'package:provider/provider.dart';

class RiwayatDetailApplyVolunteer extends StatefulWidget {
  const RiwayatDetailApplyVolunteer(
      {super.key, required this.dataHistoryApplyVolunteer});
  final Datum dataHistoryApplyVolunteer;
  @override
  State<RiwayatDetailApplyVolunteer> createState() =>
      _RiwayatDetailApplyVolunteerState();
}

class _RiwayatDetailApplyVolunteerState
    extends State<RiwayatDetailApplyVolunteer> {
  late HistoryApplyVolunteerViewModel historyApplyVolunteerViewModel;
  late final NavigationProvider navigationProvider;
  @override
  void initState() {
    historyApplyVolunteerViewModel =
        Provider.of<HistoryApplyVolunteerViewModel>(context, listen: false);
    // historyApplyVolunteerViewModel.getHistoryApplyVolunteer();
    navigationProvider =
        Provider.of<NavigationProvider>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final Map<String, dynamic> colorStatus = historyApplyVolunteerViewModel
        .getColorStatus(widget.dataHistoryApplyVolunteer.status);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          'Riwayat Relawan',
          style: TextStyle(
            color: AppTheme.primaryColor,
            fontFamily: 'Helvetica',
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: AppTheme.primaryColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: size.height * 0.25,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: NetworkImage(
                        widget.dataHistoryApplyVolunteer.vacancyPhoto),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                widget.dataHistoryApplyVolunteer.vacancyName,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xff293066),
                  fontSize: 18,
                  fontFamily: 'Helvetica',
                ),
              ),
              const SizedBox(height: 15),
              Center(
                child: reusableTextDetailHistory(colorStatus['statusRespond'],
                    color: colorStatus['textColor']),
              ),
              const SizedBox(height: 15),
              reusableTextDetailHistory(colorStatus['detailDesc'],
                  color: Colors.black, textAlign: TextAlign.center),
              const SizedBox(height: 10),
              Container(
                width: double.infinity,
                height: size.width * 0.29,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: const Color(0xFFD1D1D1),
                    width: 2,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2), // Shadow color
                      offset:
                          const Offset(0, 4), // Vertical position of the shadow
                      blurRadius: 4, // Spread radius
                      spreadRadius:
                          1, // Negative spread to create elevation at the bottom
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          reusableTextDetailHistory('Tanggal'),
                          reusableTextDetailHistory(
                              historyApplyVolunteerViewModel.formatDate(
                                  widget.dataHistoryApplyVolunteer.createdAt)),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          reusableTextDetailHistory('Status'),
                          reusableTextDetailHistory(
                            colorStatus['statusCard'],
                            color: colorStatus['textColor'],
                            size: 12.5,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const Spacer(),
              detailDonasiButton(context, () {
                navigationProvider.out();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BottomNavgationBarWidget(),
                  ),
                );
              }, 'Selesai')
            ],
          ),
        ),
      ),
    );
  }
}
