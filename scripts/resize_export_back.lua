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
-- Add "-001" to the snapshotname because sequential numbered files will be
-- generated if the sprite has multiple frames.
local snapshotname = string.format("%s/%s/%s-001.png", dirname, name, now)
sprite:saveCopyAs(snapshotname)

app.undo()
app.command.FitScreen()
