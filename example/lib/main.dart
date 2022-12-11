import 'package:flutter/material.dart';
import 'package:form_dropdown_overlay/form_dropdown_overlay.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Map? selectedData;
  List<Map> dataList = [
    {
      'id': 0,
      'name': "JAKARTA",
    },
    {
      'id': 1,
      'name': "SURABAYA",
    },
    {
      'id': 2,
      'name': "MAKASSAR",
    },
    // {
    //   'id': 3,
    //   'name': "BANDUNG",
    // },
    // {
    //   'id': 4,
    //   'name': "TUBAN",
    // },
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ...List.generate(20, (index) => ListTile(
                title: Text("TEXT $index"),
              )),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownOverlay<Map>(
                  value: selectedData,
                  dataList: dataList,
                  itemBuilder: (ctx, data) {
                    return ListTile(
                      onTap: () {
                        setState(() {
                          selectedData = data;
                        });
                        FocusScope.of(ctx).unfocus();
                      },
                      title: Text(data!['name']),
                    );
                  },
                  builder: (ctx, data, isOpen, hasFocus) {
                    return Material(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        side: BorderSide(
                          color: hasFocus ? Colors.blue : Colors.black,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(data != null ? data['name'] : "silahkan pilih satu..."),
                            ),
                            Icon(isOpen ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              ...List.generate(20, (index) => ListTile(
                title: Text("TEXT $index"),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
