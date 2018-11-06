[![Stories in Ready](https://badge.waffle.io/CSC322-Grinnell/volunteer-board.png?label=ready&title=Ready)](https://waffle.io/CSC322-Grinnell/volunteer-board)
# README
Tapiwa
This repository contains the Volunteer Board application, created in partnership with the Greater Poweshiek Community Foundation. The goal of this project is to create a space for organizations to connect with community members for volunteering opportunites.

## Installation
To clone the project to your local machine, run:
```bash
git clone https://github.com/CSC322-Grinnell/volunteer-board.git
```

Then to install gems and migrate the database, run:
```bash
bundle install
rails db:reset
rails db:migrate
```

## Tests
To run the tests for the repository, run:
```bash
rails db:migrate RAILS_ENV=test
rails test
```

## Admins
To login as an admin, go to:
```
/admin
```

## Deployment

The app is currently deployed at:
```
https://murmuring-reef-33062.herokuapp.com/
```

## Contributors

Spring 2017:
Benjamin Wong, Greyson Bourgeois, Zoe Grubbs, Tyler Williams, Devin Dooley
