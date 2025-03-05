from robot.api.deco import keyword
from pymongo import MongoClient

client = MongoClient('mongodb+srv://qax:xperience@cluster0.5ellpav.mongodb.net/markx?retryWrites=true&w=majority&appName=Cluster0')

db = client['markx']

@keyword('Remove task form database')
def remove_task_by_name(task_name):
    collection = db['tasks']
    collection.delete_many({'text': task_name})
    print('Removendo a tarefa ' + task_name)