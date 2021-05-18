import 'package:avatar_view/avatar_view.dart';
import 'package:camera_deep_ar/camera_deep_ar.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

class CameraWithMask extends StatefulWidget {
  @override
  _CameraWithMaskState createState() => _CameraWithMaskState();
}

class _CameraWithMaskState extends State<CameraWithMask> {
  CameraDeepArController cameraDeepArController;
  int currentPage = 0;
  final vp = PageController(viewportFraction: .24);

  Effects currentEffects = Effects.none;
  Filters currentFilters = Filters.none;
  Masks currentMask = Masks.none;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            CameraDeepAr(cameraDeepArCallback: (e) async {
              cameraDeepArController = e;
              setState(() {});
            },
                // androidLicenceKey: ,
                // iosLicenceKey:     ,
                // onImageCaptured:   ,
                // onVideoRecorded:   ,
                onCameraReady: (isReady) {
              String platFormVersion = "Camera Status $isReady";

              print(platFormVersion);
              setState(() {});
            }),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(8, (page) {
                          bool active = currentPage == page;

                          return Platform.isIOS
                              ? GestureDetector(
                                  // IOS
                                  onTap: () {
                                    currentPage = page;
                                    cameraDeepArController.changeMask(page);
                                    setState(() {});
                                  },
                                  child: AvatarView(
                                    radius: active ? 65 : 30,
                                    borderColor: Colors.yellow,
                                    borderWidth: 2,
                                    isOnlyText: false,
                                    avatarType: AvatarType.CIRCLE,
                                    backgroundColor: Colors.red,
                                    imagePath:
                                        "assets/ios/${page.toString()}.jpg",
                                    placeHolder: Icon(
                                      Icons.person,
                                      size: 50,
                                    ),
                                    errorWidget: Container(
                                      child: Icon(
                                        Icons.person,
                                        size: 50,
                                      ),
                                    ),
                                  ),
                                )
                              : GestureDetector(
                                  // Android

                                  onTap: () {
                                    currentPage = page;
                                    cameraDeepArController.changeMask(page);
                                    setState(() {});
                                  },
                                  child: AvatarView(
                                    radius: active ? 45 : 25,
                                    borderColor: Colors.yellow,
                                    borderWidth: 2,
                                    isOnlyText: false,
                                    avatarType: AvatarType.CIRCLE,
                                    backgroundColor: Colors.red,
                                    imagePath:
                                        "assets/android/${page.toString()}.jpg",
                                    placeHolder: Icon(
                                      Icons.person,
                                      size: 50,
                                    ),
                                    errorWidget: Container(
                                      child: Icon(
                                        Icons.person,
                                        size: 50,
                                      ),
                                    ),
                                  ),
                                );
                        }),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
