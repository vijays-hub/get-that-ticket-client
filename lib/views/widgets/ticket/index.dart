import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ticket_booking_app/utils/app_info.dart';
import 'package:ticket_booking_app/utils/app_layout.dart';
import 'package:ticket_booking_app/utils/styles.dart';
import 'package:ticket_booking_app/views/widgets/dotted_separator.dart';
import 'package:ticket_booking_app/views/widgets/ticket/departure_info.dart';
import 'package:ticket_booking_app/views/widgets/ticket/journey_info.dart';
import 'package:ticket_booking_app/views/widgets/ticket/ticket_detail_layout.dart';
import 'package:barcode_widget/barcode_widget.dart';

class TicketView extends StatelessWidget {
  bool maxWidth = false;
  bool? exposeDetails = false;
  final Map<String, dynamic> ticketInfo;
  TicketView({
    super.key,
    required this.maxWidth,
    required this.ticketInfo,
    this.exposeDetails,
  });

  @override
  Widget build(BuildContext context) {
    final Size viewportSize = AppLayout.getViewportSize(context);

    // Get the nested object data.
    final paymentInfo = ticketInfo["payment_info"];
    final cardNumber = paymentInfo["card_number"].toString();

    String getPaymentMethod(PaymentMethods paymentMethod) {
      String paymentMethodImage = assetsPath;
      switch (paymentMethod) {
        case PaymentMethods.masterCard:
          return "$paymentMethodImage/mastercard.png";

        case PaymentMethods.americanExpress:
          return "$paymentMethodImage/american_express.png";

        default:
          return "$paymentMethodImage/visa.png";
      }
    }

    return SizedBox(
      width: !maxWidth ? viewportSize.width * 0.85 : viewportSize.width,
      child: Container(
        margin: EdgeInsets.only(right: maxWidth ? 0 : 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            JourneyInfo(
              from: ticketInfo['from'],
              to: ticketInfo['to'],
              journeyDuration: ticketInfo['journey_duration'],
              exposeDetails: exposeDetails,
            ),
            DepartureInfo(
              date: ticketInfo['date'],
              time: ticketInfo['departure_time'],
              terminalNumber: ticketInfo['terminal'],
              exposeDetails: exposeDetails,
            ),
            exposeDetails == true
                ? Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: generateDynamicWidth(15),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(
                          generateDynamicHeight(10),
                        ),
                        bottomRight: Radius.circular(
                          generateDynamicHeight(10),
                        ),
                      ),
                    ),
                    child: Column(
                      children: [
                        DottedSeparator(dotsColor: Colors.grey.shade300),
                        Gap(generateDynamicHeight(16)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TicketDetailLayout(
                              title: "Class",
                              value: ticketInfo["class"],
                              crossAxisAlignment: CrossAxisAlignment.start,
                            ),
                            TicketDetailLayout(
                              title: "Passport",
                              value: ticketInfo["passport_number"],
                              crossAxisAlignment: CrossAxisAlignment.end,
                            ),
                          ],
                        ),
                        Gap(generateDynamicHeight(16)),
                        DottedSeparator(dotsColor: Colors.grey.shade300),
                        Gap(generateDynamicHeight(16)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TicketDetailLayout(
                              title: "E-Ticket",
                              value: ticketInfo["e_ticket_number"],
                              crossAxisAlignment: CrossAxisAlignment.start,
                            ),
                            TicketDetailLayout(
                              title: "Booking Code",
                              value: ticketInfo["booking_code"],
                              crossAxisAlignment: CrossAxisAlignment.end,
                            ),
                          ],
                        ),
                        Gap(generateDynamicHeight(16)),
                        DottedSeparator(dotsColor: Colors.grey.shade300),
                        Gap(generateDynamicHeight(10)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Image(image: image),
                                Row(
                                  children: [
                                    Image.asset(
                                      getPaymentMethod(paymentInfo["method"]),
                                      width: 40,
                                      height: 30,
                                      fit: BoxFit.contain,
                                    ),
                                    Gap(generateDynamicWidth(10)),
                                    Text(
                                      "*** ${cardNumber.substring(cardNumber.length - 4)}",
                                      style:
                                          GlobalStyles.heading3Style.copyWith(
                                        color: Colors.black,
                                      ),
                                    )
                                  ],
                                ),
                                Gap(generateDynamicHeight(5)),
                                Text(
                                  "Payment Info",
                                  style: GlobalStyles.heading4Style,
                                ),
                              ],
                            ),
                            TicketDetailLayout(
                              title: "Price",
                              value: "\$${ticketInfo["price"]}",
                              crossAxisAlignment: CrossAxisAlignment.end,
                            ),
                          ],
                        ),
                        Gap(generateDynamicHeight(16)),
                        DottedSeparator(dotsColor: Colors.grey.shade300),
                        Gap(generateDynamicHeight(16)),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(
                            generateDynamicHeight(12),
                          ),
                          child: BarcodeWidget(
                            barcode: Barcode.code128(),
                            data: ticketInfo["bar_code"],
                            drawText: false,
                            height: 80,
                          ),
                        ),
                        Gap(generateDynamicHeight(20)),
                      ],
                    ),
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
