import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _logoController;
  late AnimationController _progressController;
  late AnimationController _fadeController;

  late Animation<double> _logoScale;
  late Animation<double> _progress;
  late Animation<double> _fade;

  @override
  void initState() {
    super.initState();

    /// Logo animation
    _logoController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2))
          ..repeat(reverse: true);

    _logoScale = Tween(begin: 0.9, end: 1.1).animate(
      CurvedAnimation(parent: _logoController, curve: Curves.easeInOut),
    );

    /// Progress animation
    _progressController =
        AnimationController(vsync: this, duration:  Duration(seconds: 3));

    _progress = Tween(begin: 0.0, end: 0.88).animate(
      CurvedAnimation(parent: _progressController, curve: Curves.easeOut),
    );

    /// Fade animation
    _fadeController =
        AnimationController(vsync: this, duration:  Duration(seconds: 2));

    _fade = Tween(begin: 0.0, end: 1.0).animate(_fadeController);

    _fadeController.forward();
    _progressController.forward();

    /// Navigation (optional)
    Future.delayed( Duration(seconds: 4), () {
      // Navigator.pushReplacement(context,
      //     MaterialPageRoute(builder: (_) =>  HomeScreen()));
    });
  }

  @override
  void dispose() {
    _logoController.dispose();
    _progressController.dispose();
    _fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SizedBox.expand(
        child: Container(
          decoration:  BoxDecoration(
            gradient: RadialGradient(
              center: Alignment(0, -0.3),
              radius: 1.2,
              colors: [
                Color(0xFF0F5A2A),
                Color(0xFF062E1A),
              ],
            ),
          ),
          child: Stack(
            children: [
              /// MAIN CONTENT
              FadeTransition(
                opacity: _fade,
                child: Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 40),
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 420),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /// Logo
                          ScaleTransition(
                            scale: _logoScale,
                            child: Container(
                              padding: const EdgeInsets.all(22),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.black.withOpacity(0.2),
                              ),
                              child: const Icon(
                                Icons.eco,
                                color: Colors.greenAccent,
                                size: 40,
                              ),
                            ),
                          ),

                          const SizedBox(height: 20),

                          /// Title
                          Text(
                            "AyurVerse",
                            style: GoogleFonts.playfairDisplay(
                              fontSize: 40,
                              color: const Color(0xFFFFD166),
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 6),

                          /// Subtitle
                          Text(
                            "ARTIFICIAL INTELLIGENCE",
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              letterSpacing: 3,
                              color: Colors.greenAccent,
                            ),
                          ),

                          const SizedBox(height: 30),

                          /// Tagline
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "Ancient ",
                                  style: GoogleFonts.poppins(
                                      fontSize: 18, color: Colors.white70),
                                ),
                                TextSpan(
                                  text: "Healing.\n",
                                  style: GoogleFonts.poppins(
                                    fontSize: 18,
                                    fontStyle: FontStyle.italic,
                                    color: Colors.white70,
                                  ),
                                ),
                                TextSpan(
                                  text: "Intelligent ",
                                  style: GoogleFonts.poppins(
                                      fontSize: 18, color: Colors.white70),
                                ),
                                TextSpan(
                                  text: "Future.",
                                  style: GoogleFonts.poppins(
                                    fontSize: 18,
                                    color: Colors.greenAccent,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(height: 40),

                          /// Button
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 40, vertical: 16),
                              decoration: BoxDecoration(
                                color: Colors.greenAccent.shade400,
                                borderRadius: BorderRadius.circular(30),
                                boxShadow: [
                                  BoxShadow(
                                    color:
                                        Colors.greenAccent.withOpacity(0.5),
                                    blurRadius: 20,
                                    spreadRadius: 2,
                                  )
                                ],
                              ),
                              child: Text(
                                "BEGIN JOURNEY",
                                style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.5,
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(height: 12),

                          Text(
                            "TRUSTED BY 2M+ SEEKERS",
                            style: GoogleFonts.poppins(
                              fontSize: 10,
                              color: Colors.white38,
                              letterSpacing: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              /// PROGRESS BAR
              Positioned(
                bottom: 40,
                left: 40,
                right: 40,
                child: AnimatedBuilder(
                  animation: _progress,
                  builder: (context, child) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "ALIGNING DOSHAS",
                          style: GoogleFonts.poppins(
                            fontSize: 10,
                            color: Colors.greenAccent,
                            letterSpacing: 1.5,
                          ),
                        ),
                        const SizedBox(height: 8),

                        Stack(
                          children: [
                            Container(
                              height: 4,
                              width: double.infinity,
                              color: Colors.white10,
                            ),
                            Container(
                              height: 4,
                              width: screenWidth * _progress.value,
                              color: Colors.greenAccent,
                            ),
                          ],
                        ),

                        const SizedBox(height: 5),

                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "${(_progress.value * 100).toInt()}%",
                            style: GoogleFonts.poppins(
                              fontSize: 10,
                              color: Colors.white60,
                            ),
                          ),
                        )
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}