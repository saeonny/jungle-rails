describe('Product Details', () => {
  beforeEach(() => {
    cy.visit('/');
  });

  it('first item in the list', () => {
    cy.get('[data-cy="details"]').first().click().get("article")
    .should("have.class", "product-detail");
  });


}) 