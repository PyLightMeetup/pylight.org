## How to work on pylight.org website locally (without heroku)

This way is more Django oriented, and closer to how most apps are developed.

1. Make sure you've python 3.x installed on your machine (3.6 is preffered, but 3.4, 3.5 should do) 
2. Create virtualenv using python3.6 and activate it.
3. `pip install -r requirements.txt`
5. `SECRET_KEY=secret python pylight/manage.py migrate`
6. `SECRET_KEY=secret python pylight/manage.py runserver`
7. `SECRET_KEY=secret python pylight/manage.py loaddata pylight/meetups/fixtures/meetup.json` to load some test data, optionally
8. Visit `http://localhost:8000`



## How to work on pylight.org locally using heroku

This way is closer to how our website is deployed and can catch more errors.

1. Make sure you've python 3.x installed on your machine (3.6 is preffered, but 3.4, 3.5 should do)
2. Create virtualenv using python3.6 and activate it.
3. `pip install -r requirements.txt`
4. Install https://devcenter.heroku.com/articles/heroku-cli
5. `heroku local:run python pylight/manage.py migrate`
5. `heroku local:run python pylight/manage.py collectstatic` (if you're not running in DEBUG mode)
6. `heroku local:run python pylight/manage.py loaddata pylight/meetups/fixtures/meetup.json` to load some test data, optionally
7. `heroku local`  (adjust DEBUG as required)
8. Visit `http://localhost:5000`


## Common notes

Without additional config, application starts as close as possible to production
environment (this means, no DEBUG, wsgi server, etc.) It makes development a bit
more involved, but it's easier to produce app that will run on prod when deployed :)
