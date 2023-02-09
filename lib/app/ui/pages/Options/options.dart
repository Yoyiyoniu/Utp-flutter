import 'package:flutter/material.dart';
import 'package:utp/app/ui/pages/Routes/Routes.dart';

class Options extends StatefulWidget {
  const Options({super.key});

  @override
  State<Options> createState() => _OptionsState();
}

class _OptionsState extends State<Options> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: TextButton(
        onPressed: () {
          Navigator.pushReplacementNamed(context, Routes.HOME);
        },
        child: const Text("PAGINA 2"),
      ),
    );
  }
}
