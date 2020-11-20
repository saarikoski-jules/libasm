/* ************************************************************************** */
/*                                                                            */
/*                                                        ::::::::            */
/*   tests.c                                            :+:    :+:            */
/*                                                     +:+                    */
/*   By: jsaariko <jsaariko@student.codam.nl>         +#+                     */
/*                                                   +#+                      */
/*   Created: 2020/10/02 12:47:29 by jsaariko      #+#    #+#                 */
/*   Updated: 2020/11/20 19:26:16 by jsaariko      ########   odam.nl         */
/*                                                                            */
/* ************************************************************************** */

#include "libasm.h"
#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <sys/errno.h>
#include <fcntl.h>

/*
** List tests 
*/

static void print_list(t_list *head)
{
	t_list *tmp = head;
	printf("printing list:\n");
	while(tmp != NULL)
	{
		printf("%p, %s, next: %p\n", tmp, tmp->data, tmp->next);
		tmp = tmp->next;
	}
}

static void free_list(t_list **head)
{
	t_list *cur;
	t_list *to_free;

	cur = *head;
	while(cur != NULL)
	{
		to_free = cur;
		cur = cur->next;
		free(to_free);
	}
	*head = NULL;
}

void test_list_rm(t_list **head)
{
	printf("Testing list remove\n");
	if (head != NULL)
		print_list(*head);
	else
		printf("NULL\n");
	ft_list_remove_if(head, "a", ft_strcmp);
	printf("after removed item\n");
	if (head != NULL)
		print_list(*head);
	else
		printf("NULL\n");
	ft_list_remove_if(head, "b", ft_strcmp);
	ft_list_remove_if(head, "c", ft_strcmp);
	ft_list_remove_if(head, "d", ft_strcmp);
	ft_list_remove_if(head, "e", ft_strcmp);
	ft_list_remove_if(head, "f", ft_strcmp);
	ft_list_remove_if(head, "g", ft_strcmp);
	ft_list_remove_if(head, "h", ft_strcmp);
	ft_list_remove_if(head, "i", ft_strcmp);
	ft_list_remove_if(head, "j", ft_strcmp);
	printf("After removed all items\n");
	if (head != NULL)
		print_list(*head);
	else
		printf("NULL\n");
	printf("\n");
}

void test_list_sort(t_list **head)
{
	printf("Testing list sort\n");
	printf("before sort\n");
	if (head != NULL)
		print_list(*head);
	else
		printf("NULL\n");
	ft_list_sort(head, ft_strcmp);
	printf("after sort\n");
	if (head != NULL)
		print_list(*head);
	else
		printf("NULL\n");
	printf("\n");
}

void test_list_size(t_list *head)
{
	t_list	*cur;
	int		i;

	printf("ft_list_size:\t%d\n", ft_list_size(head));
	cur = head;
	i = 0;
	while (cur != NULL)
	{
		cur = cur->next;
		i++;
	}
	printf("real list size:\t%d\n\n", i);
}

void test_list_push(t_list **head)
{
	printf("Testing list push front\nBefore:\n");
	if (head != NULL)
		print_list(*head);
	else
		printf("NULL\n");
	ft_list_push_front(head, "d");
	ft_list_push_front(head, "m");
	ft_list_push_front(head, "f");
	ft_list_push_front(head, "l");
	ft_list_push_front(head, "g");
	ft_list_push_front(head, "h");
	ft_list_push_front(head, "n");
	ft_list_push_front(head, "b");
	ft_list_push_front(head, "j");
	ft_list_push_front(head, "e");
	ft_list_push_front(head, "a");
	ft_list_push_front(head, "i");
	ft_list_push_front(head, "k");
	ft_list_push_front(head, "c");
	ft_list_push_front(head, "b");
	ft_list_push_front(head, "a");
	printf("After:\n");
	if (head != NULL)
		print_list(*head);
	else
		printf("NULL\n");
	printf("\n");
}

/*
**	Notes:
**	strtol and ft_atoi_base work slightly differently.
**	Differences:
**	- strtol returns a long, atoi_base can only deal with ints
**	- strtol only works with charset 0123456789ABCDEFG..., if using
**		any other chars, there will be discrepencies
**	- strtol handles whitespace and other non matching chars differently.
**		atoi_base immediately returns 0 when faced with extraneous + or
**		- signs or any char not specified in base
*/

void test_atoi_base(char *str, char *base)
{
	char *end;
	int strtol_base = ft_strlen(base);
	int len = ft_strlen(str);

	printf("atoi_base\t%d\n", ft_atoi_base(str, base));
	printf("strtol:\t\t%ld\n", strtol(str, &end, strtol_base));
	printf("\n");
}

/*
** Mandatory part tests
*/

/*
**	Notes:
**	- strlen segfaults with a NULL input
*/

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
	printf("Test string: %s\n\treal:\t%zu\n\tft:\t%zu\n\n", str, len, len_ft);
}

void strcpy_results(char *dest, const char *src, int dest_len, char *(f)(char *, const char *))
{
	int i = 0;

	printf("strcpy:\n\treturn ptr:\t%p\n\tdest ptr:\t%p\n", f(dest, src), dest);

	printf("contents of dest:\t");
	while (i < dest_len)
	{
		if (dest[i] == '\0')
			printf("\\0");
		else
			printf("%c", dest[i]);
		i++;
	}
	printf("\n");
}

/*
**	Notes:
**	- strcpy segfaults with any NULL inputs or if dest isn't allocated
*/

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
	printf("\n");
	free(dest_real);
	free(dest_ft);
}

/*
**	Notes:
**	- strcmp segfaults with any NULL inputs
*/

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
	printf("\n");
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
	printf("\n");
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
	printf("\n");

	free(buf_ft);
	free(buf_real);
}

/*
**	Notes:
**	- strdup segfaults when you pass null to it
*/
void test_strdup(const char *str)
{
	char *s_real;
	char *s_ft;

	s_real = strdup(str);
	s_ft = ft_strdup(str);
	printf("orig str\t%p\n[%s]\n", str, str);
	printf("strdup\t\t%p\n[%s]\n", s_real, s_real);
	printf("ft_strdup\t%p\n[%s]\n", s_ft, s_ft);
	free(s_real);
	free(s_ft);
	printf("\n");
}

void test_lists()
{
	t_list *head;

	head = (t_list *)malloc(sizeof(t_list));
	head->data = "o";
	head->next = NULL;

	test_list_push(&head);
	test_list_sort(&head);
	// test_list_size(head);
	// test_list_sort(&head);
	// test_list_rm(&head);
	// test_list_size(head);
	free_list(&head);
}

int main()
{
	test_strlen("aaa");
	test_strcpy("111111111111111111", "223333333");
	test_strcmp("\xff", "\xff\xff");
	test_write(1, "aa", 2);
	test_read("Makefile", 0);
	test_strdup("ya");
	test_atoi_base("212AAAC88", "0123456789ABC");
	test_lists();
	int ret = system("leaks a.out > /dev/null");
	if (ret != 0)
		printf("leaks? %d\n", ret);
	return (0);
}