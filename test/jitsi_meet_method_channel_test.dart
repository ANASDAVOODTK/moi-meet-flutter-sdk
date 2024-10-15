import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moi_meet_flutter_sdk/src/moi_meet_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelMoiMeet platform = MethodChannelMoiMeet();
  const MethodChannel channel = MethodChannel('jitsi_meet_flutter_sdk');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return '42';
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
