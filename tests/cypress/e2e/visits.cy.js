Cypress.on('uncaught:exception', (err, runnable) => {
  if (err.message.includes("Bootstrap's JavaScript requires jQuery")) {
    return false; 
  }
  return true;
});

describe('Views API Integration', () => {
  const apiUrl = 'PLACEHOLDER_URL';

  beforeEach(() => {
    cy.visit('https://felipecostacouto.link');
    
    cy.task('log', `API URL: ${apiUrl}`);
  });

  it('should update the views with the API response', () => {
    cy.intercept({
      method: 'POST',
      url: apiUrl
    }, { 
      statusCode: 200,
      body: { body: 123 },
    }).as('postCounter');

    cy.window().then((win) => {
      cy.spy(win, 'updateCounter').as('updateCounterSpy'); 
      win.updateCounter(); 
    });
    
    cy.wait('@postCounter');
    cy.get('.counter-number').should('have.text', '👀 this page has been viewed 123 times.');
    cy.get('@updateCounterSpy').should('have.been.called');
  });

  it('should display an error message if the API request fails', () => {
    cy.intercept({
      method: 'POST',
      url: apiUrl
    }, {
      statusCode: 500,
      body: { error: 'Internal Server Error' },
    }).as('postCounter');

    cy.window().then((win) => {
      cy.spy(win, 'updateCounter').as('updateCounterSpy');
      win.updateCounter();
    });

    cy.wait('@postCounter');
    cy.get('.counter-number').should('have.text', '👀 this page has been viewed Error (Internal Server Error) times.');
    cy.get('@updateCounterSpy').should('have.been.called');
  });
});
