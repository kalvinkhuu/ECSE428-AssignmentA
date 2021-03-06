# Hong Yi Meng 260978023
# Kalvin Khuu 260983539

Feature: Sell properties

  As a player
  I would like to sell properties
  To get money from them

  # Normal Flow
  Scenario Outline: Player sells one of their properties
    Given a player's turn <curPlayer>
    And the player's balance <balance>
    And the property value <propertyValue>
    And the player's properties <playerProperties>
    When the player sells one of their properties <property>
    Then the player's balance increments by the property value
    Then the property is removed from the player's properties

    Examples:
      | curPlayer | balance | playerProperties       | propertyValue | property  |
      | Player A  | 400$    | Boardwalk, Park Place  | 200           | Boardwalk |

    # Error flow
    Scenario: Player attempts to sell property they do not own
      Given a player's turn "PlayerA"
      And the player's balance 300
      And the property value 200
      And the "PlayerB"'s properties "Park Place"
      When the player attempts to sell "Park Place"
      Then an error is generated with message "You do not have ownership of the property"
      Then the player's balance increments remain 200