import 'package:audioplayers/audioplayers.dart';
import 'package:e_book/utils/constants.dart';
import 'package:e_book/widgets/audio_file.dart';
import 'package:flutter/material.dart';

class DetailAudioPage extends StatefulWidget {
  const DetailAudioPage({
    Key? key,
    required this.books,
    required this.index,
  }) : super(key: key);
  final List books;
  final int index;
  @override
  State<DetailAudioPage> createState() => _DetailAudioPageState();
}

class _DetailAudioPageState extends State<DetailAudioPage> {
  late AudioPlayer _advancedAudioPlayer;

  @override
  void initState() {
    super.initState();
    _advancedAudioPlayer = AudioPlayer();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: audioBluishBackgroundColor,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: height / 3,
            child: Container(
              color: audioBlueBackgroundColor,
            ),
          ),
          Positioned(
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
                onPressed: () {
                  _advancedAudioPlayer.stop();
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  size: 24,
                  color: Colors.white,
                ),
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.search,
                    size: 24,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: height / 5, // 1/5 == 0.2
            height: height * 0.36,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: height * 0.12,
                  ),
                  Text(
                    widget.books[widget.index]['title'],
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    widget.books[widget.index]['text'],
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  AudioFile(
                    audioPlayer: _advancedAudioPlayer,
                    audioPath: widget.books[widget.index]['audio'],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: height * 0.12,
            left: (width - 130) / 2,
            right: (width - 130) / 2,
            height: 130,
            child: Container(
              decoration: BoxDecoration(
                color: audioGreyBackgroundColor,
                borderRadius: const BorderRadius.all(
                  Radius.circular(15),
                ),
                border: Border.all(color: Colors.white, width: 2),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  backgroundImage: AssetImage(
                    widget.books[widget.index]['img'],
                  ),
                  radius: 30,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
