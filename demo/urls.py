from django.urls import path
from .views import hello, healthz

urlpatterns = [
    path('', hello),
    path('healthz', healthz),

]
