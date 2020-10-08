/* ************************************************************************** */
/*                                                                            */
/*                                                        ::::::::            */
/*   main_strlen.c                                      :+:    :+:            */
/*                                                     +:+                    */
/*   By: jsaariko <jsaariko@student.codam.nl>         +#+                     */
/*                                                   +#+                      */
/*   Created: 2020/10/02 12:47:29 by jsaariko      #+#    #+#                 */
/*   Updated: 2020/10/08 10:21:40 by jsaariko      ########   odam.nl         */
/*                                                                            */
/* ************************************************************************** */

#include "libasm.h"
#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <sys/errno.h>
#include <fcntl.h>

// strlen segfaults with a NULL input
void test_strlen(const char *str)
{	
	size_t len;
	size_t len_ft;
	
	len = strlen(str);
	len_ft = ft_strlen(str);
	printf("testing ft_strlen:\n");
	if (len == len_ft)
		printf("Correct!\n");
	else
		printf("Test failed\n");
	printf("Test string: %s\n\treal:\t%zu\n\tft:\t%zu\n", str, len, len_ft);
}

void strcpy_results(char *dest, const char *src, int dest_len, char *(f)(char *, const char *))
{
	int i = 0;

	printf("strcpy:\n\treturn ptr:\t%p\n\tdest ptr:\t%p\n", f(dest, src), dest);

	printf("contents of dest:\t");
	while (i < dest_len)
	{
		if (dest[i] == '\0')
			printf("[0]");
		else
			printf("%c", dest[i]);
		i++;
	}
	printf("\n\n");
}

// strcpy segfaults with any NULL inputs or if dest isn't allocated
void test_strcpy(char *dest, const char *src)
{
	char *dest_ft = strdup(dest);
	char *dest_real = strdup(dest);
	int dest_len = strlen(dest);
	int i = 0;

	printf("Testing ft_strcpy:\n");
	printf("Test strings:\n\tsrc:\t\t[%s]\n\tdest_real:\t[%s]\n\tdest_ft:\t[%s]\n\n", src, dest, dest_ft);

	printf("Real strcpy:\n");
	strcpy_results(dest_real, src, dest_len, strcpy);

	printf("Fake strcpy:\n");
	strcpy_results(dest_real, src, dest_len, ft_strcpy);
}


// strcmp segfaults with any NULL inputs
void test_strcmp(const char *s1, const char *s2)
{
	int ret_real;
	int ret_ft;

	printf("Test strings:\n\ts1:\t[%s]\n\ts2\t[%s]\n", s1, s2);
	ret_real = strcmp(s1, s2);	
	ret_ft = ft_strcmp(s1, s2);	
	if (ret_real == ret_ft)
		printf("strcmp success!\n\tstrcmp:\t\t%d\n\tft_strcmp:\t%d\n", ret_real, ret_ft);
	else
		printf("Test failed:\n\tstrcmp:\t%d\n\tft_strcmp:\t%d\n", ret_real, ret_ft);
}

void test_write(int fd, char *str, size_t byte_count)
{
	int ret_real;
	int ret_ft;
	int errno_real;
	int errno_ft;

	write(1, "real write:\n[", 13);

	ret_real = write(fd, str, byte_count);

	write(1, "]\n", 2);

	errno_real = errno;
    fprintf(stderr, "Value of errno: %d\n", errno);

	write(1, "\nft_write:\n[", 12);

	ret_ft = ft_write(fd, str, byte_count);

	write(1, "]\n", 3);

	errno_ft = errno;
    fprintf(stderr, "Value of errno: %d\n\n", errno);

	printf("real return:\t%d\nft return:\t%d\n", ret_real, ret_ft);
}

void test_read(char *path_to_file, size_t byte_count)
{
	char *buf_real;
	char *buf_ft;

	int errno_real;
	int errno_ft;

	int ret_real;
	int ret_ft;

	int fd = open(path_to_file, O_RDONLY);

	buf_real = (char *)malloc(sizeof(char) * byte_count);
	buf_ft = (char *)malloc(sizeof(char) * byte_count);

	ret_real = read(fd, buf_real, byte_count);
	errno_real = errno;
	close(fd);
	fd = open(path_to_file, O_RDONLY);
	printf("Read %d bytes from fd %d\nreal:\t[%s]\nerrno:\t%d\n\n", ret_real, fd, buf_real, errno_real);
	

	ret_ft = ft_read(fd, buf_ft, byte_count);
	errno_ft = errno;
	close(fd);

	printf("Read %d bytes from fd %d\nft:\t[%s]\nerrno:\t%d\n", ret_ft, fd, buf_ft, errno_ft);

}

int main()
{
	// test_strlen("11");
	// test_strcpy("111111111111111111", "223333333");
	// test_strcmp("1122", "112");
	// test_write(1, NULL, 5);
	// test_read("help.txtt", 1);
	return (0);
}
