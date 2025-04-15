all: install_deps install_package

install_deps:
	@echo "Installing dependencies..."
	sudo pacman -S --noconfirm lua lua-utf8 lua-dkjson

install_package:
	./install.sh
