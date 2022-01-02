import 'package:flutter/material.dart';
import 'package:flutter_netflix_responsive_ui/assets.dart';

import 'widgets.dart';

class CustomAppBar extends StatelessWidget {
  final double scrollOffset;

  const CustomAppBar({Key? key, this.scrollOffset = 0.0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 24),
      decoration: BoxDecoration(
        color: Colors.black
            .withOpacity((scrollOffset / 350).clamp(0, 1).toDouble()),
      ),
      child: Responsive(
        mobile: _CustomAppBarMobile(),
        desktop: _CustomAppBarDesktop(),
        tablet: _CustomAppBarDesktop(),
      ),
    );
  }
}

class _AbbBarButton extends StatelessWidget {
  final String title;
  final Function onTap;

  const _AbbBarButton({Key? key, required this.title, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap(),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _CustomAppBarMobile extends StatelessWidget {
  const _CustomAppBarMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          Image.asset(Assets.netflixLogo0),
          const SizedBox(
            width: 12,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _AbbBarButton(
                  title: 'TV shows',
                  onTap: () => print('TV shows'),
                ),
                _AbbBarButton(
                  title: 'Movies',
                  onTap: () => print('Movies'),
                ),
                _AbbBarButton(
                  title: 'My List',
                  onTap: () => print('My List'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _CustomAppBarDesktop extends StatelessWidget {
  const _CustomAppBarDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          Image.asset(Assets.netflixLogo0),
          const SizedBox(
            width: 12,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _AbbBarButton(
                  title: 'Home',
                  onTap: () => print('Home'),
                ),
                _AbbBarButton(
                  title: 'TV shows',
                  onTap: () => print('TV shows'),
                ),
                _AbbBarButton(
                  title: 'Movies',
                  onTap: () => print('Movies'),
                ),
                _AbbBarButton(
                  title: 'My List',
                  onTap: () => print('My List'),
                ),
              ],
            ),
          ),
          Spacer(),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: ()=> print('Search'),
                  icon: Icon(Icons.search),
                  iconSize: 28,
                  color: Colors.white,
                ),
                _AbbBarButton(
                  title: 'KIDS',
                  onTap: () => print('KIDS'),
                ),
                _AbbBarButton(
                  title: 'DVD',
                  onTap: () => print('DVD'),
                ),
                IconButton(
                  onPressed: ()=> print('Gift'),
                  icon: Icon(Icons.card_giftcard),
                  iconSize: 28,
                  color: Colors.white,
                ),
                IconButton(
                  onPressed: ()=> print('Notifications'),
                  icon: Icon(Icons.notifications),
                  iconSize: 28,
                  color: Colors.white,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
