import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teste2/app/features/home/presenter/state/home_state.dart';
import 'package:teste2/app/features/home/presenter/stores/home_store.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomeStore, HomeState>(
        builder: (context, state) {
          return RefreshIndicator(
            onRefresh: () async {
              await context.read<HomeStore>().get();
            },
            child: _buildBody(context, state),
          );
        },
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
      return Center(child: CircularProgressIndicator());
    } else if (state is HomeLoadSuccess) {
      return Image.network(
        state.response.message,
        fit: BoxFit.contain,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Center(child: CircularProgressIndicator());
        },
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
            onPressed: () => context.read<HomeStore>().get(),
            child: Text('Tentar novamente'),
          ),
        ],
      ),
    );
  }
}