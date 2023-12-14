import 'package:tathagatmart/consts/consts.dart';

Widget loadingIndicator() {
  return const CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation(redColor));
}
