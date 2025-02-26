import 'package:flutter/material.dart';
import 'dart:async'; // Import for Timer

class ConversationsPage extends StatefulWidget {
  const ConversationsPage({super.key});

  @override
  State<ConversationsPage> createState() => _ConversationsPageState();
}

class _ConversationsPageState extends State<ConversationsPage> {
  bool isTalking = false; // Tracks recording state
  int recordingDuration = 0; // Tracks recording duration in seconds
  late Timer _timer; // Timer for updating recording duration

  void _startRecording() {
    setState(() {
      isTalking = true;
      recordingDuration = 0;
    });

    // Start a timer to update the recording duration
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        recordingDuration++;
      });
    });
  }

  void _stopRecording() {
    _timer.cancel(); // Stop the timer
    setState(() {
      isTalking = false;
    });

    // Save or process the recording here
    print('Recording stopped. Duration: $recordingDuration seconds');
  }

  @override
  void dispose() {
    _timer.cancel(); // Cancel the timer when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    double widthUnit = MediaQuery.of(context).size.width * 0.25;
    double combinedWidth = widthUnit * 3.5;
    double iconSize1 = 80.0;
    double iconSize2 = 48.0;
    return Container(
      color: isTalking ? Colors.black : Colors.white,
      child: SingleChildScrollView(
        child: Container(      
          width: combinedWidth,          
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(0.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [              
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0, top: 64.0),
                        child: Text(
                          'Conversation on The Indian National Security Doctrine',
                          style: TextStyle(
                            fontSize: 24, 
                            fontWeight: FontWeight.bold,
                            color: isTalking ? Colors.white : Colors.black
                          ),
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis
                        ),
                      ),
                      const SizedBox(height: 32.0),
                      GestureDetector(
                        onTap: isTalking ? _stopRecording : _startRecording,
                        child: Stack(
                          children: [
                            Container(
                              width: 192,
                              height: 192,
                              color:isTalking ? Colors.white : Colors.black,
                              child: Padding(
                                padding: const EdgeInsets.only(left:16.0, top: 16.0),
                                child: Text(
                                  isTalking? "Tap / Speak to Interrupt" : "Tap to Invoke",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: isTalking? Colors.black : Colors.white, 
                                    ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 192-16-iconSize1,
                              right: 0+16,                        
                              child: Icon(                          
                                isTalking? Icons.pause_outlined: Icons.play_arrow_outlined,                          
                                color: isTalking ? Colors.black : Colors.white,
                                size: iconSize1,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Center(
                    child: Text(
                      isTalking? "...Talking" : "Listening...",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: isTalking ? Colors.white : Colors.black
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: isTalking ? _stopRecording : _startRecording,
        
                    child: Container(
                      height: 80,
                      width: double.infinity,
                      color: isTalking ? Colors.white : Colors.black,
                      child: Icon(
                          isTalking ? Icons.mic_none_outlined : Icons.mic_off_outlined,
                          color: isTalking ? Colors.black : Colors.white,
                          size: iconSize2,
                        ),
                      ),
                  ),
                  const SizedBox(height: 16.0),
                  Container(
                    height: 32.0,
                    color: isTalking ? Colors.white : Colors.black,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        "Conversation Transcripts",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: isTalking ? Colors.black : Colors.white
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
