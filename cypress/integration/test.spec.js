describe('Heading', () => {
    it('has the right title', () => {
        cy.visit('http://172.31.30.41:5000/example-1')

        cy.get('h1')
            .invoke('text')
            .should("equal", "My Awesome Web Application")
    });

});
