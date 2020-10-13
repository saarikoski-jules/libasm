#include "libasm.h"
#include <stdio.h>

int main()
{
	t_list *item = malloc(sizeof(t_list));
	t_list *head;
	item->next = NULL;
	item->data = 1;
	head = item;
	t_list *lol;
	lol = NULL;
	printf("address of head: %p\naddress of next: %p\ndata: %d\n", head, head->next, head->data);
	// printf("new address of head: %p\naddress of next: %p\ndata: %d\n", lol, lol->next, lol->data);
	ft_list_push_front(&lol, 0);
	ft_list_push_front(&lol, 0);
	ft_list_push_front(&lol, 0);
	ft_list_push_front(&lol, 0);
	ft_list_push_front(&lol, 0);
	printf("new address of head: %p\naddress of next: %p\ndata: %d\n", lol, lol->next, lol->data);

	t_list *cur = lol;
	int i = 0;
	while(cur != NULL)
	{
		cur = cur->next;
		i++;
	}
	printf("%d\n", i);
	printf("%d\n", ft_list_size(lol));
	// printf("address of next element: %p\naddress of next: %p\ndata: %d\n", head->next, head->next->next, head->next->data);
	return (0);
}