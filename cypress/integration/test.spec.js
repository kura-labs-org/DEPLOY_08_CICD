describe('Title', () => {
    it('Has the right title', () => {
        cy.visit('http://172.31.88.114:5000/')

        cy.get('title')
            .invoke('text')
            .should("equal", "React")
    });

});
