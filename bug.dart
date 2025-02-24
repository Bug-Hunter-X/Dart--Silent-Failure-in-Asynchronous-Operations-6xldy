```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      // Process the JSON response here
      final jsonData = jsonDecode(response.body);
      // Access data like jsonData['key']
    } else {
      // Handle non-200 status codes appropriately.  This is important!
      throw Exception('Failed to load data. Status code: ${response.statusCode}');
    }
  } catch (e) {
    // Handle exceptions (network errors, JSON decoding errors, etc.)
    print('Error fetching data: $e');
    // Consider rethrowing the exception, logging it to a service, or other more robust error handling
    rethrow; // Allows calling function to handle
  }
}
```