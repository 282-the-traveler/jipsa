import 'package:flutter/material.dart';
import 'package:jipsa/constants/common_size.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:jipsa/widgets/avatar.dart';

class ProfileBody extends StatefulWidget {
  final Function onMenuChanged;

  const ProfileBody({Key? key, required this.onMenuChanged}) : super(key: key);

  @override
  State<ProfileBody> createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody>
    with SingleTickerProviderStateMixin {
  SelectedTab _selectedTab = SelectedTab.left;
  double _leftImagePagerMargin = 0;
  double _rightImagePagerMargin = 0;
  late AnimationController _animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _animationController.dispose();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 300,
      ),
    );
    _rightImagePagerMargin = MediaQuery.of(context).size.width;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _appbar(),
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(
                              common_gap,
                            ),
                            child: Avatar(
                              size: 80,
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: common_gap,
                              ),
                              child: Table(
                                children: [
                                  TableRow(
                                    children: [
                                      _valueText('123123'),
                                      _valueText('12123'),
                                      _valueText('1123'),
                                    ],
                                  ),
                                  TableRow(
                                    children: [
                                      _labelText('Posts'),
                                      _labelText('Followers'),
                                      _labelText('Following'),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      _username(),
                      _userbio(),
                      _editProfileBtn(),
                      _tabBtn(),
                    ],
                  ),
                ),
                _imagesPager()
              ],
            ),
          ),
        ],
      ),
    );
  }

  Row _appbar() {
    return Row(
      children: [
        const Expanded(
          child: Text(
            '282.the.traveler',
            textAlign: TextAlign.center,
          ),
        ),
        IconButton(
          onPressed: () {
            widget.onMenuChanged();
            _animationController.status == AnimationStatus.completed
                ? _animationController.reverse()
                : _animationController.forward();
          },
          icon: AnimatedIcon(
            icon: AnimatedIcons.menu_close,
            progress: _animationController,
          ),
        ),
      ],
    );
  }

  Text _valueText(String value) {
    return Text(
      value,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Text _labelText(String label) {
    return Text(
      label,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontWeight: FontWeight.w300,
        fontSize: 11,
      ),
    );
  }

  SliverToBoxAdapter _imagesPager() {
    return SliverToBoxAdapter(
      child: Stack(
        children: [
          AnimatedContainer(
            duration: Duration(
              milliseconds: 300,
            ),
            transform: (Matrix4.translationValues(
              _leftImagePagerMargin,
              0,
              0,
            )),
            curve: Curves.fastOutSlowIn,
            child: _images(),
          ),
          AnimatedContainer(
            duration: Duration(
              milliseconds: 300,
            ),
            transform: (Matrix4.translationValues(
              _rightImagePagerMargin,
              0,
              0,
            )),
            curve: Curves.fastOutSlowIn,
            child: _images(),
          ),
        ],
      ),
    );
  }

  _tabSelected(SelectedTab selectedTab) {
    setState(() {
      switch (selectedTab) {
        case SelectedTab.left:
          _selectedTab = SelectedTab.left;
          _leftImagePagerMargin = 0;
          _rightImagePagerMargin = MediaQuery.of(context).size.width;
          break;
        case SelectedTab.right:
          _selectedTab = SelectedTab.right;
          _leftImagePagerMargin = -MediaQuery.of(context).size.width;
          _rightImagePagerMargin = 0;
          break;
      }
    });
  }

  GridView _images() {
    return GridView.count(
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 3,
      shrinkWrap: true,
      childAspectRatio: 1,
      children: List.generate(
        30,
        (index) => CachedNetworkImage(
          fit: BoxFit.cover,
          imageUrl: 'https://picsum.photo/id/$index/100/100',
        ),
      ),
    );
  }

  Row _tabBtn() {
    return Row(
      children: [
        Expanded(
          child: IconButton(
            icon: ImageIcon(
              const AssetImage(
                'assets/images/grid.png',
              ),
              color: _selectedTab == SelectedTab.left
                  ? Colors.black87
                  : Colors.black26,
            ),
            onPressed: () {
              _tabSelected(SelectedTab.left);
            },
          ),
        ),
        Expanded(
          child: IconButton(
            icon: ImageIcon(
              const AssetImage(
                'assets/images/saved.png',
              ),
              color: _selectedTab == SelectedTab.right
                  ? Colors.black87
                  : Colors.black26,
            ),
            onPressed: () {
              _tabSelected(SelectedTab.right);
            },
          ),
        ),
      ],
    );
  }

  Padding _editProfileBtn() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: common_gap,
      ),
      child: SizedBox(
        height: 24,
        child: OutlinedButton(
          onPressed: () {},
          child: const Text(
            'Edit profile',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ),
      ),
    );
  }

  Widget _username() {
    return const Padding(
      padding: EdgeInsets.symmetric(
        horizontal: common_gap,
      ),
      child: Text(
        'username',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _userbio() {
    return const Padding(
      padding: EdgeInsets.symmetric(
        horizontal: common_gap,
        vertical: common_xxs_gap,
      ),
      child: Text(
        'bio',
        style: TextStyle(
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}

enum SelectedTab { left, right }
