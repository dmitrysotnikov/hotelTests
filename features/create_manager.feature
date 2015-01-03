Feature: Create Manager

  Scenario Outline: Should be possible to create new manager account

    Given I delete all previous emails
    And I am login to backend as staff
    When I press 'Staff' button in the header
    And I create new staff member account using the following details:
      | first_name      | <first_name> |
      | last_name       | <last_name>  |
      | phone           | <phone>      |
      | email           | <email>      |
      | password        | <password>   |
      | <staff_manager> | yes          |
    Then I should see new staff member with the following details:
      | first_name | <first_name> |
      | last_name  | <last_name>  |
      | phone      | <phone>      |
      | email      | <email>      |
      | registered | today        |
    And I should get email to mailbox with 'Confirmation instructions' subject and 'Confirm my account' link
    When I open verification link
    And I am login to backend as '<email>' with '<password>' password
    And I press '<button>' button in the header
    Then I should see ['<button2>'] button on the page

  Examples:
    | first_name | last_name | email   | phone   | staff_manager   | password  | button   | button2   |
    | Staff      | Manager   | staff   | 1234567 | staff_manager   | test12345 | Staff    | New Guest |
    | Service    | Manager   | service | 1234567 | service_manager | test12345 | Content  | Add       |
    | Request    | Manager   | request | 1234567 | request_manager | test12345 | Requests | Show All  |


  Scenario Outline: Should be possible to edit manager account

    Given I am login to backend as staff
    When I press 'Staff' button in the header
    And  I create new staff member account using the following details:
      | first_name      | <first_name> |
      | last_name       | <last_name>  |
      | phone           | <phone>      |
      | email           | <email>      |
      | password        | <password>   |
      | <staff_manager> | yes          |
    And I select manager with '<email>' email
    And I edit staff member account using the following details:
      | new_first_name | <new_first_name> |
      | new_last_name  | <new_last_name>  |
      | new_phone      | <new_phone>      |
      | new_email      | <new_email>      |
      | new_password   | <new_password>   |
    Then I should see new staff member with the following details:
      | first_name | <new_first_name> |
      | last_name  | <new_last_name>  |
      | phone      | <new_phone>      |
      | email      | <new_email>      |
      | registered | today            |

  Examples:
    | first_name | last_name | email   | phone   | staff_manager   | password  | new_first_name | new_last_name | new_email  | new_phone | new_password |
    | Staff      | Manager   | staff   | 1234567 | staff_manager   | test12345 | NewStaff       | NewManager    | newstaff   | 7654321   | test54321    |
    | Service    | Manager   | service | 1234567 | service_manager | test12345 | NewService     | NewManager    | newservice | 7654321   | test54321    |
    | Request    | Manager   | request | 1234567 | request_manager | test12345 | NewRequest     | NewManager    | newrequest | 7654321   | test54321    |


