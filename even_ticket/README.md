![GitHub Project Logo](https://github.com/OwenKe11y/APPLIED-PROJECT-AND-MINOR-DISSERTATION-PROJECT/blob/main/Images/Detailed%20Concepts/EvenTicket%20Logo.JPG?raw=true)

A new Flutter project. Here, any new developments or important snippets of information relating to the project will be 
documented.

***

# File Structure

The file structure for the project follows a <b>Folder-by-Layer</b> approach.
A small description of each folder in the main lib folder is described below.

[Article used to create the file structure](https://www.section.io/engineering-education/flutter-folder-organization/)

## Constants Folder
The constants folder is responsible for consistant functions used throughout the application. This is different to the Widgets folder as Widgets are front end components that are consistant, however the contents are purely functions used to enhance the application such as consistant styles.

## Controllers Folder
The controllers folder handles functionality of the UI components such as navigation.

## Data Folder
The data folder contains data collections that are fetched from services or databases. 
For instance, if our application will use firebase, we could have a user model containing information about the user relating to password name, age, etc.

## Pages Folder
Services folder should handle the application’s networking logic. 
For example, once a user gets authenticated with Google or GitHub, the application needs to update the backend with the access token. 
The service folder will contain the implementation of the logic responsible for handling this functionality.

## Routing Folder
The routing folder handles the application's navigation routing to each individual page.

## Services Folder
Services folder should handle your application’s networking logic. For example, once a user gets authenticated with Google or GitHub, the application needs to update the backend with the access token. The service folder will contain the implementation of the logic responsible for handling this functionality.

## Utils Folder
This folder contains the functions used to implement the application’s business logic. For instance, if we build a social media application that supports a multi-account login, the utilities will ensure that the data rendered is changed according to the currently logged-in account.

## Widgets Folder
This folder contains widgets that are used repeatedly in the application. 
### Screen_Sizes
Sub folder which contains widgets for the responsive screen sizes 
### Side_menu
Sub Folder which contains widgets for the dashboard menu for the application

## layout.dart
Class for determining responsive page layout, out putting the correct screen depending on the size

## main.dart 
Class which contains the main method. This class runs the application
***
