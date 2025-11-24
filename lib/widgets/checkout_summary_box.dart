import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import 'custom_button_with_icon.dart';

class CheckoutSummaryBox extends StatelessWidget {
  const CheckoutSummaryBox({
    super.key,
    required this.subTotal,
    required this.vat,
    required this.shippingFee,
    required this.total,
    required this.onCheckout,
  });

  final double subTotal;
  final double vat;
  final double shippingFee;
  final double total;
  final VoidCallback onCheckout;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border(
          top: BorderSide(color: AppColors.primaryColor, width: 1),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryColor.withValues(alpha: 0.1),
            blurRadius: 5,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Column(
        children: [
          const SizedBox(height: 5),
          _buildRow(
            title: "Sub-total",
            value: "\$ ${subTotal.toStringAsFixed(2)}",
          ),
          const SizedBox(height: 15),
          _buildRow(title: "VAT (%)", value: "\$ ${vat.toStringAsFixed(2)}"),
          const SizedBox(height: 15),
          _buildRow(
            title: "Shipping fee",
            value: "\$ ${shippingFee.toStringAsFixed(2)}",
          ),
          const SizedBox(height: 15),
          const Divider(),
          _buildRow(
            title: "Total",
            value: "\$ ${total.toStringAsFixed(2)}",
            isBold: true,
          ),
          const SizedBox(height: 40),

          CustomElevatedButton(
            title: "Go To Checkout",
            icon: Icons.arrow_forward,
            isRightIcon: true,
            onTap: onCheckout,
          ),

          const SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget _buildRow({
    required String title,
    required String value,
    bool isBold = false,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            color: AppColors.gray,
            fontWeight: isBold ? FontWeight.w600 : FontWeight.w400,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 18,
            color: AppColors.primaryColor,
            fontWeight: isBold ? FontWeight.w600 : FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
