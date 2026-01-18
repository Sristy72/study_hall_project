import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';

import 'booking.dart';

class BookingVideoHeader extends StatefulWidget {
  final BookingStatus status;

  const BookingVideoHeader({
    super.key,
    required this.status,
  });

  @override
  State<BookingVideoHeader> createState() => _BookingVideoHeaderState();
}

class _BookingVideoHeaderState extends State<BookingVideoHeader> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(
      'assets/videos/session_preview.mp4', // your video
    )
      ..initialize().then((_) {
        setState(() {});
        _controller.setLooping(true);
        _controller.play();
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final statusStyle = getStatusConfig(widget.status);

    return SizedBox(
      height: 200,
      width: double.infinity,
      child: Stack(
        children: [
          /// VIDEO
          _controller.value.isInitialized
              ? SizedBox.expand(
            child: FittedBox(
              fit: BoxFit.cover,
              child: SizedBox(
                width: _controller.value.size.width,
                height: _controller.value.size.height,
                child: VideoPlayer(_controller),
              ),
            ),
          )
              : const Center(child: CircularProgressIndicator()),
        ],
      ),
    );
  }
}
