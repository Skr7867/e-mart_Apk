import 'package:tathagatmart/consts/firebase_consts.dart';

class FirestorServices {
  static getUser(uid) {
    return firestore
        .collection(usersCollection)
        .where('id', isEqualTo: uid)
        .snapshots();
  }

  static getProducts(category) {
    return firestore
        .collection(productsCollection)
        .where('p_category', isEqualTo: category)
        .snapshots();
  }
}
