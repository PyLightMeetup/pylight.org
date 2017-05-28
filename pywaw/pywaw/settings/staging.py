from .base import *
import dj_database_url


DEBUG = True
TEMPLATE_DEBUG = DEBUG

MEDIA_ROOT = os.path.join(PROJECT_ROOT, '../../media')

DATABASES = {'default': dj_database_url.config()}

ALLOWED_HOSTS += ['pylight-staging.herokuapp.com']
