from django.urls import re_path, path

from coreapp import consumers

websocket_urlpatterns = [
    # re_path(r'ws/chat/(?P<room_name>\w+)', consumers.ChatRoomConsumer),
    re_path(r'ws/chat/(?P<room_name>\w+)/$', consumers.ChatRoomConsumer.as_asgi()),

]
