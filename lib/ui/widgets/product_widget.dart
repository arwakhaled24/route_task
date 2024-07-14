import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:route_task/domain/modelDto/Products.dart';
import '../../config/theme.dart';
class ProductItemWidget extends StatefulWidget {
  final SingleProductsDto product;
  ProductItemWidget({required this.product});
  @override
  State<ProductItemWidget> createState() => _ProductItemWidgetState();
}
class _ProductItemWidgetState extends State<ProductItemWidget> {
  bool isDiscount = false;
  @override
  Widget build(BuildContext context) {
     var h = MediaQuery.sizeOf(context).height;
    var w = MediaQuery.sizeOf(context).width;
    return Container(
      color: Colors.white,
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Container(
            height: h * 0.35,
            width: w * 0.45,
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color:AppTheme.mainColor)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Center(
                  child: Stack(

                     children :[ CachedNetworkImage(
                      imageBuilder: (context, imageProvider) => Container(
                        width: w * 0.4,
                        height: h * 0.2,
                        decoration: BoxDecoration(
                            image: DecorationImage(image: imageProvider)),
                      ),
                      imageUrl: widget.product.images![0],
                      fit: BoxFit.cover,
                      progressIndicatorBuilder: (context, url, downloadProgress) =>
                          CircularProgressIndicator(
                              value: downloadProgress.progress),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),

                        Positioned(
                            top: 4,
                            right: 4,
                            child: Icon(Icons.bookmark_add_outlined,color:AppTheme.mainColor,))
                     ]
                  ),
                ),
                Text(
                  widget.product.title!,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style:AppTheme.titleStyle,
                ),
                Container(
                  constraints: BoxConstraints(
                    maxWidth: h * 0.2,
                  ),
                  child: Text(
                    widget.product.description!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),

                ),
                Row(
                  children: [
                    const Text("EGP "),
                    Text(widget.product.discountPercentage == null
                        ? widget.product.price.toString()
                        : widget.product.discountPercentage.toString()),
                    SizedBox(
                      width: w * 0.03,
                    ),
                    Visibility(
                      visible: widget.product.discountPercentage != null,
                      child: Text(
                        widget.product.price.toString(),
                        style: AppTheme.DisPriceStyle
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Row(
                        //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  Text(
                                    "Review ${widget.product.rating.toString()}",
                                    style: AppTheme.reviewStyle,
                                  ),
                                  SizedBox(
                                    width: w * 0.01,
                                  ),
                                  const Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                    size: 20,
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Icon(Icons.add_circle,color: AppTheme.mainColor,size: 28,),
                              ],
                            )


                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
