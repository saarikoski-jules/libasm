/* ************************************************************************** */
/*                                                                            */
/*                                                        ::::::::            */
/*   libasm.h                                           :+:    :+:            */
/*                                                     +:+                    */
/*   By: jsaariko <jsaariko@student.codam.nl>         +#+                     */
/*                                                   +#+                      */
/*   Created: 2020/10/02 12:48:51 by jsaariko      #+#    #+#                 */
/*   Updated: 2020/11/18 14:01:32 by jsaariko      ########   odam.nl         */
/*                                                                            */
/* ************************************************************************** */

# ifndef LIBASM_H
#  define LIBASM_H

#include <stdlib.h>

typedef struct			s_list
{
	void				*data;
	struct s_list		*next;
}						t_list;

size_t	ft_strlen(const char *str);
char	*ft_strcpy(char *dst, const char *src);
int 	ft_strcmp(const char *s1, const char *s2);
int		ft_write(int fd, const void *buf, size_t count);
int		ft_read(int fd, void *buf, size_t count);
char	*ft_strdup(const char *s1);
int		ft_atoi_base(char *str, char *base);
void	ft_list_push_front(t_list **begin_list, void *data);
int		ft_list_size(t_list *head);
void	ft_list_sort(t_list **head, int (*cmp)());
void	ft_list_remove_if(t_list **begin_list, void *data_ref, int (cmp)());


# endif