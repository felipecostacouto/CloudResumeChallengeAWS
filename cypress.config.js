const { defineConfig } = require('cypress');

module.exports = defineConfig({
  defaultCommandTimeout: 10000, // Set default command timeout to 10 seconds
  e2e: {
    setupNodeEvents(on, config) {
    },
    supportFile: false,
    specPattern: 'tests/cypress/e2e/**/*.cy.{js,jsx,ts,tsx}',
  },
});
