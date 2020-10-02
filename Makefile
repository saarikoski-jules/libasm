# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    Makefile                                           :+:    :+:             #
#                                                      +:+                     #
#    By: jsaariko <jsaariko@student.codam.nl>         +#+                      #
#                                                    +#+                       #
#    Created: 2020/10/02 12:47:23 by jsaariko      #+#    #+#                  #
#    Updated: 2020/10/02 13:51:02 by jsaariko      ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

NAME = libasm.a

S_FILES = ft_strlen.s

O_FILES = $(S_FILES:.s=.o)

TEST_MAIN = main_strlen.c

all: $(NAME)

$(NAME):
	nasm -f macho64 $(S_FILES)
	ar rc $(NAME) $(O_FILES)

test: re
	gcc $(TEST_MAIN) $(NAME)

clean:
	rm -f $(O_FILES)

fclean: clean
	rm -f $(NAME)

re: fclean all
	
