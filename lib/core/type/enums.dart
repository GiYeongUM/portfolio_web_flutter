enum StatusCode { success, notFound, unAuthorized, badRequest, timeout, forbidden, error, multiple }

enum CommonStatus { initial, ready, success, loading, failure }

enum HoverType { arrow, zoom }

enum SkillItem {
  Flutter(imageUrl: 'assets/icons/ic_flutter.png', webUrl: 'https://flutter.dev/'),
  Android(imageUrl: 'assets/icons/ic_android.png', webUrl: 'https://developer.android.com/'),
  iOS(imageUrl: 'assets/icons/ic_apple.png', webUrl: 'https://developer.apple.com/'),
  nest(imageUrl: 'assets/icons/ic_nest.png', webUrl: 'https://developers.nest.com/'),
  Dart(imageUrl: 'assets/icons/ic_dart.png', webUrl: 'https://dart.dev/'),
  Kotlin(imageUrl: 'assets/icons/ic_kotlin.png', webUrl: 'https://kotlinlang.org/'),
  Swift(imageUrl: 'assets/icons/ic_swift.png', webUrl: 'https://swift.org/'),
  Typescript(imageUrl: 'assets/icons/ic_typescript.png', webUrl: 'https://www.typescriptlang.org/'),
  fastlane(imageUrl: 'assets/icons/ic_fastlane.png', webUrl: 'https://fastlane.tools/'),
  Shorebird(imageUrl: 'assets/icons/ic_shorebird.png', webUrl: ''),
  SwiftUI(imageUrl: 'assets/icons/ic_swiftui.png', webUrl: 'https://developer.apple.com/xcode/swiftui/'),
  Firebase(imageUrl: 'assets/icons/ic_firebase.png', webUrl: 'https://firebase.google.com/'),
  Git(imageUrl: 'assets/icons/ic_git.png', webUrl: 'https://git-scm.com/'),
  Gitlab(imageUrl: 'assets/icons/ic_gitlab.png', webUrl: 'https://about.gitlab.com/'),
  Jira(imageUrl: 'assets/icons/ic_jira.png', webUrl: 'https://www.atlassian.com/software/jira'),
  Confluence(imageUrl: 'assets/icons/ic_confluence.png', webUrl: 'https://www.atlassian.com/software/confluence'),
  Figma(imageUrl: 'assets/icons/ic_figma.png', webUrl: 'https://www.figma.com/'),
  Notion(imageUrl: 'assets/icons/ic_notion.png', webUrl: 'https://www.notion.so/'),
  Slack(imageUrl: 'assets/icons/ic_slack.png', webUrl: 'https://slack.com/');

  const SkillItem({this.imageUrl, this.webUrl});

  final String? webUrl;
  final String? imageUrl;
}
