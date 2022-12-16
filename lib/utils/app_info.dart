// TODO: These values are to be fetched from BE.

const String assetsPath = "assets/images";

List<Map<String, dynamic>> hotelList = [
  {
    "image": "hotel_stock_one.png",
    "location": "Open Space",
    "destination": "London",
    "cost": 25,
  },
  {
    "image": "hotel_stock_two.png",
    "location": "Global Will",
    "destination": "London",
    "cost": 40,
  },
  {
    "image": "hotel_stock_one.png",
    "location": "Open Space",
    "destination": "London",
    "cost": 25,
  },
  {
    "image": "hotel_stock_three.png",
    "location": "Burj Khalifa",
    "destination": "Dubai",
    "cost": 120,
  },
];

List<Map<String, dynamic>> ticketList = [
  {
    'from': {'iata_code': "LDN", 'airport_name': "London"},
    'to': {'iata_code': "LAX", 'airport_name': "Los Angeles"},
    'journey_duration': '13H 43M',
    'date': "2 JUNE",
    'departure_time': "23:20 AM",
    "terminal": 57,
    "class": "Business",
    "passport_number": "K0000000E",
    "e_ticket_number": "0055 444 77147",
    "booking_code": "B2SG28",
    "payment_info": {
      "method": PaymentMethods.visa,
      "card_number": "4000 0807 0620 0002",
    },
    "price": 420.69,
    "bar_code": "ticket",
  },
  {
    'from': {'iata_code': "NYC", 'airport_name': "New-York"},
    'to': {'iata_code': "LDN", 'airport_name': "London"},
    'journey_duration': '8H 32M',
    'date': "2 JAN",
    'departure_time': "10:33 AM",
    "terminal": 23,
    "class": "First",
    "passport_number": "M0993353",
    "e_ticket_number": "0255 414 66148",
    "booking_code": "B2HH28",
    "payment_info": {
      "method": PaymentMethods.masterCard,
      "card_number": "4000 0807 0620 0802",
    },
    "price": 420.69,
    "bar_code": "my ticket",
  },
  {
    'from': {'iata_code': "DK", 'airport_name': "Dhaka"},
    'to': {'iata_code': "SH", 'airport_name': "Shanghai"},
    'journey_duration': '4H 18M',
    'date': "8 MAY",
    'departure_time': "09:21 AM",
    "terminal": 48,
    "class": "Economy",
    "passport_number": "J8369854",
    "e_ticket_number": "2255 784 821948",
    "booking_code": "Y2GH68",
    "payment_info": {
      "method": PaymentMethods.americanExpress,
      "card_number": "4080 3607 0620 0992",
    },
    "price": 420.69,
    "bar_code": "someones ticket",
  },
];

// Make it part of user profile.
List<Map<String, dynamic>> milesHistory = [
  {
    "miles": 23042,
    "from": "Airline CO",
  },
  {
    "miles": 6011,
    "from": "Emirates",
  },
  {
    "miles": 13016,
    "from": "Singapore Airlines",
  },
];

enum PaymentMethods { americanExpress, masterCard, visa }
