import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({super.key});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  late Size screenSize;
  bool isSearchClicked = false;
  double searchContainerWidth = 0;
  double toolbarActionItemWidth = 124;

  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size;
    double toolbarWidth =
        getWidthPercentage(percent: 90, screen: screenSize.width);
    return Container(
      color: Colors.black,
      child: Row(
        children: [
          SizedBox(
            width: (screenSize.width > 550 && 200 < screenSize.width)
                ? 50
                : getWidthPercentage(percent: 10, screen: screenSize.width),
            child: buildNavigationContainer(),
          ),
          SizedBox(
            width: getWidthPercentage(percent: 90, screen: screenSize.width),
            child: buildToolbarContainer(toolbarWidth),
          )
        ],
      ),
    );
  }

  Widget buildNavigationContainer() {
    return const Center(
      child: Icon(
        Icons.arrow_back,
        color: Colors.white,
      ),
    );
  }

  Widget buildToolbarContainer(toolbarWidth) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(50)),
          padding: const EdgeInsets.all(5),
          margin: const EdgeInsets.only(left: 5, right: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              AnimatedOpacity(
                opacity: isSearchClicked ? 1 : 0,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.black),
                  width: searchContainerWidth,
                  height: 40,
                  child: Center(
                    child: Container(
                      margin: const EdgeInsets.all(5),
                      child: TextField(
                        decoration: InputDecoration(
                            labelText: 'Search',
                            border: inputBorder(),
                            labelStyle: const TextStyle(color: Colors.white)),
                      ),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () => switchSearchContainer(toolbarWidth),
                child: const Icon(
                  Icons.search,
                  color: Colors.black,
                ),
              ),
              const Padding(
                  padding: EdgeInsets.all(8), child: Icon(Icons.notifications)),
              const CircleAvatar(
                backgroundColor: Colors.black,
                child: Text('AM'),
              )
            ],
          ),
        )
      ],
    );
  }

  switchSearchContainer(double toolbarWidth) {
    setState(() {
      if (!isSearchClicked) {
        searchContainerWidth = toolbarWidth > (300 + toolbarActionItemWidth)
            ? 300
            : (getWidthPercentage(percent: 100, screen: toolbarWidth) -
                toolbarActionItemWidth);
      } else {
        searchContainerWidth = 0;
      }
      isSearchClicked = !isSearchClicked;
    });
  }
}

double getWidthPercentage({required int percent, required double screen}) {
  return (percent / 100) * screen;
}

inputBorder() {
  return const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(20)));
}
