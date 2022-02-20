import 'package:audioplayers/audioplayers.dart';
import 'package:e_book/utils/constants.dart';
import 'package:flutter/material.dart';

class AudioFile extends StatefulWidget {
  const AudioFile({
    Key? key,
    required this.audioPlayer,
    required this.audioPath,
  }) : super(key: key);
  final AudioPlayer audioPlayer;
  final String audioPath;

  @override
  State<AudioFile> createState() => _AudioFileState();
}

class _AudioFileState extends State<AudioFile> {
  Duration _duration = const Duration();
  Duration _position = const Duration();

  bool isPlaying = false;
  bool isPaused = false;
  bool isLoop = false;

  @override
  void initState() {
    super.initState();
    widget.audioPlayer.onDurationChanged.listen((event) {
      setState(() {
        _duration = event;
      });
    });

    widget.audioPlayer.onAudioPositionChanged.listen((event) {
      setState(() {
        _position = event;
      });
    });

    widget.audioPlayer.setUrl(widget.audioPath);

    widget.audioPlayer.onPlayerCompletion.listen((event) {
      setState(() {
        _position = const Duration(seconds: 0);
        if (isLoop) {
          isPlaying = true;
        } else {
          isPlaying = false;
          isLoop = false;
        }
      });
    });
  }

  Widget btnStart() {
    return IconButton(
      onPressed: () {
        if (!isPlaying) {
          widget.audioPlayer.play(widget.audioPath);
          setState(() {
            isPlaying = true;
          });
        } else {
          widget.audioPlayer.pause();
          setState(() {
            isPlaying = false;
          });
        }
      },
      icon: isPlaying
          ? const Icon(
              Icons.pause_circle_filled,
              size: 48,
              color: audioBlueBackgroundColor,
            )
          : const Icon(
              Icons.play_circle_fill,
              size: 48,
              color: audioBlueBackgroundColor,
            ),
      padding: const EdgeInsets.only(bottom: 10),
    );
  }

  Widget btnFastForward() {
    return IconButton(
      onPressed: () {
        widget.audioPlayer.setPlaybackRate(1.5);
      },
      icon: const Icon(
        Icons.fast_forward,
        color: Colors.black,
        size: 30,
      ),
    );
  }

  Widget btnSlowForward() {
    return IconButton(
      onPressed: () {
        widget.audioPlayer.setPlaybackRate(0.5);
      },
      icon: const Icon(
        Icons.fast_rewind,
        color: Colors.black,
        size: 30,
      ),
    );
  }

  Widget btnRandom() {
    return IconButton(
      onPressed: () {},
      icon: ImageIcon(
        const AssetImage('assets/images/random.png'),
        size: 15,
        color: isLoop ? Colors.pink : Colors.black,
      ),
    );
  }

  Widget btnLoop() {
    return IconButton(
      onPressed: () {
        if (!isLoop) {
          widget.audioPlayer.setReleaseMode(ReleaseMode.LOOP);
          setState(() {
            isLoop = true;
          });
        } else {
          widget.audioPlayer.setReleaseMode(ReleaseMode.RELEASE);
          setState(() {
            isLoop = false;
          });
        }
      },
      icon: const ImageIcon(
        AssetImage('assets/images/loop.png'),
        size: 15,
      ),
    );
  }

  Widget loadAssets() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        btnLoop(),
        btnSlowForward(),
        btnStart(),
        btnFastForward(),
        btnRandom(),
      ],
    );
  }

  Widget slider() {
    return Slider(
      activeColor: Colors.pink,
      inactiveColor: Colors.grey,
      min: 0.0,
      max: _duration.inSeconds.toDouble(),
      value: _position.inSeconds.toDouble(),
      onChanged: (value) => setState(() {
        changeToSecond(value.toInt());
        value = value;
      }),
    );
  }

  void changeToSecond(int seconds) {
    Duration newDuration = Duration(seconds: seconds);
    widget.audioPlayer.seek(newDuration);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                _position.toString().split('.').first,
                style: const TextStyle(fontSize: 16),
              ),
              Text(
                _duration.toString().split('.').first,
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
        slider(),
        loadAssets(),
      ],
    );
  }
}
