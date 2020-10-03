/* ************************************************************************** */
/*                                                                            */
/*                                                        ::::::::            */
/*   main_strlen.c                                      :+:    :+:            */
/*                                                     +:+                    */
/*   By: jsaariko <jsaariko@student.codam.nl>         +#+                     */
/*                                                   +#+                      */
/*   Created: 2020/10/02 12:47:29 by jsaariko      #+#    #+#                 */
/*   Updated: 2020/10/03 14:30:31 by jsaariko      ########   odam.nl         */
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



int main()
{
	// test_strlen("11");
	// test_strcpy("11", "22");
	
	return (0);
}
