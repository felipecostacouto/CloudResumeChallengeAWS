const { defineConfig } = require('cypress');

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
    supportFile: false,
    specPattern: 'tests/cypress/e2e/**/*.cy.{js,jsx,ts,tsx}',
  },
});
