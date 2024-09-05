from datetime import datetime
class Task:
    def __init__(self, id, description = "", status = 'todo', created_at = None, updated_at = None):
        self.id = id
        self.description = description
        self.status = status
        self.created_at = created_at or datetime.now().isoformat()
        self.updated_at = updated_at or datetime.now().isoformat()

    def update_description(self, description):
        self.description = description
        self.updated_at = datetime.now().isoformat()

    def update_status(self, status):
        self.status = status
        self.updated_at = datetime.now().isoformat()

    def to_dict(self):
        return {
            'id': self.id,
            'description': self.description,
            'status': self.status,
            'created_at': self.created_at,
            'updated_at': self.updated_at
        }

    @staticmethod
    def from_dict(data):
        return Task(
            id=data['id'],
            description=data['description'],
            status=data['status'],
            created_at=data['created_at'],
            updated_at=data['updated_at']
        )

