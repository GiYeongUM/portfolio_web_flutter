import 'package:flutter/material.dart' hide Key;
import 'package:flutter/services.dart';
import 'package:flutter_icon_dialog/flutter_icon_dialog.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../common/binding.dart';

String dateParser(String? date, {bool showCurrentYear = false}) {
  if (date == null) return "";
  final dateData = DateTime.parse(date).toLocal();
  if (dateData.year == DateTime.now().year && !showCurrentYear) {
    return DateFormat('MM월 dd일').format(dateData);
  }
  return DateFormat('yyyy년 MM월 dd일').format(dateData);
}

String timeParser(String? date, {bool showCurrentYear = false}) {
  if (date == null) return "";
  final dateData = DateTime.parse(date).toLocal();
  if (dateData.year == DateTime.now().year && !showCurrentYear) {
    return DateFormat('MM월 dd일 HH시 mm분').format(dateData);
  }
  return DateFormat('yyyy년 MM월 dd일 HH시 mm분').format(dateData);
}

String numberFormatter(int? number) {
  if (number == null) {
    return '-';
  }
  return NumberFormat('###,###,###,###').format(number);
}

DateTime dateFormatter(String? date) {
  if (date == null) return DateTime.now().toUtc();
  final result = date.replaceAll("년", "-").replaceAll("월", "-").replaceAll("일", "").replaceAll(" ", "");
  return DateTime.parse(result).toUtc();
}

String? changeAgeToString(String? age) {
  if (age?.contains("AGERANGE_AGE") ?? false) {
    return "${age?.replaceAll('AGERANGE_AGE_', "").substring(0, 2)}대";
  } else {
    return null;
  }
}

String? changeGenderToString(String? gender) {
  switch (gender) {
    case "GENDER_MALE":
      return '남';
    case "GENDER_FEMALE":
      return '여';
    default:
      return null;
  }
}

String changeNotificationToString(NotificationType type) {
  switch (type) {
    case NotificationType.need:
      return "TYPE_NEED";
    case NotificationType.notice:
      return "TYPE_NOTICE";
    case NotificationType.brand:
      return "TYPE_BRAND";
    case NotificationType.event:
      return "TYPE_EVENT";
  }
}

String? changeEmotionToString(String? emotion) {
  switch (emotion) {
    case "EMOTION_AWESOME":
      return '최고';
    case "EMOTION_GOOD":
      return '좋음';
    case "EMOTION_WELL":
      return '평범';
    case "EMOTION_BAD":
      return '나쁨';
    default:
      return null;
  }
}

String? changeReactionToString(String? reaction) {
  switch (reaction) {
    case "REACTION_ADOPT":
      return '반영되었어요!';
    case "REACTION_GOOD":
      return '검토중이에요!';
    case "REACTION_WELL":
      return '';
    default:
      return null;
  }
}

// randomNickName() {
//   return "${adjectives[Random().nextInt(adjectives.length)]} ${nouns[Random().nextInt(nouns.length)]}";
// }

Future<List<XFile?>> imageUpload(ImageType imageType, BuildContext context) async {
  final ImagePicker picker = ImagePicker();
  final image = <XFile?>[];
  try {
    if (imageType == ImageType.camera) {
      checkPermission(Permission.camera, context, '카메라');
      image.add(await picker.pickImage(source: ImageSource.camera));
    } else {
      checkPermission(Permission.photos, context, '갤러리');
      image.addAll(await picker.pickMultiImage());
    }
  } on PlatformException catch (exception) {
    logger.e(exception.code);
  }
  return image;
}

checkPermission(Permission permission, BuildContext context, String data) {
  permission.status.then((value) async {
    switch (value) {
      case PermissionStatus.denied:
        await permission.request();
        break;
      case PermissionStatus.permanentlyDenied:
        await deniedPermission(permission, context, data);
        break;
      case PermissionStatus.granted:
      case PermissionStatus.limited:
      case PermissionStatus.restricted:
      case PermissionStatus.provisional:
        break;
    }
  });
}

deniedPermission(Permission permission, BuildContext context, String data) async {
  permission.request().then((result) {
    if (result == PermissionStatus.permanentlyDenied) {
      IconDialog.show(
        context: context,
        title: '',
        content: '$data 권한이 거부되어있어요.\n기능 이용을 위해 디바이스 설정에서\n권한 설정을 해야해요. 설정으로 이동할까요?',
        iconTitle: true,
        canGoBack: true,
        buttonTheme: CustomButtonTheme(backgroundColor: colorTheme(context).foreground, iconColor: colorTheme(context).primary, contentStyle: textTheme(context).krBody1),
        widgets: Container(
          color: colorTheme(context).foreground,
          height: 40,
          width: 300,
          child: Row(
            children: [
              GestureDetector(
                onTap: () async {
                  Navigator.pop(context);
                },
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8.0)),
                  ),
                  height: 40,
                  width: 150,
                  child: Center(
                    child: Text(
                      "취소",
                      style: textTheme(context).krBody1.copyWith(color: Colors.red),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () async {
                  Navigator.pop(context);
                  await openAppSettings();
                },
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(8.0)),
                  ),
                  height: 40,
                  width: 150,
                  child: Center(
                    child: Text(
                      "확인",
                      style: textTheme(context).krBody1.copyWith(color: Colors.blue),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
  }).catchError((error) {
    IconDialog.show(
      context: context,
      title: '',
      content: '$data 권한이 거부되어있어요.\n기능 이용을 위해 디바이스 설정에서\n권한 설정을 해야해요. 설정으로 이동할까요?',
      iconTitle: true,
      canGoBack: true,
      buttonTheme: CustomButtonTheme(backgroundColor: colorTheme(context).foreground, iconColor: colorTheme(context).primary, contentStyle: textTheme(context).krBody1),
      widgets: Container(
        color: colorTheme(context).foreground,
        height: 40,
        width: 300,
        child: Row(
          children: [
            GestureDetector(
              onTap: () async {
                Navigator.pop(context);
              },
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8.0)),
                ),
                height: 40,
                width: 150,
                child: Center(
                  child: Text(
                    "취소",
                    style: textTheme(context).krBody1.copyWith(color: Colors.red),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () async {
                Navigator.pop(context);
                await openAppSettings();
              },
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(8.0)),
                ),
                height: 40,
                width: 150,
                child: Center(
                  child: Text(
                    "확인",
                    style: textTheme(context).krBody1.copyWith(color: Colors.blue),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  });
}

String listToString(List<String>? list) {
  String result = "";
  if (list == null) {
    return result;
  }
  for (int i = 0; i < list.length; i++) {
    result += list[i];
    if (i != list.length - 1) {
      result += ",";
    }
  }
  return result;
}
