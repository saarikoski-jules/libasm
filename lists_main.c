#include "libasm.h"
#include <stdio.h>

void c_list_sort(t_list **begin_list, int (*cmp)());

int compare(int a, int b)
{
	printf("smallest: %d cur: %d return: %d\n", a, b, a - b);
	return (a - b);
}

static void print_list(t_list *head)
{
	t_list *tmp = head;
	printf("printing list:\n");
	while(tmp != NULL)
	{
		printf("%p, %d, next: %p\n", tmp, tmp->data, tmp->next);
		tmp = tmp->next;
	}
}

int main()
{
	t_list *head = (t_list *)malloc(sizeof(t_list));
	head->next = NULL;
	head->data = 5;

	ft_list_push_front(&head, 7);
	ft_list_push_front(&head, 3);
	ft_list_push_front(&head, 10);
	ft_list_push_front(&head, 2);
	ft_list_push_front(&head, 8);
	ft_list_push_front(&head, 9);
	ft_list_push_front(&head, 7);
	ft_list_push_front(&head, 1);
	ft_list_push_front(&head, 1);
	ft_list_push_front(&head, 7);
	ft_list_push_front(&head, 6);
	ft_list_push_front(&head, 4);
	ft_list_push_front(&head, 1);
	ft_list_push_front(&head, 7);

	t_list *cur = head;

	// ft_list_sort(&head, compare);
	print_list(head);
	printf("\n\n");
	// void *data;
	// data = 2;
	ft_list_remove_if(&head, 1, compare);
	printf("after removed item\n");
	print_list(head);

	// ft_list_remove_if(&head, )



	// cur = head;
	// printf("head:\n");
	// while(cur != NULL)
	// {
	// 	printf("%d\n", cur->data);
	// 	cur = cur->next;
	// }

	return (0);
}