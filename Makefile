NAME = libftprintf.a
LIBFT_DIR = Libft
LIBFT = $(LIBFT_DIR)/libft.a

SRCS = spec_int.c spec_str.c spec_unsigned.c spec_char.c \
       spec_hex.c spec_point.c ft_printf.c ft_printf_utils.c
OBJS = $(SRCS:.c=.o)

BONUSSRCS = spec_int_bonus.c spec_str_bonus.c spec_unsigned_bonus.c \
            spec_char_bonus.c spec_hex_bonus.c spec_point_bonus.c \
            ft_printf_bonus.c ft_printf_utils_bonus.c
BONUSOBJS = $(BONUSSRCS:.c=.o)

CC = cc
CFLAGS = -Wall -Werror -Wextra -fPIC

all: $(NAME)

$(NAME): $(LIBFT) $(OBJS)
	@cp $(LIBFT) $(NAME)
	ar rc $(NAME) $(OBJS)
	@ranlib $(NAME)

$(LIBFT): $(LIBFT_DIR)
	@$(MAKE) -C $(LIBFT_DIR)

%.o: %.c Makefile
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	@rm -f $(OBJS) $(BONUSOBJS)
	@$(MAKE) -C $(LIBFT_DIR) clean

fclean: clean
	@rm -f $(NAME)
	@$(MAKE) -C $(LIBFT_DIR) fclean

re: fclean all

bonus: $(LIBFT) $(BONUSOBJS)
	@cp $(LIBFT) $(NAME)
	ar rc $(NAME) $(BONUSOBJS)
	@ranlib $(NAME)

