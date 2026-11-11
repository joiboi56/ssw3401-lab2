import 'package:flutter/material.dart';

void main() {
  runApp(const MyMasjidApp());
}

// The main app wrapper
class MyMasjidApp extends StatelessWidget {
  const MyMasjidApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MasjidSelectorScreen(),
    );
  }
}

// The interactive screen
class MasjidSelectorScreen extends StatefulWidget {
  const MasjidSelectorScreen({super.key});

  @override
  State<MasjidSelectorScreen> createState() => _MasjidSelectorScreenState();
}

class _MasjidSelectorScreenState extends State<MasjidSelectorScreen> {
  // These variables hold the currently selected masjid.
  // We start with Masjid Negara as the default.
  String currentImage = 'assets/masjid_negara.jpeg';
  String masjidName = 'Masjid Negara';
  String masjidAddress = 'Jalan Perdana, Tasik Perdana, 50480 Kuala Lumpur';

  // This function updates the UI when a button is pressed
  void changeMasjid(String imagePath, String name, String address) {
    setState(() {
      currentImage = imagePath;
      masjidName = name;
      masjidAddress = address;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        title: const Text(
          'Which Masjid Today?',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.green[800],
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 1. The name of the masjid
            Text(
              masjidName,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.green[800],
              ),
            ),
            const SizedBox(height: 20),

            // 2. The image display with a nice border
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.green[800]!, width: 4),
                borderRadius: BorderRadius.circular(15),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  )
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(11),
                child: Image.asset(
                  currentImage,
                  height: 250,
                  width: 250,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // 3. The simple address
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                masjidAddress,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 30),

            // 4. The selection buttons
            Wrap(
              spacing: 15,
              runSpacing: 15,
              alignment: WrapAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green[800],
                    padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  ),
                  onPressed: () => changeMasjid(
                    'assets/masjid_negara.jpeg',
                    'Masjid Negara',
                    'Jalan Perdana, Tasik Perdana, 50480 Kuala Lumpur',
                  ),
                  child: const Text('Masjid Negara',
                      style: TextStyle(color: Colors.white, fontSize: 16)),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink[400],
                    padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  ),
                  onPressed: () => changeMasjid(
                    'assets/masjid_putra.jpeg',
                    'Masjid Putra',
                    'Persiaran Persekutuan, Presint 1, 62502 Putrajaya',
                  ),
                  child: const Text('Masjid Putra',
                      style: TextStyle(color: Colors.white, fontSize: 16)),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  ),
                  onPressed: () => changeMasjid(
                    'assets/masjid_biru.jpeg',
                    'Masjid Sultan Salahuddin Abdul Aziz Shah',
                    'Persiaran Masjid, Seksyen 14, 40000 Shah Alam, Selangor',
                  ),
                  child: const Text('Masjid Biru',
                      style: TextStyle(color: Colors.white, fontSize: 16)),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrange,
                    padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  ),
                  onPressed: () => changeMasjid(
                    'assets/masjid_kristal.jpeg',
                    'Masjid Kristal',
                    'Taman Tamadun Islam, Pulau Wan Man, 21100 Kuala Terengganu',
                  ),
                  child: const Text('Masjid Kristal',
                      style: TextStyle(color: Colors.white, fontSize: 16)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}