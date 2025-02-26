import 'package:flutter/material.dart';
// You might need to import this if you are using custom icons
// import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class TasksPage extends StatefulWidget {
  const TasksPage({Key? key}) : super(key: key);

  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 8.0), // Add some padding around the whole page
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // Align content to the start of the column
            children: [
              const Text(
                "Events",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold), // "Events" title style
              ),
              const SizedBox(height: 10), // Spacing between "Events" and Calendar
              // Calendar Section
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 2.0), // Black border for calendar
                  borderRadius: BorderRadius.circular(0), // No rounded corners for calendar
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildCalendarDay("Sun", hasEvents: false),
                    _buildCalendarDay("Mon", hasEvents: true),
                    _buildCalendarDay("Tue", hasEvents: true),
                    _buildCalendarDay("Wed", hasEvents: true, isToday: true), // "Wed" is today in image
                    _buildCalendarDay("Thur", hasEvents: true),
                    _buildCalendarDay("Fri", hasEvents: true),
                    _buildCalendarDay("Sat", hasEvents: false),
                  ],
                ),
              ),
              const SizedBox(height: 20), // Spacing after Calendar
              // Graph Section Placeholder
              Container(
                height: screenHeight * 0.08, // Adjust height as needed
                width: double.infinity,
                decoration: const BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.black, width: 2.0)), // Bottom border for graph line
                ),
                child: const Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 5.0), // Adjust bottom padding to align with image
                    child: SizedBox(
                      width: double.infinity,
                      height: 2.0, // Graph line thickness
                      child: DecoratedBox(
                        decoration: BoxDecoration(color: Colors.black), // Graph line color
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30), // Spacing after Graph
              // The One Imperative Section
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                decoration: const BoxDecoration(
                  color: Colors.black, // Black background for "The One Imperative"
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "The One Imperative",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Complete Module 6 in Course\nwithin the next 3 days", // Line breaks as in image
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start, // Align top of rows
                  children: [
                    Expanded(
                      flex: 4,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start, // Align items to start in column
                        children: [
                          // One Step At A Time
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0, top: 0.0),
                            child: const Text(
                              "One Step At A Time",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold, 
                                fontStyle: FontStyle.italic, 
                                letterSpacing: 0.1
                                ),
                            ),
                          ),
                          // The Record Section
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.black,
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0), // Increased padding
                            child: Column(
                              children: [
                                const Text(
                                  "The Record",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                  textAlign: TextAlign.center,
                                  softWrap: true,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  "18",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                          // Pomodoro Section
                          Container(
                            width: double.infinity,
                          decoration: const BoxDecoration( // 'const' here is fine for BoxDecoration
                            color: Colors.white,
                          ),
                          child: Column( // Removed 'const' here
                            children: [ // 'const' here is fine for the *list* of children
                              Text(
                                "Pomodoro",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black, // Added white text color
                                ),
                              ),
                              SizedBox(height: 16),
                              Container(
                                padding: const EdgeInsets.all(20.0),
                                child: const Icon(
                                  Icons.timer,
                                  size: 60,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        )
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 6,
                      child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.black, // Black background for "The One Imperative"
                      ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 16.0, top: 16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Tasks",
                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                              ),
                              const SizedBox(height: 10),
                              // Task List
                              ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(), // Disable scrolling within ListView
                                itemCount: 4, // Number of tasks shown in image
                                itemBuilder: (context, index) {
                                  String taskText;
                                  bool isChecked = false; // Default to unchecked
                                  switch (index) {
                                    case 0: taskText = "BCI"; break;
                                    case 1: taskText = "Groceries"; isChecked = true; break; // "Groceries" is checked
                                    case 2: taskText = "Unity"; break;
                                    case 3: taskText = "Gym"; break;
                                    default: taskText = "Task ${index + 1}";
                                  }
                                  return _buildTaskTile(taskText, isChecked: isChecked);
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper widget for Calendar Day
  Widget _buildCalendarDay(String day, {bool hasEvents = false, bool isToday = false}) {
    return Column(
      children: [
        Text(
          day,
          style: TextStyle(fontWeight: isToday ? FontWeight.bold : FontWeight.normal), // Bold for today
        ),
        const SizedBox(height: 5),
        if (hasEvents)
          ...[ // Spread operator to add multiple widgets conditionally
            _buildEventIndicator(),
            const SizedBox(height: 2),
            _buildEventIndicator(),
          ]
      ],
    );
  }

  // Helper widget for event indicator in calendar
  Widget _buildEventIndicator() {
    return Container(
      width: 10,
      height: 2,
      color: Colors.black,
    );
  }


  // Helper widget for Task Tile
  Widget _buildTaskTile(String taskText, {bool isChecked = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0), // Add vertical padding between tasks
      child: Row(
        children: [
          Checkbox(
            value: isChecked,
            onChanged: (newValue) {
              // Implement checkbox functionality if needed
            },
            side: const BorderSide(color: Colors.white, width: 2.0), // Thicker black border
            checkColor: Colors.black, // Check color black
            fillColor: isChecked
                ? WidgetStateColor.resolveWith((states) => Colors.white)
                : WidgetStateColor.resolveWith((states) => Colors.transparent),
          ),
          const SizedBox(width: 8),
          Text(
            taskText,
            style: const TextStyle(fontSize: 16, color: Colors.white), // Text style for task text
          ),
          const Spacer(), // To push the "..." icon to the right
          if (taskText == "Groceries") // Only add the icon for "Groceries" as in image
            const Icon(Icons.more_horiz, color: Colors.white), // Or use more specific icon if you have one
        ],
      ),
    );
  }
}