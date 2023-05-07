import 'package:flutter/material.dart';
import 'package:presensi_pegawai/provider/dashboard_provider.dart';
import 'package:presensi_pegawai/provider/peta_provider.dart';
import 'package:presensi_pegawai/views/login_view.dart';
import 'package:provider/provider.dart';

void main(List<String> args) {
  runApp(
    MultiProvider(
      builder: (context, Widget) {
        context.read<PetaProvider>().start_searlok();

        return MaterialApp(
          home: LoginView(),
        );
      },
      providers: [
        ChangeNotifierProvider(create: (c) => DashboardProvider()),
        ChangeNotifierProvider(create: (c) => PetaProvider()),
      ],
    ),
  );
}
