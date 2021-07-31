from bs4 import BeautifulSoup
import requests
import json
from datetime import datetime
import time
import os
import sys
from lxml import html

baseURL = 'https://getnada.com/api/v1'


def get_mails(address: str):
    response = requests.get(f'{baseURL}/inboxes/{address}')
    data = json.loads(response.text)

    msgs = []

    for d in data['msgs']:
      msgs.append(d['uid'])

    return msgs

def get_mail(uid: str):
    response = requests.get(f'{baseURL}/messages/html/{uid}')
    soup = BeautifulSoup(response.text, features="html.parser")
    tree = html.fromstring(soup.__str__())
    result = tree.xpath('//p[text()]')
    print(result)
