from robot.api.deco import keyword
from pymongo import MongoClient
from dotenv import load_dotenv
import os

load_dotenv()

database_url = os.getenv("MONGO_URI")

client = MongoClient(database_url)

db = client['markx']

@keyword('Remove task form database')
def remove_task_by_name(task_name):
    collection = db['tasks']
    collection.delete_many({'text': task_name})
    print('Removendo a tarefa ' + task_name)