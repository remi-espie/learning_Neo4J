from kafka.admin import KafkaAdminClient, NewTopic
from kafka import KafkaProducer
import os

def create_topic(topic_name, num_partitions, replication_factor):
    admin_client = KafkaAdminClient(
        bootstrap_servers="localhost:9092",
        client_id='test'
    )

    topic_list = []
    topic_list.append(NewTopic(name=topic_name, num_partitions=num_partitions, replication_factor=replication_factor))
    admin_client.create_topics(new_topics=topic_list, validate_only=False)

def read_users_from_folder(folder_path):
    users = []
    for filename in os.listdir(folder_path):
        if filename.endswith(".csv"):  # Assuming user data is in text files
            with open(os.path.join(folder_path, filename), 'r') as file:
                users.append(file.read().strip())
    return users

def send_users_to_kafka(topic_name, users):
    producer = KafkaProducer(bootstrap_servers='localhost:9092')
    for user in users:
        producer.send(topic_name, user.encode('utf-8'))
    producer.flush()

if __name__ == "__main__":
    # create_topic("users", 1, 1)
    users = read_users_from_folder("./users")
    send_users_to_kafka("users", users)
