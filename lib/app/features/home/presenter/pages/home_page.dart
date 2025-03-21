import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste2/app/core/components/loading/custom_shimmer.dart';
import 'package:teste2/app/features/home/presenter/state/home_state.dart';
import 'package:teste2/app/features/home/presenter/stores/home_store.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final HomeStore store = Modular.get<HomeStore>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeStore>(
      create: (context) => store,
      child: Scaffold(
        body: BlocBuilder<HomeStore, HomeState>(
          builder: (context, state) {
            return RefreshIndicator(
              onRefresh: () async {
                await store.get();
              },
              child: _buildBody(context, state),
            );
          },
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context, HomeState state) {
    return ListView(
      physics: AlwaysScrollableScrollPhysics(),
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height,
          child: _getStateWidget(context, state),
        ),
      ],
    );
  }

  Widget _getStateWidget(BuildContext context, HomeState state) {
    if (state is HomeLoadInProgress) {
      return CustomShimmer(height: MediaQuery.of(context).size.height);
    } else if (state is HomeLoadSuccess) {
      return Image.network(
        state.response.message,
        fit: BoxFit.contain,
        errorBuilder: (context, error, stackTrace) {
          return _errorWidget(context, 'Erro ao carregar a imagem');
        },
      );
    } else if (state is HomeLoadFailure) {
      return _errorWidget(context, state.message);
    }
    return Container();
  }

  Widget _errorWidget(BuildContext context, String message) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(message, style: TextStyle(fontSize: 16)),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => store.get(),
            child: Text('Tentar novamente'),
          ),
        ],
      ),
    );
  }
}