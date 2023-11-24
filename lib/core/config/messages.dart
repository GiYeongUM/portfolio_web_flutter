import 'package:intl/intl.dart';

class Messages {
  Messages._privateConstructor();

  static final Messages _instance = Messages._privateConstructor();

  factory Messages() {
    return _instance;
  }

  String get strength_1 => Intl.message(
        "Hej! I'm a Flutter developer with a knack for applying sophisticated UI/UX. "
        "With in-depth expertise in the Flutter framework, "
        "I seamlessly integrate the latest tech trends and innovative development techniques. "
        "My continuous learning, coupled with a commitment to ongoing code improvement and optimization, "
        "allows me to consistently deliver efficient and high-quality software.",
        name: "strength_1",
      );
}
