import 'package:flutter/material.dart';
import 'package:kiwi/kiwi.dart' as kiwi;
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:matchymatchy/domain/domain.dart';
import 'package:matchymatchy/presentation/screens/multi_screen.dart';
import 'package:matchymatchy/presentation/widgets/home_notinit_widget.dart';
import 'package:matchymatchy/presentation/widgets/home_init_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  HomeBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<HomeBloc>(context);
    bloc.setup();
    bloc.intentToMultiScreen.listen((_) => _openMultiScreen());
    bloc.snackBar.listen((message) => _showSnackBar(message));
    bloc.emitEvent(HomeEvent.checkIfUserLogged());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        color: Colors.blueAccent,
        child: Stack(children: [
          Positioned.fill(
              child: Center(
            child: Opacity(
              opacity: 0.5,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 20.0),
                      child: Image.asset("assets/images/image_01.png",
                          fit: BoxFit.fill),
                    ),
//                    Padding(
//                      padding: EdgeInsets.only(top: 200.0),
//                      child:
//                      Image.asset("assets/images/image_02.png", fit: BoxFit.fill),
//                    ),
                  ]),
            ),
          )),
          BlocEventStateBuilder<HomeEvent, HomeState>(
            bloc: bloc,
            builder: (context, state) {
              switch (state.type) {
                case HomeStateType.initLogged:
                  return HomeInitWidget(user: state.user, bloc: bloc);
                  break;
                case HomeStateType.initNotLogged:
                  return HomeNotInitWidget(bloc: bloc);
                  break;
                case HomeStateType.notInit:
                  return Center(
                    child: SpinKitRotatingPlain(
                      color: Colors.blue[100],
                      size: 80.0,
                    ),
                  );
                  break;
                default:
                  return Container();
              }
            },
          ),
        ]),
      ),
    );
  }

  void _showSnackBar(String message) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(message)));
  }

  void _openMultiScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BlocProvider(
          child: MultiScreen(heroTag: 'multibutton'),
          bloc: kiwi.Container().resolve<MultiBloc>(),
        ),
      ),
    );
  }
}
