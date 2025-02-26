import 'package:flutter/material.dart';

class CustomCalendar extends StatelessWidget {
  const CustomCalendar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 12.0, bottom: 8.0),
          child: Text(
            'Events',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Table(
          border: TableBorder.all(
            color: Colors.black,
            width: 1,
          ),
          children: [
            // Header row
            TableRow(
              children: [
                'Sun',
                'Mon',
                'Tue',
                'Wed',
                'Thur',
                'Fri',
                'Sat',
              ].map((day) => TableCell(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Text(
                    day,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                    ),
                  ),
                ),
              )).toList(),
            ),
            // Calendar rows
            ...List.generate(4, (rowIndex) => TableRow(
              children: List.generate(7, (colIndex) => TableCell(
                child: Container(
                  height: 40,
                  padding: const EdgeInsets.all(4),
                  child: Stack(
                    children: [
                      // Date number
                      Positioned(
                        top: 0,
                        left: 2,
                        child: Text(
                          '${rowIndex * 7 + colIndex + 1}',
                          style: const TextStyle(
                            fontSize: 10,
                          ),
                        ),
                      ),
                      // Event indicator (horizontal line)
                      if ((rowIndex * 7 + colIndex) % 3 == 0)
                        const Positioned(
                          bottom: 8,
                          left: 4,
                          right: 4,
                          child: SizedBox(
                            height: 2,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              )).toList(),
            )),
          ],
        ),
      ],
    );
  }
}