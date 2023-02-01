 
 describe('Jungle Home Page', () => {
  beforeEach(() => {
    cy.visit('http://localhost:3000/')
  })

  it("should take user to product page upon clicking a product", () => {
    cy.get(".products article").should("be.visible").eq(0).click();

    cy.get(".product-detail").should("be.visible")
  });
 })