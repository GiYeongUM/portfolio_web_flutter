import 'package:get/get.dart';
import 'dart:async';

import 'model/text_class.dart';


class TranslateController extends GetxController {

  var translateSleep = false.obs;

  var introText_1 = TextClass(textMap: {
    "kr": TextStatus(text: "안녕하세요!", currentLength: "안녕하세요!".length.obs),
    "en": TextStatus(text: "Hello there!", currentLength: 0.obs)},
      canTranslate: true.obs, isKr: true.obs).obs;

  var introText_2 = TextClass(textMap: {
    "kr": TextStatus(text: "크로스 플랫폼 모바일 개발자", currentLength: "크로스 플랫폼 모바일 개발자".length.obs),
    "en": TextStatus(text: "cross-platform mobile developer", currentLength: 0.obs)},
      canTranslate: true.obs, isKr: true.obs).obs;

  var introText_3 = TextClass(textMap: {
    "kr": TextStatus(text: "엄기영입니다!", currentLength: "엄기영입니다!".length.obs),
    "en": TextStatus(text: "GiYeongUM", currentLength: 0.obs)},
      canTranslate: true.obs, isKr: true.obs).obs;

  var sideText_1 = TextClass(textMap: {
    "kr": TextStatus(text: "I'm", currentLength: "I'm".length.obs),
    "en": TextStatus(text: "저는", currentLength: 0.obs)},
      canTranslate: true.obs, isKr: true.obs).obs;

  var introText_4 = TextClass(textMap: {
    "kr": TextStatus(text: "창의적, 효율적으로", currentLength: "창의적, 효율적으로".length.obs),
    "en": TextStatus(text: "Creatively and efficiently", currentLength: 0.obs)},
      canTranslate: true.obs, isKr: true.obs).obs;

  var introText_5 = TextClass(textMap: {
    "kr": TextStatus(text: "AOS, iOS 모두", currentLength: "AOS, iOS 모두".length.obs),
    "en": TextStatus(text: "both AOS and iOS", currentLength: 0.obs)},
      canTranslate: true.obs, isKr: true.obs).obs;

  var introText_6 = TextClass(textMap: {
    "kr": TextStatus(text: "심지어 Flutter 까지!", currentLength: "심지어 Flutter 까지!".length.obs),
    "en": TextStatus(text: "even Flutter!", currentLength: 0.obs)},
      canTranslate: true.obs, isKr: true.obs).obs;

  var sideText_2 = TextClass(textMap: {
    "kr": TextStatus(text: "Developer", currentLength: "Developer".length.obs),
    "en": TextStatus(text: "개발자입니다.", currentLength: 0.obs)},
      canTranslate: true.obs, isKr: true.obs).obs;

  var mainTitle = TextClass(textMap: {
    "kr": TextStatus(text: "커리어", currentLength: "커리어".length.obs),
    "en": TextStatus(text: "Career", currentLength: 0.obs)},
      canTranslate: true.obs, isKr: true.obs).obs;

  var mainTech = TextClass(textMap: {
    "kr": TextStatus(text: "기술스택", currentLength: "기술스택".length.obs),
    "en": TextStatus(text: "TechStack", currentLength: 0.obs)},
      canTranslate: true.obs, isKr: true.obs).obs;

  var companyName_1 = TextClass(textMap: {
    "kr": TextStatus(text: "라온스토리", currentLength: "라온스토리".length.obs),
    "en": TextStatus(text: "LaonStory", currentLength: 0.obs)},
      canTranslate: true.obs, isKr: true.obs).obs;

  var companyDay_1 = TextClass(textMap: {
    "kr": TextStatus(text: "2021.08 ~ ", currentLength: "2021.08 ~ ".length.obs),
    "en": TextStatus(text: "2021.08 ~ ", currentLength: 0.obs)},
      canTranslate: false.obs, isKr: true.obs).obs;

  var companyProject_1 = TextClass(textMap: {
    "kr": TextStatus(text: "브랜드케어", currentLength: "브랜드케어".length.obs),
    "en": TextStatus(text: "BrandCare", currentLength: 0.obs)},
      canTranslate: true.obs, isKr: true.obs).obs;

