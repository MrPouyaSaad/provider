import 'package:floating_snackbar/floating_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/screens/home/home_screen.dart';
import 'package:provider/screens/oreders/orders_screen.dart';
import 'package:provider/screens/products/products_screen.dart';
import 'package:provider/widgets/badge.dart';

const int homeIndex = 0;
const int ordersIndex = 1;
const int productsIndex = 2;

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int selectedScreenIndex = homeIndex;
  final List<int> _history = [];

  final GlobalKey<NavigatorState> _homeKey = GlobalKey();
  final GlobalKey<NavigatorState> _cartKey = GlobalKey();
  final GlobalKey<NavigatorState> _profileKey = GlobalKey();

  late final map = {
    homeIndex: _homeKey,
    ordersIndex: _cartKey,
    productsIndex: _profileKey,
  };

  bool canPop = false;

  Future<bool> _onWillPop(bool isPop) async {
    final NavigatorState currentSelectedTabNavigatorState =
        map[selectedScreenIndex]!.currentState!;
    if (currentSelectedTabNavigatorState.canPop()) {
      currentSelectedTabNavigatorState.pop();
      return isPop;
    } else if (_history.isNotEmpty) {
      setState(() {
        selectedScreenIndex = _history.last;
        _history.removeLast();
      });
      return isPop;
    } else {
      setState(() {
        floatingSnackBar(
          message: 'برای خروج دوبار دکمه برگشت را بزنید!',
          context: context,
          textColor: Colors.white,
          textStyle: const TextStyle(
            color: Colors.white,
          ),
          duration: const Duration(milliseconds: 3000),
          backgroundColor: Theme.of(context).colorScheme.onSurface,
        );
        canPop = true;
      });
      Future.delayed(const Duration(seconds: 2)).then((value) => setState(() {
            canPop = false;
          }));
    }

    return true;
  }

  @override
  void initState() {
    // cartRepository.count();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final deActiveColor =
        Theme.of(context).colorScheme.secondary.withOpacity(0.7);

    return Directionality(
      textDirection: TextDirection.rtl,
      child: PopScope(
        canPop: canPop,
        // ignore: deprecated_member_use
        onPopInvoked: _onWillPop,
        child: Scaffold(
          body: IndexedStack(
            index: selectedScreenIndex,
            children: [
              _navigator(_homeKey, homeIndex, const HomeScreen()),
              _navigator(_cartKey, ordersIndex, const OrdersScreen()),
              _navigator(_profileKey, productsIndex, const ProductsScreen()),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: Theme.of(context).colorScheme.primary,
            unselectedItemColor: Theme.of(context).colorScheme.secondary,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            type: BottomNavigationBarType.shifting,
            items: [
              BottomNavigationBarItem(
                activeIcon: Icon(Icons.donut_small),
                icon: Icon(
                  Icons.donut_small,
                  color: deActiveColor,
                ),
                label: 'داشبورد',
              ),
              BottomNavigationBarItem(
                  activeIcon: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Icon(Icons.shopping_bag),
                      Positioned(
                        right: -10,
                        child: CounterBadge(value: 5, isActive: true),
                      )
                    ],
                  ),
                  icon: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Icon(
                        Icons.shopping_bag,
                        color: deActiveColor,
                      ),
                      Positioned(
                        right: -10,
                        child: CounterBadge(value: 5),
                      )
                    ],
                  ),
                  label: 'سفارشات'),
              BottomNavigationBarItem(
                  activeIcon: Icon(Icons.widgets),
                  icon: Icon(
                    Icons.widgets,
                    color: deActiveColor,
                  ),
                  label: 'محصولات من'),
              // BottomNavigationBarItem(
              //     activeIcon: Icon(CupertinoIcons.person_fill),
              //     icon: Icon(CupertinoIcons.person),
              //     label: 'پروفایل'),
            ],
            currentIndex: selectedScreenIndex,
            onTap: (selectedIndex) {
              setState(() {
                _history.remove(selectedScreenIndex);
                _history.add(selectedScreenIndex);
                selectedScreenIndex = selectedIndex;
                canPop = false;
              });
            },
          ),
        ),
      ),
    );
  }

  Widget _navigator(GlobalKey key, int index, Widget child) {
    return key.currentState == null && selectedScreenIndex != index
        ? Container()
        : Navigator(
            key: key,
            onGenerateRoute: (settings) => MaterialPageRoute(
              builder: (context) => Offstage(
                  offstage: selectedScreenIndex != index, child: child),
            ),
          );
  }
}
