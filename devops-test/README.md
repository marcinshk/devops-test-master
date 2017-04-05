# DevOps test

The objective of this test is to create a simple API that accepts JSON payloads

To speed the process we've provided you with a set of JSON payloads, you can find them inside the `content` directory.
Every folder is an endpoint of your API, so the contents of `permissions` should go to the `permissions` endpoint, and so on.

If you feel like the provided JSON payloads are not good enough, feel free to create more

## Application

The application simulates an ACL, where the `users` are assigned `roles` and
this roles `roles` are composed of a set of `permissions`.

Design a CRUD API where you can Create, Remove, Update and Delete:
* users
* permissions
* roles

## General guidelines

### Application
* Use a programming language you're comfortable with.
* Create unit tests for your main classes (don't need to test all the classes, just the main ones)
* All inserted documents must be persisted at some persistence layer (preferably not files)

### Environment

* Make your application easily shippable and _agnostic_ to the underlaying Operating System ![whale](http://pix.iemoji.com/images/emoji/apple/ios-9/33/0450.png)
* Starting the application should not take more than 1 command (given the provider requirements have already been fulfilled)
