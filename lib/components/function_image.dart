import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:toridori_clone/utils/firestore/users.dart';

class FunctionImage {
  static Future<dynamic> getImageFromGallery() async {
    ImagePicker picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    return pickedFile;
  }

  static Future<String?> uploadImage(image) async {
    if (image == null) {
      return null;
    }
    final storage = FirebaseStorage.instance;
    final ref = storage.ref().child('users').child(UserFirestore.currentUser.uid);
    final snapshot = await ref.putFile(
      image,
    );
    final downloadURL = await snapshot.ref.getDownloadURL();
    print('image_url: $downloadURL');
    return downloadURL;
  }
}
