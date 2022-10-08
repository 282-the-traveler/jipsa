import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:jipsa/widgets/my_progress_indicator.dart';

class TakePhoto extends StatefulWidget {
  const TakePhoto({
    Key? key,
  }) : super(key: key);

  @override
  State<TakePhoto> createState() => _TakePhotoState();
}

class _TakePhotoState extends State<TakePhoto> {
  late CameraController _cameraController;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    Widget _progress = MyProgressIndicator(
      containerSize: width,
      progressSize: 100,
    );

    return FutureBuilder<List<CameraDescription>>(
        future: availableCameras(),
        builder: (context, snapshot) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                color: Colors.black,
                width: width,
                height: width,
                child: snapshot.hasData
                    ? _getPreview(
                        snapshot.data!,
                      )
                    : _progress,
              ),
              Expanded(
                child: FloatingActionButton(
                  onPressed: () {},
                ),
              )
            ],
          );
        });
  }

  Widget _getPreview(List<CameraDescription> cameras) {
    _cameraController = CameraController(cameras[0], ResolutionPreset.medium);

    return FutureBuilder(
        future: _cameraController.initialize(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return CameraPreview(
              _cameraController,
            );
          } else {
            return CircularProgressIndicator();
          }
        });
  }
}
