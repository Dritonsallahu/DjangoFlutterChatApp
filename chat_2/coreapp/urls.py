from django.urls import path

from coreapp import views

urlpatterns = [
    path('', views.index, name='index'),
    path('<str:room_name>', views.room, name="room")
]