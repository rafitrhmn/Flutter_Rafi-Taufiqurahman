import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class OpenAIService {
  final String apiKey;
  final String apiUrl = 'https://api.openai.com/v1/chat/completions';

  OpenAIService(this.apiKey);

  Future<String?> getSmartphoneRecommendation(
      double budget, int storageGB, int cameraMP) async {
    try {
      final data = {
        "model": "gpt-3.5-turbo",
        "messages": [
          {"role": "system", "content": "You are a helpful assistant."},
          {
            "role": "user",
            "content":
                "Berikan saya rekomendasi smartphone dengan harga Rp$budget memiliki kamera $cameraMP MP dan kapasitas penyimpanan sebesar $storageGB GB"
          }
        ],
        "temperature": 0.7,
        "max_tokens": 50
      };

      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $apiKey',
        },
        body: jsonEncode(data),
      );

      if (response.statusCode == 200) {
        // final jsonResponse = json.decode(response.body);
        // return jsonResponse['choices'][0]['text'];
        print('Response body: ${response.body}');
        final jsoonResponse = jsonDecode(response.body);
        return jsoonResponse['choices'][0]['message']['content'];
      } else {
        throw Exception('Failed to get smartphone recommendation');
      }
    } catch (e) {
      // Handle exceptions (e.g., network errors, parsing errors) here
      print('Error: $e');
      throw Exception(' hai Failed to get smartphone recommendation');
    }
  }
}
