import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hulu_advert/src/controllers/product_controller.dart';
import 'package:hulu_advert/src/extensions/extensions.dart';
import 'package:hulu_advert/src/utils/input_validators.dart';
import 'package:hulu_advert/src/views/shared/custom_textfield.dart';

class AddPromotionInfoSection extends StatefulWidget {
  const AddPromotionInfoSection({super.key});

  @override
  State<AddPromotionInfoSection> createState() =>
      _AddPromotionInfoSectionState();
}

class _AddPromotionInfoSectionState extends State<AddPromotionInfoSection> {
  final _productController = Get.find<ProductController>();
  final _nameFocus = FocusNode();
  final _descFocus = FocusNode();
  final _priceFocus = FocusNode();
  final _amountFocus = FocusNode();

  @override
  void dispose() {
    _nameFocus.dispose();
    _descFocus.dispose();
    _priceFocus.dispose();
    _amountFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Promotion Details",
            style: Theme.of(context).textTheme.displaySmall,
          ),
          // 5.height(),
          Text(
            "Additional information about the promotion",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          20.height(),
          TextFormField(
            controller: _productController.nameController,
            focusNode: _nameFocus,
            decoration: getInputDecoration(
              "name of the product",
              prefixIcon: Icons.abc,
            ),
            onFieldSubmitted: (v) {
              _nameFocus.unfocus();
              FocusScope.of(context).requestFocus(_descFocus);
            },
          ),
          10.height(),
          TextFormField(
            maxLines: 5,
            minLines: 3,
            controller: _productController.descriptionController,
            focusNode: _descFocus,
            decoration: getInputDecoration(
              "promotion description",
              // prefixIcon: FontAwesomeIcons.penClip,
            ),
            onFieldSubmitted: (v) {
              _descFocus.unfocus();
              FocusScope.of(context).requestFocus(_priceFocus);
            },
          ),
          10.height(),
          TextFormField(
            controller: _productController.priceController,
            focusNode: _priceFocus,
            decoration: getInputDecoration(
              "price per unit",
              prefixIcon: Icons.money_off,
            ),
            onFieldSubmitted: (v) {
              _priceFocus.unfocus();
              FocusScope.of(context).requestFocus(_amountFocus);
            },
          ),
          10.height(),
          TextFormField(
            controller: _productController.amountController,
            focusNode: _amountFocus,
            decoration: getInputDecoration(
              "amount in stock",
              prefixIcon: Icons.store,
            ),
            onFieldSubmitted: (v) {
              _amountFocus.unfocus();
            },
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'^[0-9]*$')),
              FilteringTextInputFormatter.deny(RegExp(r'^0')),
              MaxValueFormatter(maxValue: 100000),
            ],
          ),
        ],
      ),
    );
  }
}
