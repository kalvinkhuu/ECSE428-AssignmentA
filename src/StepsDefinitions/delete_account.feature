# Hong Yi Meng 260978023
# Kalvin Khuu 260983539

Feature: Delete Account
  As a player
  I would like to delete my account
  To stop playing games or to remove the account in the database

  # Normal Flow
  Scenario: Player successfully deletes their account

    Given a player with <email> is logged into the system
    When the player <email> wants to delete their account
    Then the account no longer exist in the system