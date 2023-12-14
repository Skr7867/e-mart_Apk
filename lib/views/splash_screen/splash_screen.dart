import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:tathagatmart/consts/consts.dart';
import 'package:tathagatmart/views/splash_screen/auth_screen/login_screen.dart';
import 'package:tathagatmart/views/splash_screen/home_screen/home.dart';
import 'package:tathagatmart/widgets_common/applogo_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {
// create a method to change screen
  changeScreen() {
    Future.delayed(const Duration(seconds: 3), () {
      // Get.to(() => const LoginScreen());

      auth.authStateChanges().listen((User? user) {
        if (user == null && mounted) {
          Get.to(() => const LoginScreen());
        } else {
          Get.to(() => const Home());
        }
      });
    });
  }

  @override
  void initState() {
    changeScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: redColor,
      body: Center(
          child: Column(
        children: [
          Align(
              alignment: Alignment.topLeft,
              child: Image.asset(icSplashBg, width: 300)),
          20.heightBox,
          applogoWidget(),
          10.heightBox,
          appname.text.fontFamily(bold).size(22).white.make(),
          5.heightBox,
          appversion.text.white.make(),
          const Spacer(),
          credits.text.white.fontFamily(semibold).make(),
        ],
      )),
    );
  }
}
