enum StatusCode { success, notFound, unAuthorized, badRequest, timeout, forbidden, error, multiple }

enum CommonStatus { initial, ready, success, loading, failure }

enum HoverType { arrow, zoom }

enum SkillItemType {
  flutter(imageUrl: 'assets/images/ic_flutter.png', webUrl: 'https://flutter.dev/'),
  android(imageUrl: 'assets/images/ic_android.png', webUrl: 'https://developer.android.com/'),
  apple(imageUrl: 'assets/images/ic_apple.png', webUrl: 'https://developer.apple.com/'),
  nest(imageUrl: 'assets/images/ic_nest.png', webUrl: 'https://developers.nest.com/'),
  dart(imageUrl: 'assets/images/ic_dart.png', webUrl: 'https://dart.dev/'),
  kotlin(imageUrl: 'assets/images/ic_kotlin.png', webUrl: 'https://kotlinlang.org/'),
  swift(imageUrl: 'assets/images/ic_swift.png', webUrl: 'https://swift.org/'),
  typescript(imageUrl: 'assets/images/ic_typescript.png', webUrl: 'https://www.typescriptlang.org/'),
  fastlane(imageUrl: 'assets/images/ic_fastlane.png', webUrl: 'https://fastlane.tools/'),
  shorebird(imageUrl: 'assets/images/ic_shorebird.png', webUrl: ''),
  swiftUi(imageUrl: 'assets/images/ic_swiftui.png', webUrl: 'https://developer.apple.com/xcode/swiftui/'),
  firebase(imageUrl: 'assets/images/ic_firebase.png', webUrl: 'https://firebase.google.com/'),
  git(imageUrl: 'assets/images/ic_git.png', webUrl: 'https://git-scm.com/'),
  gitlab(imageUrl: 'assets/images/ic_gitlab.png', webUrl: 'https://about.gitlab.com/'),
  jira(imageUrl: 'assets/images/ic_jira.png', webUrl: 'https://www.atlassian.com/software/jira'),
  confluence(imageUrl: 'assets/images/ic_confluence.png', webUrl: 'https://www.atlassian.com/software/confluence'),
  figma(imageUrl: 'assets/images/ic_figma.png', webUrl: 'https://www.figma.com/'),
  notion(imageUrl: 'assets/images/ic_notion.png', webUrl: 'https://www.notion.so/'),
  slack(imageUrl: 'assets/images/ic_slack.png', webUrl: 'https://slack.com/');

  const SkillItemType({String? imageUrl, String? webUrl});
}
