ESX = exports["es_extended"]:getSharedObject()


ESX.RegisterCommand('newname', 'user', function(xPlayer, args, showError)
   -- xPlayer.triggerEvent('chat:clear')
   senderId = xPlayer.getIdentifier()
   MySQL.Async.transaction(
      {
         -- table name [users] ,  particular row id firstname
         'UPDATE users SET firstname = @name WHERE identifier = @senderId'
      },
      {
         ['name'] = args[1], ['senderId'] = senderId
      },
      function(success)
         print("Player" .. senderId .. "called now " .. args[1])
         print(success)
      end
   )
end, false)
