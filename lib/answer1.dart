import 'package:flutter/material.dart';
import './component/navbar.dart';

class RegistrationForm extends StatefulWidget {
  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('โปรไฟล์ผู้ใช้'),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(200),
                child: Image.asset(
                  "asset/profile.jpg",
                  width: 150,
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ),

              SizedBox(height: 16),
              const Text(
                "ชื่อผู้ใช้ : Raveporn Supapanchai",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                "อีเมล : supapanchai_r@silpakorn.edu",
                style: TextStyle(fontSize: 13, color: Colors.grey),
              ),
              Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.settings, color: Colors.blue),
                    title: Text("การตั้งค่า"),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Icon(Icons.password, color: Colors.blue),
                    title: Text("เปลี่ยนรหัสผ่าน"),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.privacy_tip_rounded,
                      color: Colors.blue,
                    ),
                    title: Text("ความเป็นส่วนตัว"),
                    onTap: () {},
                  ),
                ],
              ),
              SizedBox(height: 16),

              Center(
                child: ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text("แก้ไขโปรไฟล์")));
                  },
                  child: Text('แก้ไขโปรไฟล์'),
                ),
              ),
              SizedBox(height: 16),

              Center(
                child: ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text("ออกจากระบบ")));
                  },
                  child: Text('ออกจากระบบ'),
                ),
              ),
            ],
          ),
        ),
        
      ),
            bottomNavigationBar: const BottomNavbar(currentIndex: 1),
    );
  }
}
