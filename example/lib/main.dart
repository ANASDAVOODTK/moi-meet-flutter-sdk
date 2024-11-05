// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:moi_meet_flutter_sdk/moi_meet_flutter_sdk.dart';
// import 'package:moi_meet_flutter_sdk/moi_meet_flutter_sdk.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final TextEditingController meetingIdController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();

  bool audioMuted = true;
  bool videoMuted = true;
  bool screenShareOn = false;
  List<String> participants = [];
  final _moiMeetPlugin = MoiMeet();

  join({
    required String roomId,
    required String displayName,
  }) async {
    var options = MoiMeetConferenceOptions(
      serverURL: "https://meet.aioman.org",
      room: roomId,
      configOverrides: {
        "startWithAudioMuted": true,
        "startWithVideoMuted": true,
      },
      featureFlags: {
        FeatureFlags.addPeopleEnabled: true,
        FeatureFlags.welcomePageEnabled: false,
        FeatureFlags.preJoinPageEnabled: false,
        FeatureFlags.unsafeRoomWarningEnabled: true,
        FeatureFlags.resolution: FeatureFlagVideoResolutions.resolution720p,
        FeatureFlags.audioFocusDisabled: true,
        FeatureFlags.audioMuteButtonEnabled: true,
        FeatureFlags.audioOnlyButtonEnabled: true,
        FeatureFlags.calenderEnabled: true,
        FeatureFlags.callIntegrationEnabled: true,
        FeatureFlags.carModeEnabled: true,
        FeatureFlags.closeCaptionsEnabled: true,
        FeatureFlags.conferenceTimerEnabled: true,
        FeatureFlags.chatEnabled: true,
        FeatureFlags.filmstripEnabled: true,
        FeatureFlags.fullScreenEnabled: true,
        FeatureFlags.helpButtonEnabled: true,
        FeatureFlags.inviteEnabled: true,
        FeatureFlags.androidScreenSharingEnabled: true,
        FeatureFlags.speakerStatsEnabled: true,
        FeatureFlags.kickOutEnabled: true,
        FeatureFlags.liveStreamingEnabled: true,
        FeatureFlags.lobbyModeEnabled: true,
        FeatureFlags.meetingNameEnabled: true,
        FeatureFlags.meetingPasswordEnabled: true,
        FeatureFlags.notificationEnabled: true,
        FeatureFlags.overflowMenuEnabled: true,
        FeatureFlags.pipEnabled: true,
        FeatureFlags.pipWhileScreenSharingEnabled: true,
        FeatureFlags.preJoinPageHideDisplayName: true,
        FeatureFlags.raiseHandEnabled: true,
        FeatureFlags.reactionsEnabled: true,
        FeatureFlags.recordingEnabled: true,
        FeatureFlags.replaceParticipant: true,
        FeatureFlags.securityOptionEnabled: true,
        FeatureFlags.serverUrlChangeEnabled: true,
        FeatureFlags.settingsEnabled: true,
        FeatureFlags.tileViewEnabled: true,
        FeatureFlags.videoMuteEnabled: true,
        FeatureFlags.videoShareEnabled: true,
        FeatureFlags.toolboxEnabled: true,
        FeatureFlags.iosRecordingEnabled: true,
        FeatureFlags.iosScreenSharingEnabled: true,
        FeatureFlags.toolboxAlwaysVisible: true,
      },
      userInfo: MoiMeetUserInfo(
          displayName: displayName,
          email: "gabi.borlea.1@gmail.com",
          avatar:
              "https://cdn3d.iconscout.com/3d/premium/thumb/middle-eastern-arab-man-avatar-3d-icon-download-in-png-blend-fbx-gltf-file-formats--profile-view-people-person-different-pack-icons-8779384.png?f=webp"),
    );

    var listener = MoiMeetEventListener(
      conferenceJoined: (url) {
        debugPrint("conferenceJoined: url: $url");
      },
      conferenceTerminated: (url, error) {
        debugPrint("conferenceTerminated: url: $url, error: $error");
      },
      conferenceWillJoin: (url) {
        debugPrint("conferenceWillJoin: url: $url");
      },
      participantJoined: (email, name, role, participantId) {
        debugPrint(
          "participantJoined: email: $email, name: $name, role: $role, "
          "participantId: $participantId",
        );
        participants.add(participantId!);
      },
      participantLeft: (participantId) {
        debugPrint("participantLeft: participantId: $participantId");
      },
      audioMutedChanged: (muted) {
        debugPrint("audioMutedChanged: isMuted: $muted");
      },
      videoMutedChanged: (muted) {
        debugPrint("videoMutedChanged: isMuted: $muted");
      },
      endpointTextMessageReceived: (senderId, message) {
        debugPrint(
            "endpointTextMessageReceived: senderId: $senderId, message: $message");
      },
      screenShareToggled: (participantId, sharing) {
        debugPrint(
          "screenShareToggled: participantId: $participantId, "
          "isSharing: $sharing",
        );
      },
      chatMessageReceived: (senderId, message, isPrivate, timestamp) {
        debugPrint(
          "chatMessageReceived: senderId: $senderId, message: $message, "
          "isPrivate: $isPrivate, timestamp: $timestamp",
        );
      },
      chatToggled: (isOpen) => debugPrint("chatToggled: isOpen: $isOpen"),
      participantsInfoRetrieved: (participantsInfo) {
        debugPrint(
            "participantsInfoRetrieved: participantsInfo: $participantsInfo, ");
      },
      readyToClose: () {
        debugPrint("readyToClose");
      },
    );
    await _moiMeetPlugin.join(options, listener);
  }

  hangUp() async {
    await _moiMeetPlugin.hangUp();
  }

  setAudioMuted(bool? muted) async {
    var a = await _moiMeetPlugin.setAudioMuted(muted!);
    debugPrint("$a");
    setState(() {
      audioMuted = muted;
    });
  }

  setVideoMuted(bool? muted) async {
    var a = await _moiMeetPlugin.setVideoMuted(muted!);
    debugPrint("$a");
    setState(() {
      videoMuted = muted;
    });
  }

  sendEndpointTextMessage() async {
    var a = await _moiMeetPlugin.sendEndpointTextMessage(message: "HEY");
    debugPrint("$a");

    for (var p in participants) {
      var b =
          await _moiMeetPlugin.sendEndpointTextMessage(to: p, message: "HEY");
      debugPrint("$b");
    }
  }

  toggleScreenShare(bool? enabled) async {
    await _moiMeetPlugin.toggleScreenShare(enabled!);

    setState(() {
      screenShareOn = enabled;
    });
  }

  openChat() async {
    await _moiMeetPlugin.openChat();
  }

  sendChatMessage() async {
    var a = await _moiMeetPlugin.sendChatMessage(message: "HEY1");
    debugPrint("$a");

    for (var p in participants) {
      a = await _moiMeetPlugin.sendChatMessage(to: p, message: "HEY2");
      debugPrint("$a");
    }
  }

  closeChat() async {
    await _moiMeetPlugin.closeChat();
  }

  retrieveParticipantsInfo() async {
    var a = await _moiMeetPlugin.retrieveParticipantsInfo();
    debugPrint("$a");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Moi Meet'),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Network Image at the Top
                Container(
                  margin: const EdgeInsets.only(bottom: 32.0),
                  child: Image.network(
                    'https://meet.aioman.org/images/moi/moi-meet-logo.png',
                    height: 150,
                    width: 150,
                    fit: BoxFit.cover,
                  ),
                ),

                // Meeting ID TextField
                TextField(
                  controller: meetingIdController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Meeting ID',
                    hintText: 'Enter Meeting ID',
                  ),
                ),

                const SizedBox(height: 16.0),

                // User Name TextField
                TextField(
                  controller: userNameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Your Name',
                    hintText: 'Enter Your Name',
                  ),
                ),

                const Spacer(),

                // Join Now Button at the Bottom
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff637ada),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    onPressed: () {
                      // Handle join button press here
                      String meetingId = meetingIdController.text;
                      String userName = userNameController.text;
                      // Add logic to join the meeting using meetingId and userName
                      print(
                          'Joining meeting with ID: $meetingId and Username: $userName');
                      join(displayName: userName, roomId: meetingId);
                    },
                    child: const Text(
                      'Join Now',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
//           appBar: AppBar(
//             title: const Text('Plugin example app'),
//           ),
//           body: Center(
//             child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: <Widget>[
//                   TextButton(
//                     onPressed: join,
//                     child: const Text("Join"),
//                   ),
//                   TextButton(onPressed: hangUp, child: const Text("Hang Up")),
//                   Row(children: [
//                     const Text("Set Audio Muted"),
//                     Checkbox(
//                       value: audioMuted,
//                       onChanged: setAudioMuted,
//                     ),
//                   ]),
//                   Row(children: [
//                     const Text("Set Video Muted"),
//                     Checkbox(
//                       value: videoMuted,
//                       onChanged: setVideoMuted,
//                     ),
//                   ]),
//                   TextButton(
//                       onPressed: sendEndpointTextMessage,
//                       child: const Text("Send Hey Endpoint Message To All")),
//                   Row(children: [
//                     const Text("Toggle Screen Share"),
//                     Checkbox(
//                       value: screenShareOn,
//                       onChanged: toggleScreenShare,
//                     ),
//                   ]),
//                   TextButton(
//                       onPressed: openChat, child: const Text("Open Chat")),
//                   TextButton(
//                       onPressed: sendChatMessage,
//                       child: const Text("Send Chat Message to All")),
//                   TextButton(
//                       onPressed: closeChat, child: const Text("Close Chat")),
//                   TextButton(
//                       onPressed: retrieveParticipantsInfo,
//                       child: const Text("Retrieve Participants Info")),
//                 ]),
//           )),
//     );
//   }
// }
