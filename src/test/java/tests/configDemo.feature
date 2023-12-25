Feature: Config Demo

  Background: 
    * url baseURL
    * header Accept = 'application/json'

  #Accessing config file value
  Scenario: Config Author Demo
    Given print author

  #Get request with config file value
  Scenario: Config Get Demo 1
    Given path '/users?page=2'
    When method GET
    Then status 200
    And print response
