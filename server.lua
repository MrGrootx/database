ESX = exports["es_extended"]:getSharedObject()


ESX.RegisterCommand('newname', 'user', function(xPlayer, args, showError)
   -- xPlayer.triggerEvent('chat:clear')
   print(args[1] .. " ".. args[2])
   local senderId = xPlayer.getIdentifier()
   MySQL.Async.transaction(
      {
         -- table name [users] ,  particular row id firstname
         'UPDATE users SET firstname = @name WHERE identifier = @senderId',
         'UPDATE users SET lastname = @lastname WHERE identifier = @senderId2'
      },
      {
         ['name'] = args[1], ['senderId'] = senderId,
         ['lastname'] = args[2], ['senderId2'] = senderId
      },
      function(success)
         print("Player" .. senderId .. "called now " .. args[1])
         print(success)
      end
   )
end, false)
