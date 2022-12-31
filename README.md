
# Table of Contents

-   [lsp-arduino](#orge319aa7)
    -   [What is this?](#org89cf308)
    -   [What does it aim to be?](#org811a5e2)
    -   [Dependencies](#orga22ba47)
    -   [Setup](#orgacbc803)
    -   [Customisation](#orgc75c128)



<a id="orge319aa7"></a>

# lsp-arduino


<a id="org89cf308"></a>

## What is this?

For now, this is a desperate try to get the arduino language server to work with Emacs `lsp-mode`. This means:

**This does not work yet**

Instead, the current state is: When an `.ino` file is opened, I get this promising message:

> `LSP :: Connected to [arduinols:35290/starting /home/markus/Arduino/MySensors_Kirchseeon/Notifier].`

and the file's modeline displays some kind of spinning wheel/endless progress bar. No lsp features at all are working.

I followed these instructions from the [emacs-lsp project](https://emacs-lsp.github.io/lsp-mode/page/adding-new-language/) to add a new language.


<a id="org811a5e2"></a>

## What does it aim to be?

An `lsp-mode` client for the arduino language server.


<a id="orga22ba47"></a>

## Dependencies

-   arduino-language-server
-   arduino cli
-   clangd

If you have the [Arduino 2.x IDE](https://www.arduino.cc/en/software) installed, you're probably good to go. I haven't tried this, though. Instead, you can go to [Arduino Language Server on github](https://github.com/arduino/arduino-language-server) and follow their instructions to get everything you need.


<a id="orgacbc803"></a>

## Setup

Since this is no proper Emacs package (yet), copy `lsp-arduino.el` into your `load-path` and add this to your `init.el`:

    (require 'lsp-arduino)

When you open an arduino file, you should see some LSP messages in your `*Messages*` buffer.


<a id="orgc75c128"></a>

## Customisation

The path to your `arduino-language-server` and arbitrary parameters can be customized in the `lsp-arduino` group. You can use this to set your fully qualified board name (fqbn). Get a list of all supported boards with

    arduino-cli board listall
