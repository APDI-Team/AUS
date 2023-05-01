import firebase_admin
from firebase_admin import credentials
from firebase_admin import firestore

import fire


def main(path_to_credential='/Users/synch/apdi-aus-firebase-adminsdk-u2m9e-d427378380.json'):
    # Use the application default credentials
    cred = credentials.Certificate(path_to_credential)
    firebase_admin.initialize_app(cred)
    DB = firestore.client()

    # TODO


if __name__ == "__main__":
    fire.Fire(main)
