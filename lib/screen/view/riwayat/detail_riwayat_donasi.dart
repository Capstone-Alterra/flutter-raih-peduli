import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/model/model_historydonation.dart';
import 'package:flutter_raih_peduli/screen/view/navigation/navigation.dart';
import 'package:flutter_raih_peduli/screen/view/widgets/history/detail_riwayat.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_historydonation.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_navigation.dart';
import 'package:flutter_raih_peduli/theme.dart';
import 'package:provider/provider.dart';

class RiwayatDetailDonasi extends StatefulWidget {
  const RiwayatDetailDonasi({super.key, required this.dataHistoryDonation});
  final Datum dataHistoryDonation;
  @override
  State<RiwayatDetailDonasi> createState() => _RiwayatDetailDonasiState();
}

class _RiwayatDetailDonasiState extends State<RiwayatDetailDonasi> {
  late DonationHistoryViewModel donationHistoryViewModel;
  late final NavigationProvider navigationProvider;
  @override
  void initState() {
    donationHistoryViewModel =
        Provider.of<DonationHistoryViewModel>(context, listen: false);
    donationHistoryViewModel.getDonationHistory();
    navigationProvider =
        Provider.of<NavigationProvider>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final Map<String, dynamic> colorStatus = donationHistoryViewModel
        .getColorStatus(widget.dataHistoryDonation.status);
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
            minHeight:
                MediaQuery.of(context).size.height, // Set a minimum height
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
                    image:
                        NetworkImage(widget.dataHistoryDonation.fundraisePhoto),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                widget.dataHistoryDonation.fundraiseName,
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
                    color: donationHistoryViewModel.textColor),
              ),
              const SizedBox(height: 10),
              Container(
                width: double.infinity,
                height: size.width * 0.43,
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
                            donationHistoryViewModel
                                .formatDate(widget.dataHistoryDonation.paidAt),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          reusableTextDetailHistory('Invoice'),
                          reusableTextDetailHistory(
                              'ID ${widget.dataHistoryDonation.transactionId}')
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          reusableTextDetailHistory('Jumlah'),
                          reusableTextDetailHistory(donationHistoryViewModel
                              .formattedPrice(widget.dataHistoryDonation.amount
                                  .toString())),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          reusableTextDetailHistory('Status'),
                          reusableTextDetailHistory(colorStatus['statusText'],
                              color: donationHistoryViewModel.textColor),
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
              }, 'Donasi Lagi')
            ],
          ),
        ),
      ),
    );
  }
}
