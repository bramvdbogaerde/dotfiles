module Xmonad.Bindings.I3(keymap) where

-- i3wm bindings for Xmonad

import XMonad 
import XMonad.Actions.Navigation2D

keymap :: XConfig a -> [(String, X ())] 
keymap (XConfig { terminal = terminal }) = [
   -- spawn terminal
   ("M-<Return>", spawn $ terminal),
   -- kill widnows
   ("M-S-a", kill),
   -- dmenu / rofi
   ("M-d", spawn "rofi -show run"),
   ("M-w", spawn "rofi -show window"),
   -- window focus using arrow keys
   ("M-<Left>", windowGo L True),
   ("M-<Right>", windowGo R True),
   ("M-<Up>", windowGo U True),
   ("M-<Down>", windowGo D True),
   -- window movement using arrow keys
   ("M-S-<Left>", windowSwap L False),
   ("M-S-<Right>", windowSwap R False),
   ("M-S-<Up>", windowSwap U False),
   ("M-S-<Down>", windowSwap D False)]

   
