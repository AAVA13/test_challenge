import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_challenge/ui/blocs/product_bloc.dart';
import 'package:test_challenge/ui/widgets/atoms/btn.dart';
import 'package:test_challenge/ui/widgets/constants/constants.dart';

class Paginator extends StatelessWidget {
  Paginator({Key? key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Btn(
                // New widget Btn
                icon: Icon(Icons.arrow_back_ios, color: AppColors.primaryColor),
                onPressed: () {
                  context.read<ProductBloc>().add(ChangePage(state.page - 1));
                },
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  'Página ${state.page}',
                  style: TextStyle(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Btn(
                // New widget Btn
                icon: Icon(Icons.arrow_forward_ios,
                    color: AppColors.primaryColor),
                onPressed: () {
                  context.read<ProductBloc>().add(ChangePage(state.page + 1));
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
