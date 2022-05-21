# Applied Project and Minor Dissertation Project 2021

![GitHub Project Logo](https://github.com/OwenKe11y/APPLIED-PROJECT-AND-MINOR-DISSERTATION-PROJECT/blob/main/Images/Detailed%20Concepts/EvenTicketGitLogo.PNG?raw=true)

This is the repository which contains the project for a team of three participating in the 45627 -- APPLIED PROJECT AND MINOR DISSERTATION module in Galway-Mayo Institute of Technology. Contained within this repository is the source code as well as all relevent submission materials for the project.

***

| **Project Title** | EvenTicket - an event ticket distributing platform
| :------------- |:-------------|
| **Course**              | BSc (Hons) in Software Development |
| **Module**              | Applied Project and Minor Dissertation |
| **Institute**           | [Galway-Mayo Institute of Technology](https://www.gmit.ie/) |
| **Students**             | [Owen Kelly](https://github.com/OwenKe11y) - G00366614@gmit.ie <br> [John Groves](https://github.com/johngroves1) - G00367771@gmit.ie <br> [Enda Goggin](https://github.com/EndaGoggin) - G00369903@gmit.ie  |
| **Project Supervisors**     | Joe Corr <br>Martin Kenirons|
| **Module Supervisor**   | Dr. John Healy |

The efforts of the team members listed have been collected and documented in this GitHub repository. In accordance with [GMIT's plagarism policy](https://www.gmit.ie/sites/default/files/public/general/docs/policy-plagiarism-2019.pdf), all work in this repository is owned by the team members listed above. All sources and aids used have been indicated as such. All texts either quoted directly or paraphrased have been indicated by in-text citations.

***

# Project Overview

This project is a ticket distributing platform for smaller scale events being hosted and advertised by organisers. The purpose of the project is to allow smaller scale events, such as marathons, gigs and nightclubs to be advertised and showcased on one multi-platform application. 

The sale of tickets for such events are locked to the account of the user who purchased them and are authenticated using facial recognition patterns at the event using the users uploaded profile picture. This was all done to combat the rise of ticket scalping and redistribution. The application is multi-platform and is currently available on android devices and a web browser. The application features two experiences. 

# Requirements

 * [Flutter (v2.x.x)](https://docs.flutter.dev/get-started/install/windows)
 * [Android Studio](https://developer.android.com/studio?gclid=Cj0KCQjwm6KUBhC3ARIsACIwxBjiOEEe4WTYOJxOUFo3yRJk_XFyz83_UhF6gD3k4olDke2GJ0Rm5McaArzpEALw_wcB&gclsrc=aw.ds)
 * [Visual Studio Installer (for packages)](https://visualstudio.microsoft.com/vs/community/)
 * [Visual Studio Code (with associated Flutter extensions)](https://code.visualstudio.com/)

# Features

## Multi-Platform and Multi-Experience
<p align="center">
<img src="/Images/Views/View.png" width="800" height="500" >
</p>
A multi-platform application with two experiences. A user experience signified by the green theme and the organiser experience signified by the purple theme. This application can be built for both Android platforms and for the web browser. However, the Android environment is where this application thrives. <br><br>
 
## Browse Through Events with Ease

<p align="center">
<img src="/Images/Views/FilteringFeature.gif" height="600">
</p>

Featured on the home page are Events posted by organisers. Options are available to sort through the events with tags. Using this you can find the events most interesting to you.

## Several payment options and event details displayed
<p align="center">
<img src="/Images/Views/EventDetailsFeature.gif"  height="600">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<img src="/Images/Views/PaymentFeature.gif" height="600">
</p>

Each event holds details. Here, microinteractions can be performed like navigating maps for the location, browsing through photo galleries, liking the event and purchasing tickets. The payment screen features options to pay for tickets of that event.

## Organiser Management

<p align="center">
<img src="/Images/Views/CreateFeature.gif" height="600"> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<img src="/Images/Views/OrganiserFeature.gif" height="600">
</p>

Organisers can create and post new events for users to see. They can also manage that event by viewing created events and deleting them if they so wish.

## Facial recognition features to verify a users purchase
<p align="center">
  <img src="/Images/Views/NoMatchFeature.PNG" height="550"> <img src="/Images/Views/MatchFeature.png" height="550"> <img src="/Images/Views/ManyFacesFeature.PNG" height="550">
</p>

Organisers can verify the purchase of a ticket by a user at the venue with the scanner. The scanner will match the face with the face of the users profile picture. If the user has a verified purchase of a ticket then the application will display a match.

# Building the App Locally

This video explains how to set up the development environment to build and run the application.

### The video can be found [here](https://youtu.be/c5stQ6yDsFs)

# Regarding the Facial Recognition



