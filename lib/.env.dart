const bool _isProduction = bool.fromEnvironment('dart.vm.product');

const _testConfig = {
  'API_URL': 'https://trabalhocleber.azurewebsites.net/api',
  'API_TEST': 'https://carros-springboot.herokuapp.com/api/v2'
};

const _productionConfig = {
  'API_URL': 'https://carros-springboot.herokuapp.com/api/v2',
  'API_TEST': 'https://trabalhocleber.azurewebsites.net/api'
};

final environment = _isProduction ? _productionConfig : _testConfig;