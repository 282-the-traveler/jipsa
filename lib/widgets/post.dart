import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:jipsa/constants/common_size.dart';
import 'package:jipsa/widgets/avatar.dart';
import 'package:jipsa/widgets/comment.dart';
import 'package:jipsa/widgets/my_progress_indicator.dart';

class Post extends StatelessWidget {
  final int index;
  Size size;

  Post(
    this.index,
    this.size, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _postHeader(),
        _postImage(),
        _postActions(),
        _postLikes(),
        _postCaption(),
      ],
    );
  }

  Widget _postCaption() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: common_xxs_gap,
        horizontal: common_gap,
      ),
      child: Comment(
        showImage: false, username: 'tesetingUser', text: 'I have money', dateTime: DateTime.now(),
      ),
    );
  }

  Padding _postLikes() {
    return Padding(
      padding: const EdgeInsets.only(left: common_gap),
      child: Text(
        '12000 likes',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Row _postActions() {
    return Row(
      children: [
        IconButton(
          onPressed: () {},
          icon: ImageIcon(
            AssetImage(
              'assets/images/bookmark.png',
            ),
            color: Colors.black87,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: ImageIcon(
            AssetImage(
              'assets/images/comment.png',
            ),
            color: Colors.black87,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: ImageIcon(
            AssetImage(
              'assets/images/direct_message.png',
            ),
            color: Colors.black87,
          ),
        ),
        Spacer(),
        IconButton(
          onPressed: () {},
          icon: ImageIcon(
            AssetImage(
              'assets/images/heart_selected.png',
            ),
            color: Colors.black87,
          ),
        ),
      ],
    );
  }

  Widget _postHeader() {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(common_xxs_gap),
          child: Avatar(),
        ),
        Expanded(
          child: Text('username'),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.more_horiz,
            color: Colors.black87,
          ),
        )
      ],
    );
  }

  CachedNetworkImage _postImage() {
    return CachedNetworkImage(
      placeholder: (BuildContext context, String url) {
        return MyProgressIndicator(
            containerSize: MediaQuery.of(context).size.width, progressSize: 60);
      },
      imageUrl:
          'https://images.unsplash.com/photo-1532264523420-881a47db012d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9',
      imageBuilder: (BuildContext context, ImageProvider imageProvider) {
        return AspectRatio(
          aspectRatio: 1,
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
            )),
          ),
        );
      },
    );
  }
}
