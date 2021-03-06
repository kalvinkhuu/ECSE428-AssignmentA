# Hong Yi Meng 260978023
# Kalvin Khuu 260983539

Feature: Edit party settings

  As a player
  I would like to edit party settings
  To make my party private or limit the amount of players/viewers

  # Normal Flow
  Scenario Outline: Player edits the party's settings
    Given a party of players <Party>
    And a group of viewers <Viewers>
    And a party leader <leader>
    And the current limit of players <playerLimit>
    And the current limit of viewers <viewerLimit>
    When the leader limits the amount of players or viewers
    Then the limit of players is set to that amount <newPlayerLimit>
    Then the limit of viewers is set to that amount <newViewerLimit>

    Examples:
      | Party                     | Viewers          | leader  | playerLimit | viewerLimit | newPlayerLimit | newViewerLimit |
      | PlayerA, PlayerB, PlayerC | ViewerA, ViewerB | PlayerA | 4           | 2           | 3              | 3              |

    # Error Flow
  Scenario: Player tries to edit the party's settings but current party does not respect it
    Given a party of players "PlayerA, PlayerB, PlayerC"
    And a group of viewers "ViewerA, ViewerB"
    And a party leader "PlayerA"
    And the current limit of players "4"
    And the current limit of viewers "2"
    When the leader limits the amount of players "2" or viewers "1"
    Then an error is generated with message "Can not set the limit below the current party/viewer group size"