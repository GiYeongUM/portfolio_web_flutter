import 'package:get/get.dart';
import 'dart:async';

import 'model/text_class.dart';


class TranslateController extends GetxController {

  var translateSleep = false.obs;

  var introText_1 = TextClass(textMap: {
    "kr": TextStatus(text: "안녕하세요", currentLength: "안녕하세요".length.obs),
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
  var mainDesc = TextClass(textMap: {
    "kr": TextStatus(text: "개요", currentLength: "개요".length.obs),
    "en": TextStatus(text: "Outline", currentLength: 0.obs)},
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
    "en": TextStatus(text: "ModaModak is a comprehensive camping community platform app solution. I was in charge of building a community system by linking state management, Google map, and Kakao map.", currentLength: 0.obs)},
      canTranslate: true.obs, isKr: true.obs).obs;
  var companyProjectTech_6 = TextClass(textMap: {
    "kr": TextStatus(text: "Flutter, Getx, Google Map, FCM",
        currentLength: "Flutter, Getx, Google Map, FCM".length.obs),
    "en": TextStatus(text: "Flutter, Getx, Google Map, FCM", currentLength: 0.obs)},
      canTranslate: false.obs, isKr: true.obs).obs;


  var troubleTitle = TextClass(textMap: {
    "kr": TextStatus(text: "트러블 슈팅", currentLength: "트러블 슈팅".length.obs),
    "en": TextStatus(text: "Troubleshooting", currentLength: 0.obs)},
      canTranslate: true.obs, isKr: true.obs).obs;
  var troubleSub_1 = TextClass(textMap: {
    "kr": TextStatus(text: "[문제]", currentLength: "[문제]".length.obs),
    "en": TextStatus(text: "[Problem]", currentLength: 0.obs)},
      canTranslate: true.obs, isKr: true.obs).obs;
  var troubleSub_2 = TextClass(textMap: {
    "kr": TextStatus(text: "[해결]", currentLength: "[해결]".length.obs),
    "en": TextStatus(text: "[Solution]", currentLength: 0.obs)},
      canTranslate: true.obs, isKr: true.obs).obs;

  var troubleTitle_1 = TextClass(textMap: {
    "kr": TextStatus(text: "브랜드케어", currentLength: "브랜드케어".length.obs),
    "en": TextStatus(text: "BrandCare", currentLength: 0.obs)},
      canTranslate: true.obs, isKr: true.obs).obs;
  var troubleSubTitle_1 = TextClass(textMap: {
    "kr": TextStatus(text: "결제 시스템 구축", currentLength: "결제 시스템 구축".length.obs),
    "en": TextStatus(text: "Establishing a Payment System", currentLength: 0.obs)},
      canTranslate: true.obs, isKr: true.obs).obs;
  var troubleContent_1_1 = TextClass(textMap: {
    "kr": TextStatus(text: "구글 플레이스토어/애플 페이먼트 결제 시스템 사용 불가로 인한 결제 시스템 이슈", currentLength: "구글 플레이스토어/애플 페이먼트 결제 시스템 사용 불가로 인한 결제 시스템 이슈".length.obs),
    "en": TextStatus(text: "Google Play Store/Apple Payment System Not Available Issues in a Payment System", currentLength: 0.obs)},
      canTranslate: true.obs, isKr: true.obs).obs;
  var troubleContent_1_2 = TextClass(textMap: {
    "kr": TextStatus(text: "아임포트를 활용한 네이버 페이, 토스페이, 카카오페이, KG 이니시스, 다날, KCP 시스템 연동하여 결제 시스템 구축", currentLength: "아임포트를 활용한 네이버 페이, 토스페이, 카카오페이, KG 이니시스, 다날, KCP 시스템 연동하여 결제 시스템 구축".length.obs),
    "en": TextStatus(text: "Establishment of payment system by linking Naver Pay, Toss Pay, Kakao Pay, KG Inicis, Danal, and KCP system using IMPORT", currentLength: 0.obs)},
      canTranslate: true.obs, isKr: true.obs).obs;

  var troubleTitle_2 = TextClass(textMap: {
    "kr": TextStatus(text: "All.Y", currentLength: "All.Y".length.obs),
    "en": TextStatus(text: "All.Y", currentLength: 0.obs)},
      canTranslate: false.obs, isKr: true.obs).obs;
  var troubleSubTitle_2 = TextClass(textMap: {
    "kr": TextStatus(text: "Nullable 이슈", currentLength: "Nullable 이슈".length.obs),
    "en": TextStatus(text: "Nullable issue", currentLength: 0.obs)},
      canTranslate: true.obs, isKr: true.obs).obs;
  var troubleContent_2_1 = TextClass(textMap: {
    "kr": TextStatus(text: "Flutter 1.22.6 버전 사용으로 인한 Nullable 및 특정 패키지 사용 불가", currentLength: "Flutter 1.22.6 버전 사용으로 인한 Nullable 및 특정 패키지 사용 불가".length.obs),
    "en": TextStatus(text: "Nullable and specific packages unavailable due to use of Flutter 1.22.6 version", currentLength: 0.obs)},
      canTranslate: true.obs, isKr: true.obs).obs;
  var troubleContent_2_2 = TextClass(textMap: {
    "kr": TextStatus(text: "의존성 관리 및 타 패키지 사용으로 nullable 우회, 전역 state 사용을 피하며 json 파싱 최적화", currentLength: "의존성 관리 및 타 패키지 사용으로 nullable 우회, 전역 state 사용을 피하며 json 파싱 최적화".length.obs),
    "en": TextStatus(text: "Optimize json parsing by avoiding nullable bypass, global state with dependency management and other packages", currentLength: 0.obs)},
      canTranslate: true.obs, isKr: true.obs).obs;
  var troubleSubTitle_2_1 = TextClass(textMap: {
    "kr": TextStatus(text: "PlayStore UGC 정책 이슈", currentLength: "PlayStore UGC 정책 이슈".length.obs),
    "en": TextStatus(text: "PlayStore UGC Policy Issues", currentLength: 0.obs)},
      canTranslate: true.obs, isKr: true.obs).obs;
  var troubleContent_2_3 = TextClass(textMap: {
    "kr": TextStatus(text: "PlayStore UGC 정책 강화로 인한 커뮤니티 앱 출시 거절", currentLength: "PlayStore UGC 정책 강화로 인한 커뮤니티 앱 출시 거절".length.obs),
    "en": TextStatus(text: "Community App Rejection Due to Enhanced PlayStore UGC Policy", currentLength: 0.obs)},
      canTranslate: true.obs, isKr: true.obs).obs;
  var troubleContent_2_4 = TextClass(textMap: {
    "kr": TextStatus(text: "게시글 신고, 차단 기능 및 유저 블락 시스템 구축. 커뮤니티 사용자 정책을 정하고 전체 시스템에 적용", currentLength: "게시글 신고, 차단 기능 및 유저 블락 시스템 구축. 커뮤니티 사용자 정책을 정하고 전체 시스템에 적용".length.obs),
    "en": TextStatus(text: "Post reporting, blocking, and user block system construction. Set community user policies and apply to entire systems", currentLength: 0.obs)},
      canTranslate: true.obs, isKr: true.obs).obs;

  var troubleTitle_3 = TextClass(textMap: {
    "kr": TextStatus(text: "e-병무지갑", currentLength: "e-병무지갑".length.obs),
    "en": TextStatus(text: "E-Military Wallet", currentLength: 0.obs)},
      canTranslate: true.obs, isKr: true.obs).obs;
  var troubleSubTitle_3 = TextClass(textMap: {
    "kr": TextStatus(text: "Firebase 사용 불가 이슈", currentLength: "Firebase 사용 불가 이슈".length.obs),
    "en": TextStatus(text: "Firebase Unavailable Issue", currentLength: 0.obs)},
      canTranslate: true.obs, isKr: true.obs).obs;
  var troubleContent_3_1 = TextClass(textMap: {
    "kr": TextStatus(text: "병무청의 Firebase 사용불가 이유로 FCM 사용 불가", currentLength: "병무청의 Firebase 사용불가 이유로 FCM 사용 불가".length.obs),
    "en": TextStatus(text: "FCM unavailable due to MMA's inability to use Firebase", currentLength: 0.obs)},
      canTranslate: true.obs, isKr: true.obs).obs;
  var troubleContent_3_2 = TextClass(textMap: {
    "kr": TextStatus(text: "UPNS 서버 시스템을 활용하여 MSP Server Platform - Push 서비스 이용 시스템 구축", currentLength: "UPNS 서버 시스템을 활용하여 MSP Server Platform - Push 서비스 이용 시스템 구축".length.obs),
    "en": TextStatus(text: "Using UPNS Server System to Build MSP Server Platform - Push Service Utilization System", currentLength: 0.obs)},
      canTranslate: true.obs, isKr: true.obs).obs;
  var troubleSubTitle_3_1 = TextClass(textMap: {
    "kr": TextStatus(text: "AppIron 위변조 검사 시스템 버전관리 한계점 이슈", currentLength: "AppIron 위변조 검사 시스템 버전관리 한계점 이슈".length.obs),
    "en": TextStatus(text: "AppIron Forgery Check System Versioning Limitations Issue", currentLength: 0.obs)},
      canTranslate: true.obs, isKr: true.obs).obs;
  var troubleContent_3_3 = TextClass(textMap: {
    "kr": TextStatus(text: "AppIron 위변조 검사 시스템이 이전 버전을 유지하지 못하는 이슈로 인헤 유저들이 필수 업데이트를 받지 않으면 앱을 이용할 수 없는 이슈 발생", currentLength: "AppIron 위변조 검사 시스템이 이전 버전을 유지하지 못하는 이슈로 인헤 유저들이 필수 업데이트를 받지 않으면 앱을 이용할 수 없는 이슈 발생".length.obs),
    "en": TextStatus(text: "AppIron forgery inspection system fails to maintain previous versions, causing inhe users to be unable to use the app unless required updates are received", currentLength: 0.obs)},
      canTranslate: true.obs, isKr: true.obs).obs;
  var troubleContent_3_4 = TextClass(textMap: {
    "kr": TextStatus(text: "이전 버전네임과 버전코드를 서버와 비교하며 업데이트 선택 시스템 이용, 서버 업데이트 시 필수 업데이트 전환", currentLength: "이전 버전네임과 버전코드를 서버와 비교하며 업데이트 선택 시스템 이용, 서버 업데이트 시 필수 업데이트 전환".length.obs),
    "en": TextStatus(text: "Compare the old version name and version code with the server, use the update selection system, switch required updates when updating the server", currentLength: 0.obs)},
      canTranslate: true.obs, isKr: true.obs).obs;

  var troubleTitle_4 = TextClass(textMap: {
    "kr": TextStatus(text: "쉐어핏", currentLength: "쉐어핏".length.obs),
    "en": TextStatus(text: "Share Fit", currentLength: 0.obs)},
      canTranslate: true.obs, isKr: true.obs).obs;
  var troubleSubTitle_4 = TextClass(textMap: {
    "kr": TextStatus(text: "Flutter BLE Gatt 통신 이슈", currentLength: "Flutter BLE Gatt 통신 이슈".length.obs),
    "en": TextStatus(text: "Flutter BLE Gatt Communication Issue", currentLength: 0.obs)},
      canTranslate: true.obs, isKr: true.obs).obs;
  var troubleContent_4_1 = TextClass(textMap: {
    "kr": TextStatus(text: "Flutter의 BLE Gatt 통신 시스템을 특정 워치 디바이스에서 사용할 수 없는 이슈 발생", currentLength: "Flutter의 BLE Gatt 통신 시스템을 특정 디바이스에서 사용할 수 없는 이슈 발생".length.obs),
    "en": TextStatus(text: "Flutter's BLE Gatt communication system is unavailable on specific watch devices", currentLength: 0.obs)},
      canTranslate: true.obs, isKr: true.obs).obs;
  var troubleContent_4_2 = TextClass(textMap: {
    "kr": TextStatus(text: "Method Channel을 활용하여 네이티브로 Gatt 통신 시스템 구현, 타사 워치 디바이스 라이브러리 활용", currentLength: "Method Channel을 활용하여 네이티브로 Gatt 통신 시스템 구현, 타사 워치 디바이스 라이브러리 활용".length.obs),
    "en": TextStatus(text: "Native implementation of Gatt communication system utilizing Method Channel, leveraging third-party watch device libraries", currentLength: 0.obs)},
      canTranslate: true.obs, isKr: true.obs).obs;

  var profileTitle = TextClass(textMap: {
    "kr": TextStatus(text: "프로필", currentLength: "프로필".length.obs),
    "en": TextStatus(text: "Profile", currentLength: 0.obs)},
      canTranslate: true.obs, isKr: true.obs).obs;

  var profileSubTitle_1 = TextClass(textMap: {
    "kr": TextStatus(text: "학력", currentLength: "학력".length.obs),
    "en": TextStatus(text: "Education", currentLength: 0.obs)},
      canTranslate: true.obs, isKr: true.obs).obs;

  var profileContent_1 = TextClass(textMap: {
    "kr": TextStatus(text: "한국공학대학교", currentLength: "한국공학대학교".length.obs),
    "en": TextStatus(text: "Tech University of Korea", currentLength: 0.obs)},
      canTranslate: true.obs, isKr: true.obs).obs;

  var profileSubTitle_2 = TextClass(textMap: {
    "kr": TextStatus(text: "수상", currentLength: "수상".length.obs),
    "en": TextStatus(text: "Awards", currentLength: 0.obs)},
      canTranslate: true.obs, isKr: true.obs).obs;

  var profileContent_2 = TextClass(textMap: {
    "kr": TextStatus(text: "캡스톤 디자인 앱개발 우수작 수상 (2020)", currentLength: "캡스톤 디자인 앱개발 우수작 수상 (2020)".length.obs),
    "en": TextStatus(text: "Capstone Design App Development Award", currentLength: 0.obs)},
      canTranslate: true.obs, isKr: true.obs).obs;

  var profileContent_3 = TextClass(textMap: {
    "kr": TextStatus(text: "I2C 대회 3위 (2020)", currentLength: "I2C 대회 3위 (2020)".length.obs),
    "en": TextStatus(text: "3rd place in the I2C competition", currentLength: 0.obs)},
      canTranslate: true.obs, isKr: true.obs).obs;

  var profileSubTitle_3 = TextClass(textMap: {
    "kr": TextStatus(text: "자격사항", currentLength: "자격사항".length.obs),
    "en": TextStatus(text: "Licenses", currentLength: 0.obs)},
      canTranslate: true.obs, isKr: true.obs).obs;

  var profileContent_4 = TextClass(textMap: {
    "kr": TextStatus(text: "정보처리기사 (2021)", currentLength: "정보처리기사 (2021)".length.obs),
    "en": TextStatus(text: "Engineer Information Processing", currentLength: 0.obs)},
      canTranslate: true.obs, isKr: true.obs).obs;

  var profileContent_5 = TextClass(textMap: {
    "kr": TextStatus(text: "Opic IM", currentLength: "Opic IM".length.obs),
    "en": TextStatus(text: "Opic IM", currentLength: 0.obs)},
      canTranslate: false.obs, isKr: true.obs).obs;

  var etcTitle = TextClass(textMap: {
    "kr": TextStatus(text: "기타", currentLength: "기타".length.obs),
    "en": TextStatus(text: "ETC", currentLength: 0.obs)},
      canTranslate: true.obs, isKr: true.obs).obs;

  var etcContent_1 =  TextClass(textMap: {
    "kr": TextStatus(text: "산업기능요원 보충역 전직", currentLength: "산업기능요원 보충역 전직".length.obs),
    "en": TextStatus(text: "산업기능요원 보충역 전직", currentLength: 0.obs)},
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
      mainDesc.value,
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

      troubleTitle.value,
      troubleSub_1.value,
      troubleSub_2.value,
      troubleTitle_1.value,
      troubleTitle_2.value,
      troubleTitle_3.value,
      troubleTitle_4.value,
      troubleContent_1_1.value,
      troubleContent_1_2.value,
      troubleContent_2_1.value,
      troubleContent_2_2.value,
      troubleContent_2_3.value,
      troubleContent_2_4.value,
      troubleContent_3_1.value,
      troubleContent_3_2.value,
      troubleContent_3_3.value,
      troubleContent_3_4.value,
      troubleContent_4_1.value,
      troubleContent_4_2.value,
      troubleSubTitle_1.value,
      troubleSubTitle_2.value,
      troubleSubTitle_2_1.value,
      troubleSubTitle_3.value,
      troubleSubTitle_3_1.value,
      troubleSubTitle_4.value,

      profileTitle.value,
      profileSubTitle_1.value,
      profileSubTitle_2.value,
      profileSubTitle_3.value,
      profileContent_1.value,
      profileContent_2.value,
      profileContent_3.value,
      profileContent_4.value,
      profileContent_5.value,

      etcTitle.value,
      etcContent_1.value,

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