#include <stdio.h>

size_t	ft_strlen(const char *str);
ssize_t	ft_write(int fd, const void *buf, size_t count);	
char	*ft_strcpy(char *dst, const char *src);

void	test_strcpy(void)
{
	char	dest[100];
	
	ft_strcpy(dest, "Je teste ca fatigue.");
	printf("%s\n", dest);
}

int	main()
{
	printf("%zu\n", ft_strlen("bonjur"));
	ft_write(1, "test\n", 6);
	test_strcpy();
}
