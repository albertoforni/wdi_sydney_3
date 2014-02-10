function rateExchange() {
  var rates = {
    'AUD/GBP': 0.54557,
    'GBP/AUD': 1.83081,
    'AUD/NZD': 1.07906,
    'NZD/AUD': 0.92509
  };

  var convert = function (currencies, amount) {
    currencies = currencies.toUpperCase();
    if (!currencies || !amount || !rates[currencies]) return false;

    var currencies_arr = currencies.split("/");
    var change = Math.round(amount * rates[currencies] * 100) / 100;

    console.log(currencies_arr[0] + " " + amount + " is " + currencies_arr[1] + " " + change);
  };

  return {
    convert: convert
  };
}

var exchange = new rateExchange();
exchange.convert("AUD/NZD", 100);