  var companyProjectDay_1 = TextClass(textMap: {
    "kr": TextStatus(text: "2021-08 ~ 2021-10", currentLength: "2021-08 ~ 2021-10".length.obs),
    "en": TextStatus(text: "2021-08 ~ 2021-10", currentLength: 0.obs)},
      canTranslate: false.obs, isKr: true.obs).obs;

  var companyProjectDesc_1 = TextClass(textMap: {
    "kr": TextStatus(text: "브랜드 케어는 명품 수선과 정품 인증을 위한 앱 플랫폼으로 사용자가 명품에 대한 기본 정보를 등록하면 케어 서비스를 이용할 수 있습니다. 이미지 수정, 아임포트 연동 결제, 소셜 로그인, 메인 뷰를 담당했습니다.",
        currentLength: "브랜드 케어는 명품 수선과 정품 인증을 위한 앱 플랫폼으로 사용자가 명품에 대한 기본 정보를 등록하면 케어 서비스를 이용할 수 있습니다. 이미지 수정, 아임포트 연동 결제, 소셜 로그인, 메인 뷰를 담당했습니다.".length.obs),
    "en": TextStatus(text: "Brand Care is an app platform for repairing and authenticating luxury goods, and user can use the care service when register basic information about luxury goods. I was in charge of image modification, im-port linked payment, social login, and main view.", currentLength: 0.obs)},
      canTranslate: true.obs, isKr: true.obs).obs;

  var companyProjectTech_1 = TextClass(textMap: {
    "kr": TextStatus(text: "Flutter, Provider, MVVM, FVM, Json-Serializable, Im-port, Social Login, FireBase",
        currentLength: "Flutter, Provider, MVVM, FVM, Json-Serializable, Im-port, Social Login, FireBase".length.obs),
    "en": TextStatus(text: "Flutter, Provider, MVVM, FVM, Json-Serializable, Im-port, Social Login, FireBase", currentLength: 0.obs)},
      canTranslate: false.obs, isKr: true.obs).obs;

  var companyProject_2 = TextClass(textMap: {
    "kr": TextStatus(text: "All.Y", currentLength: "All.Y".length.obs),
    "en": TextStatus(text: "All.Y", currentLength: 0.obs)},
      canTranslate: false.obs, isKr: true.obs).obs;

  var companyProjectDay_2 = TextClass(textMap: {
    "kr": TextStatus(text: "2021-09 ~ 2022-01", currentLength: "2021-09 ~ 2022-01".length.obs),
    "en": TextStatus(text: "2021-09 ~ 2022-01", currentLength: 0.obs)},
      canTranslate: false.obs, isKr: true.obs).obs;

  var companyProjectDesc_2 = TextClass(textMap: {
    "kr": TextStatus(text: "All.Y 는 연세대학교의 ‘에브리타임'과 같은 대학 커뮤니티 앱 플랫폼입니다. 시간표, 학과별 공지사항, 연세대학교 시스템 연동, 학점계산기 등의 기능이 있습니다.",
        currentLength: "All.Y 는 연세대학교의 ‘에브리타임'과 같은 대학 커뮤니티 앱 플랫폼입니다. 시간표, 학과별 공지사항, 연세대학교 시스템 연동, 학점계산기 등의 기능이 있습니다.".length.obs),
    "en": TextStatus(text: "All.Y is a university community app platform like 'Every Time'. There were functions such as timetable, announcement by department, linkage of Yonsei University system, and credit calculator.", currentLength: 0.obs)},
      canTranslate: true.obs, isKr: true.obs).obs;

  var companyProjectTech_2 = TextClass(textMap: {
    "kr": TextStatus(text: "Flutter, Provider, Singleton, FVM, Json-Serializable, sqflite, Secure Storage, native-webview, FireBase",
        currentLength: "Flutter, Provider, Singleton, FVM, Json-Serializable, sqflite, Secure Storage, native-webview, FireBase".length.obs),
    "en": TextStatus(text: "Flutter, Provider, Singleton, FVM, Json-Serializable, sqflite, Secure Storage, native-webview, FireBase", currentLength: 0.obs)},
      canTranslate: false.obs, isKr: true.obs).obs;

