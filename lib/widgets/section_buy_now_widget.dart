import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../model/order_model.dart';
import '../state_management/state_management.dart';
import 'form_order_widget.dart';

class SectionBuyNowWidget extends StatelessWidget {
  final DateTime time;

  const SectionBuyNowWidget({super.key, required this.time});

  @override
  Widget build(BuildContext context) {
    final diff = auction.value.difference(now.value);

    final nameController = TextEditingController();
    final addressController = TextEditingController();
    final phoneController = TextEditingController();
    final amountController = TextEditingController();
    final noteController = TextEditingController();

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          color: const Color(0xFF161D41),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Center(
              child: SizedBox(
                width: 60.sw,
                height: 4.sh,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Sale end in ${diff.inHours.toString().padLeft(2, '0')}:${diff.inMinutes.remainder(60).toString().padLeft(2, '0')}:${diff.inSeconds.remainder(60).toString().padLeft(2, '0')} ',
                      style: TextStyle(color: Colors.white, fontSize: 4.sw),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          showAdaptiveDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog.adaptive(
                                  title: const Text('Place Order'),
                                  content: FormOrderWidget(
                                    nameController: nameController,
                                    addressController: addressController,
                                    phoneController: phoneController,
                                    amountController: amountController,
                                    notesController: noteController,
                                  ),
                                  actions: [
                                    OutlinedButton(
                                        onPressed: () =>
                                            Navigator.of(context).pop(),
                                        child: const Text('Cancel')),
                                    ElevatedButton(
                                        onPressed: () {
                                          var order = Order(
                                            name: nameController.text,
                                            phoneNumber: phoneController.text,
                                            address: addressController.text,
                                            notes: noteController.text,
                                            amount: amountController.text,
                                            color: colorSelected.value,
                                            size: sizeSelected.value,
                                            combo: comboSelected.value
                                          );
                                          // You can do anything with this information,
                                          // like : submit to Google Sheet, your own API...
                                          print(order.toJson());
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text('Submit'))
                                  ],
                                );
                              });
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red),
                        child: Text(
                          'Buy Now',
                          style: TextStyle(fontSize: 2.sw, color: Colors.white),
                        ))
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
