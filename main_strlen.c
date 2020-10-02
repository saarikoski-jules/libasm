/* ************************************************************************** */
/*                                                                            */
/*                                                        ::::::::            */
/*   main_strlen.c                                      :+:    :+:            */
/*                                                     +:+                    */
/*   By: jsaariko <jsaariko@student.codam.nl>         +#+                     */
/*                                                   +#+                      */
/*   Created: 2020/10/02 12:47:29 by jsaariko      #+#    #+#                 */
/*   Updated: 2020/10/02 14:28:44 by jsaariko      ########   odam.nl         */
/*                                                                            */
/* ************************************************************************** */

#include "libasm.h"
#include <stdio.h>
#include <string.h>

int main()
{
	const char *str = "";
	size_t len = strlen(str);
	size_t len2 = ft_strlen(str);
	printf("string: %s, len: %zu\n", str, len);
	printf("len2: %zu\n", len2);
	return (0);
}