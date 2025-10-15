import 'package:flutter/material.dart';

void main() {
  runApp(TravelGuideApp());
}

class TravelGuideApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel Guide Pakistan',
      theme: ThemeData(primarySwatch: Colors.green),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final List<Map<String, String>> destinations = [
    {
      'name': 'Islamabad',
      'image': 'assets/images/faisal_mosque.jpg',
      'description':
      'Islamabad is the beautiful capital city of Pakistan, known for its clean environment, greenery, and landmarks like Faisal Mosque and Pakistan Monument.'
    },
    {
      'name': 'Lahore',
      'image': 'assets/images/badshahi_mosque.jpg',
      'description':
      'Lahore, the heart of Pakistan, is famous for its historical sites like Badshahi Mosque, Lahore Fort, and delicious food on Food Street.'
    },
    {
      'name': 'Hunza Valley',
      'image': 'assets/images/hunza_valley.jpg',
      'description':
      'Hunza Valley is a paradise on earth located in Gilgit-Baltistan. Known for snow-capped mountains, lakes, and the friendly Hunza people.'
    },
    {
      'name': 'Karachi',
      'image': 'assets/images/karachi.jpg',
      'description':
      'Karachi is the largest city of Pakistan, located by the Arabian Sea. It is the financial hub and home to Clifton Beach and Quaid’s Mausoleum.'
    },
    {
      'name': 'Skardu',
      'image': 'assets/images/skardu.jpg',
      'description':
      'Skardu is the gateway to the world’s highest peaks including K2. It is surrounded by lakes, deserts, and majestic mountain ranges.'
    },
    {
      'name': 'Swat',
      'image': 'assets/images/swat.jpg',
      'description':
      'Swat is known as the Switzerland of Pakistan for its stunning valleys, rivers, and lush green meadows.'
    },
    {
      'name': 'Murree',
      'image': 'assets/images/murree.jpg',
      'description':
      'Murree is a famous hill station near Islamabad, known for its cool weather, pine trees, and Mall Road.'
    },
    {
      'name': 'Gwadar',
      'image': 'assets/images/gwadar.jpg',
      'description':
      'Gwadar is a beautiful port city in Balochistan with clean beaches and growing importance due to the China-Pakistan Economic Corridor (CPEC).'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Travel Guide Pakistan")),
      drawer: AppDrawer(),
      body: SafeArea(
        child: GridView.builder(
          padding: EdgeInsets.all(10),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: destinations.length,
          itemBuilder: (context, index) {
            final place = destinations[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => PlaceDetailScreen(
                      name: place['name']!,
                      image: place['image']!,
                      description: place['description']!,
                    ),
                  ),
                );
              },
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                child: Column(
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(12),
                        ),
                        child: Image.asset(
                          place['image']!,
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: Text(
                        place['name']!,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.green),
            child: Text(
              'Travel Menu',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          ListTile(
            title: Text('Home'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => HomeScreen()),
              );
            },
          ),
          ListTile(
            title: Text('Popular Places'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => PlacesScreen()),
              );
            },
          ),
          ListTile(
            title: Text('About Pakistan'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => AboutScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}

class PlaceDetailScreen extends StatelessWidget {
  final String name;
  final String image;
  final String description;

  PlaceDetailScreen({
    required this.name,
    required this.image,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(image, fit: BoxFit.cover, width: double.infinity),
            Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                description,
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
            ),
            Center(
              child: ElevatedButton.icon(
                onPressed: () => Navigator.pop(context),
                icon: Icon(Icons.arrow_back),
                label: Text("Back to Home"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PlacesScreen extends StatelessWidget {
  final List<String> places = [
    'Faisal Mosque - Islamabad',
    'Badshahi Mosque - Lahore',
    'Minar-e-Pakistan - Lahore',
    'Lahore Fort - Lahore',
    'Mohenjo Daro - Sindh',
    'K2 - Gilgit Baltistan',
    'Pakistan Monument - Islamabad',
    'Clifton Beach - Karachi'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Popular Places"),
      ),
      body: ListView.builder(
        itemCount: places.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.place, color: Colors.green),
            title: Text(places[index]),
          );
        },
      ),
    );
  }
}

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("About Pakistan")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome to Pakistan!',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),
            Text(
              'Pakistan is a land of diversity and beauty. From the mountains of Gilgit-Baltistan '
                  'to the beaches of Balochistan, every corner tells a story. Explore culture, food, '
                  'heritage, and the unmatched hospitality of its people.',
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
            SizedBox(height: 20),
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  'assets/images/lahore_fort.jpg',
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton.icon(
                onPressed: () => Navigator.pop(context),
                icon: Icon(Icons.arrow_back),
                label: Text("Back to Home"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
