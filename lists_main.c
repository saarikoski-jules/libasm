#include "libasm.h"
#include <stdio.h>

void c_list_sort(t_list **begin_list, int (*cmp)());

int compare(int a, int b)
{
	// printf("smallest: %d cur: %d return: %d\n", a, b, a - b);
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

void test_list()
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

	print_list(head);
	printf("\n\n");

	ft_list_remove_if(&head, 1, compare);
	printf("after removed item\n");
	print_list(head);

	ft_list_remove_if(&head, 2, compare);
	ft_list_remove_if(&head, 3, compare);
	ft_list_remove_if(&head, 4, compare);
	ft_list_remove_if(&head, 5, compare);
	ft_list_remove_if(&head, 6, compare);
	ft_list_remove_if(&head, 7, compare);
	ft_list_remove_if(&head, 8, compare);
	ft_list_remove_if(&head, 9, compare);
	ft_list_remove_if(&head, 10, compare);
	print_list(head);

	printf("lol\n");

}

int main()
{
	test_list();
	system("leaks a.out");
	return (0);
}