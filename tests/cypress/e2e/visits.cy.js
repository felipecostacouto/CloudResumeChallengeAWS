Cypress.on('uncaught:exception', (err, runnable) => {
  if (err.message.includes("Bootstrap's JavaScript requires jQuery")) {
    return false; 
  }
  return true;
});

describe('Views API Integration', () => {
  const apiUrl = Cypress.env('API_URL');

  beforeEach(() => {
    cy.visit('https://felipecostacouto.link');
  });

  it('should update the views with the API response', () => {
    cy.intercept('POST', apiUrl, { 
      statusCode: 200,
      body: { body: 123 }, 
    }).as('postCounter');

    cy.window().then((win) => {
      win.updateCounter(); 
    });

    cy.get('.counter-number').should('have.text', '👀 this page has been viewed 123 times.');
  });

  it('should display an error message if the API request fails', () => {
    cy.intercept('POST', apiUrl, {
      statusCode: 500,
      body: { error: 'Internal Server Error' },
    }).as('postCounter');

    cy.window().then((win) => {
      win.updateCounter();
    });

    cy.get('.counter-number').should('have.text', '👀 this page has been viewed Error (Internal Server Error) times.');
  });
});
