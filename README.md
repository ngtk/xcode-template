# xcode-template [![GitHub version](https://badge.fury.io/gh/ngtk%2Fxcode-template.svg)](https://badge.fury.io/gh/ngtk%2Fxcode-template)
👩‍💻xcode-template makes it easy to create a template and share with your project

## Install
You can install using Homebrew.

```sh
$ brew install ngtk/tools/xcode-template
```

Or you can download from [GitHub releases](https://github.com/ngtk/xcode-template/releases).

## Usage
If you want to create a new template, You can do it with subcommand `generate` or `g`.

```sh
$ xctemplate g "UIViewController"
```

If you want to use from Xcode "File Template Library". You can do it with subcommand `link`.

```sh
$ xctemplate link
```


## Development
Run:

```sh
$ swift package generate-xcodeproj
```
