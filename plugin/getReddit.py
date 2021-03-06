#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""
    A vim plugin with Python.
    To retrieve the content of the homepage of Reddit and display it in the
    current buffer
    source:
    https://dzone.com/articles/how-write-vim-plugins-python
"""

# the vim module contains everything we need to interface with
# python. We need urllib2 (or requests) for web service cosumer.
import vim
import urllib2    #requests
# we need json for parsing the response
import json

# we need define a timeout that we'll use in the API call. We don't want
# users to wait too much.
TIMEOUT = 200
URL = "http://reddit.com/.json"

try:
    # Get the posts and parse the json response
    response = urllib2.urlopen(URL, None, TIMEOUT).read()  #requests.get(URL, timeout=TIMEOUT)
    json_response = json.loads(response)

    posts = json_response.get("data", "").get("children", "")

    # vim.current.buffer is the current buffer. It's list-like object.
    # each line is an item in the liust. We can loop through them, delete
    # them, alter them, ... etc.
    # Here we delete all lines in the current buffer
    del vim.current.buffer[:]

    # Here we append some lines above. Aesthetics.
    vim.current.buffer[0] = 80 * "-"

    for post in posts:
        # In the next few line, we get the post details
        post_data = post.get("data", {})
        up = post_data.get("ups", 0)
        down = post_data.get("downs", 0)
        title = post_data.get("title", "NO TITLE").encode("utf-8")
        score = post_data.get("score", 0)
        permalink = post_data.get("permalink").encode("utf-8")
        url = post_data.get("url").encode("utf-8")
        comments = post_data.get("num_comments")

        # And here we append line by line to the buffer.
        # First the upvotes
        vim.current.buffer.append("↑ %s" % up)
        # Then the title and url
        vim.current.buffer.append("    %s [%s]" %(title, url,))
        # Then the downvotes and number of comments
        vim.current.buffer.append("↓ %s   | comments: %s [%s]" %(down, comments, permalink,))
        # And last we append some "-" for visual appeal.
        vim.current.buffer.append(80 * "-")

except Exception, e:
    print e

