import 'package:flutter/material.dart';
import 'package:flutter_netflix_responsive_ui/models/models.dart';
import 'package:flutter_netflix_responsive_ui/widgets/widgets.dart';
import 'package:video_player/video_player.dart';

class ContentHeader extends StatelessWidget {
  final Content featuredContent;

  const ContentHeader({Key? key, required this.featuredContent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: _CustomHeaderMobile(featuredContent: featuredContent),
      desktop: _CustomHeaderDesktop(featuredContent: featuredContent),
      tablet: _CustomHeaderDesktop(featuredContent: featuredContent),
    );
  }
}

class _CustomHeaderMobile extends StatelessWidget {
  final Content featuredContent;

  const _CustomHeaderMobile({Key? key, required this.featuredContent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 500,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(featuredContent.imageUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          height: 500,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.black, Colors.transparent],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
        ),
        Positioned(
          bottom: 110,
          child: SizedBox(
            width: 250,
            child: Image.asset(featuredContent.titleImageUrl.toString()),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              VerticalIconButton(
                  icon: Icons.add, title: 'List', onTap: () => print('List')),
              _PlayButton(),
              VerticalIconButton(
                  icon: Icons.info_outline,
                  title: 'Info',
                  onTap: () => print('Info')),
            ],
          ),
        ),
      ],
    );
  }
}

class _CustomHeaderDesktop extends StatefulWidget {
  final Content featuredContent;

  const _CustomHeaderDesktop({Key? key, required this.featuredContent})
      : super(key: key);

  @override
  State<_CustomHeaderDesktop> createState() => _CustomHeaderDesktopState();
}

class _CustomHeaderDesktopState extends State<_CustomHeaderDesktop> {
  late VideoPlayerController _videoPlayerController;
  bool _isMuted = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _videoPlayerController = VideoPlayerController.network(
        widget.featuredContent.videoUrl.toString())
      ..initialize().then((_) => setState(() {}))
      ..setVolume(0)
      ..play();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _videoPlayerController.value.isPlaying
          ? _videoPlayerController.pause()
          : _videoPlayerController.play(),
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          AspectRatio(
            aspectRatio: _videoPlayerController.value.isInitialized
                ? _videoPlayerController.value.aspectRatio
                : 2.344,
            child: _videoPlayerController.value.isInitialized
                ? VideoPlayer(_videoPlayerController)
                : Image.asset(
                    widget.featuredContent.imageUrl,
                    fit: BoxFit.cover,
                  ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: -1,
            child: AspectRatio(
              aspectRatio: _videoPlayerController.value.isInitialized
                  ? _videoPlayerController.value.aspectRatio
                  : 2.344,
              child:Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.black, Colors.transparent],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 60,
            right: 60,
            bottom: 150,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 250,
                  child: Image.asset(
                      widget.featuredContent.titleImageUrl.toString()),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  widget.featuredContent.description.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    shadows: [
                      Shadow(
                        color: Colors.black,
                        offset: Offset(2, 4),
                        blurRadius: 6,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    _PlayButton(),
                    const SizedBox(
                      width: 16,
                    ),
                    MaterialButton(
                      padding: EdgeInsets.fromLTRB(25, 10, 30, 10),
                      onPressed: () => print('More Info'),
                      color: Colors.white,
                      child: Row(
                        children: [
                          Icon(Icons.info_outline),
                          Text(
                            'More Info',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    _videoPlayerController.value.isInitialized
                        ? IconButton(
                            icon: Icon(
                              _isMuted ? Icons.volume_off : Icons.volume_up,
                            ),
                            onPressed: () => setState(() {
                              _isMuted
                                  ? _videoPlayerController.setVolume(100)
                                  : _videoPlayerController.setVolume(0);
                              _isMuted =
                                  _videoPlayerController.value.volume == 0;
                            }),
                          )
                        : SizedBox.shrink(),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _PlayButton extends StatelessWidget {
  const _PlayButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: !Responsive.isDesktop(context) ?
      const EdgeInsets.fromLTRB(15, 5, 20, 5):
      const EdgeInsets.fromLTRB(25, 10, 30, 10),
      onPressed: () => print('Play'),
      color: Colors.white,
      child: Row(
        children: [
          Icon(
            Icons.play_arrow,
            size: 30,
          ),
          const SizedBox(
            width: 6,
          ),
          Text(
            'Play',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
