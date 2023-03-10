import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todolist/view/home_view.dart';

import 'helper.dart';

void main() {
  testWidgets('Find Material App', (tester) async {
    const testKey = Key('MyApp');

    await tester.pumpWidget(const MaterialApp(
      key: testKey,
      home: HomeView(),
    ));
    expect(find.byKey(testKey), findsOneWidget);
  });

  testWidgets('Find by Value Key Widget on HomeView', (tester) async {
    HomeView homeView = const HomeView();

    final title = find.byKey(const ValueKey('todo'));
    final listView = find.byKey(const ValueKey('listview'));
    final scaffold = find.byKey(const ValueKey('scaffold'));
    final floatingActionButton = find.byKey(const ValueKey('addButton'));

    await tester.pumpWidget(makeTestableWidget(child: homeView));

    await tester.tap(title);
    await tester.tap(listView);
    await tester.tap(scaffold);
    await tester.tap(floatingActionButton);

    expect(title, findsOneWidget);
    expect(listView, findsOneWidget);
    expect(scaffold, findsOneWidget);
    expect(floatingActionButton, findsOneWidget);
  });
}
