module.exports = {
  rootDir: '.',
  testEnvironment: 'node',
  bail: true,
  verbose: true,
  coverageThreshold: {
    global: {
      statements: 90,
      branches: 75,
      functions: 90,
      lines: 90
    }
  },
  collectCoverageFrom: ['src/**/*.{js,jsx}'],
  coverageDirectory: 'coverage/',
  coverageReporters: ['json', 'lcov', 'text', 'html', 'text-summary'],
  moduleNameMapper: {
    '^.+\\.css$': 'identity-obj-proxy'
  },
  modulePaths: ['<rootDir>/src/'],
  roots: ['<rootDir>/src/', '<rootDir>/tests/'],
  testRegex: './tests/.*.test.js$',
  unmockedModulePathPatterns: [
    '<rootDir>/node_modules/react',
    '<rootDir>/node_modules/nock'
  ],
  globals: {
    __DEV__: true
  }
}
