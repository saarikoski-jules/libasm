/* ************************************************************************** */
/*                                                                            */
/*                                                        ::::::::            */
/*   libasm.h                                           :+:    :+:            */
/*                                                     +:+                    */
/*   By: jsaariko <jsaariko@student.codam.nl>         +#+                     */
/*                                                   +#+                      */
/*   Created: 2020/10/02 12:48:51 by jsaariko      #+#    #+#                 */
/*   Updated: 2020/10/08 10:33:14 by jsaariko      ########   odam.nl         */
/*                                                                            */
/* ************************************************************************** */

# ifndef LIBASM_H
#  define LIBASM_H

#include <stdlib.h>

size_t	ft_strlen(const char *str);
char	*ft_strcpy(char *dst, const char *src);
int 	ft_strcmp(const char *s1, const char *s2);
int		ft_write(int fd, const void *buf, size_t count);
int		ft_read(int fd, void *buf, size_t count);
char	*ft_strdup(const char *s1);

# endif