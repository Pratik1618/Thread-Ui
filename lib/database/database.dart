// import 'package:cloud_firestore/cloud_firestore.dart';

// class DatabaseManager {
//   final CollectionReference userList =
//       FirebaseFirestore.instance.collection('Users');
// }

// Future getDocId() async {
//   await FirebaseFirestore.instance
//       .collection('Users')
//       .get()
//       .then((snapshot) => snapshot.docs.forEach((element) {
//             print(element.reference);
//           }));
// }

import 'package:cloud_firestore/cloud_firestore.dart';

CollectionReference _searchrefrence =
    FirebaseFirestore.instance.collection('search');
