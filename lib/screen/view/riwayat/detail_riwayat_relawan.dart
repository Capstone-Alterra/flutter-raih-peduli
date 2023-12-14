import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/model/model_historyapplyvolunteer.dart';
import 'package:flutter_raih_peduli/screen/view/widgets/history/detail_riwayat.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_historyapplyvolunteer.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_signin.dart';
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
  late SignInViewModel sp;
  late HistoryApplyVolunteerViewModel historyApplyVolunteerViewModel;
  @override
  void initState() {
    historyApplyVolunteerViewModel =
        Provider.of<HistoryApplyVolunteerViewModel>(context, listen: false);
    historyApplyVolunteerViewModel.getHistoryApplyVolunteer();
    sp = Provider.of<SignInViewModel>(context, listen: false);
    sp.setSudahLogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          'Riwayat Donasi',
          style: TextStyle(
            color: AppTheme.primaryColor,
            fontFamily: 'Helvetica',
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
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
                child: reusableTextDetailHistory(
                    historyApplyVolunteerViewModel.statusDetailText,
                    color: historyApplyVolunteerViewModel.textColor),
              ),
              const SizedBox(height: 15),
              reusableTextDetailHistory(
                  historyApplyVolunteerViewModel.detailDesc,
                  color: Colors.black,
                  textAlign: TextAlign.center),
              const SizedBox(height: 10),
              Container(
                width: double.infinity,
                height: size.height * 0.11,
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
                              historyApplyVolunteerViewModel.statusText,
                              color: historyApplyVolunteerViewModel.textColor),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.27),
              detailDonasiButton(context, () {
                Navigator.pop(context);
              }, 'Selesai')
            ],
          ),
        ),
      ),
    );
  }
}
