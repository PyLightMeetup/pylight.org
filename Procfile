release: python pylight/manage.py migrate
web: gunicorn --chdir pylight pylight.wsgi:application
