<<-DOC

HTTP Challenge
--------------

* Define the common HTTP verbs
  - GET: Retrieve
  - POST: Create
  - PUT/PATCH: Replace (all or part)
  - DELETE: Delete

* Use the tool of your choice to draw the HTTP request/response cycle.
  - include a link to your diagram, here
  http://i.imgur.com/7eIlHPa.jpg

* Use telnet, curl, or ruby code to retrieve the messages at
  launch-academy-chat.herokuapp.com/messages

* Use telnet, curl, or ruby code to create a new message at
  launch-academy-chat.herokuapp.com/messages

  - Kernel::system method in ruby will allow you to execute command-line utilities such as curl.
  - other useful ruby libraries:
    * Net::HTTP
    * Net::Telnet

DOC

require 'open-uri'
require 'nokogiri'

doc = Nokogiri::HTML(open("http://launch-academy-chat.herokuapp.com/messages"))
puts doc.css("div[@class='pure-u-1-2 content']").text

system("curl -d content='you miss every shot you dont take :)' http://launch-academy-chat.herokuapp.com/messages")
