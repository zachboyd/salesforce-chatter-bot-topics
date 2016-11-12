Salesforce Chatter Bot for Topics
=========================

Overview
----------------
Chatter Bot for Topics is a way to easily listen for topic assignments to a Chatter post and take action. An example would be to automatically create a Case when a topic is assigned to a Chatter post. Unfortunately, you cannot just leverage Process Builder to monitor the creation of a TopicAssignment object. This project makes it easy by monitoring the topics that you want and then creating a custom object that you can leverage within Process Builder.

Installation
----------------------

* [Deploy from Github](https://githubsfdeploy.herokuapp.com)

Getting Started
----------------------

1. Deploy code using link above
2. Assign **Chatter Bot Topics Admin** permission set to your user
3. Switch to **Chatter Bot Topics** app
4. Create a new **Chatter Bot Topic** object with the topic name you want to listen for and set to active

Everytime a topic with that name is assigned to a Chatter post then a **Chatter Bot Topic Assignment** will be created. You can use Process Builder to execute when that object is created and take any actions that you need.