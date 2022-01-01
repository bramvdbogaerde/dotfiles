-- Xmonad configuration file 
-- Needs the following packages to be installed (ArchLinux)
--  - xmonad-utils 
--  - xmonad-contrib
--  - xmobar

import XMonad

import qualified Xmonad.Bindings.I3 as I3wm
import Data.Default

import XMonad.Util.EZConfig (additionalKeysP)
import XMonad.Actions.Navigation2D
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.EwmhDesktops



-- some commands to run at startup
runInit :: X () 
runInit = do
   spawn "setxkbmap -layout fr -variant mac"
   spawn "xmodmap /home/bram/.Xmodmap"

myConfig = ewmh $ docks $ withNavigation2DConfig def $ keybindings
   where 
   conf = def { 
      modMask = mod4Mask,
      terminal = "gnome-terminal",
      manageHook = manageHook def <+> manageDocks,
      layoutHook = avoidStruts $ layoutHook def,
      startupHook = runInit }
   keybindings = conf `additionalKeysP` (I3wm.keymap conf)


main :: IO ()
main = do
   _ <- spawn "polybar example"
   xmonad myConfig
