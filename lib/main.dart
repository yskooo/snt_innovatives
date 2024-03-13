import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:device_preview/device_preview.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'auth/login.dart';
import 'pages/user_profile_page.dart';
import 'package:flutter_supabase/widgets/bottom_navigationbar.dart';

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
      title: 'weConnect Smart City',
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
        currentUser = User(email: user.email!, profilePictureUrl: _getProfilePictureUrl(user.email!));
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
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginPage()));
  }


  final noteStream = supabase.from('notes').stream(primaryKey: ['id']);

  Future<void> createNote(String note) async {
    await supabase.from('notes').insert({'body': note});
  }

  Future<void> updateNote(String noteId, String updatedNote) async {
    await supabase.from('notes').update({'body': updatedNote}).eq('id', noteId);
  }

  Future<void> deleteNote(String noteId) async {
    await supabase.from('notes').delete().eq('id', noteId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Mabuhay",
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold,
              fontSize: 32,
              color: Colors.black,
            ),
          ),
          actions: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  // should be routed to User Profile
                  MaterialPageRoute(builder: (context) => const UserProfilePage()),
                );
              },
              child: CircleAvatar(
                backgroundImage: NetworkImage(currentUser.profilePictureUrl),
              ),
            ),
            IconButton(
              onPressed: signOut,
              icon: const Icon(Icons.logout_outlined),
            )
        ],
        automaticallyImplyLeading: false,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return SimpleDialog(
                title: const Text('Add a note'),
                children: [
                  TextFormField(
                    onFieldSubmitted: (value) {
                      createNote(value);
                      if (mounted) Navigator.pop(context);
                    },
                  )
                ],
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
      body:
      StreamBuilder(
        stream: noteStream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          final notes = snapshot.data!;

          return ListView.builder(
            itemCount: notes.length,
            itemBuilder: (context, index) {
              final note = notes[index];
              final noteId = note['id'].toString();

              return ListTile(
                title: Text(note['body']),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return SimpleDialog(
                              title: const Text('Edit a note'),
                              children: [
                                TextFormField(
                                  initialValue: note['body'],
                                  onFieldSubmitted: (value) async {
                                    await updateNote(noteId, value);
                                    if (mounted) Navigator.pop(context);
                                  },
                                )
                              ],
                            );
                          },
                        );
                      },
                      icon: const Icon(Icons.edit),
                    ),
                    IconButton(
                      onPressed: () async {
                        bool deletedConfirmed = await showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Delete note'),
                              content: const Text('Are you sure you want to delete this note?'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context, false);
                                  },
                                  child: const Text('Cancel'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context, true);
                                  },
                                  child: const Text('Delete'),
                                ),
                              ],
                            );
                          },
                        );
                        if (deletedConfirmed) {
                          await deleteNote(noteId);
                        }
                      },
                      icon: const Icon(Icons.delete),
                    )
                  ],
                ),
              );
            },
          );
        },
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

