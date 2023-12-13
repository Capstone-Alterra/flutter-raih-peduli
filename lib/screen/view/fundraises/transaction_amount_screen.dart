import 'package:flutter/material.dart';
// import 'package:flutter_raih_peduli/model/model_fundraise_pagination.dart';
import 'package:flutter_raih_peduli/screen/view/fundraises/transaction_payment_method_screen.dart';
import 'package:flutter_raih_peduli/screen/view/fundraises/widgets/amount_button_widget.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_fundraises.dart';

// import 'package:flutter_raih_peduli/screen/view/volunteer/form_apply.dart';
// import 'package:flutter_raih_peduli/screen/view/widgets/volunteer/save_widget.dart';
import 'package:flutter_raih_peduli/theme.dart';
import 'package:provider/provider.dart';

class TransactionAmountScreen extends StatelessWidget {
  // final Datum fundraise;
  final int id;

  const TransactionAmountScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<FundraisesViewModel>(context, listen: false);
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Pilih Jumlah Donasi',
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
            viewModel.amountController.clear();
          },
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        // actions: [
        //   SaveWidget(),
        // ],
      ),
      body: SingleChildScrollView(child:
          Consumer<FundraisesViewModel>(builder: (context, isLoading, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Banner Image
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                        width: 1,
                        color: AppTheme.primaryColor.withOpacity(0.5))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Masukkan Nominal Donasi',
                      style: TextStyle(
                        color: AppTheme.primaryColor,
                        fontFamily: 'Helvetica',
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TextField(
                      controller: viewModel.amountController,
                      decoration: InputDecoration(
                        prefix: const Text(
                          'Rp.',
                          style: TextStyle(
                            color: AppTheme.primaryColor,
                            fontFamily: 'Helvetica',
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 16),
                        border: InputBorder.none,
                        filled: true,
                        fillColor: AppTheme.secondaryColor.withOpacity(0.2),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text('Minimal Donasi Rp.10.000',
                        style: TextStyle(
                          color: AppTheme.primaryColor,
                          fontFamily: 'Helvetica',
                          fontSize: 10,
                          fontWeight: FontWeight.w300,
                        ))
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                top: 20,
                bottom: 6,
                left: 20,
              ),
              child: Text(
                'Pilih Jumlah Donasi',
                style: TextStyle(
                  color: AppTheme.tertiaryColor,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
              child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 12),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                          width: 1,
                          color: AppTheme.primaryColor.withOpacity(0.5))),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            customAmountButton(
                                text: 'Rp. 20.000',
                                bgColor:
                                    viewModel.amountController.text == '20000'
                                        ? AppTheme.secondaryColor
                                        : AppTheme.tertiaryColor,
                                width: size.width / 2.6,
                                height: size.height / 19,
                                textColor:
                                    viewModel.amountController.text == '20000'
                                        ? AppTheme.tertiaryColor
                                        : AppTheme.white,
                                onTap: () {
                                  viewModel.updateAmount('20000');
                                }),
                            customAmountButton(
                                text: 'Rp. 30.000',
                                bgColor:
                                    viewModel.amountController.text == '30000'
                                        ? AppTheme.secondaryColor
                                        : AppTheme.tertiaryColor,
                                width: size.width / 2.6,
                                height: size.height / 19,
                                textColor:
                                    viewModel.amountController.text == '30000'
                                        ? AppTheme.tertiaryColor
                                        : AppTheme.white,
                                onTap: () {
                                  viewModel.updateAmount('30000');
                                }),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            customAmountButton(
                                text: 'Rp. 40.000',
                                bgColor:
                                    viewModel.amountController.text == '40000'
                                        ? AppTheme.secondaryColor
                                        : AppTheme.tertiaryColor,
                                width: size.width / 2.6,
                                height: size.height / 19,
                                textColor:
                                    viewModel.amountController.text == '40000'
                                        ? AppTheme.tertiaryColor
                                        : AppTheme.white,
                                onTap: () {
                                  viewModel.updateAmount('40000');
                                }),
                            customAmountButton(
                                text: 'Rp. 50.000',
                                bgColor:
                                    viewModel.amountController.text == '50000'
                                        ? AppTheme.secondaryColor
                                        : AppTheme.tertiaryColor,
                                width: size.width / 2.6,
                                height: size.height / 19,
                                textColor:
                                    viewModel.amountController.text == '50000'
                                        ? AppTheme.tertiaryColor
                                        : AppTheme.white,
                                onTap: () {
                                  viewModel.updateAmount('50000');
                                }),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            customAmountButton(
                                text: 'Rp. 60.000',
                                bgColor:
                                    viewModel.amountController.text == '60000'
                                        ? AppTheme.secondaryColor
                                        : AppTheme.tertiaryColor,
                                width: size.width / 2.6,
                                height: size.height / 19,
                                textColor:
                                    viewModel.amountController.text == '60000'
                                        ? AppTheme.tertiaryColor
                                        : AppTheme.white,
                                onTap: () {
                                  viewModel.updateAmount('60000');
                                }),
                            customAmountButton(
                                text: 'Rp. 70.000',
                                bgColor:
                                    viewModel.amountController.text == '70000'
                                        ? AppTheme.secondaryColor
                                        : AppTheme.tertiaryColor,
                                width: size.width / 2.6,
                                height: size.height / 19,
                                textColor:
                                    viewModel.amountController.text == '70000'
                                        ? AppTheme.tertiaryColor
                                        : AppTheme.white,
                                onTap: () {
                                  viewModel.updateAmount('70000');
                                }),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            customAmountButton(
                                text: 'Rp. 80.000',
                                bgColor:
                                    viewModel.amountController.text == '80000'
                                        ? AppTheme.secondaryColor
                                        : AppTheme.tertiaryColor,
                                width: size.width / 2.6,
                                height: size.height / 19,
                                textColor:
                                    viewModel.amountController.text == '80000'
                                        ? AppTheme.tertiaryColor
                                        : AppTheme.white,
                                onTap: () {
                                  viewModel.updateAmount('80000');
                                }),
                            customAmountButton(
                                text: 'Rp. 100.000',
                                bgColor:
                                    viewModel.amountController.text == '100000'
                                        ? AppTheme.secondaryColor
                                        : AppTheme.tertiaryColor,
                                width: size.width / 2.6,
                                height: size.height / 19,
                                textColor:
                                    viewModel.amountController.text == '100000'
                                        ? AppTheme.tertiaryColor
                                        : AppTheme.white,
                                onTap: () {
                                  viewModel.updateAmount('100000');
                                }),
                          ],
                        ),
                      ),
                    ],
                  )),
            ),
          ],
        );
      })),
      bottomNavigationBar: Consumer<FundraisesViewModel>(
        builder: (context, isLoading, child) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                // Tambahkan logika yang diinginkan saat tombol ditekan
                if (viewModel.amountController.text.isNotEmpty &&
                    (double.tryParse(viewModel.amountController.text) ?? 0) >=
                        10000) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TransactionPaymentMethodScreen(
                          id: id,
                          controllerAmount: viewModel.amountController,
                        ),
                      ));
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: viewModel.amountController.text.isEmpty ||
                        (double.tryParse(viewModel.amountController.text) ??
                                0) <
                            10000
                    ? AppTheme.secondaryColor
                    : AppTheme.primaryColor,
                // Warna fill sesuai AppTheme.primaryColor
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      8.0), // Tombol bulat dengan radius 20.0
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.all(12.0),
                child: Text(
                  'Lanjut',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
