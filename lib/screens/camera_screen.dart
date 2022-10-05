import 'package:flutter/material.dart';
import 'package:jipsa/widgets/take_photo.dart';
import 'package:jipsa/widgets/take_video.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({Key? key}) : super(key: key);

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  int _currentIndex = 1;
  String title = 'Photo';
  PageController _pageController = PageController(
    initialPage: 1,
    keepPage: true,
  );

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
        ),
      ),
      body: PageView(
        controller: _pageController,
        children: [
          Container(
            color: Colors.amberAccent,
          ),
          TakePhoto(),
          TakeVideo()
        ],
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
            switch (index) {
              case 0:
                title = 'GALLERY';
                break;
              case 1:
                title = 'PHOTO';
                break;
              case 2:
                title = 'VIDEO';
                break;
            }
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedIconTheme: IconThemeData(opacity: 0.0, size: 0),
        unselectedIconTheme: IconThemeData(opacity: 0.0, size: 0),
        selectedItemColor: Colors.black87,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: TextStyle(
          fontWeight: FontWeight.bold,
        ),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.browse_gallery),
            label: 'GALLERY',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.photo),
            label: 'PHOTO',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_camera_back_rounded),
            label: 'VIDEO',
          )
        ],
        currentIndex: _currentIndex,
        onTap: _onItemTabbed,
      ),
    );
  }

  void _onItemTabbed(index) {
    setState(() {
      _currentIndex = index;
      _pageController.animateToPage(
        _currentIndex,
        duration: Duration(
          milliseconds: 300,
        ),
        curve: Curves.fastOutSlowIn,
      );
    });
  }
}


