from .base import *

# we need explicit DEBUG=true
DEBUG = get_env_var("DEBUG", default="true").lower() in ("1", "true", "on")
TEMPLATE_DEBUG = DEBUG

MEDIA_ROOT = os.path.join(PROJECT_ROOT, '../upload')

DB_PATH = os.path.join(PROJECT_ROOT, "../sqlite.db")

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.sqlite3',
        'NAME': DB_PATH,
    }
}

EMAIL_BACKEND = 'django.core.mail.backends.console.EmailBackend'
