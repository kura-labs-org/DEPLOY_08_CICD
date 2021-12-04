describe("Testing the Frontend form", () => {
  it("It loads successfully", () => {
    cy.visit("http://3.87.161.155:3000");
  });

  it("Header contains Hello again react", () => {
    cy.get('h1')
            .invoke('text')
            .should("equal", "Hello again react")
  })
});
