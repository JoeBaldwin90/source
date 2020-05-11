# Source
Source is a subscription based photography website built with Ruby on Rails 5.2.3. [View the production site here](https://bit.ly/313smNR). For log-in instructions, see below. 

## Goal
To build a full-stack application with user authentication and subscription payments. 

#### Timeframe
Two weeks 

## Features
- Landing page for logged-out users or visitors without an account. 
- User log in & sign up. 
- Admin user panel.
- Subscription payment plans. 
- Searchable categories.
- Flash messages.

## Technologies used
- HTML5 / CSS
- BCrypt & sessions
- git / gitHub
- Heroku pipeline
- ActiveAdmin
- Devise
- Simple form
- Fog-AWS
- Carrierwave
- Stripe
- PostgreSQL and SQLite

## App overview
Source is a basic photography website inspired by [unsplash](https://unsplash.com/) which offers high-quality photography for users who pay a monthly subscription. 

This application allows logged-in users to search for a range of photographs using the search tool or category list, then download the full-resolution images for their own use. They can also change their subscription plan at any time. Admin users have full-control over the list of categories, images published on the website and 

## Logging in
It's possible to sign-up for an account with any email and password combination. The test card details you will need are: `4242 4242 4242 4242` with any future expiry date and any CVC or ZIP code. Once logged-in you will be able to access the full website regarless of whether you selected a "pro" or "basic" subscription plan. 

## Process
After planning the relationships of the categories and items (photos), I created the models in my command line and hooked up the has_many and has_many through relationships in my model folder. I then created the RESTful routes needed to view, create, edit and delete these resources. I added Admin users to protect some routes from paying users.

This project was managed using the Kanban methodology with Trello. 

## Challenges
Working with ActiveAdmin's documentation. 

## Wins
Setting up stripe and getting to grips with the new Rails credentials was by biggest win. Although I've changed the production site to accept test card payments for usability reasons, I struggles to get my head around the environment variables, so I felt accomplished when I set environemnt-sepcific API key which picked the relevant key from my nested credentials file: `Rails.application.credentials[Rails.env.to_sym][:stripe_secret]`. 


## Future development

- Better styling with Responsive CSS.
- Improved landing page with subscription plan details.
- Restricted proviledges for basic subscription users. 
