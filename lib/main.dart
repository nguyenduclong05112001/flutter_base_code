import 'package:drawer_app/const/shared_preferences_const.dart';
import 'package:drawer_app/ui/home_screen.dart';
import 'package:drawer_app/ui/splash_screens.dart';
import 'package:drawer_app/until/shared_preferences_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SharedPreferencesUtils.init();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent),
    );

    return MaterialApp(
      title: 'Introduction screen',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: isFirstScreen(),
    );
  }

  Widget isFirstScreen(){
    if(SharedPreferencesUtils.getBool(SharedPreferencesConst.KEY_SHARED_PREFERENCE_CHECK_FIRST_TIME_IN_APP) == true){
      return const HomeScreen();
    }
    return SplashScreen();
  }
}
