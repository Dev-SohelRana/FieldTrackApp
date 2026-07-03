import 'package:field_track_app/features/auth/presentation/login_screen.dart';
import 'package:flutter/material.dart';
import 'constants/app_constants.dart';
import 'helpers/di.dart';
import 'helpers/helper_methods.dart';
import 'networks/dio/dio.dart';
import 'welcome_screen.dart';

final class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  bool _isLoading = true;

  @override
  void initState() {
    loadInitialData();
    super.initState();
  }

  loadInitialData() async {
    if (appData.read(kKeyIsLoggedIn)) {
      String token = appData.read(kKeyAccessToken);
      DioSingleton.instance.update(token);
      //await getProfileRXOBJ.getProfile();
    }
    // await getCurrencyRXOBJ.getCurrency();
    await setInitValue();
    // await initializeNotifications();
    //  LocalNotificationService.initialize();
    // LocalNotificationService.getToken();
    // DateTime time = DateTime.now().add(const Duration(minutes: 2));
    // await schedulePrayerNotifications(time);

    // await schedulePrayerNotifications();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const WelcomeScreen();
    } else {
      return const LoginScreen();

      // return appData.read(kKeyIsLoggedIn)
      //     ? const NavigationScreen()
      //     : const OnBoardingScreen();
      // || appData.read(kKeyIsExploring)
      // return  appData.read(kKeyIsFirstTime)? const LanguageChoseScreen() : appData.read(kKeyIsLoggedIn)? const NavigationScreen() : const LoginScreen();
    }
  }
}
