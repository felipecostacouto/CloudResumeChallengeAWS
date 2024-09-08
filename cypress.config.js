const { defineConfig } = require('cypress');
const apiUrl = "PLACEHOLDER_URL"; // Ensure this is replaced correctly

module.exports = defineConfig({
  defaultCommandTimeout: 10000, 
  e2e: {
    setupNodeEvents(on, config) {
      on('task', {
        log(message) {
          console.log(message); 
          return null;
        },
      });
    },
    baseUrl: apiUrl,
    supportFile: false,
    specPattern: 'tests/cypress/e2e/**/*.cy.{js,jsx,ts,tsx}',
  },
});