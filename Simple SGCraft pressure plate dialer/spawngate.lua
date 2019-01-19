-- Stargate control program for Stonelegion's
-- "The Next Leap" modpack server
-- 
-- Very simple pressure plate based stargate 
-- dialing program 

component = require("component")
sg = component.proxy(component.get("211d9582"))
c = component.proxy(component.get("cfb76e41"))
gpu = component.gpu
w, h = gpu.getResolution()
local sides = require("sides")

function showMenu()
  gpu.setResolution(50, 18)
  gpu.fill(1, 1, w, h, " ")
  print("Please step on one of the 4 marked pressure plates")
  print("This will RTP (Random Teleport) you through the")
  print("Stargate in one of the four quadrants of the world")
  print("")
  print("Make sure to choose wisely as you will not be able")
  print("to come back here and choose again")
  print("")
  gpu.setForeground(0XFF6D00)
  print("North West")
  gpu.setForeground(0XFF24FF)
  print("North East")
  gpu.setForeground(0X33B6FF)
  print("South West")
  gpu.setForeground(0X66FF00)
  print("South East")
  print("")
  print("")
end

function plate()
  while true do
    os.sleep(0.5)
    if c.getInput(sides.left) == 15 then
      c.setOutput(sides.left,15)
      sg.dial("9992-HVO-SM")
      gpu.setForeground(0XFF6D00)
      print("Attempting connection to North West...")
      break
    elseif c.getInput(sides.right) == 15 then
      c.setOutput(sides.right,15)
      sg.dial("5993-IVM-BP")
      gpu.setForeground(0XFF24FF)
      print("Attempting connection to North East...")
      break
    elseif c.getInput(sides.front) == 15 then
      c.setOutput(sides.front,15)
      sg.dial("L998-NVC-Y7")
      gpu.setForeground(0X33B6FF)
      print("Attempting connection to South West...")
      break
    elseif c.getInput(sides.back) == 15 then
      c.setOutput(sides.back,15)
      sg.dial("H999-OVA-IA")
      gpu.setForeground(0X66FF00)
      print("Attempting connection to South East...")
      break
    end
  end
  gpu.setForeground(0XFF0000)
  print("")
  print("Head to the gate room now!")
  gpu.setForeground(0xFFFFFF)  
  c.setOutput(sides.top, 15)
  os.sleep(110)
  sg.disconnect()
  os.sleep(0.5)
  c.setOutput(sides.top, 0)
  c.setOutput(sides.left,0)
  c.setOutput(sides.right,0)
  c.setOutput(sides.front,0)
  c.setOutput(sides.back,0)
  os.sleep(2)
  main()
end

function main()
  showMenu()
  plate()
  running = true
end

running = true
main()