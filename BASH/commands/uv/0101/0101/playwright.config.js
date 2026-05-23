// Playwright config for 0101 tests
const { defineConfig } = require('@playwright/test');

module.exports = defineConfig({
  testDir: './tests/playwright',
  timeout: 30 * 1000,
  use: {
    baseURL: 'http://localhost:8080',
    headless: true,
    ignoreHTTPSErrors: true,
  },
});
