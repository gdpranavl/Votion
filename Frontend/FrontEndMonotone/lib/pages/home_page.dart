import 'package:flutter/material.dart';

class _ProgressClipperHorizontal extends CustomClipper<Rect> {
  final double progress;
  final double totalWidth;

  _ProgressClipperHorizontal({required this.progress, required this.totalWidth});

  @override
  Rect getClip(Size size) {
    return Rect.fromLTRB(0, 0, totalWidth * progress, size.height);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Rect> oldClipper) => true;
}

class _ProgressClipperVertical extends CustomClipper<Rect> {
  final double progress; // Value between 0 and 1
  final double totalHeight;

  _ProgressClipperVertical({required this.progress, required this.totalHeight});

  @override
  Rect getClip(Size size) {
    // Calculate the height of the clipped area
    final clippedHeight = totalHeight * progress;

    // Create a rectangle that clips from the bottom upwards
    return Rect.fromLTRB(
      0, // Left
      totalHeight - clippedHeight, // Top (starts from the bottom)
      size.width, // Right
      totalHeight, // Bottom (full height)
    );
  }

  @override
  bool shouldReclip(covariant CustomClipper<Rect> oldClipper) => true;
}

// Existing Home Page (now moved to separate widget)
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  double _getYearProgress() {
    final now = DateTime.now();
    final startOfYear = DateTime(now.year, 1, 1);
    final endOfYear = DateTime(now.year + 1, 1, 1);
    final totalDaysInYear = endOfYear.difference(startOfYear).inDays;
    final currentDay = now.difference(startOfYear).inDays;
    return currentDay / totalDaysInYear;
  }

  double _getMonthProgress() {
  final now = DateTime.now();
  final startOfMonth = DateTime(now.year, now.month, 1);
  final endOfMonth = DateTime(now.year, now.month + 1, 1);
  final totalDaysInMonth = endOfMonth.difference(startOfMonth).inDays;
  final currentDay = now.day;
  return currentDay / totalDaysInMonth;
}

  @override
  Widget build(BuildContext context) {
    double yearProgress = _getYearProgress();
    const goalsProgress = 0.2;
    const tasksProgress = 0.87; // 30% progress for Tasks
    double monthProgress = _getMonthProgress(); // 60% progress for Month

    return LayoutBuilder(
      builder: (context, constraints) {
        double widthUnit = MediaQuery.of(context).size.width * 0.25;
        double combinedWidth = widthUnit * 3.5;

        return Padding(
          padding: const EdgeInsets.only(left: 0.0, top: 64.0),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Quote Section
                  Container(
                    width: combinedWidth,
                    height: 128,
                    color: Colors.black,
                    child: SizedBox.expand(
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text.rich(
                              TextSpan(
                                text: '"Success is not final, failure is not fatal: It is the courage to continue that ',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.0,
                                  letterSpacing: -0.5,
                                  height: 0.9,
                                ),
                                children: const <TextSpan>[
                                  TextSpan(
                                    text: 'counts',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  TextSpan(text: '. "'),
                                ],
                              ),
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const Positioned(
                            bottom: 16.0,
                            right: 16.0,
                            child: Text(
                              '- Winston S. Churchill',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 8.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Year Progress Bar
                  Container(
                    width: combinedWidth,
                    height: 64,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      border: Border.all(color: Colors.black),
                    ),
                    child: Stack(
                      children: [
                        Container(
                          width: combinedWidth * yearProgress,
                          color: Colors.blue,
                        ),
                        Stack(
                          children: [
                            Container(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text(
                                  '${(yearProgress * 100).toStringAsFixed(1)}%',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: const Text(
                                "Year",
                                textAlign: TextAlign.left,
                                style: TextStyle(                            
                                  color: Colors.white,
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            ClipRect(
                            clipper: _ProgressClipperHorizontal(
                              progress: yearProgress,
                              totalWidth: combinedWidth,
                            ),
                            child: Stack(
                              children: [
                                  SizedBox(
                                  width: combinedWidth,
                                  child: Container(
                                    alignment: Alignment.centerRight,
                                      child: Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: Text(
                                          '${(yearProgress * 100).toStringAsFixed(1)}%',
                                          style: const TextStyle(
                                            color: Colors.black, // Contrast color for filled area
                                            fontSize: 24.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                  width: combinedWidth,
                                  child: Container(
                                    alignment: Alignment.centerLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: Text(
                                          'Year',
                                          style: const TextStyle(
                                            color: Colors.black, // Contrast color for filled area
                                            fontSize: 24.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ]
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
            
                  // Goals Progress Bar
                  Container(
                    width: combinedWidth,
                    height: 64,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      border: Border.all(color: Colors.black),
                    ),
                    child: Stack(
                      children: [
                        Container(
                          width: combinedWidth * goalsProgress,
                          color: Colors.green,
                        ),
                        Container(
                          alignment: Alignment.topRight,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              '${(goalsProgress * 100).toStringAsFixed(0)}%',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: const Text(
                              'Goals',
                              style: TextStyle(
                                fontSize: 24.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        ClipRect(
                            clipper: _ProgressClipperHorizontal(
                              progress: goalsProgress,
                              totalWidth: combinedWidth,
                            ),
                            child: Stack(
                              children: [
                                  SizedBox(
                                  width: combinedWidth,
                                  child: Container(
                                    alignment: Alignment.centerRight,
                                      child: Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: Text(
                                          '${(goalsProgress * 100).toStringAsFixed(1)}%',
                                          style: const TextStyle(
                                            color: Colors.black, // Contrast color for filled area
                                            fontSize: 24.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                  width: combinedWidth,
                                  child: Container(
                                    alignment: Alignment.centerLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: Text(
                                          'Goals',
                                          style: const TextStyle(
                                            color: Colors.black, // Contrast color for filled area
                                            fontSize: 24.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ]
                              ),
                            ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
            
                  // Vertical Progress Bars Section
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: combinedWidth, // Same width as Goals progress bar
                        height: 276,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            
                            // Tasks Progress
                            Column(
                              children: [
                                Container(
                                  width: (combinedWidth - 8) / 2, // Account for 8px spacing
                                  height: 256,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    border: Border.all(color: Colors.black),
                                  ),
                                  child: Stack(
                                    alignment: Alignment.bottomCenter,
                                    children: [
                                      Container(
                                        height: 256 * tasksProgress,
                                        color: Colors.orange,
                                      ),
                                      Container(
                                        alignment: Alignment.bottomLeft,
                                        child: Padding(
                                          padding: const EdgeInsets.all(16.0),
                                          child: Text(
                                            '${(tasksProgress * 100).toStringAsFixed(0)}%',
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 24.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.topLeft,
                                        child: Padding(
                                          padding: const EdgeInsets.all(16.0),
                                          child: const Text(                                      
                                            "Tasks",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 24.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                      ClipRect(
                                      clipper: _ProgressClipperVertical(
                                        progress: tasksProgress,
                                        totalHeight: 256,
                                      ),
                                      child: Stack(
                                        children: [
                                            SizedBox(
                                            width: combinedWidth,
                                            child: Container(
                                              alignment: Alignment.bottomLeft,
                                                child: Padding(
                                                  padding: const EdgeInsets.all(16.0),
                                                  child: Text(
                                                    '${(tasksProgress * 100).toStringAsFixed(0)}%',
                                                    style: const TextStyle(
                                                      color: Colors.black, // Contrast color for filled area
                                                      fontSize: 24.0,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                            width: combinedWidth,
                                            child: Container(
                                              alignment: Alignment.topLeft,
                                                child: Padding(
                                                  padding: const EdgeInsets.all(16.0),
                                                  child: Text(
                                                    'Tasks',
                                                    style: const TextStyle(
                                                      color: Colors.black, // Contrast color for filled area
                                                      fontSize: 24.0,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ]
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
            
                            const SizedBox(width: 8), // Spacing between bars
            
                            // Month Progress
                            Column(
                              children: [                                
                                Container(
                                  width: (combinedWidth - 8) / 2, // Account for 8px spacing
                                  height: 128,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    border: Border.all(color: Colors.black),
                                  ),
                                  child: Stack(
                                    alignment: Alignment.bottomCenter,
                                    children: [
                                      Container(
                                        height: 128 * monthProgress,
                                        color: Colors.purple,
                                      ),
                                      Container(
                                        alignment: Alignment.bottomLeft,
                                        child: Padding(
                                          padding: const EdgeInsets.all(16.0),
                                          child: Text(
                                            '${(monthProgress * 100).toStringAsFixed(0)}%',
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 24.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.topLeft,
                                        child: Padding(
                                          padding: const EdgeInsets.all(16.0),
                                          child: const Text(
                                            "Month",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 24.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                      ClipRect(
                                      clipper: _ProgressClipperVertical(
                                        progress: monthProgress,
                                        totalHeight: 128,
                                      ),
                                      child: Stack(
                                        children: [
                                            SizedBox(
                                            width: combinedWidth,
                                            child: Container(
                                              alignment: Alignment.bottomLeft,
                                                child: Padding(
                                                  padding: const EdgeInsets.all(16.0),
                                                  child: Text(
                                                    '${(monthProgress * 100).toStringAsFixed(0)}%',
                                                    style: const TextStyle(
                                                      color: Colors.black, // Contrast color for filled area
                                                      fontSize: 24.0,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                            width: combinedWidth,
                                            child: Container(
                                              alignment: Alignment.topLeft,
                                                child: Padding(
                                                  padding: const EdgeInsets.all(16.0),
                                                  child: Text(
                                                    'Months',
                                                    style: const TextStyle(
                                                      color: Colors.black, // Contrast color for filled area
                                                      fontSize: 24.0,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ]
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                const SizedBox(height: 16), // Spacing between bars
                                
                                Container(
                                  width: (combinedWidth - 8) / 2, // Account for 8px spacing
                                  height: 112,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    border: Border.all(color: Colors.black),
                                  ),
                                  child: Stack(
                                    alignment: Alignment.bottomCenter,
                                    children: [
                                      Container(
                                        alignment: Alignment.topLeft,
                                        child: Padding(
                                          padding: const EdgeInsets.all(16.0),
                                          child: const Text(
                                            "Notes",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 24.0,
                                              fontWeight: FontWeight.bold,
                                              ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(                        
                        width: combinedWidth,
                        height: 96,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          border: Border.all(color: Colors.black),
                        ),
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            Container(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: const Text(
                                  "Friends",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                 
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
