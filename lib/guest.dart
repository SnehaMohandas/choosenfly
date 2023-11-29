import "package:flutter/material.dart";

class GuestPage extends StatefulWidget {
  @override
  _GuestPageState createState() => _GuestPageState();
}

class _GuestPageState extends State<GuestPage> {
  int selectedNumber = 1;
  List<int> dropdownValues = List.generate(10, (index) => index + 1);
  List<List<int>> selectedValuesList = [[]];
  List<List<DropdownButton<int>>> dynamicDropdownsList = [[]];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          //title: Text(‘Dynamic Dropdown Example’),
          ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //  Text(‘Select a number:’),
            DropdownButton<int>(
              value: selectedNumber,
              onChanged: (value) {
                setState(() {
                  selectedNumber = value!;
                  selectedValuesList = List.generate(
                    value,
                    (index) => [dropdownValues[0]],
                  );
                  dynamicDropdownsList = List.generate(
                    value,
                    (index) => [
                      DropdownButton<int>(
                        value: selectedValuesList[index][0],
                        onChanged: (newValue) {
                          setState(() {
                            selectedValuesList[index][0] = newValue!;
                          });
                        },
                        items: dropdownValues
                            .map(
                              (itemValue) => DropdownMenuItem(
                                value: itemValue,
                                child: Text(itemValue.toString()),
                              ),
                            )
                            .toList(),
                      ),
                    ],
                  );
                });
              },
              items: dropdownValues
                  .map((value) => DropdownMenuItem(
                        value: value,
                        child: Text(value.toString()),
                      ))
                  .toList(),
            ),
            for (int i = 0; i < dynamicDropdownsList.length; i++)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Dropdown ${i + 1}:'), // Added label for each dropdown
                  for (var dropdown in dynamicDropdownsList[i])
                    Row(
                      children: [
                        Text('Selected value: '),
                        dropdown,
                      ],
                    ),
                  SizedBox(height: 10),
                ],
              ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
