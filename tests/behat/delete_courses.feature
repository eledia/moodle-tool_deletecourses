@tool @tool_deletecourses
Feature: The delete courses tool allows a manager to delete courses in bulk
  In order to delete courses in bulk
  As a manager
  I need to see all the categories

Background:
  Given the following "categories" exist:
    | name       | category | idnumber | visible |
    | Category 1 | 0        | CAT1     | 0       |
    | Category 2 | CAT1     | CAT2     | 0       |
    | Category 3 | CAT1     | CAT3     | 0       |
    | Category 4 | 0        | CAT4     | 0       |
  And the following "courses" exist:
    | fullname | shortname | category | visible |
    | Course 1 | C1        | CAT2     | 1       |
    | Course 2 | C2        | CAT2     | 1       |
    | Course 3 | C3        | CAT3     | 1       |
    | Course 4 | C4        | CAT3     | 1       |
    | Course 5 | C5        | CAT4     | 1       |

@javascript
Scenario: Manager hides all but one course
  When I log in as "admin"
  And I go to the courses management page
  And I click on category "Category 1" in the management interface
  And I follow "Delete all courses"
  And I press "Confirm"
  And I trigger cron
  And I go to the courses management page
  And I click on category "Category 1" in the management interface
  And I should not see "Course 1"
  And I should not see "Course 2"