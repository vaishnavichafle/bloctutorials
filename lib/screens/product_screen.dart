import 'package:bloctutorials/bloc/products_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:velocity_x/velocity_x.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  void initState() {
    context.read<ProductsBloc>().add(ProductsLoadedEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Screen'),
      ),
      // body: BlocBuilder<ProductsBloc, ProductsState>(
      //   builder: (context, state) {
      //     if (state is ProductsLoadingState) {
      //       return Center(
      //         child: CircularProgressIndicator.adaptive(),
      //       );
      //     } else if (state is ProductsLoadedState) {
      //       return ListView.builder(
      //           itemCount: state.productsModel.length,
      //           itemBuilder: (context, index) {
      //         return ListTile(
      //           leading: Text(state.productsModel[index].category.toString()),
      //         );
      //       }
      //       );
      //     } else if (state is ProductsErrorState) {
      //       return Center(
      //         child: Text(state.errorMessage),
      //       );
      //     }
      //     return SizedBox();
      //   }
      // ),
      // body: BlocListener<ProductsBloc, ProductsState>(
      //   listener: (context, state) {
      //     if (state is ProductsLoadedState) {
      //       VxToast.show(context, msg: 'Velocity x Products Loaded', position: VxToastPosition.center);
      //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Data Loaded')));
      //     }else if(state is ProductsErrorState) {
      //       VxToast.show(context, msg: 'Velocity x Products Loaded', position: VxToastPosition.center);
      //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Data Not Loaded')));
      //     }
      //   },
      //   child: Center(
      //     child: Text('Bloc Listener', style: TextStyle(fontSize: 22)),
      //   ),
      // ),
      body: BlocConsumer<ProductsBloc, ProductsState>(
        listener: (context, state) {
            if (state is ProductsLoadedState) {
              VxToast.show(context, msg: 'Velocity x Products Loaded', position: VxToastPosition.center);
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Data Loaded')));
            }else if(state is ProductsErrorState) {
              VxToast.show(context, msg: 'Velocity x Products Loaded', position: VxToastPosition.center);
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Data Not Loaded')));
            }
          },
          builder: (context, state) {
        if (state is ProductsLoadingState) {
          return Center(
            child: CircularProgressIndicator.adaptive(),
          );
        } else if (state is ProductsLoadedState) {
          return ListView.builder(
              itemCount: state.productsModel.length,
              itemBuilder: (context, index) {
            return ListTile(
              leading: Text(state.productsModel[index].category.toString()),
            );
          }
          );
        } else if (state is ProductsErrorState) {
          return Center(
            child: Text(state.errorMessage),
          );
        }
        return SizedBox();
      }
      ),
    );
  }
}
