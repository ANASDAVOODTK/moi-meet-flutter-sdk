import 'package:flutter_test/flutter_test.dart';
import 'package:moi_meet_flutter_sdk/src/moi_meet.dart';
import 'package:moi_meet_flutter_sdk/src/moi_meet_platform_interface.dart';
import 'package:moi_meet_flutter_sdk/src/moi_meet_method_channel.dart';
import 'package:moi_meet_flutter_sdk/src/moi_meet_conference_options.dart';
import 'package:moi_meet_flutter_sdk/src/method_response.dart';
import 'package:moi_meet_flutter_sdk/src/moi_meet_event_listener.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockMoiMeetPlatform
    with MockPlatformInterfaceMixin
    implements MoiMeetPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  Future<MethodResponse> join(
      MoiMeetConferenceOptions options, MoiMeetEventListener? listener) {
    // implement join
    throw UnimplementedError();
  }

  @override
  Future<MethodResponse> hangUp() {
    // implement hangUp
    throw UnimplementedError();
  }

  @override
  Future<MethodResponse> setAudioMuted(bool muted) {
    // implement setAudioMuted
    throw UnimplementedError();
  }

  @override
  Future<MethodResponse> setVideoMuted(bool muted) {
    // implement setVideoMuted
    throw UnimplementedError();
  }

  @override
  Future<MethodResponse> sendEndpointTextMessage(
      {String? to, required String message}) {
    // implement sendEndpointTextMessage
    throw UnimplementedError();
  }

  @override
  Future<MethodResponse> toggleScreenShare(bool enabled) {
    // implement toggleScreenShare
    throw UnimplementedError();
  }

  @override
  Future<MethodResponse> openChat([String? to]) {
    // implement openChat
    throw UnimplementedError();
  }

  @override
  Future<MethodResponse> sendChatMessage(
      {String? to, required String message}) {
    // implement sendChatMessage
    throw UnimplementedError();
  }

  @override
  Future<MethodResponse> closeChat() {
    // implement closeChat
    throw UnimplementedError();
  }

  @override
  Future<MethodResponse> retrieveParticipantsInfo() {
    // implement retrieveParticipantsInfo
    throw UnimplementedError();
  }
}

void main() {
  final MoiMeetPlatform initialPlatform = MoiMeetPlatform.instance;

  test('$MethodChannelMoiMeet is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelMoiMeet>());
  });

  test('getPlatformVersion', () async {
    MoiMeet moiMeetPlugin = MoiMeet();
    MockMoiMeetPlatform fakePlatform = MockMoiMeetPlatform();
    MoiMeetPlatform.instance = fakePlatform;

    expect(await moiMeetPlugin.getPlatformVersion(), '42');
  });
}
