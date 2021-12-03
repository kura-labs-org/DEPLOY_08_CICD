describe('b', () => {
   it('has the right title', () => {
      cy.visit('http://18.218.95.240:5000')

      cy.get('b')
          .invoke('text')
          .should("equal", "Choose you player: 1. LeBron James 2. Michael Jordan 3. Kevin Durant...")
   });
});
