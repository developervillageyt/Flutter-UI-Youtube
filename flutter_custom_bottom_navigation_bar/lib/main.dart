import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const BottomNavigationBar(),
    );
  }
}

class BottomNavigationBar extends StatefulWidget {
  const BottomNavigationBar({super.key});

  @override
  State<BottomNavigationBar> createState() => _BottomNavigationBarState();
}

class _BottomNavigationBarState extends State<BottomNavigationBar> {
  late Offset offset;
  late double activeIndex;
  late IconData activeIcon;
  late String activeTabText;
  void onPresstabItem(double dx) {
    setState(() => {
          offset = Offset(dx, 0),
          activeIndex = dx,
          if (dx == 0)
            {activeIcon = Icons.dashboard, activeTabText = 'Dashboard'}
          else if (dx == 1)
            {activeIcon = Icons.contact_phone, activeTabText = 'Contacts'}
          else
            {activeIcon = Icons.settings, activeTabText = 'Settings'}
        });
  }

  @override
  void initState() {
    super.initState();
    offset = const Offset(0, 0);
    activeIndex = 0;
    activeIcon = Icons.dashboard;
    activeTabText = 'Dashboard';
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: const Center(
          child: Text('Developer village. Thank you for watching the video.')),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(10),
        height: 60,
        decoration: BoxDecoration(
            color: Colors.black, borderRadius: BorderRadius.circular(100)),
        child: Stack(
          children: [
            AnimatedSlide(
              offset: offset,
              curve: Curves.easeInOut,
              duration: const Duration(milliseconds: 500),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                width: (screenSize.width - 20) / 3,
                decoration: const BoxDecoration(
                    // color: Colors.red,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(100),
                        bottomLeft: Radius.circular(100))),
                child: Center(
                  child: Container(
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100)),
                    child: Center(
                        child: Container(
                      margin: const EdgeInsets.all(5),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              activeIcon,
                              color: Colors.red,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              activeTabText,
                              style: const TextStyle(color: Colors.red),
                            )
                          ],
                        ),
                      ),
                    )),
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                    child: InkWell(
                  onTap: (() => onPresstabItem(0)),
                  child: Center(
                    child: AnimatedOpacity(
                      opacity: activeIndex == 0 ? 0 : 1,
                      duration: const Duration(milliseconds: 500),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.dashboard,
                            color: Colors.white,
                          ),
                          Text(
                            'Dashboard',
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ),
                )),
                Expanded(
                    child: InkWell(
                  onTap: (() => onPresstabItem(1)),
                  child: Center(
                    child: AnimatedOpacity(
                      opacity: activeIndex == 1 ? 0 : 1,
                      duration: const Duration(milliseconds: 500),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.contact_phone,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Contacts',
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ),
                )),
                Expanded(
                    child: InkWell(
                  onTap: (() => onPresstabItem(2)),
                  child: Center(
                    child: AnimatedOpacity(
                      opacity: activeIndex == 2 ? 0 : 1,
                      duration: const Duration(milliseconds: 500),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.settings,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Setting',
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ),
                )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
