Feature: PUT API Demo

  Scenario: Put demo 1
    #Simple Put Request
    Given url 'https://reqres.in/api/users'
    And request {"name": "morpheus","job": "zion resident"}
    When method PUT
    Then status 404
    And print response
