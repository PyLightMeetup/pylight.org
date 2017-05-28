from .base import *
import dj_database_url

DEBUG = False
TEMPLATE_DEBUG = DEBUG

MEDIA_ROOT = os.path.join(PROJECT_ROOT, '../../media')

DATABASES = {'default': dj_database_url.config()}

EMAIL_HOST = get_env_var('EMAIL_HOST')
EMAIL_PORT = int(get_env_var('EMAIL_PORT'))
EMAIL_USE_TLS = get_env_var('EMAIL_USE_TLS') == 'true'
EMAIL_HOST_USER = get_env_var('EMAIL_HOST_USER')
DEFAULT_FROM_EMAIL = EMAIL_HOST_USER
EMAIL_HOST_PASSWORD = get_env_var('EMAIL_HOST_PASSWORD')
SERVER_EMAIL = EMAIL_HOST_USER
