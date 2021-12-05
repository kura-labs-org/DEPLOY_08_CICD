describe('Title', () => {
    it('Looking for header', () => {
        cy.visit('http://127.0.0.1:3000')

        cy.get('h1')
            .invoke('text')
            .should("equal", "Hello again react")
        Cypress.Screenshot.defaults({capture: 'runner',})
        cy.screenshot();
    });

});
