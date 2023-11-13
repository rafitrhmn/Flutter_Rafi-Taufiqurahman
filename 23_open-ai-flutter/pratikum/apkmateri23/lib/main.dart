import 'package:apkmateri23/service/api.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: SmartphoneForm(),
  ));
}

class ResultPage extends StatelessWidget {
  final String? recommendation;

  ResultPage({required this.recommendation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rekomendasi Smartphone'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 40),
        child: Container(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Text(
            'Rekomendasi: $recommendation',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}

class SmartphoneForm extends StatefulWidget {
  @override
  _SmartphoneFormState createState() => _SmartphoneFormState();
}

class _SmartphoneFormState extends State<SmartphoneForm> {
  final TextEditingController priceController = TextEditingController();
  String selectedCamera = '12 MP';
  String selectedStorage = '64 GB';

  List<String> cameraOptions = ['12 MP', '16 MP', '20 MP', '24 MP'];
  List<String> storageOptions = ['32 GB', '64 GB', '128 GB', '256 GB'];

  OpenAIService openAIService = OpenAIService(
      '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'); // Replace with your API key

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Smartphone Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: priceController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Harga Smartphone'),
            ),
            SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: selectedCamera,
              onChanged: (value) {
                setState(() {
                  selectedCamera = value!;
                });
              },
              items: cameraOptions.map((camera) {
                return DropdownMenuItem(
                  value: camera,
                  child: Text(camera),
                );
              }).toList(),
              decoration: InputDecoration(labelText: 'Kamera Smartphone'),
            ),
            SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: selectedStorage,
              onChanged: (value) {
                setState(() {
                  selectedStorage = value!;
                });
              },
              items: storageOptions.map((storage) {
                return DropdownMenuItem(
                  value: storage,
                  child: Text(storage),
                );
              }).toList(),
              decoration: InputDecoration(labelText: 'Penyimpanan Internal'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                // Validate if the price field is not empty
                if (priceController.text.isNotEmpty) {
                  double budget = double.parse(priceController.text);
                  String? recommendation =
                      await openAIService.getSmartphoneRecommendation(
                    budget,
                    int.parse(selectedStorage.split(' ')[0]),
                    int.parse(selectedCamera.split(' ')[0]),
                  );

                  // ignore: use_build_context_synchronously
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultPage(
                        recommendation: recommendation,
                      ),
                    ),
                  );
                } else {
                  // Show an error message or handle it in a way suitable for your app
                  print('Please enter a valid price.');
                }
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
