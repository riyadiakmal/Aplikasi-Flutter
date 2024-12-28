import 'package:flutter/material.dart';

class AssetSwitcher extends StatefulWidget {
  const AssetSwitcher({super.key});

  @override
  AssetSwitcherState createState() => AssetSwitcherState();
}

class AssetSwitcherState extends State<AssetSwitcher> {
  bool useSetOne = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Asset Switcher')),
      body: Column(
        children: [
          useSetOne
              ? Image.asset('assets/set1/image.png')
              : Image.asset('assets/set2/image.png'),
          Text(
            'Sample Text',
            style: TextStyle(fontFamily: useSetOne ? 'FontSet1' : 'FontSet2'),
          ),
          SwitchListTile(
            title: const Text('Switch Asset Set'),
            value: useSetOne,
            onChanged: (value) {
              setState(() {
                useSetOne = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
