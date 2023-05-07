import 'package:flutter/material.dart';
import 'package:presensi_pegawai/provider/dashboard_provider.dart';
import 'package:presensi_pegawai/views/presensi_view.dart';
import 'package:provider/provider.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    final panels = [SizedBox(), DashboardPanel(), SizedBox(), PresensiView()];

    return Consumer<DashboardProvider>(
      builder: (context, provider, Widget) {
        return Scaffold(
          body: panels[provider.iMenu],
          bottomNavigationBar: TombolMenu(),
        );
      },
    );
  }
}

class DashboardPanel extends StatelessWidget {
  const DashboardPanel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          child: Container(
            child: Stack(
              children: [
                Image.asset('assets/background.png'),
                Padding(
                  padding: const EdgeInsets.all(45),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.asset(
                          'assets/background.png',
                          height: 80,
                        ),
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'NIP-93872',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'NIP-93872',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              'NIP-93872',
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 180),
          child: Card(
            margin: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.black),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Container(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Column(
                  children: [
                    Wrap(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (c) => PresensiView(),
                              ),
                            );
                          },
                          child: Card(
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            margin: EdgeInsets.all(15.0),
                            child: Padding(
                              padding: const EdgeInsets.all(25.0),
                              child: Column(
                                children: [
                                  Image.asset(
                                    'assets/attendance.png',
                                    width: 90,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    'Presensi',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class TombolMenu extends StatelessWidget {
  const TombolMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final t = context.read<DashboardProvider>();
    return BottomNavigationBar(
      currentIndex: t.iMenu,
      onTap: (value) {
        t.onklik(value);
      },
      items: [
        BottomNavigationBarItem(
          icon: Image.asset('assets/cv.png', width: 30),
          label: 'Riwayat',
        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/home.png', width: 30),
          label: 'Dashboard',
        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/logout.png', width: 30),
          label: 'Logout',
        ),
      ],
    );
  }
}
