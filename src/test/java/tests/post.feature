Feature: Post API Demo

  Background: 
    * url 'https://reqres.in/api'
    * header Accept = 'application/json'
    * def expectedOutput = read('response1.json')
    * def expectedInput = read('request.json')

  #Simple Post Request
  Scenario: Post Demo 1
    Given url 'https://reqres.in/api/users'
    And request {"name": "morpheus","job": "leader"}
    When method Post
    Then status 201
    And print response

  #Post with Background
  Scenario: Post Demo 2
    Given path '/users'
    And request {"name": "morpheus","job": "leader"}
    When method Post
    Then status 201
    And print response

  #Post with Assertions
  Scenario: Post Demo 3
    Given path '/users'
    And request {"name": "morpheus","job": "leader"}
    When method Post
    Then status 201
    And match response == {"createdAt": "#ignore","name": "morpheus","id": "#string","job": "leader"}
    And print response

  #Post with read response from file
  Scenario: Post Demo 4
    Given path '/users'
    And request {"name": "morpheus","job": "leader"}
    When method Post
    Then status 201
    And match response == expectedOutput
    And print response

  #Post with read request from file
  Scenario: Post Demo 5
    Given path '/users'
    And request expectedInput
    When method Post
    Then status 201
    And match $ == expectedOutput
    And print response

  #Post with read request from file with path
  Scenario: Post Demo 6
    Given path '/users'
    And def projectPath = karate.properties['user.dir']
    And print projectPath
    And def filePath = projectPath + '/src/test/java/data/request2.json'
    And def requestBody = filePath
    And request requestBody
    When method Post
    Then status 201
    And match $ == expectedOutput
    And print response

  #Read body data from file and change request values
  Scenario: Post Demo 7
    Given path '/users'
    And def requestBody = read('request.json')
    And request requestBody
    And set requestBody.job = 'engineer'
    When method Post
    Then status 201
