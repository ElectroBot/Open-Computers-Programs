local comp = require("component")
local event = require("event")
local gpu = comp.gpu
local w, h = gpu.getResolution()

while true do

  gpu.setResolution(50, 18)
  gpu.setBackground(0X000000)
  gpu.setForeground(0X00CC00)
  gpu.fill(1, 1, w, h, " ")
  print("")
  print("Welcome to Stone Legion")
  print("the Official host of")
  print("")
  gpu.setForeground(0XFF0000)
  print("The Next Leap modpack")
  gpu.setForeground(0x00CC00)
  print("")
  print("")
  print("Server rules:")
  print("- Don't annoy people")
  print("- Don't lag the server")
  print("- Don't grief, steal, cheat, etc.")
  print("")
  print("Report any potential modpack issues on the Github")
  print("For any other info, please visit us on our Discord")
  print("")
  print("To start playing, go through the stargate when it")
  print("connects to one of the outposts.")
  print("Have fun")
  os.sleep()

end