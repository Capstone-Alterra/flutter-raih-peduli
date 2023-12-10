import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/screen/view/fundraises/transaction_amount_screen.dart';
import 'package:flutter_raih_peduli/screen/view/widgets/volunteer/save_widget.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_fundraises.dart';
import 'package:flutter_raih_peduli/theme.dart';
import 'package:provider/provider.dart';

class DetailFundraisePage extends StatefulWidget {
  final int id;

  const DetailFundraisePage({
    super.key,
    required this.id,
  });

  @override
  State<DetailFundraisePage> createState() => _DetailFundraisePageState();
}

class _DetailFundraisePageState extends State<DetailFundraisePage> {
  late FundraisesViewModel viewModel;
  @override
  void initState() {
    viewModel = Provider.of<FundraisesViewModel>(context, listen: false);
    viewModel.fetchDetailfundraises(id: widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Detail Penggalangan Dana',
          style: TextStyle(
            color: AppTheme.primaryColor,
            fontFamily: 'Helvetica',
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: AppTheme.primaryColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          SaveWidget(),
        ],
      ),
      body: Consumer<FundraisesViewModel>(
        builder: (context, contactModel, child) {
          return viewModel.isDetail
              ? SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 8),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12.0),
                          child: Image.network(
                            viewModel.modelDetailFundraises!.data.photo,
                            height: 250.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          viewModel.modelDetailFundraises!.data.title,
                          style: const TextStyle(
                            color: AppTheme.tertiaryColor,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                        child: Text(
                          '${viewModel.modelDetailFundraises!.data.createdAt} - ${viewModel.modelDetailFundraises!.data.endDate}',
                          style: TextStyle(
                              fontFamily: 'Helvetica',
                              fontSize: size.height / 60),
                        ),
                      ),
                      const Padding(
                        padding:
                            EdgeInsets.only(left: 16.0, top: 6, right: 16.0),
                        child: LinearProgressIndicator(
                          color: AppTheme.tertiaryColor,
                          value: 0.6,
                          minHeight: 10,
                          borderRadius:
                              BorderRadius.all(Radius.circular(10)), // Set the
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "Target",
                                      style: TextStyle(
                                        color: AppTheme.primaryColor,
                                        fontFamily: 'Helvetica',
                                        fontWeight: FontWeight.w500,
                                        fontSize: size.height / 60,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "${viewModel.modelDetailFundraises!.data.target}",
                                  style: TextStyle(
                                    color: AppTheme.tertiaryColor,
                                    fontFamily: 'Helvetica',
                                    fontSize: size.height / 50,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "Sisa hari",
                                      style: TextStyle(
                                        color: AppTheme.primaryColor,
                                        fontFamily: 'Helvetica',
                                        fontSize: size.height / 60,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "12 Hari",
                                  style: TextStyle(
                                    color: AppTheme.tertiaryColor,
                                    fontFamily: 'Helvetica',
                                    fontSize: size.height / 50,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 16.0, top: 16.0),
                        child: Text(
                          'Penggalang Dana',
                          style: TextStyle(
                            color: AppTheme.primaryColor,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const Padding(
                          padding: EdgeInsets.only(left: 16.0, top: 16.0),
                          child: Row()),
                      const Padding(
                        padding: EdgeInsets.only(left: 16.0, top: 16.0),
                        child: Text(
                          'Deskripsi',
                          style: TextStyle(
                            color: AppTheme.primaryColor,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          viewModel.modelDetailFundraises!.data.description,
                          style: const TextStyle(fontSize: 16.0),
                        ),
                      ),
                    ],
                  ),
                )
              : const Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
      bottomNavigationBar: Consumer<FundraisesViewModel>(
        builder: (context, contactModel, child) {
          return viewModel.isDetail
              ? Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TransactionAmountScreen(
                            id: widget.id,
                          ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Text(
                        'Donasi Sekarang',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                )
              : const SizedBox(
                  height: 1,
                  width: 1,
                );
        },
      ),
    );
  }

  Widget _buildInfoColumn(String label, String value, IconData iconData) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              iconData,
              color: AppTheme.primaryColor,
            ),
            const SizedBox(width: 8.0),
            Text(
              label,
              style: const TextStyle(
                color: AppTheme.primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4.0),
        Text(value),
      ],
    );
  }
}
