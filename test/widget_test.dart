import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Widget Test Example', (WidgetTester tester) async {
    // Build a MaterialApp with the widget under test
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: MyWidget(),
      ),
    ));

    // Verify that the widget has the correct text
    expect(find.text('Hello, World!'), findsOneWidget);

    // Example of interacting with the widget
    // Tap the widget and trigger a rebuild
    await tester.tap(find.text('Hello, World!'));
    await tester.pump();

    // Verify that the widget shows new text after interaction
    expect(find.text('Changed!'), findsOneWidget);
  });
}

// Example widget to test
class MyWidget extends StatefulWidget {

  const MyWidget({super.key});

  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  String text = 'Hello, World!';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          text = 'Changed!';
        });
      },
      child: Text(text),
    );
  }
}
