```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      //Process JSON data
    } else {
      //Handle error response codes.  Provide specific error messages.
      throw Exception('HTTP request failed with status: ${response.statusCode}.  Response body: ${response.body}');
    }
  } on FormatException catch (e) {
    // Handle JSON decoding errors specifically
    print('JSON decoding error: $e');
    rethrow;
  } on SocketException catch (e) {
    // Handle network errors separately
    print('Network error: $e');
    rethrow;
  } catch (e) {
    // Handle other exceptions
    print('An unexpected error occurred: $e');
    rethrow; // Let the calling function know there was a problem
  }
}
```