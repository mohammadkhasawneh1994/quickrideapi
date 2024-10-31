import 'package:flutter/material.dart';
import 'package:tam_drive/UI/orders.dart';

class OrderTile extends StatelessWidget {
  final String state, label;
  const OrderTile({super.key, required this.state, required this.label});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Orders(
                  state: state,
                ),
              ));
        },
        child: Container(
          width: MediaQuery.of(context).size.width * .9,
          height: MediaQuery.of(context).size.height * .1,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(label),
              const Icon(
                Icons.list,
                color: Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
