all:
	valac --pkg gtk+-3.0 valacolor.vala

install:
	cp valacolor /usr/local/bin
	cp valacolor.desktop /usr/local/share/applications

uninstall:
	rm /usr/local/bin/valacolor
	rm /usr/local/share/applications/valacolor.desktop
