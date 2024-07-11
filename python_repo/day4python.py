# Day 4 Notes
# 2024-07-11

# a = 10
# b = 20
# c = a + b
# print("{0} + {1} = {2}".format(a, b, c))
#
# # Strings
# sp = "Shandong University School of Management"
# s = sp.split()
# for item in s:
#     print(item)
#
# # The map function in Python
# lst = [1, 2, 3, 4, 5]
# s = [item ** 2 for item in lst]
# print(lst)
# print(s)

# Web scraping

import urllib.request
from bs4 import BeautifulSoup
import re

# Capture news titles
# url = "https://www.view.sdu.edu.cn/zhxw.htm"
#
# response = urllib.request.urlopen(url)
# soup = BeautifulSoup(response, "html.parser")
# # print(soup)
#
# ul = soup.findAll("ul", attrs = {"class": "sublist"})
# for item in ul:
#     # print(item)
#     li = item.findAll("li")
#     for li_item in li:
#         # print(li_item)
#         for a_item in li_item:
#             print(a_item.text)

# Capture news contents
url = "https://www.view.sdu.edu.cn/info/1022/193482.htm"
#
response = urllib.request.urlopen(url)
soup = BeautifulSoup(response, "html.parser")
# print(soup)

# <div class="news_content"

div = soup.findAll("div", attrs = {"class":"news_content"})

# Save output to a text file named sdu_news_content.txt
with open("sdu_news_content.txt", mode="w") as file:
    for item in div:
        # print(item)
        # p = item.findAll("p")
        # for p_item in item:
        #     # print(p_item.text)
        #     file.write(p_item.text)
        pattern = re.compile("<p>.*<\/p>")
        results= re.findall(pattern, str(item))
        for result_item in results:
            # print(result_item[3:-4])
            file.write(result_item[3:-4])