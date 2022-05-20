-- Xmonad configuration file 
-- Needs the following packages to be installed (ArchLinux)
--  - xmonad-utils 
--  - xmonad-contrib
--  - xmobar

import XMonad hiding ((|||))


import qualified Xmonad.Bindings.I3 as I3wm
import Data.Default

import qualified XMonad 
import XMonad.Util.EZConfig (additionalKeysP)
import XMonad.Config.Azerty
import XMonad.Actions.Navigation2D
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.EwmhDesktops
import XMonad.Layout.Grid
import XMonad.Layout.BinarySpacePartition
import XMonad.Layout.TwoPane
import XMonad.Layout.LayoutCombinators
import XMonad.Layout.Master



-- some commands to run at startup
runInit :: X () 
runInit = do
   spawn "setxkbmap -layout fr -variant mac"
   spawn "xmodmap /home/bram/.Xmodmap"

mLayout = avoidStruts $ mastered  (1/100) (1/2)  bsp
   where bsp = emptyBSP

myConfig = ewmh $ docks $ withNavigation2DConfig def $ keybindings
   where 
   conf = azertyConfig { 
      modMask = mod4Mask,
      terminal = "gnome-terminal",
      manageHook = manageHook def <+> manageDocks,
      layoutHook = mLayout,
      workspaces = map show [1..9],
      handleEventHook = ewmhDesktopsEventHook <+> fullscreenEventHook,
      logHook = ewmhDesktopsLogHook,
      startupHook = runInit }
   keybindings = conf `additionalKeysP` (I3wm.keymap conf)


main :: IO ()
main = do
   _ <- spawn "polybar example"
   xmonad myConfig
