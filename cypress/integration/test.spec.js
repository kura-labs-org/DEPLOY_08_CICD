describe('Title', () => {
    it('Has the right title', () => {
        cy.visit('http://127.0.0.1:3000/')

        cy.get('title')
            .invoke('text')
            .should("equal", "React")
    });

});
