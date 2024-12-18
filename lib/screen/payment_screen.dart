import 'package:flutter/material.dart';
import 'package:tugas_pammob/screen/success_screen.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pilih Pembayaran'),
      ),
      body: ListView(
        children: [
          _buildPaymentMethod(
            context,
            'Transfer Bank',
            Icons.account_balance,
            ['BCA', 'Mandiri', 'BNI', 'BRI'],
          ),
          _buildPaymentMethod(
            context,
            'E-Wallet',
            Icons.account_balance_wallet,
            ['GoPay', 'OVO', 'DANA', 'LinkAja'],
          ),
          _buildPaymentMethod(
            context,
            'Virtual Account',
            Icons.credit_card,
            ['BCA Virtual Account', 'Mandiri Virtual Account'],
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentMethod(
    BuildContext context,
    String title,
    IconData icon,
    List<String> methods,
  ) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: ExpansionTile(
        leading: Icon(icon),
        title: Text(title),
        children: methods
            .map(
              (method) => ListTile(
                title: Text(method),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SuccessScreen(),
                    ),
                  );
                },
              ),
            )
            .toList(),
      ),
    );
  }
}