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
    // TODO: implement join
    throw UnimplementedError();
  }

  @override
  Future<MethodResponse> hangUp() {
    // TODO: implement hangUp
    throw UnimplementedError();
  }

  @override
  Future<MethodResponse> setAudioMuted(bool muted) {
    // TODO: implement setAudioMuted
    throw UnimplementedError();
  }

  @override
  Future<MethodResponse> setVideoMuted(bool muted) {
    // TODO: implement setVideoMuted
    throw UnimplementedError();
  }

  @override
  Future<MethodResponse> sendEndpointTextMessage(
      {String? to, required String message}) {
    // TODO: implement sendEndpointTextMessage
    throw UnimplementedError();
  }

  @override
  Future<MethodResponse> toggleScreenShare(bool enabled) {
    // TODO: implement toggleScreenShare
    throw UnimplementedError();
  }

  @override
  Future<MethodResponse> openChat([String? to]) {
    // TODO: implement openChat
    throw UnimplementedError();
  }

  @override
  Future<MethodResponse> sendChatMessage(
      {String? to, required String message}) {
    // TODO: implement sendChatMessage
    throw UnimplementedError();
  }

  @override
  Future<MethodResponse> closeChat() {
    // TODO: implement closeChat
    throw UnimplementedError();
  }

  @override
  Future<MethodResponse> retrieveParticipantsInfo() {
    // TODO: implement retrieveParticipantsInfo
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
