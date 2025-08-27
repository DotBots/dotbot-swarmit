DOCKER_IMAGE ?= aabadie/dotbot:latest
DOCKER_TARGETS ?= all
PACKAGES_DIR_OPT ?=
SEGGER_DIR ?= /opt/segger
BUILD_CONFIG ?= Release
BUILD_TARGET ?= dotbot-v3
PROJECTS ?= dotbot motors move rgbled timer

.PHONY: $(PROJECTS)
all: $(PROJECTS)

dotbot:
	@echo "\e[1mBuilding $@ application\e[0m"
	"$(SEGGER_DIR)/bin/emBuild" swarmit-$(BUILD_TARGET).emProject -project $@ -config $(BUILD_CONFIG) $(PACKAGES_DIR_OPT) -rebuild -verbose
	@echo "\e[1mDone\e[0m\n"

motors:
	@echo "\e[1mBuilding $@ application\e[0m"
	"$(SEGGER_DIR)/bin/emBuild" swarmit-$(BUILD_TARGET).emProject -project $@ -config $(BUILD_CONFIG) $(PACKAGES_DIR_OPT) -rebuild -verbose
	@echo "\e[1mDone\e[0m\n"

move:
	@echo "\e[1mBuilding $@ application\e[0m"
	"$(SEGGER_DIR)/bin/emBuild" swarmit-$(BUILD_TARGET).emProject -project $@ -config $(BUILD_CONFIG) $(PACKAGES_DIR_OPT) -rebuild -verbose
	@echo "\e[1mDone\e[0m\n"

rgbled:
	@echo "\e[1mBuilding $@ application\e[0m"
	"$(SEGGER_DIR)/bin/emBuild" swarmit-$(BUILD_TARGET).emProject -project $@ -config $(BUILD_CONFIG) $(PACKAGES_DIR_OPT) -rebuild -verbose
	@echo "\e[1mDone\e[0m\n"

timer: 
	@echo "\e[1mBuilding $@ application\e[0m"
	"$(SEGGER_DIR)/bin/emBuild" swarmit-$(BUILD_TARGET).emProject -project $@ -config $(BUILD_CONFIG) $(PACKAGES_DIR_OPT) -rebuild -verbose
	@echo "\e[1mDone\e[0m\n"

DIRS ?= $(PROJECTS)
SRCS ?= $(foreach dir,$(DIRS),$(shell find $(dir) -name "*.[c|h]"))
CLANG_FORMAT ?= clang-format
CLANG_FORMAT_TYPE ?= file

.PHONY: format check-format
format:
	@$(CLANG_FORMAT) -i --style=$(CLANG_FORMAT_TYPE) $(SRCS)

check-format:
	@$(CLANG_FORMAT) --dry-run --Werror --style=$(CLANG_FORMAT_TYPE) $(SRCS)

.PHONY: docker
docker:
	docker run --rm -i \
		-e BUILD_TARGET="$(BUILD_TARGET)" \
		-e BUILD_CONFIG="$(BUILD_CONFIG)" \
		-e PACKAGES_DIR_OPT="-packagesdir $(SEGGER_DIR)/packages" \
		-e SEGGER_DIR="$(SEGGER_DIR)" \
		-v $(PWD):/dotbot $(DOCKER_IMAGE) \
		make $(DOCKER_TARGETS)
