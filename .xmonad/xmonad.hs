{-# LANGUAGE FlexibleInstances, MultiParamTypeClasses, PatternGuards, TypeSynonymInstances, DeriveDataTypeable #-}

import XMonad
import XMonad.Config.Desktop (desktopConfig)
import qualified XMonad.StackSet as W -- to shift and float windows
import XMonad.Util.EZConfig (additionalKeys)
import XMonad.Hooks.DynamicLog (xmobar)
import XMonad.Hooks.ManageDocks (avoidStruts, manageDocks)
-- import XMonad.Layout.MouseResizableTile
import qualified XMonad.StackSet as W
import Data.Ratio
import Graphics.X11 (Rectangle(..))
import Control.Arrow ((***), second)
import XMonad.ManageHook
import XMonad.Layout.SubLayouts
import XMonad.Layout.WindowNavigation
import XMonad.Layout.BoringWindows
--  modMask = mod4Mask -- use the Windows button as mod
main = xmonad $ desktopConfig
    {
      terminal = "konsole"
    , focusFollowsMouse = False
    , clickJustFocuses = True
    , layoutHook = myLayoutHook
    , manageHook = manageDocks <+> myManageHook <+> manageHook desktopConfig
    , focusedBorderColor = "#009cb5"
    }
    `additionalKeys` [
    ((mod1Mask .|. shiftMask, xK_q), spawn "qdbus org.kde.ksmserver /KSMServer logout 1 3 3"),
    ((mod1Mask, xK_p), spawn "rofi -combi-modi drun,run -show combi -modi combi -i -matching fuzzy"),
    ((mod1Mask .|. shiftMask, xK_p), spawn "dmenu_run"),
    ((mod1Mask .|. controlMask, xK_j), withFocused (sendMessage . mergeDir W.focusDown')),
    ((mod1Mask .|. controlMask, xK_k), withFocused (sendMessage . mergeDir W.focusUp')),
    ((mod1Mask .|. controlMask, xK_m), withFocused (sendMessage . MergeAll)),
    ((mod1Mask .|. controlMask, xK_u), withFocused (sendMessage . UnMerge)),
    ((mod1Mask, xK_bracketleft), onGroup W.focusUp'),
    ((mod1Mask, xK_bracketright), onGroup W.focusDown'),
    ((mod1Mask, xK_j), focusDown),
    ((mod1Mask, xK_k), focusUp)]
 
myLayoutHook = avoidStruts $ windowNavigation $ subTabbed $ boringWindows $ Responsive MFocus ||| Responsive (MDouble SHorizontally) ||| Responsive (MDouble SVertically) ||| Full

data MFocus a = MFocus deriving ( Read, Show )

newtype Responsive l a = Responsive (l a) deriving (Show, Read)

-- Mirror for vertical monitor
instance LayoutClass l a => LayoutClass (Responsive l) a where
    runLayout (W.Workspace i (Responsive l) ms) r = (map (second responsive) *** fmap Responsive)
                                                `fmap` runLayout (W.Workspace i l ms) (responsive r)
                                                    where
                                                        responsive = case r of
                                                                        Rectangle _ _ sw sh | sw < sh -> mirrorRect
                                                                        otherwise                     -> id

    handleMessage (Responsive l) = fmap (fmap Responsive) . handleMessage l
    description (Responsive l) = "Responsive "++ description l

-- Display focus window in main area and others on right side
instance LayoutClass MFocus Window where
    pureLayout _ sc ws = zip ups tops ++ [(W.focus ws, mainPane)] ++ zip dns bottoms
     where
       ups    = reverse $ W.up ws
       dns    = W.down ws
       count  = (length ups) + (length dns)
       (mainArea,  subArea) = splitHorizontallyBy (7%8) sc
       (top, other)         = splitVerticallyBy   ((8*length ups)%(count*8 + 1)) subArea
       (_, bottom)          = splitVerticallyBy   (1%(length dns*8 + 1)) other
       mainPane | ups /= [] || dns /= [] = mainArea
                | otherwise              = sc
       tops    = if ups /= [] then splitVertically (length ups) top    else []
       bottoms = if dns /= [] then splitVertically (length dns) bottom else []

data SplitD = SHorizontally | SVertically deriving ( Read, Show )

data MDouble a = MDouble SplitD deriving ( Read, Show )

-- Display first two window in mainarea and others on right side
instance LayoutClass MDouble Window where
  pureLayout (MDouble sd) sc ws = zip all rts
     where
       ups    = reverse $ W.up ws
       dns    = W.down ws
       all    = ups ++ [W.focus ws] ++ dns
       split  = case sd of
                  SHorizontally -> splitHorizontally 2
                  SVertically -> splitVertically 2
       rts    = case all of
                  []        -> []
                  [_]       -> [sc]
                  [_, _]    -> split sc
                  otherwise -> (split x) ++ (splitVertically (length all - 2) y)
                      where
                        (x, y) = splitHorizontallyBy (7%8) sc

myManageHook = composeAll  
  [ className =? "plasmashell" --> doFloat -- doIgnore
  , className =? "urxvt"       --> doFloat
  , className =? "deadbeef"    --> doF (W.shift "1")
  , className =? "slack"       --> doF (W.shift "2")
  ]  
