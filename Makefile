# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: gusouza- <gusouza-@student.42sp.org.br>    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/04/04 20:22:39 by gusouza-          #+#    #+#              #
#    Updated: 2022/07/24 11:42:43 by gusouza-         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libft.a
SRC = ft_isalpha.c ft_isdigit.c ft_isalnum.c ft_isascii.c ft_isprint.c \
	ft_strlen.c ft_memset.c ft_bzero.c ft_memcpy.c ft_memmove.c ft_strlcpy.c \
	ft_strlcat.c ft_toupper.c ft_tolower.c ft_strchr.c ft_strrchr.c \
	ft_strncmp.c ft_memchr.c ft_memcmp.c ft_strnstr.c ft_atoi.c ft_calloc.c \
	ft_strdup.c ft_substr.c ft_strjoin.c ft_strtrim.c ft_split.c ft_itoa.c \
	ft_strmapi.c ft_striteri.c ft_putchar_fd.c ft_putstr_fd.c ft_putendl_fd.c \
	ft_putnbr_fd.c get_next_line.c
SRC_B = ft_lstnew.c ft_lstadd_front.c ft_lstsize.c ft_lstlast.c \
	ft_lstadd_back.c ft_lstdelone.c ft_lstclear.c ft_lstiter.c ft_lstmap.c
OBJ = $(SRC:.c=.o)
OBJ_B = $(SRC_B:.c=.o)
FLAGS = -Wall -Wextra -Werror

all: $(NAME)

$(NAME): $(OBJ)
	@echo making library....
	@ar rcs $(NAME) $(OBJ)
	@echo "Libft created successfully"

$(OBJ): $(SRC)
	@gcc $(FLAGS) -c $(SRC)

bonus: $(OBJ_B)
	@echo creating bonus....
	@ar rcs $(NAME) $(OBJ_B)
	@echo done!

$(OBJ_B): $(SRC_B)
	@gcc $(FLAGS) -c $(SRC_B)

clean:
	@/bin/rm -f $(OBJ) $(OBJ_B)

fclean: clean
	@echo clearing....
	@/bin/rm -f $(NAME)
	@echo done!

%.o: %.c
	@$(CC) -c $< -o $@ $(FLAGS)

re: fclean all

rebonus: fclean bonus

.PHONY: all clean fclean re bonus rebonus