import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/screen/view/onboarding/splash_screen.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_chatbot.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_fundraises.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_ganti_password.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_historydonation.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_homescreeen.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_profile.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_volunteer.dart';
import 'package:provider/provider.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_forget_password.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_onboarding.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_signup.dart';
import 'screen/view_model/view_model_news.dart';
import 'screen/view_model/view_model_signin.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_navigation.dart';
import 'services/service_chat_bot.dart';

void main() async {
  final signInViewModel = SignInViewModel();
  final chatBotViewModel = ChatbotService();
  final newsViewModel = NewsViewModel();
  final fundraiseViewModel = FundraisesViewModel();
  runApp(const MyApp());
  await fundraiseViewModel.fetchAllFundraises();
  await newsViewModel.fetchAllNews();
  await signInViewModel.checkSharedPreferences();
  await chatBotViewModel.fetchApiKey();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => FundraisesViewModel()),
          ChangeNotifierProvider(create: (_) => ProfileViewModel()),
          ChangeNotifierProvider(create: (_) => SignUpViewModel()),
          ChangeNotifierProvider(create: (_) => SignInViewModel()),
          ChangeNotifierProvider(create: (_) => ForgetPasswordViewModel()),
          ChangeNotifierProvider(create: (_) => OnBoardingViewModel()),
          ChangeNotifierProvider(create: (_) => NavigationProvider()),
          ChangeNotifierProvider(create: (_) => HomeScreenViewModel()),
          ChangeNotifierProvider(create: (_) => NewsViewModel()),
          ChangeNotifierProvider(create: (_) => ChatbotViewModel()),
          ChangeNotifierProvider(create: (_) => VolunteerViewModel()),
          ChangeNotifierProvider(create: (_) => GantiPasswordViewModel()),
          ChangeNotifierProvider(create: (_) => DonationHistoryViewModel()),
        ],
        child: MaterialApp(
          theme: ThemeData(
            useMaterial3: false,
            brightness: Brightness.light,
            appBarTheme: const AppBarTheme(
              backgroundColor: Color(0xFF293066),
            ),
          ),
          debugShowCheckedModeBanner: false,
          home: const SplashScreen(),
        ));
  }
}
