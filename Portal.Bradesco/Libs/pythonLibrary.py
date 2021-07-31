import json
import decimal
import datetime
import ast
import uuid
import hashlib
import binascii
from decimal import Decimal
from datetime import datetime

def help_converter(item):
    item2 = json.loads(item)
    return item2

def b64encode(s, altchars=None):
    # Strip off the trailing newline
    encoded = binascii.b2a_base64(s)[:-1]
    if altchars is not None:
        return _translate(encoded, {'+': altchars[0], '/': altchars[1]})
    return encoded

def gera_guid():
    a = uuid.uuid4()
    return str(a)

def retorna_data(stringData):
    date = str(datetime.strptime(stringData.strip(' \t\r\n'), '%b %d %Y'))
    data = date[0:10]
    print(data)
    return  data

if __name__ == '__main__':
    gera_guid()
