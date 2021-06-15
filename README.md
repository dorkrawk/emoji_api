# EmojiApi

Here's a new basic Sinatra app.

To run it locally:
`ruby app.rb`
or
`shotgun app.rb`

## Quick Test Commands:
```
> ruby app.rb
> curl http://localhost:4567/emjoify/turtle -H "Accept: application/json"
```

should return:
```
{"status":"success","message":"","content":"🐢"}
```
