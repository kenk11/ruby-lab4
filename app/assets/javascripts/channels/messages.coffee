console.log("setting up messages channel", App.cable)
App.messages = App.cable.subscriptions.create "MessagesChannel",
  connected: ->
    console.log("connected")
# Called when the subscription is ready for use on the server

  disconnected: ->
    console.log("disconnected")
# Called when the subscription has been terminated by the server

  received: (data) ->
# Called when there's incoming data on the websocket for this channel
    console.log("data received": data)
    $(".messages").append(data.message)

  test: (data) ->
# notice that this calls the javascript defined by MessagesChannel#test on the server
    @perform 'test', message: data