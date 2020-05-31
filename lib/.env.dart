const bool _isProduction = bool.fromEnvironment('dart.vm.product');

const _testConfig = {
  'API_URL': 'https://trabalhocleber.azurewebsites.net/api',
  'API_TEST2': 'http://187.111.20.60:3333'
};

const _productionConfig = {
  'API_URL': 'https://carros-springboot.herokuapp.com/api/v2',
  'API_TEST': 'https://trabalhocleber.azurewebsites.net/api',
  'API_TEST2': 'http://187.111.20.60:3333'
};

final environment = _isProduction ? _productionConfig : _testConfig;