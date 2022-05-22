BUILD 			:=stable
APP_NAME 		:= discord
INSTALL_DIR 	:= /opt/$(APP_NAME)				# such as "-ptb" or "-canary"

BUILD_DIR = build

# FUNCTIONS
define download

endef

inject:
# 1. Download
# 2. Unpack with asar
# 3. Inject file(s?)
# 4. Package back to asar
# 5. grap Electron13 Binarys and replace Discord Linux Bins
	@$(call download, $(BUILD))
	@echo $(APP_NAME)