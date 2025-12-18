import 'package:flutter/material.dart';
import 'package:trackizer/common/color_extension.dart';
// Gue hapus painter dan row yang nggak perlu buat hemat memori
import '../../common_widget/status_button.dart';
import '../settings/settings_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: TColor.gray,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: media.width * 0.4, // Gue pendekin biar fokus ke tombol settings
              decoration: BoxDecoration(
                  color: TColor.gray70.withOpacity(0.5),
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25))),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Text(
                        "Trackizer",
                        style: TextStyle(color: TColor.white, fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      // Jantung utama lo: Tombol Settings
                      IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SettingsView()));
                          },
                          icon: Image.asset("assets/img/settings.png",
                              width: 25,
                              height: 25,
                              color: TColor.gray30))
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 100),
            Center(
              child: Text(
                "Halaman Dashboard\n(Gue rampingin biar lo fokus di Settings)",
                textAlign: TextAlign.center,
                style: TextStyle(color: TColor.gray30, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}