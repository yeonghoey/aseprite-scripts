app.command.FitScreen()

app.command.SpriteSize()
app.command.FitScreen()

app.command.SaveFileCopyAs()

-- Take a snapshot
local sprite = app.activeSprite
local filename = sprite.filename
local _, _, dirname, basename = string.find(filename, "(.*)/(.*)")
local _, _, name, ext = string.find(basename, "(.*)%.(.*)")
local now = os.date("%Y%m%d-%H%M%S")
local snapshotname = string.format("%s/%s/%s.png", dirname, name, now)
sprite:saveCopyAs(snapshotname)

app.undo()
app.command.FitScreen()
