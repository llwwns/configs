"use strict";
exports.__esModule = true;
exports.activate = function (oni) {
    //console.log("config activated")
    // Input
    //
    // Add input bindings here:
    //
    //oni.input.bind("<c-enter>", () => console.log("Control+Enter was pressed"))
    //
    // Or remove the default bindings here by uncommenting the below line:
    //
    oni.input.unbind("<c-p>");
    oni.input.unbind("<c-v>");
};
exports.deactivate = function (oni) {
    console.log("config deactivated");
};
exports.configuration = {
    //add custom config here, such as    "oni.hideMenu": true, // Hide default menu, can be opened with <alt>
    activate: exports.activate,
    "oni.loadInitVim": true,
    "oni.useDefaultConfig": true,
    "ui.colorscheme": "n/a",
    "autoClosingPairs.enabled": false,
    "commandline.mode": false,
    "wildmenu.mode": true,
    "learning.enabled": false,
    "achievements.enabled": true,
    "editor.textMateHighlighting.enabled": false,
    "editor.typingPrediction": false,
    //"oni.useDefaultConfig": true,
    //"oni.bookmarks": ["~/Documents"],
    "editor.fontSize": "17px",
    "editor.fontFamily": "Iosevka Term",
    "editor.backgroundImageUrl": "file:///home/li/.config/bg.png",
    "editor.backgroundImageSize": "initial",
    "editor.backgroundOpacity": "0",
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
    /*"language.ruby.languageServer.command": "docker",
    "language.ruby.languageServer.arguments": [
      "run",
      "mtsmfm/language_server-ruby",
    ],*/
};
