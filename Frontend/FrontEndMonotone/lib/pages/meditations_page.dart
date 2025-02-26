import 'package:flutter/material.dart';
import 'dart:math';


class MeditationsPage extends StatefulWidget {
  const MeditationsPage({super.key});

  @override
  State<MeditationsPage> createState() => _MeditationsPageState();
}

class _MeditationsPageState extends State<MeditationsPage> {
  String? _selectedMeditation;
  int _breathCycles = 9;
  void _incrementBreathCycles() {
    setState(() {
      _breathCycles++;
    });
  }

  void _decrementBreathCycles() {
    setState(() {
      if (_breathCycles > 1) {
        _breathCycles--;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    var IncDecIconSize = 20.0;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 280,
                  height: 48,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 2.0
                    ),                                     
                  ),
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 8.0, bottom: 8.0),
                child: DropdownButton<String>(
                  value: _selectedMeditation,
                  hint: Text(
                    "Select Meditation Type ",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black
                      ),
                    ),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedMeditation = newValue;
                    });
                  },
                  items: <String>['Meditation 1', 'Meditation 2', 'Meditation 3']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );                
                  }).toList(),
                  underline: Container(height: 0),
                  icon: const Icon(Icons.arrow_drop_down), // Use a different icon
                  iconEnabledColor: Colors.black, // Customize icon color
                  iconSize: 32,
                ),
              ),
            ),
            SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildSquare(),
                _buildSquare(),
              ],
            ),
            SizedBox(height: 16),
            Text(
              _selectedMeditation != null
                ? 'Meditating in $_selectedMeditation'
                : 'Select Meditation Type',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 16),
            _buildSquareGraph(),
            SizedBox(height: 32),            
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    _decrementBreathCycles();
                  },
                  child: Container(
                    width: IncDecIconSize,
                    height: IncDecIconSize,
                    color: Colors.black,
                    child: Icon(
                      Icons.remove,
                      color: Colors.white,
                      size: 16,
                    )
                  ),
                ),
                SizedBox(width: 8),
                Container(
                  width: 32,
                  height: 32,
                  color: Colors.black,
                  child: Center(
                    child: Text(
                        '$_breathCycles',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                  )
                  ),
                  SizedBox(width: 8),
                  GestureDetector(
                    onTap: () {
                      _incrementBreathCycles();
                    },
                    child: Container(
                    width: IncDecIconSize,
                    height: IncDecIconSize,
                    color: Colors.black,
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 16,
                    )
                                    ),
                  ),                
              ],
            ),
            Text(
              'Tap to Start/Stop Meditation',
              style: TextStyle(
                  fontSize: 8,
                  fontWeight: FontWeight.w300,
                  color: Colors.black,
                ),
              ),
            SizedBox(height: 16),
            Text(
              'Breath Cycles',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildSquare() {
    return Container(      
      child: Stack(
        children: [
          Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 4.0,
                  ),                  
                ),
              ),
            Padding(              
              padding: const EdgeInsets.only(top: 8.0, left: 8.0),
              child: Container(
                width: 80,
                height: 32,
                decoration: BoxDecoration(
                  color: Colors.black,
                ),
              ),
            ),
            Positioned(
              top: 80-24,
              right: 16,
              child: Container(
                alignment: Alignment.bottomRight,
                width: 16,
                height: 16,
                color: Colors.black,
              ),
            )
        ],
        
      ),
    );
  }

  Widget _buildSquareGraph() {
    return Container(
      width: 192,
      height: 192,
      decoration: BoxDecoration(
        border: Border.all(),
        color: Colors.black,
      ),
      child: CustomPaint(
        painter: SquareGraphPainter(),
      ),
    );
  }
}

class SquareGraphPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 2.0;

    // Define the amplitude and wavelength of the wave
    double amplitude = 30; // Adjust for wave height
    double wavelength = 40; // Adjust for wave frequency
    double count = 20;
    double stepSize = 0.2;

    // Calculate the y-position of each square based on a sine wave
    for (double i = 0; i < count; i+=stepSize) {
      double x = i * (wavelength / 2); // Adjust spacing for wavelength
      double y = size.height / 2 + amplitude * sin(x / wavelength * pi);

      canvas.drawRect(
        Rect.fromLTWH(x, y - 5, 10, 10), // Adjust size and offset as needed
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}