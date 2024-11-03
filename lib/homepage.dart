import 'package:flutter/material.dart';

class ParkVisionApp extends StatelessWidget {
  const ParkVisionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ParkVision',
      theme: ThemeData(
        primaryColor: Colors.grey[800],
        fontFamily: 'Arial',
      ),
      home: LandingPage(),
    );
  }
}

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromARGB(255, 236, 233, 233), 
        child: Scaffold(
          backgroundColor: Colors.transparent, // Agar tidak menimpa gradien
          appBar: AppBar(
            backgroundColor: Colors.white,  
            title: Row(
              children: [
                Image.asset(
                  './assets/images/logo_parkvision.png',
                  height: 50, // Sesuaikan ukuran logo
                ),
                SizedBox(width: 8),
              ],
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Center(
                  child: Text(
                    'LOGIN',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16, // Sesuaikan ukuran teks
                    ),
                  ),
                ),
              ),
            ],
          ),
          body: LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 600) {
                return DesktopLayout();
              } else {
                return MobileLayout();
              }
            },
          ),
        ),
      ),
    );
  }
}


class DesktopLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  height: 300,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    image: DecorationImage(
                      image: AssetImage(
                          './assets/images/parkir.jpg'), // Path gambar
                      fit: BoxFit.cover, // Sesuaikan tampilan gambar
                    ),
                  ),
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                flex: 1,
                child: StatusSlot(),
              ),
            ],
          ),
          SizedBox(height: 16),
          ParkingSlots(),
        ],
      ),
    );
  }
}

class MobileLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              image: DecorationImage(
                image: AssetImage('./assets/images/parkir.jpg'), // Path gambar
                fit: BoxFit.cover, // Sesuaikan tampilan gambar
              ),
            ),
          ),
          SizedBox(height: 16),
          StatusSlot(),
          SizedBox(height: 16),
          ParkingSlots(),
        ],
      ),
    );
  }
}

class StatusSlot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white, // Warna putih untuk container atas
            borderRadius: BorderRadius.circular(16.0), // Rounded corners
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 4,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // _buildLegend(Colors.grey, 'Kendaraan'),
              _buildLegend(Colors.green, 'Kosong'),
              _buildLegend(Colors.red, 'Melanggar'),
              _buildLegend(Colors.blue, 'Terisi'),
            ],
          ),
        ),
        SizedBox(height: 8), // Jarak antara container putih dan merah
        Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white, // Warna merah untuk container bawah
            borderRadius: BorderRadius.circular(16.0), // Rounded corners
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 4,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'SLOT STATUS',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20, // Sesuaikan ukuran font
                ),
              ),
              Text(
                'Penghitungan kendaraan yang diparkir\nStatus terkini jumlah slot parkir',
                style: TextStyle(fontSize: 14), // Sesuaikan ukuran font
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16.0),
                    child: _buildSlotCounter(Colors.black, Colors.green, '20'),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16.0),
                    child: _buildSlotCounter(Colors.black, Colors.red, '0'),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16.0),
                    child: _buildSlotCounter(Colors.black, Colors.blue, '4'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildLegend(Color color, String text) {
    return Row(
      children: [
        Container(
          width: 20, // Sesuaikan ukuran ikon
          height: 20,
          decoration: BoxDecoration(
            border: Border.all(color: color, width: 2), // Warna border
            color: Colors.white, // Background ikon
          ),
        ),
        SizedBox(width: 8),
        Text(
          text,
          style: TextStyle(
            fontSize: 14, // Sesuaikan ukuran teks
            fontWeight: FontWeight.bold, // Teks tebal
          ),
        ),
      ],
    );
  }

  Widget _buildSlotCounter(Color bgColor, Color textColor, String count) {
    return Container(
      width: 80,
      height: 80,
      color: bgColor, // Background hitam seperti di desain
      child: Center(
        child: Text(
          count,
          style: TextStyle(
            color: textColor, // Warna angka
            fontSize: 40, // Ukuran font besar
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class ParkingSlots extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get the screen width
    final screenWidth = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'BLOK A',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16, // Adjust font size
          ),
        ),
        SizedBox(height: 8),
        // Check if the screen width is greater than 600 for desktop layout
        if (screenWidth > 600)
          // Desktop layout: 1 row for BLOK A
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(
                12, (index) => ParkingSlot(slot: 'A${index + 1}')),
          )
        else
          // Mobile layout: 2 rows for BLOK A
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                    6, (index) => ParkingSlot(slot: 'A${index + 1}')),
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                    6, (index) => ParkingSlot(slot: 'A${index + 7}')),
              ),
            ],
          ),
        SizedBox(height: 16),
        Text(
          'BLOK B',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16, // Adjust font size
          ),
        ),
        SizedBox(height: 8),
        // Check if the screen width is greater than 600 for desktop layout
        if (screenWidth > 600)
          // Desktop layout: 1 row for BLOK B
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(
                12, (index) => ParkingSlot(slot: 'B${index + 1}')),
          )
        else
          // Mobile layout: 2 rows for BLOK B
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                    6, (index) => ParkingSlot(slot: 'B${index + 1}')),
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                    6, (index) => ParkingSlot(slot: 'B${index + 7}')),
              ),
            ],
          ),
      ],
    );
  }
}

class ParkingSlot extends StatelessWidget {
  final String slot;
  final bool isSelected;

  const ParkingSlot({required this.slot, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 80,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isSelected ? Colors.blue : Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.black),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 4,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Text(
        slot,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
