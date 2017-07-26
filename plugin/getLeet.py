#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""
    Scrape the description of certain leetcode problem.
    This script need to read current vim buffer line as webpage address.
    Note: this is a vim extended plugin-in written in Python.
    Can only run within vim.
"""
import vim
import requests
import BeautifulSoup as bs3

cur_line = vim.current.line
cur_b = vim.current.buffer

# fetch raw webpage
page = requests.get(cur_line)
# use beautifultsoup to store
soup = bs3.BeautifulSoup(page.content)

# get title name:
titleTag = soup.html.head.title
title_str = titleTag.contents

# get description
desSet = soup.findAll("meta", attrs={'name':'description'})
desTag = desSet[0]

des_str = desTag.get("content")
des_list = des_str.split('\r\n')

# write description back to buffer
ind = 0
for i, e in enumerate(cur_b):
    if e == cur_line:
        ind = i
        break
    else:
        continue
# delete webpage address
del cur_b[ind]

# write description in buffer
cur_b.append(des_list, ind)

