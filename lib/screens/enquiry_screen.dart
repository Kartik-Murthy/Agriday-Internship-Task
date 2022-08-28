import 'package:demo/data_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_2.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_4.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_5.dart';
import 'package:google_fonts/google_fonts.dart';

class EnquiryScreen extends StatefulWidget {
  final Object? argument;
  const EnquiryScreen({Key? key, this.argument}) : super(key: key);

  @override
  State<EnquiryScreen> createState() => _EnquiryScreenState();
}

class _EnquiryScreenState extends State<EnquiryScreen> {
  late Item item;

  final textController = TextEditingController();
  String message = "";
  List myMessageList = [
    {"type": "sender", "message": "Hello Buyer we have Apples ready to ship"},
    {"type": "sender", "message": "Do let me know "},
    {"type": "receiver", "message": "How fast can you deliver?"},
    {"type": "receiver", "message": "What are the payment Terms?"}
  ];
  @override
  void initState() {
    item = widget.argument as Item;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE5E5E5),
      appBar: AppBar(
        title: Text(item.seller,
            style: GoogleFonts.inter(
                fontSize: 16,
                color: Color(0xff000000),
                fontWeight: FontWeight.w400)),
        backgroundColor: Color(0xffffffff),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_outlined,
              color: Colors.black54,
            )),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              "Lot Details",
              style: GoogleFonts.inter(
                  color: Color(0xff000000),
                  fontSize: 18,
                  fontWeight: FontWeight.w800),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    alignment: Alignment.centerLeft,
                    color: Color(0xffFFFFFF),
                    height: MediaQuery.of(context).size.height * .07,
                    width: MediaQuery.of(context).size.width * .95,
                    child: Text(
                      item.seller,
                      style: GoogleFonts.inter(
                          fontSize: 14,
                          color: Color(0xff4F4F4F),
                          fontWeight: FontWeight.w400),
                    )),
                Container(
                  color: Color(0xffF4F4DD),
                  height: MediaQuery.of(context).size.height * .1,
                  width: MediaQuery.of(context).size.width * .95,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(item.product,
                              style: GoogleFonts.roboto(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xff4F4F4F))),
                          Text("Product",
                              style: GoogleFonts.roboto(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff828282)))
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(item.variety,
                              style: GoogleFonts.roboto(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xff4F4F4F))),
                          Text("Variety",
                              style: GoogleFonts.roboto(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff828282)))
                        ],
                      ),
                      Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Color.fromRGBO(33, 33, 33, 0.08)),
                          height: 21,
                          width: 73,
                          child: Center(
                            child: Text("₹ ${item.price}",
                                style: GoogleFonts.roboto(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff27AE60))),
                          ))
                    ],
                  ),
                ),
                Container(
                  color: Color(0xffF4F4DD),
                  height: MediaQuery.of(context).size.height * .1,
                  width: MediaQuery.of(context).size.width * .95,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(item.avgWeight.toString(),
                              style: GoogleFonts.roboto(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff000000))),
                          Text("Avg Weight",
                              style: GoogleFonts.roboto(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff828282)))
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(item.perBox.toString(),
                              style: GoogleFonts.roboto(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff000000))),
                          Text("Per Box",
                              style: GoogleFonts.roboto(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff828282)))
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(item.boxes.toString(),
                              style: GoogleFonts.roboto(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff000000))),
                          Text("Boxes",
                              style: GoogleFonts.roboto(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff828282)))
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(item.delivery,
                              style: GoogleFonts.roboto(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff000000))),
                          Text("Delivery",
                              style: GoogleFonts.roboto(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff828282)))
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            reverse: true,
            child: ListView(
              primary: false,
              shrinkWrap: true,
              children: [
                for (var ele in myMessageList)
                  ele['type'] == "sender"
                      ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ChatBubble(
                            backGroundColor: Color(0xffFFFFFF),
                            clipper: ChatBubbleClipper5(
                                type: BubbleType.receiverBubble),
                            child: Text(ele['message'],
                                style: GoogleFonts.inter(
                                    color: Color(0xff505050),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400)),
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ChatBubble(
                            alignment: Alignment.topRight,
                            backGroundColor: Color(0xff27AE60),
                            clipper:
                                ChatBubbleClipper5(type: BubbleType.sendBubble),
                            child: Text(ele['message'],
                                style: GoogleFonts.inter(
                                    color: Color(0xffFFFFFF),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400)),
                          ),
                        )
              ],
            ),
          )),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 40,
                  margin: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xffFFFFFF),
                    border: Border.all(color: Colors.white70),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: TextField(
                    controller: textController,
                    decoration: InputDecoration(
                      hintText: "Message",
                      hintStyle: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff7E7E7E)),
                      border: InputBorder.none,
                    ),
                    style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff353535)),
                    onChanged: (value) {
                      message = value.toString();
                    },
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    myMessageList.add({'type': 'reciever', 'message': message});
                    textController.clear();
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Color(0xff27AE60),
                        borderRadius: BorderRadius.circular(10)),
                    child: Icon(
                      Icons.send,
                      color: Color(0xffffffff),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
