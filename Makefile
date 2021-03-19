NAME		= libasm.a
TESTCC		= clang
CC			= nasm
AR			= ar
RM			= rm -rf

TESTCFLAGS	= -Wall -Werror -Wextra
CFLAGS		= -f elf64
ARFLAGS		= rcs

SRC_DIR		= srcs
OBJ_DIR 	= objs

SRC			= $(notdir $(shell find $(SRC_DIR) -type f -name "*.s"))
OBJ			= $(addprefix $(OBJ_DIR)/, $(SRC:.s=.o))
TEST_FILE	= main.c
TEST_OUT	= test
vpath		%.s $(shell find $(SRC_DIR) -type d)

_YELLOW		= \033[38;5;184m
_GREEN		= \033[38;5;46m
_RESET		= \033[0m
_INFO		= [$(_YELLOW)INFO$(_RESET)]
_SUCCESS	= [$(_GREEN)SUCCESS$(_RESET)]
_CLEAR		= \033[2K\c

all				: init $(NAME)
				@ echo "$(_SUCCESS) $(NAME) created"	

init			:
				@ echo "$(_INFO) Creating objects directory"
				$(shell mkdir -p $(OBJ_DIR))

test			: $(TEST_FILE) all 
				@ echo "$(_INFO) Compiling library with .c file"
				@ $(TESTCC) $(TESTCFLAGS) $< $(NAME) -o $(TEST_OUT)
				

$(NAME)			: $(OBJ)
				@ echo "\t$(_YELLOW) Creating library..."
				@ $(AR) $(ARFLAGS) $(NAME) $(OBJ)
				@ echo "$(_CLEAR)"

$(OBJ_DIR)/%.o	: %.s
				@ echo "\t$(_YELLOW)Compiling $(_RESET) $*.c\r\c"
				@ $(CC) $(CFLAGS) $< -o $@
				@ echo "$(_CLEAR)"

clean			:
				@ echo "$(_INFO) Removing binary files."
				@ $(RM) $(OBJ_DIR)

fclean			: clean
				@ $(RM) $(NAME)
				@ $(RM) $(TEST_OUT)

re				: fclean all

.SUFFIXES:	.s .o
.PHONY:		all clean fclean re
