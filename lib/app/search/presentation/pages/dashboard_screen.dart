import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hackernews/app/search/presentation/bloc/home_page_bloc.dart';
import 'package:hackernews/app/search/presentation/widgets/news_item_list_view.dart';
import 'package:hackernews/di/injection_container.dart';

@RoutePage()
class DashBoradScreen extends StatefulWidget {
  const DashBoradScreen({Key? key}) : super(key: key);

  @override
  State<DashBoradScreen> createState() => _DashBoradScreenState();
}

class _DashBoradScreenState extends State<DashBoradScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hacker Ui"),
      ),
      body: BlocProvider(
        create: (context) => getIt<DashBoardBloc>()..add(FrontPageLoadEvent()),
        child: const NewItemListViewBuilder(),
      ),
    );
  }
}
