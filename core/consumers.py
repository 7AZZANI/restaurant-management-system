from channels.generic.websocket import WebsocketConsumer
from asgiref.sync import async_to_sync

import json

class AdminDashboardConsumer(WebsocketConsumer):
    def connect(self):
        self.room_group_name = 'admin'
        async_to_sync(self.channel_layer.group_add)(
            self.room_group_name,
            self.channel_name
        )
        self.accept()
        self.send(text_data=json.dumps({
            "type": "connection_success"
        }))

    def disconnect(self, close_code):
        async_to_sync(self.channel_layer.group_discard)(
            self.room_group_name,
            self.channel_name
        )

    def receive(self, text_data):
        async_to_sync(self.channel_layer.group_send)(
            self.room_group_name,
            {
                'type': 'update_dashboard',
                'payload': text_data
            }
        )

    def update_dashboard(self, event):
        payload = json.loads(event['payload'])
        self.send(text_data=json.dumps({
            'payload': payload
        }))


