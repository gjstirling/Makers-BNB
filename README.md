# Makers-BNB
Week 5: Makers Air BNB clone team project

# Product Specification

We would like a web application that allows users to list spaces they have available, and to hire spaces for the night.

Headline specifications
------------------------
* Any signed-up user can list a new space.
* Users can list multiple spaces.
* Users should be able to name their space, provide a short description of the space, and a price per night.
* Users should be able to offer a range of dates where their space is available.
* Any signed-up user can request to hire any space for one night, and this should be approved by the user that owns that space.
* Nights for which a space has already been booked should not be available for users to book that space.
* Until a user has confirmed a booking request, that space can still be booked for that night.

Nice-to-haves
-----------------
* Users should receive an email whenever one of the following happens:
* They sign up
* They create a space
* They update a space
* A user requests to book their space
* They confirm a request
* They request to book a space
* Their request to book a space is confirmed
* Their request to book a space is denied
* Users should receive a text message to a provided number whenever one of the following happens:
* A user requests to book their space
* Their request to book a space is confirmed
* Their request to book a space is denied
* A ‘chat’ functionality once a space has been booked, allowing users whose space-booking request has been confirmed to chat with the user that owns that space
Basic payment implementation though Stripe.

Mockups
--------------------------
Mockups for MakersBnB are available here.

# User Stories 

````
As a User
So my space can be viewed by others
I would like to create a space

As a User
So I can advertise multiple spaces
I would like to list multiple spaces

As a User
So other users can get information about my spaces
I can name, price and describe my space

As a User/Owner of space
So I can show availability to other users
I can set available dates for my spaces

As a User
So that I can hire a space
I want to be able to book a space

As a User/Owner of space
So that I can approve bookings from other users
I would like to confirm a booking

As a User
So I don't see spaces that have already been booked
I would like to only see available booking dates

As a the Owner of space
So my space is continually advertised
I would like to confirm completed bookings

````
