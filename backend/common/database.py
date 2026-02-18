import os
import asyncio

class MockCollection:
    def __init__(self, name):
        self.name = name
        self.data = {}

    async def find_one(self, query):
        for item in self.data.values():
            if all(item.get(k) == v for k, v in query.items()):
                return item
        return None

    async def insert_one(self, document):
        # Handle string _id or generate one
        if "_id" not in document:
            document["_id"] = str(len(self.data) + 1)
        self.data[document["_id"]] = document
        return document

    def find(self, query=None):
        query = query or {}
        results = []
        for item in self.data.values():
            if all(item.get(k) == v for k, v in query.items()):
                results.append(item)
        
        class MockCursor:
            def __init__(self, data):
                self.data = data
            async def to_list(self, length=None):
                return self.data[:length] if length else self.data
        
        return MockCursor(results)

class MockDatabase:
    def __init__(self):
        self.collections = {}

    def __getattr__(self, name):
        if name not in self.collections:
            self.collections[name] = MockCollection(name)
        return self.collections[name]

    def __getitem__(self, name):
        return self.__getattr__(name)

# Singleton instance
mock_db = MockDatabase()

def get_database():
    return mock_db
