#include <assert.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <errno.h>
#include <string.h>

extern size_t	ft_strlen(const char *str);
extern int		ft_strcmp(const char *s1, const char *s2);
extern char		*ft_strcpy(char *dest, const char *src);
extern char		*ft_strdup(const char *s);
// extern ssize_t	ft_assert(ft_read(fd, int fd, void *buf, size_t count);
extern ssize_t	ft_write(int fd, const void *buf, size_t count);

void	ft_test_strlen(void)
{
	char	buff[500];
	size_t	i;
	size_t	j;

	i = 0;
	bzero(buff, 500);
	while (i < 499)
	{
		j = 0;
		buff[i] = (char)('a' + i % 26);
		while (j < i)
		{
			assert(ft_strlen(buff + j) == strlen(buff + j));
			j++;
		}
		i++;
	}
}

void	ft_test_strcmp(void)
{
	char	buff[501];
	char	set[501];
	size_t	i;
	size_t	j;

	i = 0;
	while (i < 500)
	{
		j = 0;
		bzero(buff, 501);
		bzero(set, 501);
		while (j < 500)
		{
			buff[j] = (char)('a' + j % 26);
			assert(strcmp(buff, set) == ft_strcmp(buff, set));
			j++;
		}
		set[i] = (char)('a' + i);
		i++;
	}
}

void	ft_test_strcpy(void)
{
		size_t	i;
	char	buff[501];
	char	buff2[501];

	i = 0;
	bzero(buff, 501);
	while (i < 500)
	{
		buff[i] = (char)('a' + i % 26);
		ft_strcpy(buff2, buff);
		assert(!memcmp(buff2, buff, 500));
		i++;
	}
}

void	ft_test_strdup(void)
{
	char	buffer[501];
	char	*tmp;
	size_t	i;

	i = 0;
	bzero(buffer, 501);
	while (i < 500)
	{
		buffer[i] = (char)('a' + i % 26);
		tmp = ft_strdup(buffer);
		assert(!memcmp(buffer, tmp, 501));
		free(tmp);
		i++;
	}
}

void	ft_test_write()
{
	char	buffer[100];

	assert(ft_write(1, "toto", 4L) == 4L);
	assert(ft_write(1, "totototo", 4L) == 4L);
	assert(ft_write(1, "totototo", 8L) == 8L);
	assert(ft_write(1, "toto", 2L) == 2L);
	assert(ft_write(100000, "random string yes", 10) == -1);
	assert(errno == 9);
}

// void ft_test_assert(ft_read(fd, char *file)
// {
// 	char		buffer[100];
// 	const int	fd = open(file, O_RDONLY);

// 	assert(ft_read(fd, buffer, 50) == 50);
// 	assert(ft_read(fd, buffer, 25) == 25);
// 	assert(ft_read(fd, buffer, 4) == 4);
// 	assert(ft_read(fd, buffer, 26) == 26);
// 	assert(ft_read(fd, buffer, 14) == 14);
// 	assert(ft_read(fd, buffer, 0) == 0);
// 	assert(ft_read(1000, buffer, 10) == -1);
// 	assert(errno == 9);
// }

int main(int argc, char **argv)
{
	assert(argc == 2);
	assert(access(argv[1], F_OK) == -1);

	ft_test_strlen();
	ft_test_strcpy();
	ft_test_strcmp();
	ft_test_write();
	// ft_test_assert(ft_read(fd, argv[1]);
	ft_test_strdup();
}


// r12, r13, r14, r15, rbx, rsp and rbp