  var companyProject_3 = TextClass(textMap: {
    "kr": TextStatus(text: "e-병무지갑", currentLength: "e-병무지갑".length.obs),
    "en": TextStatus(text: "e-Military wallet", currentLength: 0.obs)},
      canTranslate: true.obs, isKr: true.obs).obs;

  var companyProjectDay_3 = TextClass(textMap: {
    "kr": TextStatus(text: "2021-11 ~ 2022-03", currentLength: "2021-11 ~ 2022-03".length.obs),
    "en": TextStatus(text: "2021-11 ~ 2022-03", currentLength: 0.obs)},
      canTranslate: false.obs, isKr: true.obs).obs;

  var companyProjectDesc_3_1 = TextClass(textMap: {
    "kr": TextStatus(text: "e-병무지갑은 블록체인 기반으로 병적증명서, 병역증 등의 문서를 발급 받을 수 있는 앱입니다. WebView 기반 앱이며, DID와 Credential을 이용해 디지털 신분증과 PDF 등을 발급 받는 서비스를 제공합니다.",
        currentLength: "e-병무지갑은 블록체인 기반으로 병적증명서, 병역증 등의 문서를 발급 받을 수 있는 앱입니다. WebView 기반 앱이며, DID와 Credential을 이용해 디지털 신분증과 PDF 등을 발급 받는 서비스를 제공합니다.".length.obs),
    "en": TextStatus(text: "E-Military Wallet is an app that allows user to receive documents such as military certificates and military service certificates based on blockchain. It is a WebView-based app that provides a service that issues digital ID and PDF using DID and Credentials.", currentLength: 0.obs)},
      canTranslate: true.obs, isKr: true.obs).obs;

  var companyProjectDesc_3_2 = TextClass(textMap: {
    "kr": TextStatus(text: "또한, QR코드 인식으로 사회복무요원 출석 시스템과 APP to APP 국민은행, 정부24 연동과 APP to Web 중앙대학교 연동 기능이 있습니다.",
        currentLength: "또한, QR코드 인식으로 사회복무요원 출석 시스템과 APP to APP 국민은행, 정부24 연동과 APP to Web 중앙대학교 연동 기능이 있습니다.".length.obs),
    "en": TextStatus(text: "In addition, QR code recognition has a social service personnel attendance system, APP to APP Kookmin Bank, Government linkage, and APP to Web Chung-Ang University linkage.", currentLength: 0.obs)},
      canTranslate: true.obs, isKr: true.obs).obs;

  var companyProjectTech_3 = TextClass(textMap: {
    "kr": TextStatus(text: "Kotlin, Swift, View Binding, MVVM, AndroidX, JetPack, StoryBoard, BlockChain, VC, DID",
        currentLength: "Kotlin, Swift, View Binding, MVVM, AndroidX, JetPack, StoryBoard, BlockChain, VC, DID".length.obs),
    "en": TextStatus(text: "Kotlin, Swift, View Binding, MVVM, AndroidX, JetPack, StoryBoard, BlockChain, VC, DID", currentLength: 0.obs)},
      canTranslate: false.obs, isKr: true.obs).obs;

  var companyProject_4 = TextClass(textMap: {
    "kr": TextStatus(text: "쉐어핏", currentLength: "쉐어핏".length.obs),
    "en": TextStatus(text: "Share Fit", currentLength: 0.obs)},
      canTranslate: true.obs, isKr: true.obs).obs;

  var companyProjectDay_4 = TextClass(textMap: {
    "kr": TextStatus(text: "2021-12 ~ 2022-04", currentLength: "2021-12 ~ 2022-04".length.obs),
    "en": TextStatus(text: "2021-12 ~ 2022-04", currentLength: 0.obs)},
      canTranslate: false.obs, isKr: true.obs).obs;

