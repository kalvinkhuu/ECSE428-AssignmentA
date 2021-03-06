# Hong Yi Meng 260978023
# Kalvin Khuu 260983539

Feature: Create Account

  As a player
  I would like to create an account
  To save my preferences and play the game

  Scenario Outline: Player uses email to create an account on the online iteration of Monopoly
    # Normal flow
    Given a player with an email <email>
    When the player inputs their email <email> and password <password>
    Then an account is created

    Examples:
    | email            | password  |
    | kalvin@email.com | password1 |
    | hongyi@email.com | password2 |

    # Error flow
  Scenario: Player tries to create an account with an already existing email
    Given a player with email "kalvin@email.com"
    And an existing account with email "kalvin@email.com"
    When the player with email "kalvin@email.com" tries to create an account
    Then an error is generated with message "This email is already connected to an account"

    # Error flow
  Scenario: Player tries to create an account with an invalid email
    Given the player is not logged in
    When the player with email "!@#$%" tries to create an account
    Then an error is generated with message "This email is not valid"

    # Error flow
  Scenario: Player tries to create an account with an illegal password
    Given no existing account with email "kalvin@email.com"
    When the player tries to create an account with email "kalvin@email.com" and password "   "
    Then an error is generated with message "This password is not valid"