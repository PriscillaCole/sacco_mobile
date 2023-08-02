// greeting_helper.dart

String getGreeting() {
  final DateTime now = DateTime.now();

  if (now.hour < 12) {
    return "Good Morning";
  } else if (now.hour < 17) {
    return "Good Afternoon";
  } else {
    return "Good Evening";
  }
}
