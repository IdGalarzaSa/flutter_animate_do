import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class NavigationPage extends StatelessWidget {
  static final String routeName = 'NavigationPage';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => _NotificationModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Notifications page'),
          backgroundColor: Colors.pink,
        ),
        floatingActionButton: _FloatingButton(),
        bottomNavigationBar: _NavigationBar(),
      ),
    );
  }
}

class _NavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final notificationModel = Provider.of<_NotificationModel>(context);

    return BottomNavigationBar(
      currentIndex: 0,
      selectedItemColor: Colors.pink,
      items: [
        BottomNavigationBarItem(
          icon: FaIcon(FontAwesomeIcons.bone),
          label: 'Bone',
        ),
        BottomNavigationBarItem(
          icon: Stack(
            children: [
              FaIcon(FontAwesomeIcons.bell),
              Positioned(
                  top: 0,
                  right: 0,
                  child: BounceInDown(
                    from: 20,
                    animate:
                        notificationModel.notificationNumber > 0 ? true : false,
                    child: Bounce(
                      controller: (controller) =>
                          notificationModel._bounceController = controller,
                      from: 20,
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          notificationModel.notificationNumber.toString(),
                          style: TextStyle(color: Colors.white, fontSize: 7),
                        ),
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                          color: Colors.redAccent,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  )),
            ],
          ),
          label: 'Notifications',
        ),
        BottomNavigationBarItem(
          icon: FaIcon(FontAwesomeIcons.cat),
          label: 'My cat',
        )
      ],
    );
  }
}

class _FloatingButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.pink,
      child: FaIcon(FontAwesomeIcons.play),
      onPressed: () {
        final notificationModel =
            Provider.of<_NotificationModel>(context, listen: false);

        notificationModel.notificationNumber =
            notificationModel.notificationNumber + 1;

        if (notificationModel.notificationNumber >= 2) {
          notificationModel._bounceController.forward(from: 0.0);
        }
      },
    );
  }
}

class _NotificationModel extends ChangeNotifier {
  int _notificationNumber = 0;
  AnimationController _bounceController;

  int get notificationNumber => this._notificationNumber;

  set notificationNumber(int newValue) {
    this._notificationNumber = newValue;
    notifyListeners();
  }

  AnimationController get bounceController => this._bounceController;

  set animationController(AnimationController newController) {
    this._bounceController = newController;
    notifyListeners();
  }
}