  var companyProjectDesc_4 = TextClass(textMap: {
    "kr": TextStatus(text: "쉐어핏은 스마트워치를 이용하여 헬스 데이터와 활동 데이터를 다른 사용자와 공유할 수 있는 앱 플랫폼 입니다. 프로젝트 리더를 담당했으며, 실시간 건강 데이터 연동, 유저 연결 데이터 공유, 소셜로그인, BLE 통신이 있습니다.",
        currentLength: "쉐어핏은 스마트워치를 이용하여 헬스 데이터와 활동 데이터를 다른 사용자와 공유할 수 있는 앱 플랫폼 입니다. 프로젝트 리더를 담당했으며, 실시간 건강 데이터 연동, 유저 연결 데이터 공유, 소셜로그인, BLE 통신이 있습니다.".length.obs),
    "en": TextStatus(text: "ShareFit is an app platform that allows user to share health data and activity data with other users using a smartwatch. There are real-time health data linkage, user-connected data sharing, social login, and BLE communication.", currentLength: 0.obs)},
      canTranslate: true.obs, isKr: true.obs).obs;

  var companyProjectTech_4 = TextClass(textMap: {
    "kr": TextStatus(text: "Flutter, Kotlin, BLE, FVM, GetX, MethodChannel, Social Login, Secure Storage, FireBase, MVVM",
        currentLength: "Flutter, Kotlin, BLE, FVM, GetX, MethodChannel, Social Login, Secure Storage, FireBase, MVVM".length.obs),
    "en": TextStatus(text: "Flutter, Kotlin, BLE, FVM, GetX, MethodChannel, Social Login, Secure Storage, FireBase, MVVM", currentLength: 0.obs)},
      canTranslate: false.obs, isKr: true.obs).obs;

  var companyProject_5 = TextClass(textMap: {
    "kr": TextStatus(text: "포르쉐 이코넨", currentLength: "포르쉐 이코넨".length.obs),
    "en": TextStatus(text: "Porsche Ikonen, Seoul", currentLength: 0.obs)},
      canTranslate: true.obs, isKr: true.obs).obs;

  var companyProjectDay_5 = TextClass(textMap: {
    "kr": TextStatus(text: "2022-03 ~ 2022-04", currentLength: "2022-03 ~ 2022-04".length.obs),
    "en": TextStatus(text: "2022-03 ~ 2022-04", currentLength: 0.obs)},
      canTranslate: false.obs, isKr: true.obs).obs;

  var companyProjectDesc_5 = TextClass(textMap: {
    "kr": TextStatus(text: "포르쉐 이코넨 앱은 포르쉐 전시용 iPad 앱입니다. 포르쉐 전시 차량 사운드를 출력해주며, SwiftUI를 이용하여 고난이도 애니메이션 기술을 개발했습니다.",
        currentLength: "포르쉐 이코넨 앱은 포르쉐 전시용 iPad 앱입니다. 포르쉐 전시 차량 사운드를 출력해주며, SwiftUI를 이용하여 고난이도 애니메이션 기술을 개발했습니다.".length.obs),
    "en": TextStatus(text: "The Porsche Econen app is an iPad app for Porsche exhibition. It produces the sound of Porsche exhibition vehicles and developed high-level animation technology using SwiftUI.", currentLength: 0.obs)},
      canTranslate: true.obs, isKr: true.obs).obs;

  var companyProjectTech_5 = TextClass(textMap: {
    "kr": TextStatus(text: "iOS, SwiftUI, Transition, AVAudioPlayer",
        currentLength: "iOS, SwiftUI, Transition, AVAudioPlayer".length.obs),
    "en": TextStatus(text: "iOS, SwiftUI, Transition, AVAudioPlayer", currentLength: 0.obs)},
      canTranslate: false.obs, isKr: true.obs).obs;


  var companyName_2 = TextClass(textMap: {
    "kr": TextStatus(text: "웨이테크", currentLength: "웨이테크".length.obs),
    "en": TextStatus(text: "Waytech", currentLength: 0.obs)},
      canTranslate: true.obs, isKr: true.obs).obs;

