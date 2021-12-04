describe('Title', () => {
    it('has the right title', () => {
        cy.visit('http://54.226.56.84:3000')

        cy.get('title')
            .invoke('text')
            .should("equal", "React App")
    });

});
