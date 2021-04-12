NAME =		libasm.a

SRCS =		./srcs/ft_strlen.s \
			./srcs/ft_strcpy.s \
			./srcs/ft_strcmp.s \
			./srcs/ft_write.s \
			./srcs/ft_read.s \
			./srcs/ft_strdup.s

FLAGS =		-Wall -Wextra -Werror

NASM_FLAG =	nasm -f macho64

OBJS =		$(SRCS:.s=.o)

.PHONY: all clean fclean re

%.o: %.s
	$(NASM_FLAG) $<

all: $(NAME)

$(NAME): $(OBJS)
	ar -rc $(NAME) $(OBJS)
	ranlib $(NAME)

test: all
	gcc $(FLAGS) main.c -L. -lasm
	./a.out

clean:
	/bin/rm -f $(OBJS)

fclean: clean
	/bin/rm -f $(NAME)
	/bin/rm -f ./a.out
	/bin/rm -f ./my_test.txt
	/bin/rm -f ./nm_test.txt

re: fclean all
