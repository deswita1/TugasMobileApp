import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  // menentukan level berdasarkan exp
  Map<String, dynamic> getLevel(double exp) {
    if (exp >= 0.80) {
      return {
        "level": "Gold",
        "gradient": const LinearGradient(
          colors: [Color(0xFFFFD700), Color(0xFFFFA500)],
        ),
        "icon": Icons.workspace_premium,
      };
    } else if (exp >= 0.50) {
      return {
        "level": "Silver",
        "gradient": const LinearGradient(
          colors: [Color(0xFFC0C0C0), Color(0xFF9E9E9E)],
        ),
        "icon": Icons.military_tech,
      };
    } else {
      return {
        "level": "Bronze",
        "gradient": const LinearGradient(
          colors: [Color(0xFFCD7F32), Color(0xFF8B4513)],
        ),
        "icon": Icons.emoji_events,
      };
    }
  }

  @override
  Widget build(BuildContext context) {
    double exp = 0.78; // contoh exp
    final level = getLevel(exp);

    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 50),

            // FOTO PROFIL
            CircleAvatar(
              radius: 65,
              backgroundColor: Colors.white24,
              child: const Icon(Icons.person, size: 70, color: Colors.white),
            ),

            // NAMA
            const Text(
              "Deswita Anugrahpuspa A",
              style: TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            // BADGE LEVEL
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
              decoration: BoxDecoration(
                gradient: level["gradient"],
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withOpacity(0.1),
                    blurRadius: 10,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(level["icon"], color: Colors.black, size: 22),
                  const SizedBox(width: 8),
                  Text(
                    level["level"],
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // EXP BAR
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.05),
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.white12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "EXP Belanja: ${(exp * 100).toStringAsFixed(0)}%",
                    style: const TextStyle(
                      color: Colors.orange,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: LinearProgressIndicator(
                      value: exp,
                      minHeight: 10,
                      color: Colors.orange,
                      backgroundColor: Colors.white10,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // TITLE
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Voucher Diskon",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 15),

            // VOUCHER CARD
            _voucherCard("Diskon 20% Makanan", "Berlaku hingga 20 Des 2025"),
            _voucherCard("Gratis Ongkir", "Berlaku hingga 31 Des 2025"),
            _voucherCard("Cashback 10%", "Berlaku hingga 5 Jan 2026"),

            const SizedBox(height: 25),
          ],
        ),
      ),
    );
  }

  // WIDGET KARTU VOUCHER
  Widget _voucherCard(String title, String subtitle) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white.withOpacity(0.05),
        border: Border.all(color: Colors.white10),
        boxShadow: [
          BoxShadow(color: Colors.white.withOpacity(0.05), blurRadius: 10),
        ],
      ),
      padding: const EdgeInsets.all(18),
      child: Row(
        children: [
          const Icon(Icons.card_giftcard, size: 40, color: Colors.orange),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 3),
              Text(
                subtitle,
                style: TextStyle(color: Colors.white.withOpacity(0.7)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
