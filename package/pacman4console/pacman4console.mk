################################################################################
#
# pacman4console
#
################################################################################

PACMAN4CONSOLE_VERSION = 1.3
PACMAN4CONSOLE_SOURCE = pacman-$(PACMAN4CONSOLE_VERSION).tar.gz
PACMAN4CONSOLE_SITE = https://sites.google.com/site/doctormike
PACMAN4CONSOLE_LICENSE = GPLv2
PACMAN4CONSOLE_LICENSE_FILES = COPYING
PACMAN4CONSOLE_DEPENDENCIES = ncurses

define PACMAN4CONSOLE_BUILD_CMDS
	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS)
endef

define PACMAN4CONSOLE_INSTALL_TARGET_CMDS
	$(MAKE) -C $(@D) install DESTDIR=$(TARGET_DIR) $(TARGET_CONFIGURE_OPTS)
	
endef

$(eval $(generic-package))
