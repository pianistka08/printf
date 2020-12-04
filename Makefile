# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: dmarsell <dmarsell@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/07/23 20:34:49 by dmarsell          #+#    #+#              #
#    Updated: 2020/08/06 11:49:12 by dmarsell         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libftprintf.a

LIBFT_DIR = libft

LIBFT = libft/libft.a

CC = gcc

CFLAGS = -Wall -Wextra -g

DC = .DS_Store

GC = libftprintf.h.gch

INCL = ft_printf.h

TEST = ft_printf

SRC = begin.c \
				ft_printf.c \
				print_addres.c \
				count_decimal.c \
				count_decimal_next.c \
				count_decimal_next_n.c \
				print_decimal.c \
				print_decimal_next.c \
				additional.c \
				additional_next.c \
				o_x.c \
				o_x_l.c \
				printing_nums.c \
				printing_nums_next.c \
				char.c \
				char_next.c \
				calc_float.c \
				calc_float_next.c \
				print_float.c \
				make_flags_2.c \
				make_flags.c 
OBJ_DIR = obj

OBJ = $(addprefix $(OBJ_DIR)/,$(SRC:.c=.o))

all: $(NAME) 

$(NAME): $(OBJ_DIR) $(OBJ)
	@cp $(LIBFT) $(NAME)
	@echo "\033[32m [OK] \033[0m\033[32mCoping:\033[36m "$(LIBFT) "\033[0m\033[32mwith:\033[36m "$(NAME)
		@ar rc $(NAME) $(OBJ)
		@echo "\033[32m [OK] \033[0m\033[32mArchive binaries and:\033[36m " $(NAME)
			@ranlib $(NAME)
			@echo "\033[32m [OK] \033[0m\033[32mRunlib library:\033[36m " $(NAME)

$(OBJ): $(OBJ_DIR)/%.o: ./%.c $(INCL)
	@$(CC) $(CFLAGS) -I $(INCL) -o $@ -c $<
	@echo "\033[32m [OK] \033[0m\033[32mCompiling:\033[36m " $@

$(OBJ_DIR): 
	@make -C $(LIBFT_DIR)
		@mkdir -p $(OBJ_DIR)
		@echo "\033[32m [OK] \033[0m\033[32mMaking catalog:\033[36m " $(OBJ_DIR)
test:
	@$(CC) $(CFLAGS) -o $(TEST) main.c $(NAME)
	@echo "\033[32m [OK] \033[0m\033[32mCompiling testfile:\033[36m " $(TEST)

clean:
	@rm -rf $(OBJ_DIR) $(DC) $(GC)
	@echo "\033[31m [OK] \033[0m\033[31mDeleting catalog and binaries:\033[33m " $(OBJ_DIR)
		@make clean -C $(LIBFT_DIR)
			@rm -f $(TEST)
			@echo "\033[31m [OK] \033[0m\033[31mDeleting testfile:\033[33m " $(TEST)

fclean: clean
	@rm -f $(NAME)
		@make fclean -C $(LIBFT_DIR)
		@echo "\033[31m [OK] \033[0m\033[31mDeleting library binary:\033[33m " $(NAME)

re: fclean all

.PHONY: all clean fclean re