import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class SettingsTab extends StatefulWidget {
  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  @override
  final List<String> items = [
    'English',
    'Arabic',
  ];
  final List<String> modes = [
    'Dark',
    'Light',
  ];

  String? selectedValue;
  String? selectedMode;



  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 20, top: 20),
                  child: Text(
                    "Language",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                DropdownButtonHideUnderline(
                  child: DropdownButton2<String>(
                    isExpanded: true,
                    hint: const Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Language',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white
                                // color: Colors.yellow,
                                ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    items: items
                        .map((String item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                                // overflow: TextOverflow.ellipsis,
                              ),
                            ))
                        .toList(),
                    value: selectedValue,
                    onChanged: (String? value) {
                      setState(() {
                        selectedValue = value;
                      });
                    },
                    buttonStyleData: ButtonStyleData(
                      height: 50,
                      width: 300,
                      padding: const EdgeInsets.only(left: 14, right: 14),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color: Colors.black26,
                        ),
                        color: Colors.blue,
                      ),
                      elevation: 2,
                    ),
                    iconStyleData: const IconStyleData(
                      iconEnabledColor: Colors.white,
                      iconDisabledColor: Colors.white,
                    ),
                    dropdownStyleData: DropdownStyleData(
                      maxHeight: 200,
                      width: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Colors.blue,
                      ),
                    ),
                    menuItemStyleData: const MenuItemStyleData(
                      height: 40,
                      padding: EdgeInsets.only(left: 15),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Text("Mode",style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),),
                DropdownButtonHideUnderline(
                  child: DropdownButton2<String>(
                    isExpanded: true,
                    hint: const Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Mode',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white
                              // color: Colors.yellow,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    items:modes
                        .map((String modes) => DropdownMenuItem<String>(
                      value: modes,
                      child: Text(
                        modes,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        // overflow: TextOverflow.ellipsis,
                      ),
                    ))
                        .toList(),
                    value: selectedMode,
                    onChanged: (String? value) {
                      setState(() {
                        selectedMode = value;
                      });
                    },
                    buttonStyleData: ButtonStyleData(
                      height: 50,
                      width: 300,
                      padding: const EdgeInsets.only(left: 14, right: 14),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color: Colors.black26,
                        ),
                        color: Colors.blue,
                      ),
                      elevation: 2,
                    ),
                    iconStyleData: const IconStyleData(
                      iconEnabledColor: Colors.white,
                      iconDisabledColor: Colors.white,
                    ),
                    dropdownStyleData: DropdownStyleData(
                      maxHeight: 200,
                      width: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Colors.blue,
                      ),
                    ),
                    menuItemStyleData: const MenuItemStyleData(
                      height: 40,
                      padding: EdgeInsets.only(left: 15),
                    ),
                  ),
                ),

              ],
            )));
  }
}
