describe('Title', () => {
    it('has the right title', () => {
        // The application is hosted on port 3000
        cy.visit('http://localhost:3000')

        cy.get('h1')
            .invoke('text')
            .should("equal", "Hello again react")
        Cypress.Screenshot.defaults({
        capture: 'runner',
        })
        cy.screenshot();
    });

});
