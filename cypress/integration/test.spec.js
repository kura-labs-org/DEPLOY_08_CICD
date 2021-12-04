describe('Title', () => {
    it('has the right title', () => {
        cy.visit('http://127.0.0.1:3000')

        cy.get('h1')
            .invoke('text')
            .should("equal", "React App")
        Cypress.Screenshot.defaults({
        capture: 'runner',
        })
        cy.screenshot();
    });

});
