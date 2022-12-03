import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_navigation_bloc/bloc/navigation_bloc.dart';
import 'package:flutter_navigation_bloc/screens/animation_holder.dart';
import 'package:flutter_navigation_bloc/screens/dashboard.dart';
import 'package:flutter_navigation_bloc/screens/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => NavigationBloc()..add(LoadNavigation()))
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({super.key, required this.title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  List<Widget> screens = [const DashBoard(), const Login()];
  int navSelectedIndex = 0;
  void _onTap(int index) {
    if (navSelectedIndex != index) {
      BlocProvider.of<NavigationBloc>(context).add(SwitchNavigation(
        screens[index],
      ));
      setState(() {
        navSelectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var navigationBlocRef = BlocProvider.of<NavigationBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.login),
            label: 'Login',
          ),
        ],
        currentIndex: navSelectedIndex,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        onTap: _onTap,
        type: BottomNavigationBarType.fixed,
      ),
      body: Center(
        child: BlocBuilder<NavigationBloc, NavigationState>(
          builder: ((context, state) {
            if (state is NavigationInitial) {
              return const CircularProgressIndicator(
                color: Colors.indigo,
              );
            }

            if (state is NavigationLoaded) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  state.currentPage,
                ],
              );
            } else {
              return const Text("something went bad");
            }
          }),
        ),
      ),
    );
  }
}
