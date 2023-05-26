import 'package:flutter/material.dart';
import 'package:nba_app/pages/app_bar/app_bar.dart';
import 'package:nba_app/pages/drawer/drawer_widget_page.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBarWidget(title: 'Dashboard'),
      drawer: const DrawerWidget(),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(50),
              ),
            ),
            child: Column(
              children: [
                const SizedBox(height: 50),
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 30),
                  title: Text('Hello Wesley!',
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.copyWith(color: Colors.white)),
                  subtitle: Text('Good Morning',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(color: Colors.white54)),
                  // trailing: const CircleAvatar(
                  //   radius: 30,
                  //   backgroundImage: AssetImage('assets/images/user.JPG'),
                  // ),
                ),
                const SizedBox(height: 30)
              ],
            ),
          ),
          // Container(
          //   color: Theme.of(context).primaryColor,
          //   child: Container(
          //     padding: const EdgeInsets.symmetric(horizontal: 30),
          //     decoration: const BoxDecoration(
          //         color: Colors.white,
          //         borderRadius:
          //             BorderRadius.only(topLeft: Radius.circular(200))),
          //     child: GridView.count(
          //       shrinkWrap: true,
          //       physics: const NeverScrollableScrollPhysics(),
          //       crossAxisCount: 2,
          //       crossAxisSpacing: 40,
          //       mainAxisSpacing: 30,
          //       children: [
          //         itemDashboard('Videos', CupertinoIcons.play_rectangle,
          //             Colors.deepOrange),
          //         itemDashboard(
          //             'Analytics', CupertinoIcons.graph_circle, Colors.green),
          //         itemDashboard(
          //             'Audience', CupertinoIcons.person_2, Colors.purple),
          //         itemDashboard(
          //             'Comments', CupertinoIcons.chat_bubble_2, Colors.brown),
          //         itemDashboard('Revenue', CupertinoIcons.money_dollar_circle,
          //             Colors.indigo),
          //         itemDashboard(
          //             'Upload', CupertinoIcons.add_circled, Colors.teal),
          //         itemDashboard(
          //             'About', CupertinoIcons.question_circle, Colors.blue),
          //         itemDashboard(
          //             'Contact', CupertinoIcons.phone, Colors.pinkAccent),
          //       ],
          //     ),
          //   ),
          // ),
          const SizedBox(height: 20)
        ],
      ),
    );
  }
}
