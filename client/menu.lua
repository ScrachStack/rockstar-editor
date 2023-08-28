lib.registerMenu({
    id = 'editor',
    title = 'Rockstar Editor',
    position = 'top-right',
    options = {
        {label = 'Record', args={id='record'}, },
        {label = 'Save Clip', args={id='save'},},
        {label = 'Delete Clip', args={id='discard'},}, 
        {label = 'Enter Rockstar Editor', args={id='enter'},},
    }
}, function(selected, scrollIndex, args)
    if args.id == 'record' then
        TriggerEvent('record')
    elseif args.id == 'save' then
        TriggerEvent('saveclip')
    elseif args.id == 'discard' then
        TriggerEvent('discard')
    elseif args.id == 'enter' then
        TriggerEvent('gointo:editor')
    end
    print(selected, scrollIndex, args)
end)
 
RegisterCommand('editor', function()
    lib.showMenu('editor')
end)
RegisterKeyMapping('+editor', 'Open Rockstar Editor Menu', 'keyboard', 'f7')

RegisterNetEvent("record")
AddEventHandler("record", function()
    StartRecording(1) 
    lib.notify({
        id = 'some_identifier',
        title = 'Rockstar Editior',
        description = 'Record.',
        position = 'top',
        style = {
            backgroundColor = '#141517',
            color = '#C1C2C5',
            ['.description'] = {
              color = '#909296'
            }
        },
    })
    
end)
RegisterNetEvent("saveclip")
AddEventHandler("saveclip", function()
    StartRecording(0)
    StopRecordingAndSaveClip()
    lib.notify({
        id = 'some_identifier',
        title = 'Rockstar Editior',
        description = 'Save Clip.',
        position = 'top',
        style = {
            backgroundColor = '#141517',
            color = '#C1C2C5',
            ['.description'] = {
              color = '#909296'
            }
        },
    })

end)

RegisterNetEvent("discard")
AddEventHandler("discard", function()
StopRecordingAndDiscardClip()
lib.notify({
    id = 'some_identifier',
    title = 'Rockstar Editior',
    description = 'Discard.',
    position = 'top',
    style = {
        backgroundColor = '#141517',
        color = '#C1C2C5',
        ['.description'] = {
          color = '#909296'
        }
    },
})
end)
RegisterNetEvent("gointo:editor")
AddEventHandler("gointo:editor", function()
    local alert = lib.alertDialog({
        header = 'Rockstar Editor',
        content = 'Press confirm to leave the server and go to Rockstar Editor',
        centered = true,
        cancel = true
    })
    
    if alert == 'confirm' then -- if the user confirms
        NetworkSessionLeaveSinglePlayer()
        ActivateRockstarEditor()
    

    end
end)
