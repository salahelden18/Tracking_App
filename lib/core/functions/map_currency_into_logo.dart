String mapCurrencyIntoLogo(String currency) {
  switch (currency) {
    case 'USD':
      return '\$';
    case 'EUR':
      return '€';
    case 'TRY':
      return '₺';
    case 'GBP':
      return '£';
    default:
      return '€';
  }
}
