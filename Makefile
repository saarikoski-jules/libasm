# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    Makefile                                           :+:    :+:             #
#                                                      +:+                     #
#    By: jsaariko <jsaariko@student.codam.nl>         +#+                      #
#                                                    +#+                       #
#    Created: 2020/10/02 12:47:23 by jsaariko      #+#    #+#                  #
#    Updated: 2020/11/20 15:51:31 by jsaariko      ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

NAME = libasm.a

SRCS = srcs/

FILES = 	$(SRCS)ft_strlen \
			$(SRCS)ft_strcpy \
			$(SRCS)ft_strcmp \
			$(SRCS)ft_write \
			$(SRCS)ft_read \
			$(SRCS)ft_strdup \
			$(SRCS)ft_atoi_base \
			$(SRCS)ft_list_push_front \
			$(SRCS)ft_list_size \
			$(SRCS)ft_list_sort \
			$(SRCS)list_scoot \
			$(SRCS)ft_list_remove_if \

S_FILES = 	$(FILES:=.s)

O_FILES = $(FILES:=.o)

TESTS = tests.c

all: $(NAME)

bonus: all

%.o: %.s
	nasm -f macho64 $<

$(NAME): $(O_FILES)
	ar rc $(NAME) $(O_FILES)

test: re
	gcc $(TESTS) $(NAME)

clean:
	rm -f $(O_FILES)

fclean: clean
	rm -f $(NAME)
	rm -f a.out


re: fclean all
	
