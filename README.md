# xcode-template
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


## Developemnt
Been written in go, you can `go get github.com/ngtk/xcode-template` and change command by editing `xctemplate.go`.

If you want to release new version, You have to do below:

1. Bump version
   - `$ goxc bump` to bump version in `.goxc.json`
   - Bump `app.Version` in `xctemplate/xctemplate.go`
1. Build and Release to GitHub
   - `$ goxc`
1. Enable to download with Homebrew
   - Bump version in [Homebrew formula](https://github.com/ngtk/homebrew-tools/blob/master/Formula/xcode-template.rb)
   - Change also `sha256` to result of `gsha256sum xctemplate_{VERSION}_darwin_386.zip`
