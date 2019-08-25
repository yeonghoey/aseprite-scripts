-- snap.lua
-- Resize and export all the frames as png files which are named
-- filename/yyyymmdd-HHMMSS-WWWxHHH-NNN.EXT, and then rollback the size.

function snap (ext)
  app.command.SpriteSize()
  local sprite = app.activeSprite
  local filename = sprite.filename
  local now = os.date("%Y%m%d-%H%M%S")
  local width = sprite.width
  local height = sprite.height
  -- Add "-001" to the snapshotname because sequential numbered files will be
  -- generated if the sprite has multiple frames.
  -- The index starts from 1 to match with frame number.
  local snapshotname = string.format("%s.%s-%dx%d-001.%s",
                                     filename, now, width, height, ext)
  sprite:saveCopyAs(snapshotname)
  app.undo()
end

snap("png")
