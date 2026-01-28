
describe('Test login website', () => {
  beforeEach(() => {
    cy.visit('http://the-internet.herokuapp.com/login')
  })

  it('Login success', () => {
    cy.url().should('eq', 'http://the-internet.herokuapp.com/login') 
    cy.contains("Login Page")
    cy.get('[id=username]').type("tomsmith")
    cy.get('[id=password]').type("SuperSecretPassword!")
    cy.get('[type=submit]').click()
    cy.contains("You logged into a secure area!")
    cy.contains("Logout").click()
    cy.contains("You logged out of the secure area!") 
  })

  it('Login failed - Password incorrect', () => {
    cy.url().should('eq', 'http://the-internet.herokuapp.com/login') 
    cy.contains("Login Page")
    cy.get('[id=username]').type("tomsmith")
    cy.get('[id=password]').type("Password!")
    cy.get('[type=submit]').click()
    cy.contains("Your password is invalid!")
  })

  it('Login failed - Username not found', () => {
    cy.url().should('eq', 'http://the-internet.herokuapp.com/login') 
    cy.contains("Login Page")
    cy.get('[id=username]').type("tomholland")
    cy.get('[id=password]').type("Password!")
    cy.get('[type=submit]').click()
    cy.contains("Your username is invalid!")
  })


})
