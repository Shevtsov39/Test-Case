import requests

link = "https://reqres.in/api/unknown/"
plade = { "name": "fuchsia rose", 
         "year": "2001"
}
response = requests.post(link,data=plade)
print(response.text)