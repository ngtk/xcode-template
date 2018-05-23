package main

import (
	"fmt"
	"log"
	"os"

	"github.com/gobuffalo/packr"
	"github.com/urfave/cli"
)

func main() {
	app := cli.NewApp()
	app.Name = "xcode-template"
	app.Usage = "Create a template and share with your project"

	app.Commands = []cli.Command{
		{
			Name:    "generate",
			Aliases: []string{"g"},
			Usage:   "generate a new template",
			Action: func(c *cli.Context) error {
				box := packr.NewBox("./templates")

				currentDir, _ := os.Getwd()
				filename := c.Args().First()
				fileDir := fmt.Sprintf("%s/Templates/%s.xctemplate", currentDir, filename)
				templateInfoPath := fmt.Sprintf("%s/TemplateInfo.plist", fileDir)
				swiftFilePath := fmt.Sprintf("%s/___FILEBASENAME___.swift", fileDir)

				os.MkdirAll(fileDir, 0777)

				// Create TemplateInfo.plist
				templateInfoFile, err := os.Create(templateInfoPath)
				if err != nil {
					log.Fatal(err)
				}
				templateInfoString := box.String("Swift.xctemplate/TemplateInfo.plist")
				templateInfoFile.Write(([]byte)(templateInfoString))

				// Create Swift File
				swiftFile, err := os.Create(swiftFilePath)
				if err != nil {
					log.Fatal(err)
				}
				templateString := box.String("Swift.xctemplate/___FILEBASENAME___.swift")
				swiftFile.Write(([]byte)(templateString))

				return nil
			},
		},
	}

	err := app.Run(os.Args)
	if err != nil {
		log.Fatal(err)
	}
}
