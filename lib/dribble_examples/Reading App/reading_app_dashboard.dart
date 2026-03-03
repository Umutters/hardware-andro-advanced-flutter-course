import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const ReadingAppDashBoard());
}

class ReadingAppDashBoard extends StatelessWidget {
  const ReadingAppDashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
      ), // Eğer yüklü değilse varsayılan gelir
      home: const LearningPage(),
    );
  }
}

class LearningPage extends StatefulWidget {
  const LearningPage({super.key});

  @override
  State<LearningPage> createState() => _LearningPageState();
}

class _LearningPageState extends State<LearningPage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FE),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. Header Section
              _buildHeader(),
              const SizedBox(height: 30),

              // 2. Main Progress Card
              _buildMainCard(),
              const SizedBox(height: 35),

              // 3. Course List Title
              const Text(
                "Course List",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2D2D2D),
                ),
              ),
              const SizedBox(height: 20),

              // 4. Grid of Course Tiles
              _buildCourseGrid(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "Hi! Rakib 👋",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              "What do you want to learn?",
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
          ],
        ),
        const CircleAvatar(
          radius: 30,
          backgroundImage: NetworkImage(
            'https://via.placeholder.com/150',
          ), // Buraya kendi avatarını koyabilirsin
        ),
      ],
    );
  }

  Widget _buildMainCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFF4A2A84),
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF4A2A84).withOpacity(0.3),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Row(
        children: [
          // Circular Progress
          SizedBox(
            width: 85,
            height: 85,
            child: CustomPaint(
              painter: ProgressPainter(0.75),
              child: const Center(
                child: Text(
                  "75%",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 25),
          // Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Speaking",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "Awesome - we're pulling in your data automagically! :)",
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 15),
                Row(
                  children: const [
                    Text(
                      "Continue Lesson",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(width: 5),
                    Icon(Icons.arrow_forward, color: Colors.white, size: 18),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCourseGrid() {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      crossAxisSpacing: 20,
      mainAxisSpacing: 20,
      childAspectRatio: 0.85,
      children: [
        _buildCourseTile(
          "Listening",
          "18 Lessons",
          Colors.orange,
          Icons.headset_outlined,
        ),
        _buildCourseTile(
          "Reading",
          "12 Lessons",
          Colors.pinkAccent,
          Icons.menu_book_outlined,
        ),
        _buildCourseTile(
          "Speaking",
          "24 Lessons",
          Colors.teal,
          Icons.mic_none_outlined,
        ),
        _buildCourseTile(
          "Writing",
          "22 Lessons",
          Colors.blueAccent,
          Icons.edit_outlined,
        ),
      ],
    );
  }

  Widget _buildCourseTile(
    String title,
    String lessons,
    Color color,
    IconData icon,
  ) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Icon(icon, color: color, size: 28),
          ),
          const Spacer(),
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const SizedBox(height: 4),
          Text(
            lessons,
            style: const TextStyle(color: Colors.grey, fontSize: 14),
          ),
          const Align(
            alignment: Alignment.bottomRight,
            child: Icon(Icons.arrow_forward, color: Colors.black54, size: 20),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNav() {
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      onTap: (index) => setState(() => _selectedIndex = index),
      type: BottomNavigationBarType.fixed,
      selectedItemColor: const Color(0xFF4A2A84),
      unselectedItemColor: Colors.grey,
      showUnselectedLabels: true,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: "Home"),
        BottomNavigationBarItem(
          icon: Icon(Icons.grid_view_rounded),
          label: "Explore",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.book_rounded),
          label: "Courses",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          label: "Profile",
        ),
      ],
    );
  }
}

// --- CustomPainter for the Circular Progress ---
class ProgressPainter extends CustomPainter {
  final double progress;
  ProgressPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width / 2, size.height / 2);
    const strokeWidth = 10.0;

    // Background circle
    final bgPaint = Paint()
      ..color = Colors.white.withOpacity(0.15)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;
    canvas.drawCircle(center, radius, bgPaint);

    // Progress arc
    final progressPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2,
      2 * pi * progress,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
