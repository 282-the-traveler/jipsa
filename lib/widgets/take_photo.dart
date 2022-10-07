import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          color: Colors.black,
          width: width,
          height: width,
        ),
        Expanded(
          child: FloatingActionButton(
            onPressed: () {},
          ),
        )
      ],
    );
  }
}