  var companyDay_2 = TextClass(textMap: {
    "kr": TextStatus(text: "2020.12 ~ 2021.08", currentLength: "2020.12 ~ 2021.08".length.obs),
    "en": TextStatus(text: "2020.12 ~ 2021.08", currentLength: 0.obs)},
      canTranslate: false.obs, isKr: true.obs).obs;

  var companyProject_6 = TextClass(textMap: {
    "kr": TextStatus(text: "모닥모닥", currentLength: "모닥모닥".length.obs),
    "en": TextStatus(text: "ModakModak", currentLength: 0.obs)},
      canTranslate: true.obs, isKr: true.obs).obs;

  var companyProjectDay_6 = TextClass(textMap: {
    "kr": TextStatus(text: "2020.12 ~ 2021.08", currentLength: "2020.12 ~ 2021.08".length.obs),
    "en": TextStatus(text: "2020.12 ~ 2021.08", currentLength: 0.obs)},
      canTranslate: false.obs, isKr: true.obs).obs;

  var companyProjectDesc_6 = TextClass(textMap: {
    "kr": TextStatus(text: "모닥모닥은 캠핑 종합 커뮤니티 플랫폼 앱 솔루션입니다. 상태관리, 구글맵, 카카오맵을 연동하여 커뮤니티 시스템을 구축을 담당했습니다.",
        currentLength: "모닥모닥은 캠핑 종합 커뮤니티 플랫폼 앱 솔루션입니다. 상태관리, 구글맵, 카카오맵을 연동하여 커뮤니티 시스템을 구축을 담당했습니다.".length.obs),
    "en": TextStatus(text: "Modamodak is a comprehensive camping community platform app solution. I was in charge of building a community system by linking state management, Google map, and Kakao map.", currentLength: 0.obs)},
      canTranslate: true.obs, isKr: true.obs).obs;

  var companyProjectTech_6 = TextClass(textMap: {
    "kr": TextStatus(text: "Flutter, Getx, Google Map, FCM",
        currentLength: "Flutter, Getx, Google Map, FCM".length.obs),
    "en": TextStatus(text: "Flutter, Getx, Google Map, FCM", currentLength: 0.obs)},
      canTranslate: false.obs, isKr: true.obs).obs;


  var translateList = <TextClass>[];

  @override
  void onInit() {
    translateList = [
      introText_1.value,
      introText_2.value,
      introText_3.value,
      introText_4.value,
      introText_5.value,
      introText_6.value,
      sideText_1.value,
      sideText_2.value,
      mainTitle.value,
      mainTech.value,

      companyName_1.value,
      companyProject_1.value,
      companyProjectDesc_1.value,
      companyProject_2.value,
      companyProjectDesc_2.value,
      companyProject_3.value,
      companyProjectDesc_3_1.value,
      companyProjectDesc_3_2.value,
      companyProject_4.value,
      companyProjectDesc_4.value,
      companyProject_5.value,
      companyProjectDesc_5.value,

      companyName_2.value,
      companyProject_6.value,
      companyProjectDesc_6.value,
    ];
    super.onInit();
  }

  void translateStart(TextClass textData){
    if(!textData.canTranslate.value){
      return;
    }
    textData.canTranslate.value = false;
    Timer.periodic(const Duration(milliseconds: 1), (timer) {
      if(textData.textMap[textData.isKr.value ? "kr" : "en"]!.currentLength.value == 0){
        timer.cancel();
        textData.isKr.value = !textData.isKr.value;
        Timer.periodic(const Duration(milliseconds: 1), (timerEnd) {
          if (textData.textMap[textData.isKr.value ? "kr" : "en"]!.currentLength.value == textData.textMap[textData.isKr.value ? "kr" : "en"]!.text.length) {
            textData.canTranslate.value = true;
            timerEnd.cancel();
          } else {
            textData.textMap[textData.isKr.value ? "kr" : "en"]!.currentLength.value++;
          }
        });
      } else {
        textData.textMap[textData.isKr.value ? "kr" : "en"]!.currentLength.value--;
      }
    });

  }


}