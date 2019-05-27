
import * as React from "react"
import * as Oni from "oni-api"

export const activate = (oni: Oni.Plugin.Api) => {
    //console.log("config activated")

    // Input
    //
    // Add input bindings here:
    //
    //oni.input.bind("<c-enter>", () => console.log("Control+Enter was pressed"))

    //
    // Or remove the default bindings here by uncommenting the below line:
    //
    oni.input.unbind("<c-p>")
    oni.input.unbind("<c-v>")

}

export const deactivate = (oni: Oni.Plugin.Api) => {
    console.log("config deactivated")
}

export const configuration = {
    //add custom config here, such as    "oni.hideMenu": true, // Hide default menu, can be opened with <alt>
    activate,
    "oni.loadInitVim": true,
    "oni.useDefaultConfig": false,
    "ui.colorscheme": "n/a",
    "autoClosingPairs.enabled": false, // disable autoclosing pairs
    "commandline.mode": false, // Do not override commandline UI
    "wildmenu.mode": true,
    "learning.enabled": false, // Turn off learning pane
    "achievements.enabled": true, // Turn off achievements tracking / UX
    "editor.textMateHighlighting.enabled": false, // Use vim syntax highlighting
    "editor.typingPrediction": false, // Wait for vim's confirmed typed characters, avoid edge cases
    //"oni.useDefaultConfig": true,
    //"oni.bookmarks": ["~/Documents"],
    "editor.fontSize": "17px",
    "editor.fontFamily": "Iosevka Term",
    //"editor.backgroundImageUrl": "file:///home/li/.config/bg.png",
    //"editor.backgroundImageSize": "initial",
    "editor.backgroundOpacity": 1,
    // UI customizations
    "ui.animations.enabled": false,
    "ui.fontSmoothing": "auto",
    "editor.completions.enabled": false,
    "sidebar.enabled": false,
    "sidebar.default.open": false,
    "oni.hideMenu": true,
    "tabs.mode": "native",
    "colors.tabs.background": "rgba(255,255,255,0.1)",
    "tabs.height": "1.5em",
    "tabs.showFileIcon": false
}
