import 'package:flutter/material.dart';

abstract class SelectableItem {
  String get displayedName;
}

class GenericPicker<T extends SelectableItem> extends StatefulWidget {
  final List<T> items;
  final void Function(T selectedItem) onSelected;
  final String title;

  const GenericPicker({
    super.key,
    required this.items,
    required this.onSelected,
    this.title = 'Select Item',
  });

  @override
  State<GenericPicker<T>> createState() => _GenericPickerState<T>();
}

class _GenericPickerState<T extends SelectableItem>
    extends State<GenericPicker<T>> {
  late List<T> _filteredItems;
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _filteredItems = widget.items;
  }

  void _filterItems(String query) {
    setState(() {
      _searchQuery = query.toLowerCase();
      _filteredItems =
          widget.items.where((item) {
            return item.displayedName.toLowerCase().contains(_searchQuery);
          }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.title),
      content: SizedBox(
        width: double.maxFinite,
        height: 400,
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                labelText: 'Search',
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: _filterItems,
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: _filteredItems.length,
                itemBuilder: (context, index) {
                  final item = _filteredItems[index];
                  return ListTile(
                    title: Text(item.displayedName),
                    onTap: () {
                      widget.onSelected(item);
                      Navigator.pop(context);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
