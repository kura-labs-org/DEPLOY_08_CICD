describe('Heading', () => {
    it('has the right title', () => {
        cy.visit('http://localhost:3000')

        cy.get('h2')
            .invoke('text')
            .should("equal", "Testline")
    })

})
