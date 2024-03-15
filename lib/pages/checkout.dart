import 'package:flutter/material.dart';
import 'package:shopapp/cartmodel.dart';
import 'package:shopapp/paymentmodel.dart';

class Checkout extends StatefulWidget {
  Checkout({super.key});

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  @override
  Widget build(BuildContext context) {
    final List<Cartmodel> lists = [
      Cartmodel(title: 'Items', amount: 3),
      Cartmodel(title: 'Subtotal', amount: 423),
      Cartmodel(title: 'Discount', amount: 4),
      Cartmodel(title: 'Delivery Changes', amount: 2),
    ];
    final List<Paymentmodel> options = [
      Paymentmodel(
          title: 'Paypal',
          icon: Icon(Icons.paypal),
          color: Colors.blue.shade900),
      Paymentmodel(
          title: 'Credit Card',
          icon: Icon(Icons.payment_rounded),
          color: Colors.blue.shade400),
      Paymentmodel(
          title: 'Cash',
          icon: Icon(Icons.monetization_on),
          color: Colors.yellow.shade600)
    ];

    bool? ischecked = false;
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
        leading: ClipOval(
          child: Material(
            color: Colors.grey[300],
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.arrow_back,
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          const ListTile(
            leading: Icon(
              Icons.location_on_sharp,
              color: Colors.deepPurpleAccent,
            ),
            title: Text('325 15th Eighth Avenue, New York'),
            subtitle: Text('dummy text'),
          ),
          const ListTile(
            leading: Icon(
              Icons.access_time_filled_sharp,
              color: Colors.deepPurpleAccent,
            ),
            title: Text('6:00 pm, Wednesday 20'),
          ),
          const SizedBox(
            height: 40,
          ),
          Column(
            children: [
              Container(
                height: 40,
                color: Colors.grey[200],
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Order Summary',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.2,
                child: ListView.builder(
                  itemCount: lists.length,
                  itemBuilder: (context, index) {
                    return Container(
                      color: Colors.grey[200],
                      child: ListTile(
                        title: Text(
                          lists[index].title,
                        ),
                        trailing: Text('\$ ${lists[index].amount}'),
                      ),
                    );
                  },
                ),
              ),
              Container(
                height: 40,
                color: Colors.grey[200],
                child: const ListTile(
                  title: Text(
                    'Total',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 15,
                    ),
                  ),
                  trailing: Text(
                    '\$ 432',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.2,
            child: ListView.builder(
              itemCount: options.length,
              itemBuilder: (context, index) {
                return Container(
                    color: Colors.grey[200],
                    child: ListTile(
                      leading: options[index].icon,
                      iconColor: options[index].color,
                      title: Text(
                        options[index].title,
                      ),
                      trailing: Checkbox(
                        value: ischecked,
                        activeColor: Colors.blue.shade200,
                        onChanged: (newbool) {
                          setState(() {
                            ischecked = newbool;
                          });
                        },
                      ),
                    ));
              },
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
              width: MediaQuery.of(context).size.width * 0.6,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.deepPurpleAccent,
              ),
              child: const Center(
                child: Text(
                  'Check out',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              )),
        ],
      ),
    );
  }
}
