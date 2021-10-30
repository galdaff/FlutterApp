import 'package:first_project/bloc/product/product_bloc.dart';
import 'package:first_project/bloc/product/product_event.dart';
import 'package:first_project/bloc/product/product_state.dart';
import 'package:first_project/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddProductBody extends StatefulWidget {
  @override
  _AddProductBodyState createState() => _AddProductBodyState();
}

class _AddProductBodyState extends State<AddProductBody> {
  TextEditingController nameController = TextEditingController();
  TextEditingController manuController = TextEditingController();
  TextEditingController sizeController = TextEditingController();
  TextEditingController cateController = TextEditingController();
  TextEditingController desController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController statusController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  var productBloc;
  bool nameValidate = false;
  bool manuValidate = false;
  bool sizeValidate = false;
  bool cateValidate = false;
  bool descriptValidate = false;
  bool quantityValidate = false;
  bool statusValidate = false;
  bool priceValidate = false;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    productBloc = BlocProvider.of<ProductBloc>(context);
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        if (state is ProductInitState) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
              child: ListView(
                children: [
                  Container(
                    height: height,
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Add Product',
                          style: TextStyle(
                              fontSize: 30.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 15.0),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 50.0),
                          child: Column(
                            children: <Widget>[
                              TextField(
                                controller: nameController,
                                style: TextStyle(fontSize: 22.0),
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  labelText: 'Product Name',
                                  errorText: nameValidate
                                      ? 'Product Name can\'t be empty'
                                      : null,
                                  labelStyle: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                              SizedBox(height: 10.0),
                              TextField(
                                controller: manuController,
                                obscureText: true,
                                style: TextStyle(fontSize: 22.0),
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  labelText: 'Manufacturer',
                                  errorText: manuValidate
                                      ? 'Manufacturer can\'t be empty'
                                      : null,
                                  labelStyle: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                              SizedBox(height: 10.0),
                              TextField(
                                controller: sizeController,
                                obscureText: true,
                                style: TextStyle(fontSize: 22.0),
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  labelText: 'Shoes size',
                                  errorText: sizeValidate
                                      ? 'Shoes size can\'t be empty'
                                      : null,
                                  labelStyle: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.grey,
                                  ),
                                ),
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                              ),
                              SizedBox(height: 10.0),
                              TextField(
                                controller: cateController,
                                style: TextStyle(fontSize: 22.0),
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  labelText: 'Category',
                                  errorText: cateValidate
                                      ? 'Category can\'t be empty'
                                      : null,
                                  labelStyle: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                              SizedBox(height: 10.0),
                              TextField(
                                controller: desController,
                                style: TextStyle(fontSize: 22.0),
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  labelText: 'Description',
                                  errorText: descriptValidate
                                      ? 'Description can\'t be empty'
                                      : null,
                                  labelStyle: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                              SizedBox(height: 10.0),
                              TextField(
                                controller: quantityController,
                                obscureText: true,
                                style: TextStyle(fontSize: 22.0),
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  labelText: 'Quantity',
                                  errorText: quantityValidate
                                      ? 'Quantity can\'t be empty'
                                      : null,
                                  labelStyle: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.grey,
                                  ),
                                ),
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                              ),
                              SizedBox(height: 10.0),
                              TextField(
                                controller: statusController,
                                obscureText: true,
                                style: TextStyle(fontSize: 22.0),
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  labelText: 'Status',
                                  errorText: statusValidate
                                      ? 'Status can\'t be empty'
                                      : null,
                                  labelStyle: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.grey,
                                  ),
                                ),
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                              ),
                              SizedBox(height: 10.0),
                              TextField(
                                controller: priceController,
                                obscureText: true,
                                style: TextStyle(fontSize: 22.0),
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  labelText: 'Shoes price',
                                  errorText: priceValidate
                                      ? 'Shoes price can\'t be empty'
                                      : null,
                                  labelStyle: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.grey,
                                  ),
                                ),
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                              ),
                              SizedBox(height: 10.0),
                              Container(
                                width: 150.0,
                                child: ElevatedButton(
                                  child: Text('Add'),
                                  onPressed: () {
                                    print(nameController.text);
                                    print(manuController.text);
                                    print(sizeController.text);
                                    print(cateController.text);
                                    print(desController.text);
                                    print(quantityController.text);
                                    print(statusController.text);
                                    print(priceController.text);

                                    if (nameController.text.isEmpty &&
                                        manuController.text.isEmpty &&
                                        sizeController.text.isEmpty &&
                                        cateController.text.isEmpty &&
                                        desController.text.isEmpty &&
                                        quantityController.text.isEmpty &&
                                        statusController.text.isEmpty &&
                                        priceController.text.isEmpty) {
                                      setState(() {
                                        nameValidate = true;
                                        manuValidate = true;
                                        sizeValidate = true;
                                        cateValidate = true;
                                        descriptValidate = true;
                                        quantityValidate = true;
                                        statusValidate = true;
                                        priceValidate = true;
                                      });
                                    } else if (nameController.text.isEmpty) {
                                      setState(() {
                                        nameValidate = true;
                                        manuValidate = false;
                                        sizeValidate = false;
                                        cateValidate = false;
                                        descriptValidate = false;
                                        quantityValidate = false;
                                        statusValidate = false;
                                        priceValidate = false;
                                      });
                                    } else if (manuController.text.isEmpty) {
                                      setState(() {
                                        nameValidate = false;
                                        manuValidate = true;
                                        sizeValidate = false;
                                        cateValidate = false;
                                        descriptValidate = false;
                                        quantityValidate = false;
                                        statusValidate = false;
                                        priceValidate = false;
                                      });
                                    } else if (sizeController.text.isEmpty) {
                                      setState(() {
                                        nameValidate = false;
                                        manuValidate = false;
                                        sizeValidate = true;
                                        cateValidate = false;
                                        descriptValidate = false;
                                        quantityValidate = false;
                                        statusValidate = false;
                                        priceValidate = false;
                                      });
                                    } else if (cateController.text.isEmpty) {
                                      setState(() {
                                        nameValidate = false;
                                        manuValidate = false;
                                        sizeValidate = false;
                                        cateValidate = true;
                                        descriptValidate = false;
                                        quantityValidate = false;
                                        statusValidate = false;
                                        priceValidate = false;
                                      });
                                    } else if (desController.text.isEmpty) {
                                      setState(() {
                                        nameValidate = false;
                                        manuValidate = false;
                                        sizeValidate = false;
                                        cateValidate = false;
                                        descriptValidate = true;
                                        quantityValidate = false;
                                        statusValidate = false;
                                        priceValidate = false;
                                      });
                                    } else if (quantityController
                                        .text.isEmpty) {
                                      setState(() {
                                        nameValidate = false;
                                        manuValidate = false;
                                        sizeValidate = false;
                                        cateValidate = false;
                                        descriptValidate = false;
                                        quantityValidate = true;
                                        statusValidate = false;
                                        priceValidate = false;
                                      });
                                    } else if (statusController.text.isEmpty) {
                                      setState(() {
                                        nameValidate = false;
                                        manuValidate = false;
                                        sizeValidate = false;
                                        cateValidate = false;
                                        descriptValidate = false;
                                        quantityValidate = false;
                                        statusValidate = true;
                                        priceValidate = false;
                                      });
                                    } else if (priceController.text.isEmpty) {
                                      setState(() {
                                        nameValidate = false;
                                        manuValidate = false;
                                        sizeValidate = false;
                                        cateValidate = false;
                                        descriptValidate = false;
                                        quantityValidate = false;
                                        statusValidate = false;
                                        priceValidate = true;
                                      });
                                    } else {
                                      setState(() {
                                        nameValidate = false;
                                        manuValidate = false;
                                        sizeValidate = false;
                                        cateValidate = false;
                                        descriptValidate = false;
                                        quantityValidate = false;
                                        statusValidate = false;
                                        priceValidate = false;
                                      });
                                      productBloc.add(AddButtonPressed(
                                          name: nameController.text,
                                          manufacturer: manuController.text,
                                          size: int.parse(
                                              sizeController.text.toString()),
                                          category: cateController.text,
                                          description: desController.text,
                                          quantity: int.parse(quantityController
                                              .text
                                              .toString()),
                                          status: int.parse(
                                              statusController.text.toString()),
                                          price: int.parse(priceController.text
                                              .toString())));
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.orangeAccent,
                                      textStyle: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold)),
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
            ),
          );
        } else if (state is ProductLoadingState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is ProductSuccess) {
          Future.delayed(Duration.zero, () async {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => HomeScreen()));
          });
        } else if (state is ProductErrorState) {
          return Text(state.message);
        }
        return Text('');
      },
    );
  }
}
