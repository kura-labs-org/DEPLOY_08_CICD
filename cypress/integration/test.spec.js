describe('Heading', () => {
    it('has the right title', () => {
        cy.visit('http://localhost:5000')

        cy.get('h1')
            .invoke('text')
            .should("equal", "HI, THIS IS THE TEST LINE TO SEE IF THE APP RAN! DO NOT DELETE!")
    });

});
