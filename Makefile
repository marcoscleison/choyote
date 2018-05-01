include local.mk
CC=chpl
MODS=-M$(CHREST_HOME)/src -M$(NUMSUCH_HOME)/src -M$(RELCH_HOME)/src -lwebsockets
SRC_DIR=src
BUILD_DIR=build
INCLUDES=-I$(CHREST_HOME)/src
C_LIBS=$(CHREST_HOME)/src/chrest_websocket.c

default: $(SRC_DIR)/choyote.chpl
	$(CC) $(MODS) $(C_LIBS) $(INCLUDES) -o $(BUILD_DIR)/choyote $<; \
	./$(BUILD_DIR)/choyote -f $(SRC_DIR)/choyote.cfg ; \
	rm $(BUILD_DIR)/choyote
