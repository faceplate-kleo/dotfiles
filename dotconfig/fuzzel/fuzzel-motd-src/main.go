package main

import (
	"flag"
	"fmt"
	"github.com/goccy/go-yaml"
	"io"
	"log/slog"
	"math/rand"
	"os"
)

type Messages struct {
	Messages []string
}

func (m *Messages) Dump() {
	fmt.Println(len(m.Messages))
	for _, msg := range m.Messages {
		fmt.Println(msg)
	}
}

func (m *Messages) SelectRandom() string {
	if len(m.Messages) == 0 {
		return ""
	}
	return m.Messages[rand.Intn(len(m.Messages))]
}

func loadMessages(logger *slog.Logger, path string) (Messages, error) {
	logger.Info("Loading messages from path: " + path)
	handle, err := os.Open(path)
	if err != nil {
		return Messages{}, err
	}

	data, err := io.ReadAll(handle)
	if err != nil {
		return Messages{}, err
	}

	var msg Messages

	err = yaml.Unmarshal(data, &msg)
	if err != nil {
		return msg, err
	}

	err = handle.Close()
	if err != nil {
		return msg, err
	}

	return msg, nil
}

func main() {
	logger := slog.Default()
	iniPath := ""
	destPath := ""
	motdMessagesPath := ""

	slog.SetLogLoggerLevel(slog.LevelError)

	flag.StringVar(&iniPath, "ini", "/home/kleo/.config/fuzzel/fuzzel-motd.tpl", "The path of the fuzzel.ini template.")
	flag.StringVar(&destPath, "dest", "/home/kleo/.config/fuzzel/fuzzel-motd.ini", "The path to write the rendered fuzzel.ini to.")
	flag.StringVar(&motdMessagesPath, "messages", "/home/kleo/.config/fuzzel/motd.yml", "The path to the list of messages to select from.")

	flag.Parse()

	msg, err := loadMessages(logger, motdMessagesPath)
	if err != nil {
		logger.Error("Fatal error, exiting.", "error", err)
		os.Exit(1)
	}

	fmt.Println(msg.SelectRandom())
}
