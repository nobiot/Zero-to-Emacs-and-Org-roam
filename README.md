<a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-sa/4.0/80x15.png" /></a>

# Notes on the current status

I am writing this note 26 October 2024. If you are using Emacs 29 or higher, `sqlite` comes with Emacs (if you download a pre-compiled version for Windows). This is currently the easiest way to enable Org-roam on Windows. This means you do not need to compile `emacs-sqlite.exe` with MSYS2 on your end. Org-roam still requires `emacsql-builtin`, which is now incorporated into [`emacsql`](https://melpa.org/#/emacsql). It is a prequisite of `org-roam`, so installing it from MELPA should also automatically install `emacsql`. This means chapter 4 currently available is no longer needed. I still think MSYS2 is useful for Emacs and Org-roam users on Windows because it gives you supporting programs such as Aspell (for spell-checking) and Grep (for text search in Emacs). I have not been able to come back to this guide so for long, but I am not archiving it yet; I am still hoping to come back to it to add information for Org-roam users on Windows. Thank you for your patience. If any part of the current content has confused you, I am sorry. 

# Notes on Org-roam V2

As of 17 Jul 2021, V2 has been released. Both MELPA and MELPA-Stable have this version of Org-roam. It will be markedly different from v1 for both its initial setup and daily usage. At the moment, most of the content of guide will only be applicable to v1 for Org-roam and its related packages such as Org-roam-bibtex.

I am gradually revising this guide in its entirety for v2.

So far the following chapters have been updated:

1. [Get Emacs for Windows](./10.Get-Emacs.md)
2. [Use Emacs to write some text (including copy & paste)](./20.Use-Emacs.md)
3. [Improve quality-of-life with your font, theme, and minimal select packages](./30.improve-emacs-qol.md)
4. [Set up Org-roam (including MSYS2 and emacsql-sqlite.exe)](./30.setup-org-roam.md) [WIP but main parts are illustrated with a series of screen shots, so you should be able to install Org-roam V2]

The the latest version of this guide compatible for v1 is available in the [v1 branch of this repositry](https://github.com/nobiot/Zero-to-Emacs-and-Org-roam/tree/v1).

# Zero to Emacs and Org-roam: a step-by-step guide on Windows 10

I took the liberty of creating a step-by-step guide for people new to Emacs. I have written this with Windows users with no Linux or programming background in mind, zero about Emacs.

The guide aims to get you going real quick, starting with downloading Emacs with vanilla configuration (no Doom, no Spacemacs).

I won't repeat why you might like to use Emacs or plain text to write. Here is what I think is the best response to the question: ["The Plain Person’s Guide to Plain Text Social Science"](https://plain-text.co/) by Kieran Healy of Duke University.

At the end of step-by-step guide of Part 1, your Emacs will look like this.

[ Image to be inserted after writing up Part 1] 

## Audience and purpose in mind

The audience I have had in mind are:

- New to Emacs
- Windows users (Emacs part should be useful for others, I hope)
- No programming or Linux background
- Looking to use Org-roam / Emacs to help write long-form material (essays / papers about life, humanities, or some qualitative social sciences, etc.) as opposed to math and programming

Even if you are already down the path of using a framework like Doom, I hope stepping back a little and actually finishing configuration from scratch will help you understand how things fit together – it’s a bit like DIY making stuff; completing one thing from start to finish seems to help you leap to the next level of understanding and confidence for some reason.

## Part 1

1. [Get Emacs for Windows](./10.Get-Emacs.md)
2. [Use Emacs to write some text (including copy & paste)](./20.Use-Emacs.md)
3. [Improve quality-of-life with your font, theme, and minimal select packages](./30.improve-emacs-qol.md)
4. [Set up Org-roam (including MSYS2 and emacsql-sqlite.exe)](./30.setup-org-roam.md) [WIP but main parts are illustrated with a series of screen shots]


## Part 2
5. (maybe) How to swap CapsLock with Ctrl
6. Set up Org-roam-ui for a graph visualization of your notes
7. Set up Org-ref and Org-roam-bibtex (ORB)
8. Export to MS Word
9. Set up a spell checker (Hunspell, including how to get it)

## Part 3
10. Work with PDF files in Emacs with PDF-Tools, Org-noter, and ORB
11. Insert an image from the clipboard, or the Snipping Tool on Windows (incl. in-line display resizing without Imagemagick, or external programs)

## License

<a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-sa/4.0/88x31.png" /></a><br />This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/">CC BY-SA 4.0 license</a>, except for source code and documentation excerpts from Emacs and Org-roam project.
