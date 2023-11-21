import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/screen/view/login_screen.dart';
import 'package:provider/provider.dart';

import '../view_model/view_model_landing_page.dart';

class LandingPage1 extends StatelessWidget {
  const LandingPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Landing Page 1")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const LandingPage2()));
          },
          child: const Text("Lanjutkan"),
        ),
      ),
    );
  }
}

class LandingPage2 extends StatelessWidget {
  const LandingPage2({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<LandingPageViewModel>(context);
    return Scaffold(
      appBar: AppBar(title: const Text("Landing Page 2")),
      body: SingleChildScrollView(
        child: Consumer<LandingPageViewModel>(
          builder: (context, contactModel, child) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    viewModel.skipToLogin(context);
                  },
                  child: const Text("Skip"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LandingPage3()));
                  },
                  child: const Text("Lanjutkan"),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class LandingPage3 extends StatelessWidget {
  const LandingPage3({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<LandingPageViewModel>(context, listen: false);
    return Scaffold(
      appBar: AppBar(title: const Text("Landing Page 3")),
      body: SingleChildScrollView(
        child: Consumer<LandingPageViewModel>(
          builder: (context, contactModel, child) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    viewModel.skipToLogin(context);
                  },
                  child: const Text("Skip"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LandingPage4()));
                  },
                  child: const Text("Lanjutkan"),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class LandingPage4 extends StatelessWidget {
  const LandingPage4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Landing Page 4")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
                (route) => false,
              );
            },
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 20,
              child: const Center(child: Text("Get Started")),
            ),
          ),
        ),
      ),
    );
  }
}