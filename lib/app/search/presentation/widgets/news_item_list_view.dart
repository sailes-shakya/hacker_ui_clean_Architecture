import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hackernews/app/search/presentation/bloc/home_page_bloc.dart';
import 'package:hackernews/app/search/presentation/widgets/common_search_bar.dart';
import 'package:hackernews/core/constant/text_style.dart';
import 'package:hackernews/core/enum/enum_utilis.dart';
import 'package:hackernews/core/extension/date_time_extension.dart';
import 'package:hackernews/core/utilis/debouncer.dart';

class NewItemListViewBuilder extends StatefulWidget {
  const NewItemListViewBuilder({
    super.key,
  });

  @override
  State<NewItemListViewBuilder> createState() => _NewItemListViewBuilderState();
}

class _NewItemListViewBuilderState extends State<NewItemListViewBuilder> {
  late ScrollController controller;
  final _debouncer = Debouncer();
  @override
  void initState() {
    controller = ScrollController()..addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashBoardBloc, DashBoardLoadState>(
      builder: (context, state) {
        return Column(
          children: [
            CommonSearchBar(
              key: const Key("searchBox"),
              onChange: (value) {
                _debouncer.call(() {
                  if (value!.isEmpty) {
                    context
                        .read<DashBoardBloc>()
                        .add(const FrontPageInitialEvent());
                  } else {
                    context.read<DashBoardBloc>().add(SearchEvent(value!));
                  }
                });
              },
            ),
            Expanded(
              child: ListView.builder(
                  controller: controller,
                  itemCount: state.hitEnititys.length + 1,
                  itemBuilder: (context, index) {
                    if (index == state.hitEnititys.length) {
                      return _buildLoader();
                    }
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              state.hitEnititys[index].title!,
                              style: TextStyleClass.titleBold(),
                            ),
                            Text(state.hitEnititys[index].author!),
                            Text(state.hitEnititys[index].url ?? ""),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                    '${state.hitEnititys[index].numComments ?? "0"} Comments'),
                                Text(
                                    '${state.hitEnititys[index].points!.toString()} points'),
                                Text(state.hitEnititys[index].createdAt!
                                    .formatDate()),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          ],
        );
      },
    );
  }

  Widget _buildLoader() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: context.read<DashBoardBloc>().state.isLoading == Operation.loading
          ? const Center(child: CircularProgressIndicator())
          : Container(),
    );
  }

  void _scrollListener() {
    if (controller.position.pixels == controller.position.maxScrollExtent) {
      context.read<DashBoardBloc>().add(FrontPageLoadEvent());
    }
  }
}
