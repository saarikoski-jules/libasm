# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    Makefile                                           :+:    :+:             #
#                                                      +:+                     #
#    By: jsaariko <jsaariko@student.codam.nl>         +#+                      #
#                                                    +#+                       #
#    Created: 2020/10/02 12:47:23 by jsaariko      #+#    #+#                  #
#    Updated: 2020/10/09 15:22:27 by jsaariko      ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

NAME = libasm.a

FILES = 	ft_strlen \
			ft_strcpy \
			ft_strcmp \
			ft_write \
			ft_read \
			ft_strdup \
			ft_atoi_base		

S_FILES = 	$(FILES:=.s)

O_FILES = $(FILES:=.o)

# TEST_MAIN = tests.c
TEST_MAIN = test_atoi_base.c

all: $(NAME)

%.o: %.s
	nasm -f macho64 $<

$(NAME): $(O_FILES)
	ar rc $(NAME) $(O_FILES)

test: re
	gcc $(TEST_MAIN) $(NAME)

clean:
	rm -f $(O_FILES)

fclean: clean
	rm -f $(NAME)

re: fclean all
	
