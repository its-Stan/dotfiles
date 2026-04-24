STOW = stow
STOW_FLAGS ?= --target=$(HOME) --no-folding
PIPE_ERROR = 2> /dev/null || true

MAKEFLAGS += --no-print-directory

HEADLESS = alacritty nvim zsh
BASE = $(HEADLESS) shortcuts wallpapers
PACKAGES = $(BASE) vscode

.PHONY: all base headless clean $(PACKAGES)

base: $(BASE)
headless: $(HEADLESS)
all: $(PACKAGES)

$(PACKAGES):
	@$(MAKE) $@-pre   $(PIPE_ERROR)
	@$(MAKE) $@-build $(PIPE_ERROR)
	@$(MAKE) $@-post  $(PIPE_ERROR)

$(PACKAGES:%=%-build): %-build:
	$(STOW) $(STOW_FLAGS) $*

nvim-post:
	nvim --headless +PlugInstall +qall

$(PACKAGES:%=%-clean): %-clean:
	$(STOW) $(STOW_FLAGS) -D $*

clean: $(PACKAGES:%=%-clean)

help:
	@echo "Usage: make [RULES]..."
	@echo "Make a symbolic link to the specified packages"
	@echo
	@echo "Rules:"
	@echo "    headless:  $(HEADLESS)"
	@echo "    base:      $(BASE)"
	@echo "    all:       $(PACKAGES)"
	@echo "    <package>: The package rule"
	@echo
	@echo "Each package have a %-pre and %-post rule for pre-build and post-build hooks"
	@echo