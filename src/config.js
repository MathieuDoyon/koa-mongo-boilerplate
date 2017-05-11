const { version } = require('../package.json')

const environment = {
  development: {
    isProduction: false
  },
  production: {
    isProduction: true,
    logger: {
      enabled: true,
      level: process.env.APP_LOG_LEVEL || 'error'
    }
  },
  test: {
    isProduction: true,
    port: 3000,
    logger: {
      enabled: false,
      level: 'silent'
    },
    database: {
      url: 'mongodb://localhost:27017/app_test'
    },
  }
}[process.env.NODE_ENV || 'development']

module.exports = Object.assign({
  environment: process.env.NODE_ENV || 'development',
  host: process.env.APP_HOST || 'localhost',
  port: process.env.APP_PORT || 3000,
  app: {
    name: process.env.APP_NAME || 'Service app',
    id: process.env.APP_ID || 'srv:app',
    version
  },
  logger: {
    enabled: true,
    level: process.env.APP_LOG_LEVEL || 'trace' // 'fatal', 'error', 'warn', 'info', 'debug', 'trace'; also 'silent'
  },
  database: {
    url: process.env.APP_MONGO_URL || 'mongodb://localhost:27017/app'
  }
}, environment)
