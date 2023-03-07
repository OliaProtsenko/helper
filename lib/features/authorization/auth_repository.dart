
import 'package:helper/common/utils/network_helper.dart';

import 'model/user_data_model.dart';

class AuthRepository {
  Future _getData({required String url}) async {
    NetworkHelper networkHelper = NetworkHelper(Uri.parse(url));
    var data = await networkHelper.getData();
    return data;
  }

  Future<String?> attemptAutoLogin() async {
    String? userName;
    // var user = await _getData(url: url);
    // if (user != null) {
    //   print('User is signed in!');
    //   userName = user.email!;
    //   print(userName);
    // } else {
    //   print('User is currently signed out!');
    // }
    // return userName;
  }

  Future<User> login({
    required String email,
    required String password,
  }) async {
    // try {
    //   UserCredential result = await _auth.signInWithEmailAndPassword(
    //       email: email, password: password);
    //   User user = result.user!;
    //   return user;
    // } on FirebaseAuthException catch (e) {
    //   if (e.code == 'user-not-found') {
    //     print('No user found for that email.');
    //   } else if (e.code == 'wrong-password') {
    //     print('Wrong password provided for that user.');
    //   }
    //   rethrow;
    // }
    throw UnimplementedError();
  }

  Future<User> signUp({
    required String username,
    required String email,
    required String password,
  }) async {
    //try {
    //   UserCredential result = await _auth.createUserWithEmailAndPassword(
    //       email: email, password: password);
    //   await result.user?.updateDisplayName(username);
    //   User user = result.user!;
    //   return user;
    // } on FirebaseAuthException catch (e) {
    //   if (e.code == 'weak-password') {
    //     print('The password provided is too weak.');
    //   } else if (e.code == 'email-already-in-use') {
    //     print('The account already exists for that email.');
    //   }
    //   rethrow;
    // }
      throw UnimplementedError();

    }

  Future<void> signOut() async {
    throw UnimplementedError();


    // try {
    //   return await _auth.signOut();
    // } catch (error) {
    //   print(error.toString());
    //   return null;
    // }
  }
}
