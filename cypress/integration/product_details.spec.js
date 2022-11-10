

describe('go-to homepage', () => {
  it('visits the websites homepage', () => {

    cy.visit('http://localhost:3000/')
    cy.get(".products article").first().click()
  });

 


});