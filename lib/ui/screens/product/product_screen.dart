import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_task/config/di/di_generator.dart';
import 'package:route_task/config/theme.dart';
import 'package:route_task/ui/screens/product/product_viewModel.dart';
import '../../widgets/product_widget.dart';
class ProductScreen extends StatefulWidget {
  static const String routeName = 'Home Screen';

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  ProductViewModel viewModel = getIt<ProductViewModel>();
@override
  void initState() {
  viewModel.getProducts();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductViewModel,ProductState>(
        bloc: viewModel,
        builder: (context , state ){
          if(state is ProductInitial){
            viewModel.getProducts();
            return Center(child: CircularProgressIndicator(
              color: AppTheme.mainColor,
            ),);
          }else if(state is ProductLoaded){
            return Scaffold(

              appBar: AppBar(
                backgroundColor: Colors.white,
                title:  Image.asset('assets/images/image_2024-07-13_01-34-05.png'),

              ),
              body: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: state.products.products?.length ?? 0,
                itemBuilder: (context, index) {
                  var product = state.products.products?[index];
/*
                  print(product?.title ?? 'No title found ');
*/
                  if (product != null) {
                    return ProductItemWidget(product: product);
                  } else {
                    return Container();  // Return an empty widget if product is null
                  }
                },
              )
            );
          }else if(state is ProductError){
            return Center(child: Text(state.error.toString()),);
          }
          return Container();
        });

  }
}
