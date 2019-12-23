{-# LANGUAGE FlexibleInstances, MultiParamTypeClasses, PatternGuards, TypeSynonymInstances, DeriveDataTypeable #-}

import XMonad
import XMonad.Config.Desktop (desktopConfig)
import qualified XMonad.StackSet as W -- to shift and float windows
import XMonad.Util.EZConfig (additionalKeys)
import XMonad.Hooks.ManageDocks (avoidStruts, manageDocks, docksStartupHook)
-- import XMonad.Layout.MouseResizableTile
import qualified XMonad.StackSet as W
import Data.Ratio
import Graphics.X11 (Rectangle(..))
import Control.Arrow ((***), second)
import XMonad.ManageHook
import XMonad.Layout.Dwindle
import XMonad.Util.Paste
import qualified XMonad.Hooks.ManageHelpers as Helper
--  modMask = mod4Mask -- use the Windows button as mod
main = xmonad $ desktopConfig
    {
      terminal = "konsole"
    , focusFollowsMouse = False
    , clickJustFocuses = False
    , layoutHook = myLayoutHook
    , manageHook = manageDocks <+> myManageHook <+> manageHook desktopConfig
    , focusedBorderColor = "#009cb5"
    , normalBorderColor = "#000"
    , startupHook = docksStartupHook <+> startup
    }
    `additionalKeys` [
    ((mod1Mask .|. shiftMask, xK_q), spawn "qdbus org.kde.ksmserver /KSMServer logout 1 3 3"),
    ((mod1Mask, xK_p), spawn "rofi -combi-modi drun,run -show combi -modi combi -i -matching fuzzy"),
    ((mod1Mask .|. shiftMask, xK_p), spawn "dmenu_run"),
    ((mod1Mask .|. shiftMask .|. controlMask, xK_j), sendKey (mod1Mask .|. shiftMask) xK_Down),
    ((mod1Mask .|. shiftMask .|. controlMask, xK_k), sendKey (mod1Mask .|. shiftMask) xK_Up)
                     ]
myLayoutHook = avoidStruts $ Responsive(Dwindle R CW (7/4) (11/10)) ||| Full

startup = do
   spawn "picom --config /home/li/.config/compton/compton.conf"
   spawn "dunst"

data MFocus a = MFocus deriving ( Read, Show )

newtype Responsive l a = Responsive (l a) deriving (Show, Read)

-- Mirror for vertical monitor
instance LayoutClass l a => LayoutClass (Responsive l) a where
    runLayout (W.Workspace i (Responsive l) ms) r = (fmap (second responsive) *** fmap Responsive)
                                                <$> runLayout (W.Workspace i l ms) (responsive r)
                                                    where
                                                        responsive = case r of
                                                                        Rectangle _ _ sw sh | sw < sh -> mirrorRect
                                                                        otherwise                     -> id

    handleMessage (Responsive l) = fmap (fmap Responsive) . handleMessage l
    description (Responsive l) = "Responsive "++ description l

myManageHook = composeAll
  [ className =? "plasmashell" --> doFloat
  , fmap not Helper.isDialog   --> doF avoidMaster
  ]

avoidMaster :: W.StackSet i l a s sd -> W.StackSet i l a s sd
avoidMaster = W.modify' $ \c -> case c of
     W.Stack t [] (r:rs) ->  W.Stack t [r] rs
     otherwise           -> c
