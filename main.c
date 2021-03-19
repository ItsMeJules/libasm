#include <stdio.h>

size_t	ft_strlen(const char *str);
ssize_t	ft_write(int fd, const void *buf, size_t count);	

int	main()
{
	printf("%zu\n", ft_strlen("bonjur"));
	ft_write(1, "test\n", 6);
}
