import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hulu_advert/src/controllers/controllers.dart';
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
  final _promotionController = Get.find<PromotionController>();
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
      child: Form(
        key: _promotionController.formKey,
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
              controller: _promotionController.nameController,
              focusNode: _nameFocus,
              decoration: getInputDecoration(
                "name of the product",
                prefixIcon: Icons.abc,
              ),
              onFieldSubmitted: (v) {
                _nameFocus.unfocus();
                FocusScope.of(context).requestFocus(_descFocus);
              },
              validator: (v) => InputValidators.isRequired(
                v,
                message: "name is required",
              ),
            ),
            10.height(),
            TextFormField(
              maxLines: 5,
              minLines: 3,
              controller: _promotionController.descriptionController,
              focusNode: _descFocus,
              decoration: getInputDecoration(
                "promotion description",
                // prefixIcon: FontAwesomeIcons.penClip,
              ),
              onFieldSubmitted: (v) {
                _descFocus.unfocus();
                FocusScope.of(context).requestFocus(_priceFocus);
              },
              validator: (v) => InputValidators.isRequired(
                v,
                message: "description is required",
              ),
            ),
            10.height(),
            TextFormField(
              controller: _promotionController.priceController,
              focusNode: _priceFocus,
              decoration: getInputDecoration(
                "price per unit",
                prefixIcon: Icons.money_off,
              ),
              onFieldSubmitted: (v) {
                _priceFocus.unfocus();
                FocusScope.of(context).requestFocus(_amountFocus);
              },
              validator: (v) => InputValidators.isRequired(
                v,
                message: "price per unit is required",
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^[0-9]*$')),
                FilteringTextInputFormatter.deny(RegExp(r'^0')),
                // MaxValueFormatter(maxValue: 1000000),
              ],
            ),
            10.height(),
            TextFormField(
              controller: _promotionController.amountController,
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
                // MaxValueFormatter(maxValue: 100000),
              ],
              validator: (v) => InputValidators.isRequired(
                v,
                message: "amount in stock is required",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
