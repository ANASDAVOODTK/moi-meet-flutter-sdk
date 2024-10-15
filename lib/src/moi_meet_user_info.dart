/// Information about the local user. It will be used in absence of a token.
class MoiMeetUserInfo {
  /// User display name.
  final String? displayName;

  /// User email.
  final String? email;

  /// URL for the user avatar.
  final String? avatar;

  MoiMeetUserInfo({this.displayName, this.email, this.avatar});
}
