describe('Title', () => {
    it('Has the right title', () => {
        cy.visit('http://3.82.217.25:3000/')

        cy.get('title')
            .invoke('text')
            .should("equal", "React App")
    });

});
