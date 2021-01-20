import 'package:flutter/material.dart';

class DrawerMenuListItem extends StatelessWidget {
  final String name;

  const DrawerMenuListItem({
    Key key,
    @required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(name),
      onTap: () {
        print('$name tapped');
      },
    );
  }
}

class DrawerMenuList extends StatelessWidget {
  const DrawerMenuList();

  static const _itemsNames = <String>[
    'Favorites',
    'Top News',
    'Categories',
  ];

  Widget _buildMenuItemsWidgets(List<Widget> items) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) => items[index],
      itemCount: items.length,
    );
  }

  @override
  Widget build(BuildContext context) {
    final items = <DrawerMenuListItem>[];

    for (var i = 0; i < _itemsNames.length; i++) {
      items.add(DrawerMenuListItem(name: _itemsNames[i]));
    }

    final listView = Container(
      height: double.maxFinite,
      child: _buildMenuItemsWidgets(items),
    );

    return listView;
  }
}