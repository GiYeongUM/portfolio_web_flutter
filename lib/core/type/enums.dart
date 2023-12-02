enum StatusCode { success, notFound, unAuthorized, badRequest, timeout, forbidden, error, multiple }

enum CommonStatus { initial, ready, success, loading, failure }

enum HoverType { arrow, zoom }

enum SkillItem {
  flutter(imageUrl: 'assets/icons/ic_flutter.png', webUrl: 'https://flutter.dev/'),
  android(imageUrl: 'assets/icons/ic_android.png', webUrl: 'https://developer.android.com/'),
  apple(imageUrl: 'assets/icons/ic_apple.png', webUrl: 'https://developer.apple.com/'),
  nest(imageUrl: 'assets/icons/ic_nest.png', webUrl: 'https://developers.nest.com/'),
  dart(imageUrl: 'assets/icons/ic_dart.png', webUrl: 'https://dart.dev/'),
  kotlin(imageUrl: 'assets/icons/ic_kotlin.png', webUrl: 'https://kotlinlang.org/'),
  swift(imageUrl: 'assets/icons/ic_swift.png', webUrl: 'https://swift.org/'),
  typescript(imageUrl: 'assets/icons/ic_typescript.png', webUrl: 'https://www.typescriptlang.org/'),
  fastlane(imageUrl: 'assets/icons/ic_fastlane.png', webUrl: 'https://fastlane.tools/'),
  shorebird(imageUrl: 'assets/icons/ic_shorebird.png', webUrl: ''),
  swiftUi(imageUrl: 'assets/icons/ic_swiftui.png', webUrl: 'https://developer.apple.com/xcode/swiftui/'),
  firebase(imageUrl: 'assets/icons/ic_firebase.png', webUrl: 'https://firebase.google.com/'),
  git(imageUrl: 'assets/icons/ic_git.png', webUrl: 'https://git-scm.com/'),
  gitlab(imageUrl: 'assets/icons/ic_gitlab.png', webUrl: 'https://about.gitlab.com/'),
  jira(imageUrl: 'assets/icons/ic_jira.png', webUrl: 'https://www.atlassian.com/software/jira'),
  confluence(imageUrl: 'assets/icons/ic_confluence.png', webUrl: 'https://www.atlassian.com/software/confluence'),
  figma(imageUrl: 'assets/icons/ic_figma.png', webUrl: 'https://www.figma.com/'),
  notion(imageUrl: 'assets/icons/ic_notion.png', webUrl: 'https://www.notion.so/'),
  slack(imageUrl: 'assets/icons/ic_slack.png', webUrl: 'https://slack.com/');

  const SkillItem({this.imageUrl, this.webUrl});

  final String? webUrl;
  final String? imageUrl;
}
