Cypress.on('uncaught:exception', (err, runnable) => {
  if (err.message.includes("Bootstrap's JavaScript requires jQuery")) {
    return false; 
  }
  return true;
});

describe("Views API Integration", () => {

  it("should update the views with the API response", () => {

    cy.request("POST", '/').then((response) => {
      expect(response.body.views).to.be.a("number");
      const initialCount = response.body.views;

      // Check if updateCounter exists and is callable
      cy.window().then((win) => {
        if (win.updateCounter) {
          cy.spy(win, 'updateCounter').as('updateCounterSpy');
          win.updateCounter(); // Trigger the counter update
        } else {
          throw new Error('updateCounter method is not defined on the window object');
        }
      });

      // Wait for the update to take effect
      cy.wait(1000); // Adjust the wait time if necessary
      cy.get('.counter-number').invoke('text').then((text) => {
        const numberMatch = text.match(/\d+/);
        expect(numberMatch).to.not.be.null; // Ensure there is a number
        expect(parseInt(numberMatch[0], 10)).to.be.a('number'); // Ensure it's a number
      });

      // Perform another request to check the updated view count
      cy.request("POST", '/').then((response) => {
        expect(response.body.views).to.be.a("number");
        const updatedCount = response.body.views;
        expect(updatedCount).to.be.greaterThan(initialCount);
      });
    });
  });

  it("should display an error message if the API request fails", () => {

    cy.intercept({
      method: 'POST',
      url: '/'
    }, {
      statusCode: 500,
      body: { error: 'Internal Server Error' },
    }).as('postCounter');

    cy.window().then((win) => {
      if (win.updateCounter) {
        cy.spy(win, 'updateCounter').as('updateCounterSpy');
        win.updateCounter(); // Trigger the counter update
      } else {
        throw new Error('updateCounter method is not defined on the window object');
      }
    });

    cy.wait('@postCounter');
    cy.get('.counter-number').invoke('text').then((text) => {
      expect(text).to.contain('Error (Internal Server Error)');
    });
    cy.get('@updateCounterSpy').should('have.been.called');
  });
});


