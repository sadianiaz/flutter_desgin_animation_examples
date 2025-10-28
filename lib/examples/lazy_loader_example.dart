import 'package:flutter/material.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

class LazyLoaderExample extends StatefulWidget {
  const LazyLoaderExample({super.key});

  @override
  State<LazyLoaderExample> createState() => _LazyLoaderExampleState();
}

class _LazyLoaderExampleState extends State<LazyLoaderExample> {
  List<int> data = []; // list to hold numbers
  int currentLength = 0;
  final int increment = 10; // items to load per scroll

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadMore(); // load first items
  }

  void _loadMore() {
    setState(() => isLoading = true);

    Future.delayed(const Duration(seconds: 1), () {
      final newData = List.generate(
        increment,
        (index) => currentLength + index + 1,
      );
      setState(() {
        data.addAll(newData);
        currentLength = data.length;
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lazy Loader Example'),
        backgroundColor: Colors.teal,
      ),
      body: LazyLoadScrollView(
        isLoading: isLoading,
        onEndOfPage: _loadMore,
        child: ListView.builder(
          itemCount: data.length + (isLoading ? 1 : 0),
          itemBuilder: (context, index) {
            if (index == data.length) {
              return const Padding(
                padding: EdgeInsets.all(16.0),
                child: Center(child: CircularProgressIndicator()),
              );
            }
            return ListTile(
              title: Text('Item ${data[index]}'),
              leading: const Icon(Icons.list),
            );
          },
        ),
      ),
    );
  }
}
