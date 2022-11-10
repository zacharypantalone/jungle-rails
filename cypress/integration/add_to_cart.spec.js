

describe('go-to homepage', () => {
  it('visits the websites homepage', () => {

    cy.visit('http://localhost:3000/')
    // cy.get(".products article").first().contains('Add').click()
    cy.get(".products article").contains("Add").first().click({force: true})
  });

 


});