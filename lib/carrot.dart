import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        home: SafeArea(
            bottom: false,
            top: false,
            child: Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.white,
                  title: Row(children: const [
                    Text('금호동3가',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, color: Colors.black)),
                    Icon(Icons.arrow_drop_down_rounded, color: Colors.black)
                  ]),
                  actions: [
                    Container(
                      child: const Icon(Icons.search, color: Colors.black),
                      padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                    ),
                    Container(
                      child: const Icon(Icons.menu, color: Colors.black),
                      padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                    ),
                    Container(
                      child:
                          const Icon(Icons.notifications, color: Colors.black),
                      padding: const EdgeInsets.fromLTRB(8, 0, 16, 0),
                    ),
                  ],
                ),
                body: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Row(
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: SizedBox(
                                  height: 120,
                                  width: 120,
                                  child: Image.asset('assets/images/camera.jpg',
                                      cacheWidth: 360, fit: BoxFit.cover))),
                          SizedBox(
                              height: 120,
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 220,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16),
                                      child: const Text(
                                          '캐논 DSLR 100D (단렌즈, 충전기 16기가SD 포함)',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16)),
                                    ),
                                    Container(
                                      width: 220,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16),
                                      child: const Text('성동구 행당동-끌올 10분 전',
                                          style: TextStyle(
                                              color: Color(0xff4f4f4f),
                                              fontSize: 12)),
                                    ),
                                    Container(
                                      width: 220,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16),
                                      child: const Text('210,000원',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                    SizedBox(
                                        width: 220,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            const Icon(Icons.favorite_border,
                                                color: Colors.red),
                                            Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 2),
                                                child: const Text('4',
                                                    style: TextStyle(
                                                      color: Colors.black54,
                                                      fontSize: 12,
                                                    )))
                                          ],
                                        ))
                                  ])),
                        ],
                      ),
                    )
                  ],
                ),
                bottomNavigationBar: BottomAppBar(
                    child: SizedBox(
                        height: 50,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              Icon(Icons.phone),
                              Icon(Icons.message),
                              Icon(Icons.contact_page)
                            ]))))));
  }
}
