import 'package:flutter/material.dart';
import 'package:presensi_pegawai/views/dashboard_view.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    bool? _check = false;

    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50, bottom: 30),
                  child: Text(
                    'Presensi\nPegawai',
                    style: TextStyle(
                      fontSize: 45,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Card(
                  margin: EdgeInsets.only(top: 30, left: 20, right: 20),
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(20)),
                  color: Color.fromARGB(183, 255, 255, 255),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 30, left: 20, right: 20, bottom: 50),
                    child: Column(
                      children: [
                        SizedBox(height: 50),
                        TextField(
                          style: TextStyle(fontSize: 16, height: 0.5),
                          decoration: InputDecoration(
                            hintText: "Masukkan NIP Anda",
                            labelText: "NIP",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            fillColor: Colors.white,
                            filled: true,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextField(
                          style: TextStyle(fontSize: 16, height: 0.5),
                          decoration: InputDecoration(
                            hintText: "Masukkan Password Anda",
                            labelText: "Password",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            fillColor: Colors.white,
                            filled: true,
                          ),
                          obscureText: true,
                        ),
                        Row(
                          children: [
                            Checkbox(
                              value: _check,
                              onChanged: (bool? value) {
                                setState(() {
                                  _check =
                                      value; // ketika Checkbox diubah, nilai _isChecked juga diubah
                                });
                              },
                              shape: CircleBorder(),
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              visualDensity:
                                  VisualDensity.adaptivePlatformDensity,
                            ),
                            Text(
                              'Remember Me!',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                'Forgot Password?',
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (bc) {
                                  return DashboardView();
                                },
                              ),
                            );
                          },
                          child: Text('LOG IN'),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                              side: BorderSide(),
                            ),
                            backgroundColor: Color(0xFF032FF4),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void setState(void Function() fn) {}
}
