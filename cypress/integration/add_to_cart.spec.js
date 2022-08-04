describe("Jungle app", () => {
  beforeEach(() => {
    cy.visit("/");
  });

  it('add the first item to the cart', () => {
    cy.get('button').contains('Add').first().click({force: true});
    cy.contains('.nav-link', 'My Cart (1)').should('be.visible')
  })

  it('cant add the soldout item to the cart', () => {
    cy.get('button').contains('Add').last().click({force: true});
    cy.contains('.nav-link', 'My Cart (1)').should('be.visible')
  
  })

 
});