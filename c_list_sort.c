/* ************************************************************************** */
/*                                                                            */
/*                                                        ::::::::            */
/*   c_list_sort.c                                      :+:    :+:            */
/*                                                     +:+                    */
/*   By: jsaariko <jsaariko@student.codam.nl>         +#+                     */
/*                                                   +#+                      */
/*   Created: 2020/11/16 15:23:58 by jsaariko      #+#    #+#                 */
/*   Updated: 2020/11/17 11:07:48 by jsaariko      ########   odam.nl         */
/*                                                                            */
/* ************************************************************************** */

#include "libasm.h"
#include <stdio.h>

void list_add_back(t_list **begin_list, t_list *item)
{
	if (item != NULL)
		printf("item value: %d\n", item->data);
	else
		printf("item NULL");
	t_list *cur = *begin_list;
	if (cur == NULL)
	{
		*begin_list = item;
		item->next = NULL;
		return ;
	}
	while(cur->next != NULL)
		cur = cur->next;
	cur->next = item;
	item->next = NULL;
}

void list_scoot(t_list **begin_list, int pos)
{
	t_list *cur = *begin_list;
	int i = 0;
	printf("in scoot, pos: %d\n");
	if (pos == 0)
	{
		if ((*begin_list)->next == NULL)
		{
			printf("%d, (*begin_list)->next == NULL\n", (*begin_list)->data);
			return ;
		}
		else
			printf("%d, %d", (*begin_list)->data, (*begin_list)->next->data);
		*begin_list = (*begin_list)->next;
	}
	else
	{
		while(i < pos - 1)
		{
			i++;
			cur = cur->next;
		}
		t_list *prev = cur;
		t_list *post = cur->next->next;
		if (cur != NULL)
		{
			if (post != NULL)
				printf("prev: %d, post: %d\n", prev->data, post->data);
			else
			{
				printf("prev: %d, post: NULL\n", prev->data);
			}
			
			printf("scooting: %p, %d\n", cur, cur->data);
			prev->next = post;
			// printf("cur->data: %d, i: %d\n", *(int *)(cur->data), i);

		}
		else
		{
			printf("OH NO!\n");
		}
	}
}

void print_list(t_list *begin)
{
	t_list *cur = begin;
	while(cur != NULL)
	{
		printf("%p, %d\n", cur, cur->data);
		cur = cur->next;
	}
	printf("\n");
}

int get_list_len(t_list *list)
{
	int i = 0;
	t_list *cur = list;
	while(cur != NULL)
	{
		cur = cur->next;
		i++;
	}
	return (i);
}

void c_list_sort(t_list **begin_list, int (*cmp)())//ascending order, smallest to largest
{
	int i;
	t_list *cur = *begin_list;
	i = 0;
	int j = 0;
	int pos = 0;
	int len = 0;
	t_list *new;
	t_list *small = *begin_list;
	len = get_list_len(*begin_list);
	while(j <= len)
	{
		while (cur != NULL)
		{
			// printf("i: %d, %p\n", i, cur);
			if (cmp(cur->data, small->data) < 0) //returns less than zero, arg 1 is smaller
			{
				small = cur;
				pos = i;
			}
			cur = cur->next;
			i++;
		}
		j++;
		cur = *begin_list;
		i = 0;
		list_scoot(begin_list, pos);
		list_add_back(&new, small);
		printf("old\n");
		print_list(*begin_list);
		printf("new:\n");
		print_list(new);
		small = *begin_list;
		pos = 0;
	}
	printf("done rotating\n");
	*begin_list = new;
}