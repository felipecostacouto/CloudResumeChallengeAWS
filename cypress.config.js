const { defineConfig } = require('cypress');

module.exports = defineConfig({
  defaultCommandTimeout: 10000, // Set default command timeout to 10 seconds
  e2e: {
    setupNodeEvents(on, config) {
      on('task', {
        log(message) {
          console.log(message); // Log message in the terminal
          return null;
        },
      });
    },
    supportFile: false,
    specPattern: 'tests/cypress/e2e/**/*.cy.{js,jsx,ts,tsx}',
  },
});
