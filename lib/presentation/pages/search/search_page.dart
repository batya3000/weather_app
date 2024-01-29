import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/constants/constants.dart';
import 'package:weather_app/core/design/dimensions.dart';
import 'package:weather_app/core/design/styles.dart';
import 'package:weather_app/core/di/get_it.dart';
import 'package:weather_app/presentation/pages/search/bloc/search_page_bloc.dart';
import 'package:weather_app/presentation/pages/weather/weather_page.dart';
import 'package:weather_app/presentation/widgets/content_card.dart';
import 'package:weather_app/presentation/widgets/loading_ui.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: const Text("Поиск"),
    );
  }

  Widget _buildBody() {
    return BlocProvider<SearchPageBloc>(
      create: (context) => getIt<SearchPageBloc>()
        ..add(const QueryChangedEvent("")),

      child: BlocBuilder<SearchPageBloc, SearchPageState>(
          builder: (context, state) {
            if(state is SearchPageLoading) {
              return const LoadingUI();
            }

            if(state is SearchPageContent) {

              return _buildContentUI(context, state);
            }
            return const SizedBox();
          }
      ),
    );
  }

  Widget _buildContentUI(BuildContext context, SearchPageContent state) {
    return Padding(
      padding: const EdgeInsets.all(padding16),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildCard(state, context),
            const SizedBox(height: height16),
            _buildButton(state, context)
          ],
        ),
      ) ,

    );
  }

  Widget _buildCard(SearchPageContent state, BuildContext context) {
    return ContentCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Введите название города", style: subtitleTextStyle),

          const SizedBox(height: height16),


          _buildTextField(
            onValueChanged: (String newQuery) {
              context.read<SearchPageBloc>().add(QueryChangedEvent(newQuery));
            },
            onSubmitted: () {
              _onSearchClicked(context, state);
            },
          )
        ],
      ),
    );
  }

  Widget _buildButton(SearchPageContent state, BuildContext context) {
    return ElevatedButton(
        onPressed: () => _onSearchClicked(context, state),
        child: const Text("Подтверить", style: buttonTextStyle)
    );
  }

  Widget _buildTextField({
    required void Function() onSubmitted,
    required void Function(String newValue) onValueChanged,
  }) {

    return SizedBox(
      height: 52,
      child: TextField(
        onChanged: (String newValue) => onValueChanged(newValue),
        onSubmitted: (_) => onSubmitted(),
        style: fieldTextStyle,
        textCapitalization: TextCapitalization.words,
        decoration: const InputDecoration(
            labelText: "Город",
        ),
      ),
    );
  }


  void _onSearchClicked(BuildContext context, SearchPageContent state) {
    Navigator.pushNamed(context, weatherPageRoute, arguments: WeatherPageArguments(state.query.trim()));
  }


}
