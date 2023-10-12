import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:idukaan/controller/main/business/business_ctrl.dart';
import 'package:idukaan/controller/main/business/ir/shop/ir_ctrl.dart';
import 'package:idukaan/model/main/business/shop/ir/list/ir_shop_list_obj_res_mdl.dart';
import 'package:idukaan/view/widgets/text_widget.dart';
import 'package:idukaan/view/widgets/verified_widget.dart';
import 'package:provider/provider.dart';

class IrShopListButtonWidget extends StatefulWidget {
  final IrShopListObjResMdl irShop;
  final int index;
  final Function onTap;
  const IrShopListButtonWidget({
    super.key,
    required this.irShop,
    required this.index,
    required this.onTap,
  });

  @override
  State<IrShopListButtonWidget> createState() => _IrShopListButtonWidgetState();
}

class _IrShopListButtonWidgetState extends State<IrShopListButtonWidget> {
  late IrCtrl irCtrl;
  @override
  void initState() {
    irCtrl = Provider.of<BusinessCtrl>(context, listen: false).irCtrl;
    super.initState();
  }

  Widget shopImgWidget() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.18,
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).size.height * 0.009,
      ),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: CachedNetworkImageProvider(
            widget.irShop.shopImg,
          ),
          fit: BoxFit.fitWidth,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }

  Widget shopInfoWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('Station: ${widget.irShop.station}'),
        if (widget.irShop.getPlt().isNotEmpty)
          Text('Platform: ${widget.irShop.getPlt()}'),
      ],
    );
  }

  Widget shopActionWidget() {
    return Column(
      children: [
        OutlinedButton(
          onPressed: () {
            //TODO: Integrate open/close stall functionality
            setState(() {
              widget.irShop.isOpen = !widget.irShop.isOpen;
            });
          },
          style: ButtonStyle(
            side: MaterialStateProperty.all(
              BorderSide(
                color: widget.irShop.isOpen ? Colors.red : Colors.green,
              ),
            ),
          ),
          child: Text(
            widget.irShop.isOpen ? 'Close' : 'Open',
            style: TextStyle(
              color: widget.irShop.isOpen ? Colors.red : Colors.green,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onTap(),
      child: Card(
        child: Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.03,
                vertical: MediaQuery.of(context).size.height * 0.02,
              ),
              child: Stack(
                children: [
                  Column(
                    children: <Widget>[
                      shopImgWidget(),
                      TextWidget(
                        text:
                            '${widget.irShop.shopName} (${widget.irShop.shopNo})',
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).size.height * 0.018,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          shopInfoWidget(),
                          shopActionWidget(),
                        ],
                      ),
                    ],
                  ),
                  if (widget.irShop.isActive)
                    Container(
                      height: MediaQuery.of(context).size.height * 0.05,
                      color: Colors.yellow,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextWidget(
                            text: 'Attention Required ',
                            fontWeight: FontWeight.bold,
                          ),
                          Icon(Icons.build_outlined),
                        ],
                      ),
                    ),
                ],
              ),
            ),
            VerifiedWidget(isVer: widget.irShop.isVer),
          ],
        ),
      ),
    );
  }
}
