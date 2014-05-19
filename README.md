Welcome to Barbot on Rails
======

Barbot is a robotic drink mixing machine, that was built in a hurry, and came out better than expected.

BARBOT was concieved and built in the two days leading up to New Year's Eve 2013. After two long nights of work, the bot came to life hours before the New Year's party it was built for. It was of course a big hit.

![alt text](http://blnorris.com/barbot/img/front.jpg "Barbot Alpha 1")

This, unfortunately, did not leave time to develop a proper UI for it. However, now that I am becoming an actual web developer, I thought it was time for an upgrade. Thus, the BARBOT interface was born.




Technical
------
If you're looking for the hardware/firmware [go here](https://github.com/BLNorris/BarBot).


#####BarBot-Rails was built with Ruby on Rails, using Postgresql

###Front End

####Foundation

#####Zurbs foundation template was used for several of the design element, as well as the grid system it employs.

####Animations

#####Animate.css - http://daneden.me/animate

####HAML

#####I am in progress converting the HTML view files over to HAML, as I think it's better.


###Back End

####Rails

#####Ruby 1.9.3
#####Rails 3.2.17

####Authentication

#####Devise
This was way overkill, but I wanted to learn it.


Run your own
------


####Locally
#####needs to be on a unix based system to run the unicorn webserver
You will need a postgreSQL server running on your local box.
You will need a sendgrid account(make one thru Heroku, its easy)
You will need ruby 1.9.3 installed as well as the bundle gem

copy .env-sample to .env and fill in the sample info.

run these commands
```
rake db:create
rake db:migrate
bundle install
foreman start
```

You should have a server running on localhost:5000

