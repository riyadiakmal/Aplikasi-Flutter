import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DynamicFontApp extends StatelessWidget {
  const DynamicFontApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(
          bodyMedium: TextStyle(fontFamily: 'MyLocalFont'), // Font Lokal
        ),
      ),
      home: const FontSwitcher(),
    );
  }
}

class FontSwitcher extends StatefulWidget {
  const FontSwitcher({super.key});

  @override
  FontSwitcherState createState() => FontSwitcherState();
}

class FontSwitcherState extends State<FontSwitcher> {
  bool useGoogleFont = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Font Switcher')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'The ordinary storyline and shallow characterizations make this novel stand outbut the writing skill is what ultimately makes it a success. The sweet and heartwarming romance between the ML and FL is beautifully portrayed and improves as the story progresses. The misunderstanding between the two leads to cute and caring moments, and the cliché ending is made unforgettable by the writers mastery',
            style: useGoogleFont
                ? GoogleFonts.roboto(fontSize: 20) // Google Font
                : const TextStyle(fontFamily: 'MyLocalFont', fontSize: 20),
          ),
          const SizedBox(height: 20),
          SwitchListTile(
            title: const Text('Use Google Font'),
            value: useGoogleFont,
            onChanged: (value) {
              setState(() {
                useGoogleFont = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
