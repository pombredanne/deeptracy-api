
Feature: Create new projects
  The API should be able to create new projects

  Background: Database setup
    Given an empty system

  @only
  Scenario Outline: Add a new project
    When the user makes a "POST" request to "/api/1/project/" endpoint with <payload>
    Then the api response code is <response_code>
    And the api response payload is <response>
    And <created> projects are in the database

    Examples:
      | payload                      | response_code | response                                                                                  | created |
      | {"repo":"https://github.com/BBVA/deeptracy", "name": "test"} | 201           | {"id": "ID", "authType": "PUBLIC", "repo": "https://github.com/BBVA/deeptracy", "name": "test", "scans": 0, "hookData": "", "hookType": "NONE"} | 1       |
      | {"repo":""}                  | 400           | {"error": {"msg": "missing repo"}}                                                        | 0       |
      | {}                           | 400           | {"error": {"msg": "invalid payload"}}                                                     | 0       |

  @demo
  Scenario: Add a project with a duplicated repo is forbidden
    When the user makes a "POST" request to "/api/1/project/" endpoint with {"repo":"https://github.com/BBVA/deeptracy"}
    And the user makes a "POST" request to "/api/1/project/" endpoint with {"repo":"https://github.com/BBVA/deeptracy"}
    Then the api response code is 409
    And the api response payload is {"error": {"msg": "unique constraint project repo https://github.com/BBVA/deeptracy"}}
    And 1 projects are in the database
