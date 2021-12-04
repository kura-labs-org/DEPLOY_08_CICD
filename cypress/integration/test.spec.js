describe('Title', () => {
    it('has the right title', () => {
        cy.visit('http://127.0.0.0:3000')

        cy.get('title')
            .invoke('text')
            .should("equal", "React App")
    });

});
