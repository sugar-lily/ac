import requests
import sys

url = "https://notify-api.line.me/api/notify" 
token = "JC6fsKtx9hsqysuV8MUXGEGbWfeH04gXTtN3mQM2z7E"
headers = {"Authorization" : "Bearer "+ token} 
message = "The room temperture's rising : " + sys.argv[1] + "C" 
payload = {"message" :  message} 
r = requests.post(url, headers = headers, params=payload)
