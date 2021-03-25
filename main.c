#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <fcntl.h>
#include <stdlib.h>

size_t	ft_strlen(const char *str);
ssize_t	ft_write(int fd, const void *buf, size_t count);	
char	*ft_strcpy(char *dst, const char *src);
int		ft_strcmp(const char *s1, const char *s2);
ssize_t	ft_read(int	fd, void *buf, size_t bytes);
char	*ft_strdup(const char *s);

void	test_strcpy(void)
{
	char	dest[100];
	
	ft_strcpy(dest, "Je teste ca fatigue.");
	printf("%s\n", dest);
}

void	test_read(void)
{
	char	buf[125];
	int		fd;

	fd = open("read", O_RDONLY);
	ft_read(fd, buf, 124);
	buf[124] = 0;
	printf("The 125 bytes read from read file :\n\t%s\n", buf);
	close(fd);
}


void	test_strdup(void)
{
	char *dup;

	dup = ft_strdup("Je suis une patate");
	printf("La patate dit : '%s'\n", dup);
	free(dup);
}

int	main()
{
	printf("%zu\n", ft_strlen("bonjur"));
	ft_write(1, "test\n", 6);
	test_strcpy();
	printf("%d %d %d\n", ft_strcmp("lol", "lol"), ft_strcmp("lob", "loa"), ft_strcmp("hehho", "uehf"));
	test_read();
	test_strdup();
}
