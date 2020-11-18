#include "libasm.h"
#include <stdio.h>

void c_list_sort(t_list **begin_list, int (*cmp)());

int compare(int a, int b)
{
	printf("smallest: %d cur: %d return: %d\n", a, b, a - b);
	// if (a < b)
	// 	return (0);
	// return (1);
	return (a - b);
}

int main()
{
	t_list *head = (t_list *)malloc(sizeof(t_list));
	head->next = NULL;
	head->data = 5;

	ft_list_push_front(&head, 3);
	ft_list_push_front(&head, 10);
	ft_list_push_front(&head, 2);
	ft_list_push_front(&head, 8);
	ft_list_push_front(&head, 9);
	ft_list_push_front(&head, 7);
	ft_list_push_front(&head, 6);
	ft_list_push_front(&head, 4);
	ft_list_push_front(&head, 1);

	t_list *cur = head;
	while(cur != NULL)
	{
		printf("%p, %d\n", cur, cur->data);
		cur = cur->next;
	}
	// c_list_sort(&head, compare);
	t_list *ret = ft_list_sort(head, compare);
	if (ret == NULL)
		printf("NULL\n");
	else
		printf("return: %p, %d\n", ret, ret->data);
	// t_list *tmp = ret;
	t_list *tmp = head;
	printf("old head:\n");
	while(tmp != NULL)
	{
		printf("%p, %d, next: %p\n", tmp, tmp->data, tmp->next);
		tmp = tmp->next;
	}


	// cur = head;
	// printf("head:\n");
	// while(cur != NULL)
	// {
	// 	printf("%d\n", cur->data);
	// 	cur = cur->next;
	// }

	return (0);
}