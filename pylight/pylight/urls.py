from django.conf.urls import patterns, include, url
from django.contrib import admin
from django.conf.urls.static import static
from django.conf import settings
from dbstorage.urls import dbstorage_url


admin.autodiscover()

urlpatterns = patterns(
    '',
    url(r'^', include('misc.urls', namespace='misc')),
    url(r'^', include('meetups.urls', namespace='meetups')),
    url(r'^admin/', include(admin.site.urls)),
    dbstorage_url()
) + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
