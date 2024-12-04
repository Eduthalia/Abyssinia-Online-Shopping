import 'package:flutter/material.dart';

class productDetail extends StatefulWidget {
  final int indexs;
  final price;
  final title;
  final images;
  final description;
  final like;
  const productDetail({
    super.key,
    required this.indexs,
    required this.title,
    required this.price,
    required this.images,
    required this.description,
    required this.like,
  });

  @override
  State<productDetail> createState() => _productDetailState();
}

class _productDetailState extends State<productDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.5,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: NetworkImage(widget.images),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ClipOval(
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
                    ClipOval(
                        child: Material(
                            color: Colors.grey[300],
                            child: Icon(Icons.favorite))),
                  ],
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 5),
                    child: Text(
                      widget.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                        fontSize: 25,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.star_border_outlined,
                          size: 35,
                          color: Colors.yellow,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          '${widget.like['like'].length}',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                  right: 20,
                ),
                child: Text(
                  '\$ ${widget.price}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurpleAccent,
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              'Description',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              widget.description,
              style: const TextStyle(
                fontSize: 15,
              ),
            ),
          ),
          const Padding(
            padding: const EdgeInsets.only(left: 10, top: 20, bottom: 20),
            child: Text(
              'Size',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Row(
              children: [
                MaterialButton(
                  shape: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black54,
                    ),
                  ),
                  onPressed: () {},
                  height: 50,
                  minWidth: 50,
                  child: const Text(
                    '8',
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                MaterialButton(
                  shape: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black54,
                    ),
                  ),
                  onPressed: () {},
                  height: 50,
                  minWidth: 50,
                  child: const Text(
                    '10',
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                MaterialButton(
                  shape: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black54,
                    ),
                  ),
                  onPressed: () {},
                  height: 50,
                  minWidth: 50,
                  child: const Text(
                    '38',
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.deepPurpleAccent,
                  ),
                  child: const Center(
                    child: Text(
                      'Buy now',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: MaterialButton(
                  height: 50,
                  minWidth: 50,
                  color: Colors.grey[100],
                  onPressed: () {},
                  child: const Center(
                    child: Icon(
                      Icons.shopping_bag,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
