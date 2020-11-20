/* ************************************************************************** */
/*                                                                            */
/*                                                        ::::::::            */
/*   libasm.h                                           :+:    :+:            */
/*                                                     +:+                    */
/*   By: jsaariko <jsaariko@student.codam.nl>         +#+                     */
/*                                                   +#+                      */
/*   Created: 2020/10/02 12:48:51 by jsaariko      #+#    #+#                 */
/*   Updated: 2020/11/20 15:44:37 by jsaariko      ########   odam.nl         */
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

extern size_t	ft_strlen(const char *str);
extern char		*ft_strcpy(char *dst, const char *src);
extern int		ft_strcmp(const char *s1, const char *s2);
extern int		ft_write(int fd, const void *buf, size_t count);
extern int		ft_read(int fd, void *buf, size_t count);
extern char		*ft_strdup(const char *s1);

extern int		ft_atoi_base(char *str, char *base);
extern void		ft_list_push_front(t_list **begin_list, void *data);
extern int		ft_list_size(t_list *head);
extern void		ft_list_sort(t_list **head, int (*cmp)());
extern void		ft_list_remove_if(t_list **begin_list, void *data_ref, int (cmp)());

# endif