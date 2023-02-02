# Salesforce Opportunity Trigger Automation - #3
### _[Salesforce Mentor - Build Together](https://courses.salesforcementor.com/p/build-together/)_

A month-long project you build on a team of 2-3 with other learning Salesforce developers. Small teams will work together to complete development assignments. A weekly meeting with experienced developers to go over questions and review code. Get actual hands-on experience by working on projects, in a team with requirements.

## Overview
Create Apex trigger(s) on the opportunity object that completes the project requirements. Your code should follow apex best practices like bulkification and use the correct trigger context. No Salesforce declarative automation should be used.
- Triggers basics
- Trigger frameworks
- Apex/OOP fundamentals
- Object and Data Models
- SOQL practice

## Project Requirements  
- Create a trigger validation on the opportunity if the stage is past prospecting make sure there is at least one opportunity product or else show an error message to the user.
- If the opportunity gets marked closed won create a renewal opportunity with all the same information and opportunity products and link the renewal opportunity to the original opportunity. Update the stage to be value proposition and the closed date to be 1 year from the current close date.
- If an opportunity is created and there are no other related open opportunities set the amount to 20% of the account's annual revenue and send a communication to another user for them to review the information.

## Getting Started
- Clone this repository onto your local computer and open the folder in Visual Studio Code
- Create a branch from the main branch for your team or individually 
   - (ADVANCED) Create a subbranch for each week and merge that into the main team branch
- Connect to your playground org and start coding! 

## Development Requirements
- Must have completed and sent a review of Apex Fundamentals
- Must use SFDX, git, GitHub, and Visual Studio Code **NO DEVELOPER CONSOLE!** Only for logs....
- Your code should be able to run in any playground org via a GitHub repo
- Must be able to commit to meeting weekly with a large group
- Do not use configuration automation or middleware to do integration

## Resources
- [Trailhead - Apex Triggers](https://trailhead.salesforce.com/content/learn/modules/apex_triggers)
- [Apex Recipies - Trigger Examples](https://github.com/trailheadapps/apex-recipes/tree/main/force-app/main/default/triggers)
- [SFBen - Trigger Framework](https://www.salesforceben.com/the-salesforce-trigger-handler-framework/)
- [Trailhead - Set Up Visual Studio Code](https://trailhead.salesforce.com/content/learn/projects/quick-start-lightning-web-components/set-up-visual-studio-code)
- [Setup GitHub Repo and SFDX Project](https://youtu.be/SHGf_9NN4Sg)

## Notes
- Build Together is meant to be challenging. You will be asked to figure things out with your team. Sr. Dev will guide you but not a full outline of what you should be doing. Asking questions is the more important thing.
- You can use other resources but don’t just copy it word for word. You should be able to explain what your code is doing.
- Team members are meant to keep each other accountable, but if a team member is not pulling their weight, they will be cut.

## Read All About It

- [Salesforce Extensions Documentation](https://developer.salesforce.com/tools/vscode/)
- [Salesforce CLI Setup Guide](https://developer.salesforce.com/docs/atlas.en-us.sfdx_setup.meta/sfdx_setup/sfdx_setup_intro.htm)
- [Salesforce DX Developer Guide](https://developer.salesforce.com/docs/atlas.en-us.sfdx_dev.meta/sfdx_dev/sfdx_dev_intro.htm)
- [Salesforce CLI Command Reference](https://developer.salesforce.com/docs/atlas.en-us.sfdx_cli_reference.meta/sfdx_cli_reference/cli_reference.htm)

## License

MIT

**Free Software, Hell Yeah!**
