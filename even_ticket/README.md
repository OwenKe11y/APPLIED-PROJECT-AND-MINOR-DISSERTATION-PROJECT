![GitHub Project Logo](https://github.com/OwenKe11y/APPLIED-PROJECT-AND-MINOR-DISSERTATION-PROJECT/blob/main/Images/Detailed%20Concepts/EvenTicket%20Logo.JPG?raw=true)

A new Flutter project. Here, any new developments or important snippets of information relating to the project will be 
documented.

***

## File Structure

The file structure for the project follows a <b>Folder-by-Layer</b> approach.
A small description of each folder in the main lib folder is described below.

[Article used to create the file structure](https://www.section.io/engineering-education/flutter-folder-organization/)

### Data Folder
The data folder contains data collections that are fetched from services or databases. 
For instance, if our application will use firebase, we could have a user model containing information about the user relating to password name, age, etc.

### Screens Folder
Services folder should handle your application’s networking logic. 
For example, once a user gets authenticated with Google or GitHub, the application needs to update the backend with the access token. 
The service folder will contain the implementation of the logic responsible for handling this functionality.

### Services Folder
Services folder should handle your application’s networking logic. For example, once a user gets authenticated with Google or GitHub, the application needs to update the backend with the access token. The service folder will contain the implementation of the logic responsible for handling this functionality.

### Utils Folder
This folder contains the functions used to implement the application’s business logic. For instance, if we build a social media application that supports a multi-account login, the utilities will ensure that the data rendered is changed according to the currently logged-in account.

### Widget Folder
This folder contains widgets that are used repeatedly in the application. If you are using an API to list GitHub accounts following a particular user, the followers’ list view remains the same. Only the data that is rendered is dynamic. In such a case, we will use the <i>followers widget</i> in our widgets folder.
