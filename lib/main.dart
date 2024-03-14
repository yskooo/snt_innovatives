import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:device_preview/device_preview.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'auth/login.dart';
import 'pages/user_profile_page.dart';
import 'package:flutter_supabase/widgets/bottom_navigationbar.dart';
import 'package:carousel_slider/carousel_slider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://sgkbfaxjpcztoaivcrlu.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InNna2JmYXhqcGN6dG9haXZjcmx1Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDk4ODM3NjQsImV4cCI6MjAyNTQ1OTc2NH0.vvmdh7TTroPcg_rDNH305XokhgTtZ6300L6xrSTUxo8'
  );

  DevicePreview(
    enabled: !const bool.fromEnvironment('dart.vm.product'),
    builder: (context) => const MyApp(),
  );

  runApp(const MyApp());
}

final supabase = Supabase.instance.client;

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      title: 'weConnect Smart Governance',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.tealAccent.shade700),
        textTheme: GoogleFonts.poppinsTextTheme(),
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0; // Current selected index for bottom navigation bar

  // Callback function to handle bottom navigation bar item tap
  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  late User currentUser;

  @override
  void initState() {
    super.initState();
    _fetchCurrentUser();
  }

  Future<void> _fetchCurrentUser() async {
    final user = supabase.auth.currentUser;
    if (user != null) {
      setState(() {
        currentUser = User(email: user.email!,
            profilePictureUrl: _getProfilePictureUrl(user.email!));
      });
    }
  }

  String _getProfilePictureUrl(String email) {
    // Placeholder function to generate profile picture URL from email
    // Replace this with your own logic to fetch profile pictures
    return 'https://www.gravatar.com/avatar/${email.hashCode}?d=identicon';
  }

  Future<void> signOut() async {
    await supabase.auth.signOut();
    if (!mounted) return;
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const LoginPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 20),
          Container(
            height: 80,
            color: Colors.white,
            child: AppBar(
              automaticallyImplyLeading: false,
              title: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Mabuhay",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          fontSize: 32,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 2),
                      const Text(
                        'Patacsil, Harold',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const UserProfilePage()),
                      );
                    },
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                          currentUser.profilePictureUrl),
                    ),
                  ),
                  IconButton(
                    onPressed: signOut,
                    icon: const Icon(Icons.logout_outlined),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 5.0,
                      right: 5.0,
                      top: 0,
                      bottom: 10.0,
                    ),
                    child: Row(
                      children: [
                        _buildFeatureBox(Icons.monitor_heart_rounded, "Health Wellness"),
                        _buildFeatureBox(Icons.security, "Public Safety"),
                        _buildFeatureBox(
                            Icons.local_hospital_rounded, "Emergency Hotlines"),
                        _buildFeatureBox(
                            Icons.document_scanner_rounded, "Raise Concerns"),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                CarouselSlider(
                  items: [
                    //1st Image of Slider
                    Container(
                      margin: const EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: const DecorationImage(
                          image: NetworkImage(
                              "https://scontent.fmnl8-2.fna.fbcdn.net/v/t39.30808-6/394293201_295529599956199_900468275556561837_n.jpg?_nc_cat=110&ccb=1-7&_nc_sid=5f2048&_nc_ohc=kpVmejhCdlkAX-Ra_Tj&_nc_ht=scontent.fmnl8-2.fna&oh=00_AfDfNpvCD4izyI4NpsacHAq7inwjmPZYObgQvIeWn85-ow&oe=65F7069E"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    //2nd Image of Slider
                    Container(
                      margin: const EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: const DecorationImage(
                          image: NetworkImage(
                              "https://scontent.fmnl8-3.fna.fbcdn.net/v/t39.30808-6/391662228_303902002393165_7520637264579023501_n.jpg?stp=dst-jpg_p960x960&_nc_cat=104&ccb=1-7&_nc_sid=5f2048&_nc_ohc=xnS24tAUbnMAX9_ZhGv&_nc_ht=scontent.fmnl8-3.fna&oh=00_AfB617T8UChw4eTBy8IqwNwaQGH75CydDE-ZuiQwMniruw&oe=65F71E80"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    //3rd Image of Slider
                    Container(
                      margin: const EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: const DecorationImage(
                          image: NetworkImage(
                              "https://scontent.fmnl8-1.fna.fbcdn.net/v/t39.30808-6/394298957_348700597540417_4747465536129137285_n.jpg?stp=dst-jpg_p720x720&_nc_cat=107&ccb=1-7&_nc_sid=5f2048&_nc_ohc=1ahW-O3jpRwAX-KpEv8&_nc_ht=scontent.fmnl8-1.fna&oh=00_AfBy6SA27C1HXkL_km09sXZcIfSVmZkfRTbx4kPEJ-JWLw&oe=65F7A743"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                  //Slider Container properties
                  options: CarouselOptions(
                    height: 180.0,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    aspectRatio: 16 / 9,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enableInfiniteScroll: true,
                    autoPlayAnimationDuration: const Duration(
                        milliseconds: 800),
                    viewportFraction: 0.8,
                  ),
                ),

                // THIS IS THE CITY CERVICES COMPONENT, 2 WIDGETS BELOW
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Text(
                        'CITY SERVICES',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          shadows: [
                            Shadow(
                              color: Colors.black,
                              offset: Offset(0.2, 0.2),
                            ),
                            Shadow(
                              color: Colors.black,
                              offset: Offset(-0.2, -0.2),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: ListView(
                        shrinkWrap: true,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center, // Center the row horizontally
                            children: [
                              const SizedBox(width: 8), // Adjust spacing between widgets
                              Expanded(
                                child: _buildServiceBox('Request Form', Icons.file_copy_rounded),
                              ),
                              const SizedBox(width: 8), // Adjust spacing between widget
                              Expanded(
                                child: _buildServiceBox('Pay Taxes', Icons.attach_money_rounded),
                              ),
                              const SizedBox(width: 8), // Adjust spacing between widgets
                              Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: _buildLongServiceBox('Job Opportunities', Icons.work_history_rounded),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: ListView(
                        shrinkWrap: true,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center, // Center the row horizontally
                            children: [
                              Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: _buildLongServiceBox('Financial Assistance', Icons.money),
                                ),
                              ),
                              const SizedBox(width: 8), // Adjust spacing between widgets
                              Expanded(
                                child: _buildServiceBox('Health Checkup', Icons.local_hospital),
                              ),
                              const SizedBox(width: 8), // Adjust spacing between widgets
                              Expanded(
                                child: _buildServiceBox('View More', Icons.more_horiz_rounded),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                )

              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTap: _onItemTap,
      ),
    );
  }
}

class User {
  final String email;
  final String profilePictureUrl;

  User({required this.email, required this.profilePictureUrl});
}

Widget _buildFeatureBox(IconData icon, String label) {
  List<String> words = label.split(' ');
  // Join the words with newline characters
  String wrappedLabel = words.join('\n');
  return Column(
    children: [
      Container(
        width: 80, // Adjust width of the box
        height: 80, // Adjust height of the box
        margin: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          color: const Color(0xFF1A915A), // Green color
          borderRadius: BorderRadius.circular(16), // Adjust border radius as needed
        ),
        child: Center(
          child: Icon(
            icon,
            size: 30, // Adjust size of icon
            color: Colors.white,
          ),
        ),
      ),
      const SizedBox(height: 8), // Add vertical space between box and text
      Text(
        wrappedLabel,
        style: const TextStyle(color: Colors.black, fontSize: 12),
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis, // Prevents overflow by showing ellipsis
        maxLines: 2,
      ),
    ],
  );
}

// 2 CITY SERVICES WIDGETS
Widget _buildServiceBox(String title, IconData icon) {
  return Container(
    height: 80, // Adjusted for consistency with _buildLongServiceBox
    decoration: BoxDecoration(
      color: Colors.white,
      border: Border.all(color: const Color(0xFF1A915A), width: 1.5),
      borderRadius: BorderRadius.circular(10),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: const Color(0xFF1A915A), size: 24), // Icon size adjusted for consistency
        const SizedBox(height: 8),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: title.split(" ").map((word) => Text(
            word,
            style: const TextStyle(color: Colors.black, fontSize: 12),
            textAlign: TextAlign.center,
          )).toList(),
        ),
      ],
    ),
  );
}

Widget _buildLongServiceBox(String title, IconData icon) {
  return Container(
    height: 80, // Adjusted for consistency with _buildServiceBox
    decoration: BoxDecoration(
      color: Colors.white,
      border: Border.all(color: const Color(0xFF1A915A), width: 1.5),
      borderRadius: BorderRadius.circular(10),
    ),
    child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Icon(icon, color: const Color(0xFF1A915A), size: 24), // Icon size adjusted for consistency
          const SizedBox(height: 8),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: title.split(" ").map((word) => Text(
            word,
            style: const TextStyle(color: Colors.black),
            textAlign: TextAlign.center,
          )).toList(),
        ),
  ]));
}
