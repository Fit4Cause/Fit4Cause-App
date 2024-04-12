import 'package:fit4cause/utils/const.dart';
import 'package:fit4cause/utils/coupons.dart';
import 'package:flutter/material.dart';

class RewardPage extends StatefulWidget {
  final userCoins;

  RewardPage([this.userCoins = 40]);

  @override
  State<RewardPage> createState() => _RewardPageState();
}

class _RewardPageState extends State<RewardPage> with TickerProviderStateMixin {
  // int currentPageIndex = 0;
  late TabController _tabController;
  int activeTabIndex = 0;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    void setActiveTabIndex() {
      setState(() {
        activeTabIndex = _tabController.index;
      });
    }

    _tabController.addListener(setActiveTabIndex);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kwhiteColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(top: 30),
                child: const Text(
                  "Rewards",
                  style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w700,
                      color: kgreyColor),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurStyle: BlurStyle.outer,
                        blurRadius: 10,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(color: kwhiteColor)),
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: "Search",
                    prefixIcon: Icon(Icons.search),
                    border: InputBorder.none,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    // boxShadow: [
                    //   BoxShadow(
                    //     color: Colors.black12,
                    //     blurRadius: 3.0,
                    //     // spreadRadius: 0.5,
                    //     offset: Offset(1.0, 1.0),
                    //   )
                    // ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Container(
                      decoration: BoxDecoration(
                        // color: Colors.black.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: TabBar(
                        tabs: [
                          Tab(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                'Coupons',
                                style: TextStyle(
                                    color: activeTabIndex == 0
                                        ? kwhiteColor
                                        : kgreyColor),
                              ),
                            ),
                          ),
                          Tab(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                'Products',
                                style: TextStyle(
                                    color: activeTabIndex == 1
                                        ? kwhiteColor
                                        : kgreyColor),
                              ),
                            ),
                          ),
                        ],
                        indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: kgreenColor,
                        ),
                        controller: _tabController,
                        // isScrollable: true,
                        labelPadding:
                            const EdgeInsets.symmetric(horizontal: 40),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: <Widget>[
                    Center(
                      child: CouponList(),
                    ),
                    Center(
                      child: ProductList(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: GridView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.80, // Change
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: dummyHealthProducts
            .map((data) =>
                ProductCard(data.title, data.imageUrl, data.donations))
            .toList(),
      ),
    );
  }
}

class CouponList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: GridView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.80, // Change
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: coupons
            .map((data) =>
                ProductCard(data.title, data.imageUrl, data.donations))
            .toList(),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String title;
  final String imagePath;
  final String donation;

  ProductCard(this.title, this.imagePath, this.donation);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      // mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: const BoxDecoration(
            color: kgreyColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
          height: 150,
          width: double.maxFinite,
          child: Image.asset(imagePath, fit: BoxFit.cover),
        ),
        Container(
          color: kgreyColor,
          padding: const EdgeInsets.symmetric(vertical: 10),
          width: double.maxFinite,
          child: RichText(
            text: TextSpan(
              text: title,
              style: const TextStyle(color: kwhiteColor, fontSize: 16),
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
            color: kgreenColor,
          ),
          child: Padding(
            padding: const EdgeInsets.all(7.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.lock_rounded,
                  color: kwhiteColor,
                ),
                Container(
                  child: Text(
                    donation,
                    style: const TextStyle(color: kwhiteColor),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
