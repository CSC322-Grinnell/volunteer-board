[![Stories in Ready](https://badge.waffle.io/CSC322-Grinnell/volunteer-board.png?label=ready&title=Ready)](https://waffle.io/CSC322-Grinnell/volunteer-board)
# README
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
https://lit-brook-63057.herokuapp.com/
```

## Dummy user credentials
name: John Test
password: password

## Contributors

Fall 2018:
Tapiwanashe Zvidzwa, Seth Ruiz, Papa Kojo Ampim-Darko, Kamal Nadesan, Willem Junker

Spring 2017:
Benjamin Wong, Greyson Bourgeois, Zoe Grubbs, Tyler Williams, Devin Dooley
