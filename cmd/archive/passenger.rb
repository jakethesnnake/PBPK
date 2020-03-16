# start passenger (attach to port)

passenger start -a 127.0.0.1 -p 3000 -d -e development

# passenger stop/restart
passenger stop -p 3000
passenger restart -p 3000