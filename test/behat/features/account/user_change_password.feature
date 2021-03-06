@javascript @core @core_account
Feature: Creating users and an institution enrolling users and changing their passwords
    In order to change user passwords successfully
    As an admin create users and create an institution
    So I can log in as those users and change the password successfully

Scenario: Creating an Institution assigning users and changing their passwords
    # Log in as Admin
    Given I log in as "admin" with password "Kupuhipa1"
    # Verifying login was successful
    And I should see "Admin User"
    # Creating an Institution
    And I choose "Settings" in "Institutions" from administration menu
    And I press "Add institution"
    And I fill in the following:
    | Institution name   | Institution One  |
    And I press "Submit"
    # Creating user 1
    And I choose "Add user" in "Users" from administration menu
    And I fill in the following:
    | firstname   | bob  |
    | lastname    | bobby    |
    | email       | bob@example.com |
    | username    | bob  |
    | password    | mahara1  |
    And I select "Institution One" from "Institution"
    And I enable the switch "Institution administrator"
    And I press "Create user"
    # Creating user 2
    And I choose "Add user" in "Users" from administration menu
    And I fill in the following:
    | firstname   | Jen  |
    | lastname    | Jenny    |
    | email       | jen@example.com |
    | username    | jen  |
    | password    | mahara1  |
    And I select "Institution One" from "Institution"
    And I press "Create user"
    # Log out as user admin
    And I log out
    # Log in as user 1
    When I log in as "bob" with password "mahara1"
    And I fill in the following:
    | New password | mahara2  |
    | Confirm password | mahara2 |
    And I press "Submit"
    # Verifying password was changed successfully
    And I should see "Your new password has been saved"
    # Changing password
    And I choose "Settings" in "Settings" from user menu
    And I fill in the following:
    | Current password   | mahara2 |
    | New password   | mahara3 |
    | Confirm password   | mahara3 |
    When I press "Save"
    # Verifying password was changed
    And I should see "Preferences saved"
    # Log out as user 1
    And I log out
    # Log in as user 2
    And I log in as "jen" with password "mahara1"
    And I fill in the following:
    | New password | mahara2  |
    | Confirm password | mahara2 |
    And I press "Submit"
    # Verifying password was changed
    And I should see "Your new password has been saved"
    # Changing password
    And I choose "Settings" in "Settings" from user menu
    And I fill in the following:
    | Current password   | mahara2 |
    | New password   | mahara3 |
    | Confirm password   | mahara3 |
    And I press "Save"
    # Verifying password was changed
    And I should see "Preferences saved"
