describe('Heading', () => {
    it('has the right title', () => {
        cy.visit('localhost:5000')

        cy.get('h2')
            .invoke('text')
            .should("equal", "Equipment Tracker")
    });

});