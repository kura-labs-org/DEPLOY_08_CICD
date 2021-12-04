describe('Title', () => {
    it('has the right title', () => {
        cy.visit('http://3.82.217.25:3000')

        cy.get('h1')
            .invoke('text')
            .should("equal", "React App")
        Cypress.Screenshot.defaults({
        capture: 'runner',
        })
        cy.screenshot();
    });

});
