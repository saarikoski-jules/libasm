/* ************************************************************************** */
/*                                                                            */
/*                                                        ::::::::            */
/*   main_strlen.c                                      :+:    :+:            */
/*                                                     +:+                    */
/*   By: jsaariko <jsaariko@student.codam.nl>         +#+                     */
/*                                                   +#+                      */
/*   Created: 2020/10/02 12:47:29 by jsaariko      #+#    #+#                 */
/*   Updated: 2020/10/02 16:36:21 by jsaariko      ########   odam.nl         */
/*                                                                            */
/* ************************************************************************** */

#include "libasm.h"
#include <stdio.h>
#include <string.h>

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

void test_strcpy(const char *str)
{
	size_t	len;
	char	*dest;
	char	*dest_ft;

	printf("Testing ft_strcpy:\n");
	if (str != NULL)
		len = strlen(str);
	else
	{
		dest_ft = (char *)malloc(sizeof(char));
		printf("source is NULL. strcpy should segfault");
		ft_strcpy(dest_ft, str);
	}
	dest = (char *)malloc((len + 1) * sizeof(char));
	dest_ft = (char *)malloc((len + 1) * sizeof(char));
	strcpy(dest, str);
	printf("Test string: %s\n\treal:\t[%s]\n\tft:\t[%s]\n", str, dest, dest_ft);
}

int main()
{
	// test_strlen("12");
	// test_strcpy("12");
	char *dest;

	dest = (char *)malloc(10);
	char src[] = "lolol";
	strcpy(dest, "aaaaaaaaa");
	// char dest[] = "12";
	printf("src: %p, dest: %p\n", src, dest);
	printf("value of rax: %s\n", ft_strcpy(dest, src));
	printf("value of dest: %s\n", dest);
	printf("src: %p, dest: %p\n", src, dest);
	return (0);
}
