import 'package:flutter/material.dart';
import './component/navbar.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        backgroundColor: Colors.orange,
      ),
      body: Center(
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset(
                    "asset/profile.jpg",
                    width: 400,
                    height: 400,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Raveporn Supapanchai",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.book, // ใช้ไอคอนโปรไฟล์ที่ถูกต้อง
                      size: 30,
                      color: Colors.orange,
                    ),
                    SizedBox(width: 40),
                    Text(
                      "Silpakorn University",
                      style: TextStyle(fontSize: 20, color: Colors.grey),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.phone, // ใช้ไอคอนโปรไฟล์ที่ถูกต้อง
                      size: 30,
                      color: Colors.orange,
                    ),
                    SizedBox(width: 10),
                    Text(
                      "098-378-7681",
                      style: TextStyle(fontSize: 20, color: Colors.grey),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.email, // ใช้ไอคอนโปรไฟล์ที่ถูกต้อง
                      size: 30,
                      color: Colors.orange,
                    ),
                    SizedBox(width: 10),
                    Text(
                      "supapanchai_r@silpakorn.edu",
                      style: TextStyle(fontSize: 20, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavbar(currentIndex: 0),
    );
  }
}
