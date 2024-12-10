class PriceCalculator {
  static String calcTicketPrice(int stationsNum) {
    if (stationsNum <= 9) {
      return '8 EGP';
    } else if (stationsNum <= 16) {
      return '10 EGP';
    } else if (stationsNum <= 23) {
      return '15 EGP';
    } else {
      return '20 EGP';
    }
  }
}